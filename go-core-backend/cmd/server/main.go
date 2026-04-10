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