// Ghi chú: File này được tạo mới để chứa các struct phục vụ ĐÚNG luồng giao tiếp AI theo api-contract.md
// nhằm hạn chế sửa đổi làm vỡ file dto/ai_chatbot.go hiện tại.

package dto

// AIIntentParseRequest đại diện cho dữ liệu Go gửi đi ở GIAI ĐOẠN 1
type AIIntentParseRequest struct {
	UserID  int    `json:"user_id"`
	Message string `json:"message"`
}

// AIIntentParseResponse đại diện cho dữ liệu Python trả về ở GIAI ĐOẠN 1
type AIIntentParseResponse struct {
	Success bool `json:"success"`
	Data    struct {
		Intent     string                 `json:"intent"`
		Entities   map[string]interface{} `json:"entities"`
		Confidence float64                `json:"confidence"`
	} `json:"data"`
}

// AIChatGenerateRequest đại diện cho dữ liệu Go gửi đi ở GIAI ĐOẠN 3
type AIChatGenerateRequest struct {
	UserMessage      string                   `json:"user_message"`
	Intent           string                   `json:"intent"`
	UserContext      map[string]interface{}   `json:"user_context"`
	FoundRestaurants []map[string]interface{} `json:"found_restaurants"`
}

// AIChatGenerateResponse đại diện cho kết quả Python trả về ở GIAI ĐOẠN 4
type AIChatGenerateResponse struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
	Data    struct {
		Reply           string                   `json:"reply"`
		SuggestedPlaces []map[string]interface{} `json:"suggested_places"`
	} `json:"data"`
}
