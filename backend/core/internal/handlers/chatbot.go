// chatbot.go chứa các hàm xử lý liên quan đến chatbot
//  bao gồm logic nhận câu hỏi từ user, gọi dịch vụ AI để phân tích Intent, truy vấn cơ sở dữ liệu và trả về kết quả cho frontend.
//  Đây là nơi chúng ta sẽ xây dựng luồng xử lý chính cho API /chat
// đảm bảo rằng khi user gửi câu hỏi, chúng ta có thể phân tích và trả lời một cách chính xác và nhanh chóng.

package handlers

import (
	"fmt" // Thêm import fmt để sử dụng fmt.Sprintf
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"

	"backend/core/internal/dto"
	"backend/core/internal/services"
)

// ChatbotProcess is the main handler for the /chat endpoint.
// It orchestrates the entire chatbot workflow as defined in the API contract.
func ChatbotProcess(c *gin.Context) {
	// Lấy data từ Request
	var req dto.ChatbotMessageRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"success": false,
			"message": "Dữ liệu yêu cầu không hợp lệ",
			"data":    nil,
			"error":   err.Error(),
		})
		return
	}

	userID := c.GetInt("user_id")
	// Hỗ trợ lấy user_id từ body Postman để test cho tiện (vì route này đang public)
	if userID == 0 && req.UserID > 0 {
		userID = req.UserID
	}

	// NẾU TEST KHÔNG CẦN XÁC THỰC: Gán cứng userID = 1 để luôn qua được điều kiện lưu DB
	if userID == 0 {
		userID = 1
	}

	// GIAI ĐOẠN 1: Go -> Python (INTENT PARSE)
	intentReq := dto.AIIntentParseRequest{
		UserID:  userID,
		Message: req.Message,
	}

	intentRes, err := services.CallAIIntentParse(intentReq)
	if err != nil || !intentRes.Success {
		log.Printf("[Chatbot] Lỗi Giai đoạn 1 (Intent Parse): %v", err)
		if intentRes != nil {
			log.Printf("[Chatbot] Dữ liệu trả về từ AI: %+v", intentRes)
		}

		var errorDetail string
		if err != nil {
			errorDetail = err.Error()
		} else if intentRes != nil && intentRes.Error != nil {
			if e, ok := intentRes.Error.(string); ok {
				errorDetail = e
			} else {
				errorDetail = fmt.Sprintf("%v", intentRes.Error) // Chuyển đổi lỗi sang string
			}
		} else {
			errorDetail = "Lỗi không xác định khi phân tích ý định."
		}

		// Soft-fallback: AI lỗi nhưng API vẫn trả về câu thoại chống crash UI
		c.JSON(http.StatusOK, gin.H{
			"success": false, // Đổi thành false khi có lỗi
			"message": "Hệ thống AI gặp sự cố khi phân tích ý định của bạn.",
			"data": gin.H{
				"reply":            "Xin lỗi, hiện tại tôi đang gặp chút trục trặc. Bạn có thể hỏi lại sau nhé!",
				"suggested_places": []interface{}{},
			},
			"error": errorDetail, // Cung cấp thông tin lỗi chi tiết
		})
		return
	}

	// GIAI ĐOẠN 2: Xử lý nội bộ tại Go (DATABASE FETCH)
	foundRestaurants := services.FetchRestaurantsFromEntities(c.Request.Context(), intentRes.Data.Entities)
	if foundRestaurants == nil {
		foundRestaurants = []map[string]interface{}{} // Ép kiểu luôn là mảng rỗng, ngăn chặn giá trị null
	}

	// GIAI ĐOẠN 2.5: Lấy ngữ cảnh user (sở thích đã lưu trong DB)
	// Khởi tạo user context với giá trị mặc định
	userContext := map[string]interface{}{
		"user_id": userID,
		"preferences": map[string]interface{}{
			"dietary": []string{},
			"budget":  nil, // Dùng nil để AI biết là không có budget cụ thể
		},
	}
	// Nếu có userID, thử lấy preferences từ DB
	if userID > 0 {
		if prefs, err := services.GetUserPreferences(c.Request.Context(), userID); err == nil && prefs != nil {
			// Xử lý trường dietary: DB có thể lưu dưới dạng chuỗi "vegan,vegetarian"
			// Cần chuyển đổi thành mảng ["vegan", "vegetarian"] để khớp với Pydantic model của Python
			var dietaryPreferences []string
			if prefs.Dietary != "" {
				items := strings.Split(prefs.Dietary, ",")
				for _, item := range items {
					trimmedItem := strings.TrimSpace(item)
					if trimmedItem != "" {
						dietaryPreferences = append(dietaryPreferences, trimmedItem)
					}
				}
			}

			// Ghi đè preferences mặc định bằng dữ liệu từ DB
			userContext["preferences"] = map[string]interface{}{
				"dietary": dietaryPreferences,         // Sử dụng slice đã được xử lý
				"budget":  int(prefs.BudgetPerPerson), // Ép kiểu float64 sang int để khớp với Pydantic
			}
		}
	}

	// GIAI ĐOẠN 3: Go -> Python (GENERATE RESPONSE)
	genReq := dto.AIChatGenerateRequest{
		UserMessage:      req.Message,
		Intent:           intentRes.Data.Intent,
		UserContext:      userContext,
		FoundRestaurants: foundRestaurants,
	}

	genRes, err := services.CallAIChatGenerate(genReq)
	if err != nil || !genRes.Success {
		log.Printf("[Chatbot] Lỗi Giai đoạn 3 (Generate Response): %v", err)
		if genRes != nil {
			log.Printf("[Chatbot] Dữ liệu trả về từ AI: %+v", genRes)
		}

		var errorDetail string
		if err != nil {
			errorDetail = err.Error()
		} else if genRes != nil && genRes.Error != nil {
			if e, ok := genRes.Error.(string); ok {
				errorDetail = e
			} else {
				errorDetail = fmt.Sprintf("%v", genRes.Error) // Chuyển đổi lỗi sang string
			}
		} else {
			errorDetail = "Lỗi không xác định trong quá trình tạo câu trả lời."
		}

		c.JSON(http.StatusOK, gin.H{
			"success": false, // Đổi thành false khi có lỗi
			"message": "Hệ thống AI gặp sự cố khi tạo câu trả lời.",
			"data": gin.H{
				"reply":            "Xin lỗi, tôi chưa nghĩ ra câu trả lời phù hợp. Bạn có thể đổi cách hỏi được không?",
				"suggested_places": []interface{}{},
			},
			"error": errorDetail, // Cung cấp thông tin lỗi chi tiết
		})
		return
	}

	// GIAI ĐOẠN 4.5: Lưu lịch sử chat vào Database (chỉ lưu nếu có userID)
	if userID > 0 {
		botReply := genRes.Data.Reply

		errDB := services.SaveChatHistory(c.Request.Context(), userID, req.Message, botReply)
		if errDB != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"success": false,
				"message": "AI đã trả lời nhưng lỗi lưu Database (Xem chi tiết ở error)",
				"data":    nil,
				"error":   errDB.Error(),
			})
			return
		}
	}

	// GIAI ĐOẠN 4 & FINAL OUTPUT: Python -> Go -> Frontend
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Thành công",
		"data":    genRes.Data,
		"error":   nil,
	})
}

// GetChatHistory API lấy lịch sử chat
func GetChatHistory(c *gin.Context) {
	userID, err := strconv.Atoi(c.Param("userId"))
	if err != nil || userID <= 0 {
		c.JSON(http.StatusBadRequest, gin.H{
			"success": false, "message": "ID người dùng không hợp lệ", "data": nil, "error": "Invalid User ID",
		})
		return
	}

	history, err := services.GetChatHistoryByUserID(c.Request.Context(), userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false, "message": "Lỗi lấy lịch sử", "data": nil, "error": err.Error(),
		})
		return
	}

	if history == nil {
		history = []services.ChatHistoryEntry{} // Mảng rỗng nếu chưa có
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true, "message": "Thành công", "data": gin.H{"messages": history}, "error": nil,
	})
}
