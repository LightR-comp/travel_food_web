// Request and Response DTOs for AI Chatbot
// Tuân theo flow chatbot ở API-CONTRACT.md

package dto

import (
	"go-core-backend/internal/models"
)

// ChatRequest là DTO cho yêu cầu chat từ client
type ChatRequest struct {
	Message string `json:"message" binding:"required"`
}

// ChatResponse là DTO cho phản hồi chat từ server
type ChatResponse struct {
	Reply string `json:"reply"`
	Suggestions []models.Restaurant `json:"suggestions,omitempty"`
}

// Các intent từ python sau khi được phân tích sẽ được gửi về đây
type IntentRequest struct {
	Intent []string `json:"intent" binding:"required"`
}

// data từ database khi query từ các intent để gửi cho python
type IntentData struct {
	Intent string `json:"intent"`
	Data   string `json:"data"`
}
