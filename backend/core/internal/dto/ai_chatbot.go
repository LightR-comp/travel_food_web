
package dto

type ChatbotMessageRequest struct {
	UserID  int    `json:"user_id"`
	Message string `json:"message" binding:"required"`
}

type AIIntentParseRequest struct {
	UserID  int    `json:"user_id"`
	Message string `json:"message"`
}

type AIIntentParseResponse struct {
	Success bool `json:"success"`
	Data    struct {
		Intent     string                 `json:"intent"`
		Entities   map[string]interface{} `json:"entities"`
		Confidence float64                `json:"confidence"`
	} `json:"data"`
	Error interface{} `json:"error"`
}

type AIChatGenerateRequest struct {
	UserMessage      string                   `json:"user_message"`
	Intent           string                   `json:"intent"`
	UserContext      map[string]interface{}   `json:"user_context"`
	FoundRestaurants []map[string]interface{} `json:"found_restaurants"`
}

type AIChatGenerateResponse struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
	Data    struct {
		Reply           string                   `json:"reply"`
		SuggestedPlaces []map[string]interface{} `json:"suggested_places"`
	} `json:"data"`
	Error interface{} `json:"error"`
}

type AIIdentifyDishRequest struct {
	UserID   int    `json:"user_id"`
	ImageB64 string `json:"image_base64"`
	Message  string `json:"message"`
}

type AIIdentifyDishResponse struct {
	DishName    string   `json:"dish_name"`
	Ingredients []string `json:"ingredients"`
	Recipe      string   `json:"recipe"`
}
