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
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Thiếu token xác thực"})
			return
		}

		parts := strings.Split(authHeader, " ")
		if len(parts) != 2 || strings.ToLower(parts[0]) != "bearer" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Định dạng token không hợp lệ, dùng: Bearer <token>"})
			return
		}

		decoded, err := services.VerifyIDToken(c.Request.Context(), parts[1])
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ hoặc đã hết hạn"})
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