package handlers

import (
	"go-core-backend/internal/services"
	"go-core-backend/internal/utils"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// Cấu trúc phân tầng  API-CONTRACT.md
type RestaurantData struct {
	ID             string `json:"id"`
	RestaurantInfo struct {
		Name    string `json:"name"`
		Contact struct {
			Address string `json:"address"`
			Phone   string `json:"phone,omitempty"`
		} `json:"contact"`
		OperatingHours struct {
			Schedule   string `json:"schedule,omitempty"`
			IsOpenNow  bool   `json:"is_open_now"`
			StatusText string `json:"status_text"`
		} `json:"operating_hours"`
		History  string   `json:"history,omitempty"`
		FunFacts []string `json:"fun_facts,omitempty"`
	} `json:"restaurant_info"`
	SignatureDish struct {
		DishName       string   `json:"dish_name,omitempty"`
		CulturalOrigin string   `json:"cultural_origin,omitempty"`
		FlavorProfile  string   `json:"flavor_profile,omitempty"`
		Trivia         []string `json:"trivia,omitempty"`
	} `json:"signature_dish,omitempty"`
	Meta struct {
		Rating     float64 `json:"rating,omitempty"`
		DistanceKm float64 `json:"distance_km"`
		PriceRange string  `json:"price_range"`
		Lat        float64 `json:"lat"`
		Lng        float64 `json:"lng"`
	} `json:"meta"`
	AIAnalysis *struct {
		Score  float64 `json:"score"`
		Reason string  `json:"reason"`
	} `json:"ai_analysis,omitempty"`
}

// StandardizeData nhào nặn dữ liệu Map thô thành form RestaurantData
func StandardizeData(raw services.GoongDetail, mainText string, placeID string, latTam float64, lngTam float64) RestaurantData {
	quanLat := raw.Result.Geometry.Location.Lat
	quanLng := raw.Result.Geometry.Location.Lng

	// Tính khoảng cách thực tế
	khoangCachThuc := utils.CalculateDistance(latTam, lngTam, quanLat, quanLng)

	// Giả lập dữ liệu (sau này lấy từ DB)
	rawPrice := 550000
	isOpen := true

	var place RestaurantData

	// 1. Gán ID bắt buộc
	place.ID = placeID

	// 2. Gom nhóm Restaurant Info
	place.RestaurantInfo.Name = mainText
	if place.RestaurantInfo.Name == "" {
		place.RestaurantInfo.Name = raw.Result.Name
	}
	place.RestaurantInfo.Contact.Address = raw.Result.FormattedAddress
	place.RestaurantInfo.OperatingHours.IsOpenNow = isOpen
	place.RestaurantInfo.OperatingHours.StatusText = utils.FormatStatusText(isOpen)

	// 3. Gom nhóm Meta
	place.Meta.DistanceKm = khoangCachThuc
	place.Meta.PriceRange = utils.FormatPrice(rawPrice)
	place.Meta.Lat = quanLat
	place.Meta.Lng = quanLng

	// Lưu ý: Các trường DB/AI sẽ để trống mặc định và bị ẩn đi nhờ `omitempty`
	return place
}

// --- CÁCH 1: TRẢ VỀ DANH SÁCH 5 QUÁN ---
func GetListPlacesHandler(c *gin.Context) {
	keyword := c.Query("keyword")
	lat, _ := strconv.ParseFloat(c.Query("lat"), 64)
	lng, _ := strconv.ParseFloat(c.Query("lng"), 64)
	radius := 1000

	if keyword == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"success": false,
			"message": "Thiếu từ khóa tìm kiếm",
			"data":    gin.H{},
			"error":   "missing_keyword",
		})
		return
	}

	client := services.NewGMapsClient()
	res, err := client.Autocomplete(keyword, 5, lat, lng, radius)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "Lỗi truy xuất dữ liệu bản đồ",
			"data":    gin.H{},
			"error":   err.Error(),
		})
		return
	}

	var finalResults []RestaurantData
	for _, p := range res.Predictions {
		detail, err := client.GetPlaceDetail(p.PlaceID)
		if err != nil {
			continue
		}

		// Đưa place_id vào hàm chuẩn hóa
		finalResults = append(finalResults, StandardizeData(detail, p.StructuredFormatting.MainText, p.PlaceID, lat, lng))
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Lấy danh sách địa điểm thành công",
		"data": gin.H{
			"restaurants": finalResults,
		},
		"error": nil,
	})
}

// --- CÁCH 2: TRẢ VỀ 1 QUÁN CỤ THỂ DUY NHẤT ---
func GetBestMatchPlaceHandler(c *gin.Context) {
	keyword := c.Query("keyword")
	lat, _ := strconv.ParseFloat(c.Query("lat"), 64)
	lng, _ := strconv.ParseFloat(c.Query("lng"), 64)

	client := services.NewGMapsClient()
	res, err := client.Autocomplete(keyword, 1, lat, lng, 2000)
	if err != nil || len(res.Predictions) == 0 {
		c.JSON(http.StatusNotFound, gin.H{
			"success": false,
			"message": "Không tìm thấy quán phù hợp",
			"data":    gin.H{},
			"error":   "not_found",
		})
		return
	}

	p := res.Predictions[0]
	detail, _ := client.GetPlaceDetail(p.PlaceID)

	finalData := StandardizeData(detail, p.StructuredFormatting.MainText, p.PlaceID, lat, lng)

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Tìm thấy địa điểm phù hợp nhất",
		"data": gin.H{
			"restaurants": []RestaurantData{finalData},
		},
		"error": nil,
	})
}
