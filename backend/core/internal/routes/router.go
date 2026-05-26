package routes

import (
	"github.com/gin-gonic/gin"

	"backend/core/internal/handlers"
	"backend/core/internal/middlewares"
)

func SetupRouter(r *gin.Engine) {
	// Serve static files cho avatar
	r.Static("/uploads", "./uploads")

	v1 := r.Group("/api/v1")
	{
		// --- NHÓM CHATBOT AI ---
		chat := v1.Group("/chat")
		{
			chat.POST("/message", handlers.ChatbotProcess)
			chat.GET("/history/:userId", handlers.GetChatHistory)
		}

		// --- NHÓM GỢI Ý QUÁN ĂN ---
		v1.POST("/recommend", handlers.GetRecommendations)

		// --- NHÓM XÁC THỰC & NGƯỜI DÙNG ---
		auth := v1.Group("/auth")
		{
			auth.POST("/oauth", handlers.Login)
			auth.POST("/register", handlers.Register)
			auth.POST("/login", handlers.LocalLogin)
			auth.POST("/forgot-password", handlers.ForgotPassword)
			auth.POST("/reset-password", handlers.ResetPassword)
		}

		protected := v1.Group("", middlewares.FirebaseAuthMiddleware())
		{
			protected.GET("/me", handlers.GetProfile)
			protected.PUT("/me", handlers.UpdateProfile)

			// --- AVATAR ---
			protected.POST("/me/avatar", handlers.UploadAvatar)
			protected.DELETE("/me/avatar", handlers.DeleteAvatar)
			protected.PUT("/me/avatar", handlers.UpdateAvatar)
		}

		// --- NHÓM NHÀ HÀNG & MÓN ĂN ---
		restaurants := v1.Group("/restaurants")
		{
			restaurants.GET("/popular", handlers.GetPopularRestaurants)
			restaurants.GET("/search", handlers.SearchRestaurants)
			restaurants.GET("/:id", handlers.GetRestaurantDetail)
			restaurants.GET("/:id/ratings", handlers.GetReviews)

			restaurantAuth := restaurants.Group("", middlewares.FirebaseAuthMiddleware())
			{
				restaurantAuth.POST("/:id/rating", handlers.CreateComment)
				restaurantAuth.PUT("/:id/rating/:reviewId", handlers.UpdateComment)
				restaurantAuth.DELETE("/:id/rating/:reviewId", handlers.DeleteComment)
			}
		}

		v1.GET("/dishes/trending", handlers.GetTrendingDishes)

		// --- NHÓM BÀI VIẾT (POSTS) ---
		posts := v1.Group("/posts")
		{
			posts.GET("/popular", handlers.GetPopularPosts)
			posts.GET("", handlers.GetListPosts)
			posts.GET("/:id", handlers.GetPostDetail)

			authorized := posts.Group("")
			authorized.Use(middlewares.FirebaseAuthMiddleware())
			{
				authorized.POST("", handlers.CreatePost)
				authorized.POST("/:id/comments", handlers.AddComment)
				authorized.POST("/:id/likes", handlers.LikePost)
				authorized.POST("/comments/:id/likes", handlers.LikeComment)
				authorized.POST("/upload", handlers.UploadImage)
			}
		}

		// --- NHÓM TIỆN ÍCH ---
		utils := v1.Group("/utils")
		{
			utils.GET("/weather", handlers.GetWeather)
		}
	}
}
