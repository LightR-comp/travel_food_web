package handlers

import (
	"net/http"
	"strconv"

	"backend/core/internal/services" 

	"github.com/gin-gonic/gin"
)

func GetWeather(c *gin.Context) {
	latStr := c.Query("lat")
	lngStr := c.Query("lng")

	if latStr == "" || lngStr == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"success": false,
			"message": "Thiếu tọa độ lat hoặc lng",
			"data":    nil,
			"error":   "Missing required query parameters",
		})
		return
	}

	lat, errLat := strconv.ParseFloat(latStr, 64)
	lng, errLng := strconv.ParseFloat(lngStr, 64)
	if errLat != nil || errLng != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"success": false,
			"message": "Tọa độ không hợp lệ",
			"data":    nil,
			"error":   "Invalid coordinate format",
		})
		return
	}

	weatherData, err := services.GetLiveWeather(lat, lng)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "Không thể lấy dữ liệu thời tiết thực tế",
			"data":    nil,
			"error":   err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Tải thông tin thời tiết thành công",
		"data":    weatherData,
		"error":   nil,
	})
}