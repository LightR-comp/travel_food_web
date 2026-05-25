// main.go là điểm khởi đầu của ứng dụng
// nơi chúng ta thiết lập server, cấu hình các route và chạy server
// Đây là nơi chúng ta sẽ load cấu hình, khởi tạo router Gin, thiết lập các route cơ bản và sau đó chạy server trên cổng được chỉ định trong file config.

package main

import (
	"context"
	"fmt"
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"backend/core/internal/config"
	"backend/core/internal/handlers"
	"backend/core/internal/routes"
	"backend/core/internal/services"
)

func main() {
	// Load config
	config.LoadConfig()

	// Khởi tạo Database
	services.InitDB()

	services.InitServiceDB(services.GetDB())

	// Khởi tạo Cloudinary
	services.InitCloudinary()

	// Init Firebase
	if err := services.InitFirebase(context.Background()); err != nil {
		panic(err)
	}

	// Khởi tạo handlers với database connection
	handlers.InitUserHandler(services.GetDB())

	// Tạo server
	r := gin.Default()

	// Cấu hình CORS
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:5173", "http://localhost:3000", "http://127.0.0.1:5173", "http://127.0.0.1:3000"},
		AllowMethods:     []string{"GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept", "Authorization"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

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

	// CHẠY SERVER
	r.Run(":" + port)
}
