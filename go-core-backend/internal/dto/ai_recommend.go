// ai_recommend.go định nghĩa các cấu trúc dữ liệu Request và Response để giao tiếp giữa Go backend và Python AI Service trong việc gợi ý quán ăn dựa trên Intent của người dùng và thông tin về các quán ăn.
// AIRecommendRequest sẽ chứa thông tin về Intent của người dùng (được xây dựng từ UserContext) và một danh sách các quán ăn (AIRestaurantInput) để Python AI Service đánh giá và gợi ý.
// AIRecommendResponse sẽ chứa danh sách các quán ăn được Python AI Service đánh giá và gợi ý (AIRestaurantOutput), bao gồm ID của quán ăn, điểm số đánh giá tổng hợp từ AI và lý do tại sao quán ăn đó được gợi ý.

package dto
import (
	"go-core-backend/internal/models"
)
// AIRecommendRequest: Định nghĩa cấu trúc dữ liệu Request gửi từ Go backend tới Python AI Service
type AIRecommendRequest struct {
	// Intent của user, ví dụ: "Tôi muốn ăn phở với 10 người, ngân sách 200k/người, ở quận 1"
	UserIntent  models.UserContext `json:"user_intent"`
	// Tạm thời truyền mảng ID, có thể mở rộng thành Struct chứa thông tin chi tiết sau.
	Restaurants []AIRestaurantInput `json:"restaurants"`
}
// AIRestaurantInput: Định nghĩa cấu trúc dữ liệu của một quán ăn được gửi sang Python AI Service để đánh giá và gợi ý
type AIRestaurantInput struct {
	ID         int     `json:"id"`
	Rating     float64 `json:"rating"`
	Price      float64 `json:"price"`
	DistanceKm float64 `json:"distance_km"`
	//Kiểu quán ăn
	Type       string   `json:"type"`
	//Các món đặc trưng của quán, có thể được sử dụng để gợi ý nếu người dùng có sở thích ăn uống cụ thể
	FeaturedDishes []AISummaryDishInput `json:"featured_dishes"`
}

// AISummaryDishInput: Định nghĩa cấu trúc dữ liệu của một món ăn đặc trưng được gửi sang Python AI Service để đánh giá và gợi ý
type AISummaryDishInput struct {
	Name        string   `json:"name"`
	Price       float64  `json:"price"`
	Ingredients  []string `json:"ingredients"`
}

// AIRecommendResponse: Định nghĩa cấu trúc dữ liệu Response nhận từ Python AI Service trả về Go backend
type AIRecommendResponse struct {
	RecommendedRestaurants []AIRestaurantOutput `json:"recommended_restaurants"`
}

// AIRestaurantOutput: Định nghĩa cấu trúc dữ liệu của một quán ăn được Python AI Service đánh giá và gợi ý, trả về cho Go backend
type AIRestaurantOutput struct {
	ID         int     `json:"id"`
	Score      float64 `json:"score"` // Điểm đánh giá tổng hợp từ AI, có thể dựa trên nhiều yếu tố như sở thích của user, rating, giá cả, v.v.
	Reason     string  `json:"reason"` // Lý do tại sao AI gợi ý quán này, có thể được hiển thị cho người dùng để tăng tính minh bạch
}
