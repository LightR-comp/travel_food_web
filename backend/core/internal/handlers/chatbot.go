// chatbot.go chứa các hàm xử lý liên quan đến chatbot
//  bao gồm logic nhận câu hỏi từ user, gọi dịch vụ AI để phân tích Intent, truy vấn cơ sở dữ liệu và trả về kết quả cho frontend.
//  Đây là nơi chúng ta sẽ xây dựng luồng xử lý chính cho API /chat
// đảm bảo rằng khi user gửi câu hỏi, chúng ta có thể phân tích và trả lời một cách chính xác và nhanh chóng.

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