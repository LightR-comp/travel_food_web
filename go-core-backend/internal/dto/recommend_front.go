// recommend_front.go định nghĩa các cấu trúc dữ liệu Request và Response để giao tiếp giữa frontend và backend trong quá trình gợi ý quán ăn dựa trên sở thích của người dùng. Đây là nơi chúng ta sẽ xây dựng các struct để nhận dữ liệu từ client và trả về kết quả sau khi xử lý yêu cầu gợi ý.
// RecommendRequest sẽ chứa thông tin về người dùng, vị trí hiện tại, và các sở thích ăn uống của họ. 
// RecommendResponse sẽ chứa danh sách các quán ăn được gợi ý, cùng với thông tin chi tiết về từng quán ăn như tên, địa chỉ, món ăn đặc trưng, v.v.

package dto

// RecommendRequest: Định nghĩa cấu trúc dữ liệu Request nhận từ client (frontend) gửi lên Go backend
type RecommendRequest struct {
	UserID int `json:"user_id"`

	Location struct {
		Lat float64 `json:"lat"`
		Lng float64 `json:"lng"`
	} `json:"location"`

	Preferences struct {
		Budget   int      `json:"budget"`
		People   int      `json:"people"`
		Dietary  []string `json:"dietary"`
		Mood     string   `json:"mood"`
	} `json:"preferences"`
}

// RecommendResponse: Định nghĩa cấu trúc dữ liệu Response trả về cho client sau khi xử lý xong yêu cầu gợi ý
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
    Meta           MetaDTO           `json:"meta"`// Thông tin meta như rating, khoảng cách, mức giá, v.v.
    AIAnalysis     AIAnalysisDTO     `json:"ai_analysis"`
}

type InfoDTO struct {
    Name           string            `json:"name"`
    Contact        ContactDTO        `json:"contact"`
    OperatingHours HoursDTO          `json:"operating_hours"`
    History        string            `json:"history"`// Câu chuyện về nhà hàng
    FunFacts       []string          `json:"fun_facts"`// Những thông tin thú vị về nhà hàng
}

type ContactDTO struct {
    Address string `json:"address"`
    Phone   string `json:"phone"`
}

type HoursDTO struct {
    Schedule   string `json:"schedule"` // Ví dụ: "10:00 AM - 10:00 PM"
    IsOpenNow  bool   `json:"is_open_now"`
    StatusText string `json:"status_text"` // Ví dụ: "Đang mở cửa"
}

type SignatureDishDTO struct {
    DishName       string   `json:"dish_name"`
    Description    string   `json:"description"`// Mô tả về món ăn đặc trưng của nhà hàn
    Trivia         []string `json:"trivia"`// Những thông tin thú vị về món ăn, có thể được sử dụng để gợi ý nếu người dùng quan tâm đến trải nghiệm ẩm thực
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