package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"go-core-backend/internal/models"
	"go-core-backend/internal/services"
)

func Login(c *gin.Context) {
	var req struct {
		IDToken  string `json:"id_token" binding:"required"`
		Provider string `json:"provider" binding:"required"` // "google" hoặc "facebook"
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu id_token hoặc provider"})
		return
	}

	token, err := services.VerifyIDToken(c.Request.Context(), req.IDToken)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ"})
		return
	}

	email, _ := token.Claims["email"].(string)
	name, _ := token.Claims["name"].(string)
	avatar, _ := token.Claims["picture"].(string)

	user, err := services.UpsertUser(
		c.Request.Context(),
		token.UID,
		email, name, avatar,
		models.AuthProvider(req.Provider),
	)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lưu thông tin user"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng nhập thành công",
		"user":    user,
	})
}

func GetProfile(c *gin.Context) {
	userID := c.GetInt("user_id")

	user, err := services.GetUserByID(c.Request.Context(), userID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Không tìm thấy user"})
		return
	}

	c.JSON(http.StatusOK, user)
}

func UpdateProfile(c *gin.Context) {
	userID := c.GetInt("user_id")

	var prefs models.UserPreferences
	if err := c.ShouldBindJSON(&prefs); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	if err := services.UpdateUserPreferences(c.Request.Context(), userID, prefs); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi cập nhật profile"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Cập nhật thành công"})
}
