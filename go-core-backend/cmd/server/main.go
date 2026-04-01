package main

import (
	"fmt"
	"net/http"

	"go-core-backend/internal/config"

	"github.com/gin-gonic/gin"
)
func main() {
	// Load cấu hình
	config.LoadConfig()

	// Khởi tạo server Gin mặc định
	r :=gin.Default()

	// Thêm dòng này để tắt cảnh báo "Trusted Proxies"
	r.SetTrustedProxies(nil)

	// Tạo endpoint test /ping
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Go Server is running",
			"data": nil,
			"error": nil,
		})
	})
		
	//Lấy port từ file config
	port := config.AppConfig.Port
	fmt.Print("Server is running on port: ", port)

	// Chạy server trên port đã cấu hình
	if err := r.Run(":" + port); err != nil {
		fmt.Print("Failed to start server: ", err)
	}
}