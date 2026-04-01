package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// ChatbotProcess là API xử lý luồng chat với user
// TODO: Minh viết logic nhận câu hỏi, chọc Python phân tích Intent, gọi DB rồi trả text về ở đây!
// ChatbotProcess là hàm xử lý cho API /chat
func ChatbotProcess(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Chatbot đang phân tích câu hỏi của user...",
		"data":    nil,
		"error":   nil,
	})
}