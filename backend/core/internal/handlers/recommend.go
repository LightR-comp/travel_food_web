package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"backend/core/internal/dto"
	"backend/core/internal/models"
	"backend/core/internal/services"
	"backend/core/internal/utils"
)



func GetRecommendations(c *gin.Context) {
	var req dto.RecommendRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, dto.RecommendResponse{
			Success: false,
			Message: "Dữ liệu yêu cầu không hợp lệ",
			Error:   err.Error(),
		})
		return
	}
	// CHỐT BẢO MẬT: LẤY ID TỪ TOKEN
	authUserID := c.GetInt("user_id")
	if authUserID > 0 {
		req.UserID = authUserID
	}
	// Hardcode tọa độ demo tại Vincom Thủ Đức
	req.Location.Lat = 10.85027
	req.Location.Lng = 106.76504
	if req.Location.RadiusKm == 0 {
		req.Location.RadiusKm = 5.0
	}


	ctx := c.Request.Context()

	// Ưu tiên 1: Lấy từ DB lấp vào chỗ trống
	if req.UserID > 0 {
		prefs, err := services.GetUserPreferences(ctx, req.UserID)
		if err == nil {
			if len(req.Preferences.Dietary) == 0 && prefs.Dietary != "" {
				req.Preferences.Dietary = utils.SplitCSV(prefs.Dietary)
			}
			if len(req.Preferences.FoodTypes) == 0 && prefs.FoodTypes != "" {
				req.Preferences.FoodTypes = utils.SplitCSV(prefs.FoodTypes)
			}
			if req.Preferences.Budget == 0 && prefs.BudgetPerPerson > 0 {
				req.Preferences.Budget = int(prefs.BudgetPerPerson)
			}
		}
	}

	// Ưu tiên 2: Xử lý giá trị mặc định
	if req.Preferences.Budget == 0 { req.Preferences.Budget = 100000 }
	if req.Preferences.People == 0 { req.Preferences.People = 1 }

	// Truy vấn quán ăn quanh vị trí
	restaurants, err := services.GetRestaurantsNearby(ctx, services.NearbyQuery{
		Latitude:  req.Location.Lat,
		Longitude: req.Location.Lng,
		RadiusKm:  req.Location.RadiusKm,
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, dto.RecommendResponse{Success: false, Message: "Lỗi DB"})
		return
	}

	if len(restaurants) == 0 {
		c.JSON(http.StatusOK, dto.RecommendResponse{Success: true, Data: dto.RecommendResponseData{Restaurants: []dto.RestaurantSummary{}}})
		return
	}

	// Payload gửi Python AI
	var aiInput []dto.AIRestaurantInput
	for _, r := range restaurants {
		aiInput = append(aiInput, utils.BuildAIInput(r))
	}

	aiReq := dto.AIRecommendRequest{
		UserIntent:  utils.ToUserContext(req),
		Restaurants: aiInput,
	}

	// Gọi Python Service chấm điểm
	aiResp, err := services.CallPythonEngine(aiReq)
	if err != nil {
		c.JSON(http.StatusServiceUnavailable, dto.RecommendResponse{Success: false, Message: "AI Service lỗi"})
		return
	}

	// Map kết quả trả về cho Frontend
	var finalResults []dto.RestaurantSummary
	resMap := make(map[int]models.Restaurant)
	for _, r := range restaurants {
		resMap[r.ID] = r
	}

	for _, aiRes := range aiResp.RecommendedRestaurants {
		if original, exists := resMap[aiRes.ID]; exists {
			summary := dto.RestaurantSummary{
				ID: original.ID,
				RestaurantInfo: dto.InfoDTO{
					Name: original.Name,
					Contact: dto.ContactDTO{Address: original.Address},
					OperatingHours: dto.HoursDTO{
						Schedule: original.OpenTime + " - " + original.CloseTime,
						IsOpenNow: original.IsOpen,
					},
				},
				Meta: dto.MetaDTO{
					Rating: original.Rating,
					DistanceKm: original.DistanceKm,
				},
				AIAnalysis: dto.AIAnalysisDTO{
					Score: aiRes.Score,
					Reason: aiRes.Reason,
				},
			}
			if len(original.Menu) > 0 {
				summary.SignatureDish = dto.SignatureDishDTO{
					DishName: original.Menu[0].Name,
					Description: original.Menu[0].Description,
				}
			}
			finalResults = append(finalResults, summary)
		}
	}

	c.JSON(http.StatusOK, dto.RecommendResponse{
		Success: true,
		Message: "Thành công",
		Data:    dto.RecommendResponseData{Restaurants: finalResults},
	})
}
