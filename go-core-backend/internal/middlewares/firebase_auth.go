// firebase_auth.go chứa middleware để xác thực người dùng thông qua Firebase Authentication.
// Middleware này sẽ được áp dụng cho các route cần bảo vệ, đảm bảo rằng chỉ những người dùng đã đăng nhập mới có thể truy cập vào các API đó.
// Middleware sẽ kiểm tra header Authorization, xác thực token với Firebase, và nếu hợp lệ, sẽ lưu thông tin người dùng vào context để các handler có thể sử dụng.
// Đây là một phần quan trọng để đảm bảo an toàn cho API của chúng ta, ngăn chặn truy cập trái phép và bảo vệ dữ liệu người dùng.

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

