// main.go là điểm khởi đầu của ứng dụng
// nơi chúng ta thiết lập server, cấu hình các route và chạy server
// Đây là nơi chúng ta sẽ load cấu hình, khởi tạo router Gin, thiết lập các route cơ bản và sau đó chạy server trên cổng được chỉ định trong file config.

package main

import (
	"context"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"

	"go-core-backend/internal/config"
	"go-core-backend/internal/routes"
	"go-core-backend/internal/services"
)

func main() {
	// 🔥 Load config
	config.LoadConfig()

	// 🔥 Init Firebase (THÊM DÒNG NÀY)
	if err := services.InitFirebase(context.Background()); err != nil {
		panic(err)
	}

	// 🔥 Tạo server
	r := gin.Default()

	r.SetTrustedProxies(nil)

	// Test endpoint
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Go Server is running",
		})
	})

	// Setup routes
	routes.SetupRouter(r)

	// Lấy port
	port := config.AppConfig.Port
	fmt.Println("Server is running on port:", port)

	// 🔥 CHẠY SERVER (QUAN TRỌNG)
	r.Run(":" + port)
}