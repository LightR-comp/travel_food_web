package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"smart-tourism/internal/services"
)

// RecommendRequest là toàn bộ input từ client cho luồng gợi ý
type RecommendRequest struct {
	// Vị trí hiện tại của user
	Latitude  float64 `json:"latitude" binding:"required"`
	Longitude float64 `json:"longitude" binding:"required"`

	// Ngữ cảnh bữa ăn
	NumberOfPeople int     `json:"number_of_people"`  // Số người
	BudgetPerPerson float64 `json:"budget_per_person"` // Kinh phí mỗi người (VND)
	MealTime       string  `json:"meal_time"`         // "breakfast" | "lunch" | "dinner"
	Mood           string  `json:"mood"`              // "happy" | "sad" | "romantic" | "chill"
	Weather        string  `json:"weather"`           // "sunny" | "rainy" | "cloudy"

	// Override tạm thời (ghi đè preferences trong DB)
	Allergies []string `json:"allergies"` // Các thành phần dị ứng
	CuisineTypes []string `json:"cuisine_types"` // Loại ẩm thực ưa thích
	RadiusKm float64 `json:"radius_km"` // Bán kính tìm kiếm (mặc định 5km)
}

// Recommend godoc
// POST /api/recommend
// Header: Authorization: Bearer <token>  (tuỳ chọn - nếu có sẽ lấy preferences từ DB)
//
// Luồng chính:
//  1. Lấy preferences của user từ DB (nếu đã đăng nhập)
//  2. Merge với input từ request (input request ưu tiên hơn)
//  3. Gọi db_repo lấy danh sách quán trong bán kính + menu
//  4. Gọi Python AI service để tính điểm và xếp hạng
//  5. Trả về danh sách quán đã xếp hạng kèm chi tiết
func Recommend(c *gin.Context) {
	var req RecommendRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu latitude/longitude"})
		return
	}

	// Mặc định bán kính 5km nếu không truyền
	if req.RadiusKm == 0 {
		req.RadiusKm = 5.0
	}

	ctx := c.Request.Context()

	// 1. Lấy preferences từ DB nếu user đã đăng nhập
	uid := c.GetString("uid") // Có thể rỗng nếu không qua middleware auth
	var userPrefsAllergies []string
	if uid != "" {
		user, err := services.GetUserByUID(ctx, uid)
		if err == nil {
			// Dùng preferences trong DB làm mặc định
			if len(req.Allergies) == 0 {
				req.Allergies = user.Preferences.Allergies
			}
			if req.BudgetPerPerson == 0 {
				req.BudgetPerPerson = user.Preferences.DefaultBudget
			}
			if req.NumberOfPeople == 0 {
				req.NumberOfPeople = user.Preferences.DefaultPeople
			}
			userPrefsAllergies = user.Preferences.Allergies
		}
	}
	_ = userPrefsAllergies

	// 2. Lấy danh sách quán trong bán kính từ DB (kèm menu, review)
	restaurants, err := services.GetRestaurantsNearby(ctx, services.NearbyQuery{
		Latitude:  req.Latitude,
		Longitude: req.Longitude,
		RadiusKm:  req.RadiusKm,
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lấy dữ liệu quán ăn"})
		return
	}

	if len(restaurants) == 0 {
		c.JSON(http.StatusOK, gin.H{
			"message":     "Không tìm thấy quán ăn trong khu vực",
			"restaurants": []interface{}{},
		})
		return
	}

	// 3. Gọi Python AI service để tính điểm và xếp hạng
	aiPayload := services.AIRecommendPayload{
		Restaurants: restaurants,
		Context: services.AIContext{
			NumberOfPeople:  req.NumberOfPeople,
			BudgetPerPerson: req.BudgetPerPerson,
			MealTime:        req.MealTime,
			Mood:            req.Mood,
			Weather:         req.Weather,
			Allergies:       req.Allergies,
			CuisineTypes:    req.CuisineTypes,
		},
	}

	ranked, err := services.CallAIRecommend(ctx, aiPayload)
	if err != nil {
		// Fallback: nếu AI lỗi, trả về danh sách thô theo khoảng cách
		c.JSON(http.StatusOK, gin.H{
			"message":     "Gợi ý theo khoảng cách (AI service tạm không khả dụng)",
			"restaurants": restaurants,
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message":     "Gợi ý thành công",
		"restaurants": ranked,
	})
}