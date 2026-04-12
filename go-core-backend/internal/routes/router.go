package routes

import (
	"github.com/gin-gonic/gin"

	"go-core-backend/internal/handlers"
)

// SetupRouter thiết lập các route cho server
func SetupRouter(r *gin.Engine) {
	
	//Group API version 1
	//localhost:8080/api/v1/
	v1 := r.Group("/api/v1")
	{
	// Route cho API chat
	v1.POST("/chat", handlers.ChatbotProcess)

	// Route cho API recommend
	v1.GET("/recommend", handlers.GetRecommendations)

	// OAuth
	v1.POST("/auth/oauth", handlers.Login)

	// Local
	v1.POST("/auth/register", handlers.Register)
	v1.POST("/auth/login", handlers.LocalLogin)

	// Profile
	v1.GET("/me", handlers.GetProfile)
	v1.PUT("/me", handlers.UpdateProfile)
	}
}