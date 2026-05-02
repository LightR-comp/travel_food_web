// chatbot.go chứa các hàm xử lý liên quan đến chatbot
//  bao gồm logic nhận câu hỏi từ user, gọi dịch vụ AI để phân tích Intent, truy vấn cơ sở dữ liệu và trả về kết quả cho frontend.
//  Đây là nơi chúng ta sẽ xây dựng luồng xử lý chính cho API /chat
// đảm bảo rằng khi user gửi câu hỏi, chúng ta có thể phân tích và trả lời một cách chính xác và nhanh chóng.

package handlers

import (
	"log"
	"net/http"
	"strconv"

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

		// Soft-fallback: AI lỗi nhưng API vẫn trả về câu thoại chống crash UI
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Lỗi tại Intent Parse",
			"data": gin.H{
				"reply":            "Xin lỗi, hiện tại tôi đang gặp chút trục trặc. Bạn có thể hỏi lại sau nhé!",
				"suggested_places": []interface{}{},
			},
			"error": nil,
		})
		return
	}

	// GIAI ĐOẠN 2: Xử lý nội bộ tại Go (DATABASE FETCH)
	foundRestaurants := services.FetchRestaurantsFromEntities(c.Request.Context(), intentRes.Data.Entities)
	if foundRestaurants == nil {
		foundRestaurants = []map[string]interface{}{} // Ép kiểu luôn là mảng rỗng, ngăn chặn giá trị null
	}

	// Lấy ngữ cảnh user (sở thích lưu nội bộ)
	// BÁM SÁT THEO PYTHON: Khởi tạo đầy đủ các trường preferences
	// để Python không bị văng lỗi AttributeError khi cố đọc dữ liệu bên trong.
	userContext := map[string]interface{}{
		"user_id": userID,
		"preferences": map[string]interface{}{
			"dietary": []string{}, // Bắt buộc phải là mảng (List) theo đúng chuẩn Pydantic
			"budget":  0,          // Tránh giá trị null
		},
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

		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Lỗi tại Response Generation",
			"data": gin.H{
				"reply":            "Xin lỗi, tôi chưa nghĩ ra câu trả lời phù hợp. Bạn có thể đổi cách hỏi được không?",
				"suggested_places": []interface{}{},
			},
			"error": nil,
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
