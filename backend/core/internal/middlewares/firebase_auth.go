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

        // Chỉ giữ ParseJWT
        userID, err := services.ParseJWT(parts[1])
        if err != nil {
            c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ"})
            return
        }

        c.Set("user_id", userID)  
        c.Next()                   
    }
}