package routes

import (
	"github.com/gin-gonic/gin"

	"go-core-backend/internal/handlers"
	"go-core-backend/internal/middlewares"
)

func SetupRouter(r *gin.Engine) {
	v1 := r.Group("/api/v1")
	{
		v1.POST("/chat",      handlers.ChatbotProcess)
		v1.POST("/recommend", handlers.GetRecommendations)

		auth := v1.Group("/auth")
		{
			auth.POST("/oauth",           handlers.Login)
			auth.POST("/register",        handlers.Register)
			auth.POST("/login",           handlers.LocalLogin)
			auth.POST("/forgot-password", handlers.ForgotPassword)
			auth.POST("/reset-password",  handlers.ResetPassword)
		}

		protected := v1.Group("", middlewares.FirebaseAuthMiddleware())
		{
			protected.GET("/me", handlers.GetProfile)
			protected.PUT("/me", handlers.UpdateProfile)
		}
	}
}