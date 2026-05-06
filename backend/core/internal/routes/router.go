package routes

import (
	"github.com/gin-gonic/gin"

	"backend/core/internal/handlers"
	"backend/core/internal/middlewares"
)

func SetupRouter(r *gin.Engine) {
	v1 := r.Group("/api/v1")
	{
		// --- NHÓM CHATBOT AI ---
		chat := v1.Group("/chat")
		{
			chat.POST("/message", handlers.ChatbotProcess)             // Xử lý tin nhắn (Intent -> DB -> Gen text)
		//	chat.GET("/history/:userId", handlers.GetChatHistory)      // Lấy lịch sử chat
		}


		// --- NHÓM GỢI Ý QUÁN ĂN ---
		v1.POST("/recommend", handlers.GetRecommendations)


		// --- NHÓM XÁC THỰC & NGƯỜI DÙNG ---
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

		// --- NHÓM NHÀ HÀNG & MÓN ĂN ---
		restaurants := v1.Group("/restaurants")
		{
			restaurants.GET("/popular", handlers.GetPopularRestaurants) // Good spots for food
		 	restaurants.GET("/search", handlers.SearchRestaurants)      // Bộ lọc & Tìm kiếm (q, price, sort...)
			restaurants.GET("/:id", handlers.GetRestaurantDetail)       // Chi tiết nhà hàng.
		}

		v1.GET("/dishes/trending", handlers.GetTrendingDishes)

		//--- NHÓM BÀI VIẾT (POSTS) ---
		posts := v1.Group("/posts")
		{
			// Public routes (Xem không cần đăng nhập)
			posts.GET("/popular", handlers.GetPopularPosts) // Bài review hot
			posts.GET("", handlers.GetListPosts)            // Danh sách bài viết (Phân trang/Topic)
			posts.GET("/:id", handlers.GetPostDetail)       // Chi tiết bài viết + Comments

			// Private routes (Cần Middleware Auth)
			authorized := posts.Group("/")
			authorized.Use(middlewares.FirebaseAuthMiddleware())
			{
				authorized.POST("", handlers.CreatePost)                // Đăng bài mới
				authorized.POST("/:id/comments", handlers.AddComment)    // Bình luận bài viết, :id là ID bài viết
				authorized.POST("/:id/likes", handlers.LikePost)        // Thả tim, :id là ID bài viết
			}
		}

		// // --- NHÓM TIỆN ÍCH (Vị trí, Thời tiết, Tiền tệ) ---
		// utils := v1.Group("/utils")
		// {
		// 	utils.GET("/weather", handlers.GetWeather)
		// 	utils.GET("/currency", handlers.GetExchangeRate)
		// }
	}
	}
