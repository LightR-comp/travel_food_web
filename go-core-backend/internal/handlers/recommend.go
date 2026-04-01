package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// GetRecommendations là API luồng chính tìm quán ăn
// TODO: Kiên viết logic chọc DB lấy danh sách quán, rồi gọi qua AI Python ở đây nha!
// GetRecommendations là hàm xử lý cho API /recommend
func GetRecommendations(c *gin.Context) {
	// Tạm thời trả về JSON chuẩn form sếp quy định để test luồng
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Đang gọi AI Python để tìm quán ngon cho sếp...",
		"data":    nil,
		"error":   nil,
	})
}