package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"go-core-backend/internal/services"
)

type RecommendRequest struct {
	Latitude        float64  `json:"latitude" binding:"required"`
	Longitude       float64  `json:"longitude" binding:"required"`
	NumberOfPeople  int      `json:"number_of_people"`
	BudgetPerPerson float64  `json:"budget_per_person"`
	MealTime        string   `json:"meal_time"`
	Mood            string   `json:"mood"`
	Weather         string   `json:"weather"`
	Dietary         []string `json:"dietary"`
	FoodTypes       []string `json:"food_types"`
	RadiusKm        float64  `json:"radius_km"`
}

func GetRecommendations(c *gin.Context) {
	var req RecommendRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu latitude/longitude"})
		return
	}

	if req.RadiusKm == 0 {
		req.RadiusKm = 5.0
	}

	ctx := c.Request.Context()

	// Lấy preferences từ DB nếu đã đăng nhập
	userID := c.GetInt("user_id")
	if userID != 0 {
		prefs, err := services.GetUserPreferences(ctx, userID)
		if err == nil {
			if len(req.Dietary) == 0 {
				req.Dietary = []string{prefs.Dietary}
			}
			if len(req.FoodTypes) == 0 {
				req.FoodTypes = []string{prefs.FoodTypes}
			}
			if req.BudgetPerPerson == 0 {
				req.BudgetPerPerson = prefs.BudgetPerPerson
			}
		}
	}

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

	c.JSON(http.StatusOK, gin.H{
		"message":     "Gợi ý thành công",
		"restaurants": restaurants,
	})
}