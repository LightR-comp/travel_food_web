
package main

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"backend/core/internal/config"
	"backend/core/internal/handlers"
	"backend/core/internal/routes"
	"backend/core/internal/services"
)

func main() {
	config.LoadConfig()

	services.InitDB()

	services.InitServiceDB(services.GetDB())

	services.InitCloudinary()

	if err := services.InitFirebase(context.Background()); err != nil {
		panic(err)
	}

	handlers.InitUserHandler(services.GetDB())

	r := gin.Default()

	allowedOrigins := []string{
		"http://localhost:5173",
		"http://localhost:3000",
		"http://127.0.0.1:5173",
		"http://127.0.0.1:3000",
		"https://travelfoodweb1.vercel.app",
		"https://yummap-1-9-1-7.onrender.com",
	}
	if envOrigins := os.Getenv("ALLOWED_ORIGINS"); envOrigins != "" {
		for _, origin := range strings.Split(envOrigins, ",") {
			trimmed := strings.TrimSpace(origin)
			if trimmed != "" {
				allowedOrigins = append(allowedOrigins, trimmed)
			}
		}
	}

	r.Use(cors.New(cors.Config{
		AllowOrigins:     allowedOrigins,
		AllowMethods:     []string{"GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept", "Authorization", "X-Requested-With"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	r.SetTrustedProxies(nil)

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Go Server is running",
		})
	})

	routes.SetupRouter(r)

	port := config.AppConfig.Port
	fmt.Println("Server is running on port:", port)

	r.Run(":" + port)
}
