package middlewares

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"go-core-backend/internal/services"
)

func FirebaseAuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {

		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Missing token"})
			return
		}

		parts := strings.Split(authHeader, " ")
		if len(parts) != 2 {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid format"})
			return
		}

		idToken := parts[1]

		decoded, err := services.VerifyIDToken(c.Request.Context(), idToken)
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
			return
		}

		// Lấy user từ DB theo Firebase UID
		user, err := services.GetUserByProviderID(c.Request.Context(), decoded.UID)
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "User not found"})
			return
		}

		c.Set("user_id", user.ID)
		c.Next()
	}
}

