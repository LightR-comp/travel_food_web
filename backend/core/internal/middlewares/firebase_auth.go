package middlewares

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"backend/core/internal/services"
)

func FirebaseAuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Thiếu token"})
			return
		}

		parts := strings.Split(authHeader, " ")
		if len(parts) != 2 || strings.ToLower(parts[0]) != "bearer" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Định dạng token không hợp lệ"})
			return
		}

		tokenStr := parts[1]

		// Thử JWT trước (local account)
		if userID, err := services.ParseJWT(tokenStr); err == nil {
			c.Set("user_id", userID)
			c.Next()
			return
		}

		// Thử Firebase token (Google/Facebook)
		decoded, err := services.VerifyIDToken(c.Request.Context(), tokenStr)
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ"})
			return
		}

		user, err := services.GetUserByProviderID(c.Request.Context(), decoded.UID)
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Không tìm thấy người dùng"})
			return
		}

		c.Set("user_id", user.ID)
		c.Next()
	}
}