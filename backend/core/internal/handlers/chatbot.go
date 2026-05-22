// chatbot.go chứa các hàm xử lý liên quan đến chatbot
//  bao gồm logic nhận câu hỏi từ user, gọi dịch vụ AI để phân tích Intent, truy vấn cơ sở dữ liệu và trả về kết quả cho frontend.
//  Đây là nơi chúng ta sẽ xây dựng luồng xử lý chính cho API /chat
// đảm bảo rằng khi user gửi câu hỏi, chúng ta có thể phân tích và trả lời một cách chính xác và nhanh chóng.

package handlers

import (
	"bytes"
	"encoding/base64"
	"fmt" // Thêm import fmt để sử dụng fmt.Sprintf
	"io"
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
	// RẼ NHÁNH LOGIC: Kiểm tra nếu request có chứa file ảnh (multipart form)
	contentType := c.ContentType()
	if strings.Contains(contentType, "multipart/form-data") {
		handleImageIdentification(c)
		return
	}

	// LOGIC CHAT VĂN BẢN (Giữ nguyên logic cũ bên dưới)
	processTextChat(c)
}

func processTextChat(c *gin.Context) {
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
	// Truyền userID vào để hệ thống có thể cá nhân hóa kết quả dựa trên lịch sử tương tác
	foundRestaurants := services.FetchRestaurantsFromEntities(c.Request.Context(), intentRes.Data.Entities, userID)
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
			preferencesMap := userContext["preferences"].(map[string]interface{})

			if prefs.Dietary != "" {
				items := strings.Split(prefs.Dietary, ",")
				var dietaryPreferences []string
				for _, item := range items {
					trimmedItem := strings.TrimSpace(item)
					if trimmedItem != "" {
						dietaryPreferences = append(dietaryPreferences, trimmedItem)
					}
				}
				preferencesMap["dietary"] = dietaryPreferences
			}

			// Ghi đè budget
			if prefs.BudgetPerPerson > 0 {
				preferencesMap["budget"] = int(prefs.BudgetPerPerson)
			} else {
				preferencesMap["budget"] = nil
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

	// GIAI ĐOẠN 4.5: Lưu lịch sử chat và các gợi ý vào Database (chỉ lưu nếu có userID)
	if userID > 0 {
		botReply := genRes.Data.Reply

		// Bước 1: Lưu tin nhắn chat chính và lấy ID của nó để liên kết
		chatHistoryID, errDB := services.SaveChatHistory(c.Request.Context(), userID, req.Message, botReply)
		if errDB != nil {
			// Nếu lưu chat chính bị lỗi, vẫn trả về kết quả cho FE nhưng log lỗi và báo lỗi server
			log.Printf("[Chatbot] Lỗi nghiêm trọng: không thể lưu tin nhắn chat chính: %v", errDB)
			c.JSON(http.StatusInternalServerError, gin.H{
				"success": false,
				"message": "AI đã trả lời nhưng lỗi lưu Database (Xem chi tiết ở error)",
				"data":    genRes.Data, // Vẫn trả về data cho FE dù DB lỗi
				"error":   errDB.Error(),
			})
			return
		}

		// Bước 2: Chuẩn bị và lưu các gợi ý chi tiết vào bảng phụ ChatSuggestionLog
		if genRes.Data.SuggestedPlaces != nil && len(genRes.Data.SuggestedPlaces) > 0 {
			var suggestionsToLog []services.ChatSuggestionLogEntry
			for _, placeMap := range genRes.Data.SuggestedPlaces {
				// Trích xuất dữ liệu từ map (AI trả về JSON số dưới dạng float64)
				var restaurantID int
				var restaurantName string
				var score float64

				if restaurantData, ok := placeMap["restaurant"].(map[string]interface{}); ok {
					if id, ok := restaurantData["id"].(float64); ok {
						restaurantID = int(id)
					}
					if name, ok := restaurantData["res_name"].(string); ok {
						restaurantName = name
					}
				}
				if s, ok := placeMap["score"].(float64); ok {
					score = s
				}

				suggestionsToLog = append(suggestionsToLog, services.ChatSuggestionLogEntry{
					RestaurantID:   restaurantID,
					RestaurantName: restaurantName,
					Score:          score,
				})
			}

			errLog := services.SaveChatSuggestions(c.Request.Context(), chatHistoryID, suggestionsToLog)
			if errLog != nil {
				// Lỗi lưu bảng phụ không quá nghiêm trọng, chỉ cần log lại để debug, không cần báo lỗi cho user
				log.Printf("[Chatbot] Lỗi lưu chi tiết gợi ý (ChatHistoryID: %d): %v", chatHistoryID, errLog)
			}
		}
	}

	// GIAI ĐOẠN 5: Chuẩn bị dữ liệu trả về cho Frontend (loại bỏ score)
	// Mục đích là chỉ lưu 'score' vào DB để phân tích, không cần hiển thị cho người dùng.
	var placesForFrontend []map[string]interface{}
	if genRes.Data.SuggestedPlaces != nil {
		for _, place := range genRes.Data.SuggestedPlaces {
			// Tạo bản sao để xóa trường score trước khi trả về FE
			placeMap := make(map[string]interface{})
			for k, v := range place {
				if k == "score" {
					continue
				}
				placeMap[k] = v
			}

			placesForFrontend = append(placesForFrontend, placeMap)
		}
	}

	// Đóng gói dữ liệu cuối cùng cho frontend
	frontendData := gin.H{
		"reply":            genRes.Data.Reply,
		"suggested_places": placesForFrontend, // Sử dụng danh sách đã được xử lý
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Thành công",
		"data":    frontendData,
		"error":   nil,
	})
}

// handleImageIdentification xử lý logic nhận diện món ăn khi endpoint /chat nhận được file
func handleImageIdentification(c *gin.Context) {
	file, err := c.FormFile("image") // Tên field này phải khớp với Key trong Postman/Frontend
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "Vui lòng cung cấp hình ảnh", "error": err.Error()})
		return
	}

	userID, _ := strconv.Atoi(c.PostForm("user_id"))
	message := c.PostForm("message") // Lấy message từ form
	if userID == 0 {
		userID = c.GetInt("user_id")
	}

	// Fallback cho testing tương tự luồng chat văn bản
	if userID == 0 {
		userID = 1
	}

	f, err := file.Open()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"success": false, "message": "Không thể mở file", "error": err.Error()})
		return
	}
	defer f.Close()

	imgBytes, err := io.ReadAll(f)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"success": false, "message": "Lỗi đọc dữ liệu ảnh", "error": err.Error()})
		return
	}
	imgBase64 := base64.StdEncoding.EncodeToString(imgBytes)

	// 2.5 Upload ảnh lên Cloudinary để lấy link lưu vào Database
	imageURL, errUpload := services.UploadToCloudinary(c.Request.Context(), bytes.NewReader(imgBytes), "yummap_chats")
	if errUpload != nil {
		log.Printf("[Identify] Lỗi upload Cloudinary: %v", errUpload)
		// Fallback nếu upload lỗi để không làm gián đoạn tiến trình của AI
		imageURL = "[Hình ảnh món ăn]"
	}

	aiReq := dto.AIIdentifyDishRequest{
		UserID:   userID,
		ImageB64: imgBase64,
		Message:  message, // Thêm message vào request
	}

	aiRes, err := services.CallAIIdentifyDish(aiReq)
	if err != nil {
		log.Printf("[Identify] AI Error: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "AI không thể nhận diện món ăn lúc này",
			"error":   err.Error(),
		})
		return
	}

	if userID > 0 {
		var botReply strings.Builder
		botReply.WriteString(fmt.Sprintf("Tôi nhận ra đây là món **%s**.", aiRes.DishName))
		if len(aiRes.Ingredients) > 0 {
			botReply.WriteString(fmt.Sprintf("\n\n**Nguyên liệu chính:** %s", strings.Join(aiRes.Ingredients, ", ")))
		}
		// Chỉ thêm công thức nếu nó không rỗng
		if aiRes.Recipe != "" {
			botReply.WriteString(fmt.Sprintf("\n\n**Công thức:**\n%s", aiRes.Recipe))
		}

		_, errDB := services.SaveChatHistory(c.Request.Context(), userID, imageURL, botReply.String())
		if errDB != nil {
			log.Printf("[Identify] Lỗi lưu lịch sử DB cho UserID %d: %v", userID, errDB)
		}
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Nhận diện thành công",
		"data":    aiRes,
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
