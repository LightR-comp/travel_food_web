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

func FirebaseAuth() gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{
				"error": "Thiếu Authorization header",
			})
			return
		}

		parts := strings.SplitN(authHeader, " ", 2)
		if len(parts) != 2 || strings.ToLower(parts[0]) != "bearer" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{
				"error": "Định dạng Authorization không hợp lệ. Dùng: Bearer <token>",
			})
			return
		}

		idToken := parts[1]

		token, err := services.VerifyIDToken(c.Request.Context(), idToken)
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{
				"error": "Token không hợp lệ hoặc đã hết hạn",
			})
			return
		}

		c.Set("uid", token.UID)
		c.Set("email", token.Claims["email"])
		c.Set("name", token.Claims["name"])

		c.Next()
	}
}