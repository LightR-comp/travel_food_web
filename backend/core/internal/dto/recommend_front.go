// recommend_front.go định nghĩa các cấu trúc dữ liệu Request và Response để giao tiếp giữa frontend và backend trong quá trình gợi ý quán ăn dựa trên sở thích của người dùng. Đây là nơi chúng ta sẽ xây dựng các struct để nhận dữ liệu từ client và trả về kết quả sau khi xử lý yêu cầu gợi ý.
// RecommendRequest sẽ chứa thông tin về người dùng, vị trí hiện tại, và các sở thích ăn uống của họ.
// RecommendResponse sẽ chứa danh sách các quán ăn được gợi ý, cùng với thông tin chi tiết về từng quán ăn như tên, địa chỉ, món ăn đặc trưng, v.v.

package dto

import "backend/core/internal/models"

type RecommendRequest struct {
	UserID int `json:"user_id"`

	Location models.Location `json:"location"`

	Preferences models.ContextPreferences `json:"preferences"`
}

type RecommendResponse struct {
    Success bool                     `json:"success"`
    Message string                   `json:"message"`
    Data    RecommendResponseData    `json:"data"`
    Error   interface{}              `json:"error"`
}

type RecommendResponseData struct {
    Restaurants []RestaurantSummary `json:"restaurants"`
}

type RestaurantSummary struct {
    ID             int               `json:"id"`
    RestaurantInfo InfoDTO           `json:"restaurant_info"`
    SignatureDish  SignatureDishDTO  `json:"signature_dish"`
    Meta           MetaDTO           `json:"meta"`
    AIAnalysis     AIAnalysisDTO     `json:"ai_analysis"`
}

type InfoDTO struct {
    Name           string            `json:"name"`
    ImageURL       string            `json:"image_url"`
    Contact        ContactDTO        `json:"contact"`
    OperatingHours HoursDTO          `json:"operating_hours"`
    History        string            `json:"history"`
    FunFacts       []string          `json:"fun_facts"`
}

type ContactDTO struct {
    Address string `json:"address"`
    Phone   string `json:"phone"`
}

type HoursDTO struct {
    Schedule   string `json:"schedule"` 
    IsOpenNow  bool   `json:"is_open_now"`
    StatusText string `json:"status_text"` 
}

type SignatureDishDTO struct {
    DishName       string   `json:"dish_name"`
    Description    string   `json:"description"`
    Trivia         []string `json:"trivia"`
}

type MetaDTO struct {
    Rating     float64 `json:"rating"`
    DistanceKm float64 `json:"distance_km"`
    PriceRange string  `json:"price_range"`
}

type AIAnalysisDTO struct {
    Score  float64 `json:"score"`
    Reason string  `json:"reason"`
}