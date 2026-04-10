package handlers

import (
	"go-core-backend/internal/services"
	"go-core-backend/internal/utils"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

type StandardizedPlace struct {
	Name          string
	SecondaryAddr string
	FullAddress   string
	Lat, Lng      float64
	Distance      float64
	Price         string
	Status        string
}

// Hàm này giả lập việc chuẩn hóa dữ liệu thô từ API Goong thành định dạng chuẩn để trả về cho client.
// KHông giống với các hàm bên dưới dùng cho frontend
func StandardizeData(raw services.GoongDetail, mainText string, secondaryText string, latTam float64, lngTam float64) StandardizedPlace {
	// Giả lập dữ liệu thô cho các hàm utils
	quanLat := raw.Result.Geometry.Location.Lat
	quanLng := raw.Result.Geometry.Location.Lng

	// TÍNH KHOẢNG CÁCH THỰC TẾ
	khoangCachThuc := utils.CalculateDistance(latTam, lngTam, quanLat, quanLng)

	rawPrice := 550000
	isOpen := true

	return StandardizedPlace{
		Name:          mainText,
		SecondaryAddr: secondaryText,
		FullAddress:   raw.Result.FormattedAddress,
		Lat:           raw.Result.Geometry.Location.Lat,
		Lng:           raw.Result.Geometry.Location.Lng,
		Distance:      khoangCachThuc,
		Price:         utils.FormatPrice(rawPrice),
		Status:        utils.FormatStatusText(isOpen),
	}
}

// --- CÁCH 1: TRẢ VỀ DANH SÁCH 5 QUÁN ĐÃ CHUẨN HÓA ---
// URL ví dụ: /api/places/search?keyword=com+tam&lat=10.7629&lng=106.6821
func GetListPlacesHandler(c *gin.Context) {
	keyword := c.Query("keyword")
	lat, _ := strconv.ParseFloat(c.Query("lat"), 64)
	lng, _ := strconv.ParseFloat(c.Query("lng"), 64)
	radius := 1000 // Mặc định 1km

	if keyword == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu từ khóa tìm kiếm"})
		return
	}

	client := services.NewGMapsClient()
	// Gọi service lấy 5 quán
	res, err := client.Autocomplete(keyword, 5, lat, lng, radius)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi truy xuất dữ liệu"})
		return
	}

	var finalResults []StandardizedPlace
	for _, p := range res.Predictions {
		detail, err := client.GetPlaceDetail(p.PlaceID)
		if err != nil {
			continue
		}
		// Chuẩn hóa từng quán trước khi cho vào danh sách
		finalResults = append(finalResults, StandardizeData(detail, p.StructuredFormatting.MainText, p.StructuredFormatting.SecondaryText, lat, lng))
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"count":   len(finalResults),
		"data":    finalResults,
	})
}

// --- CÁCH 2: TRẢ VỀ 1 QUÁN CỤ THỂ DUY NHẤT (THEO KEYWORD) ---
// URL ví dụ: /api/places/best?keyword=pho+le&lat=10.7629&lng=106.6821
func GetBestMatchPlaceHandler(c *gin.Context) {
	keyword := c.Query("keyword")
	lat, _ := strconv.ParseFloat(c.Query("lat"), 64)
	lng, _ := strconv.ParseFloat(c.Query("lng"), 64)

	client := services.NewGMapsClient()
	// Chỉ lấy 1 kết quả duy nhất (limit = 1)
	res, err := client.Autocomplete(keyword, 1, lat, lng, 2000)
	if err != nil || len(res.Predictions) == 0 {
		c.JSON(http.StatusNotFound, gin.H{"success": false, "message": "Không tìm thấy quán phù hợp"})
		return
	}

	p := res.Predictions[0]
	detail, _ := client.GetPlaceDetail(p.PlaceID)

	// Chuẩn hóa dữ liệu quán cụ thể đó
	finalData := StandardizeData(detail, p.StructuredFormatting.MainText, p.StructuredFormatting.SecondaryText, lat, lng)

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"data":    finalData,
	})
}
