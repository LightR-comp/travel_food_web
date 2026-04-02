package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"smart-tourism/internal/models"
	"smart-tourism/internal/services"
)

// Login godoc
// POST /api/auth/login
// Body: { "id_token": "<Google ID Token từ client>" }
//
// Luồng: Nhận token -> Verify qua Firebase -> Check user trong DB -> Nếu chưa có thì tạo mới -> Trả profile
func Login(c *gin.Context) {
	var req struct {
		IDToken string `json:"id_token" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu id_token"})
		return
	}

	// 1. Verify token
	token, err := services.VerifyIDToken(c.Request.Context(), req.IDToken)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ"})
		return
	}

	uid := token.UID
	email, _ := token.Claims["email"].(string)
	name, _ := token.Claims["name"].(string)
	avatar, _ := token.Claims["picture"].(string)

	// 2. Check user trong DB, nếu chưa có thì upsert
	user, err := services.UpsertUser(c.Request.Context(), uid, email, name, avatar)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lưu thông tin user"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng nhập thành công",
		"user":    user,
	})
}

// GetProfile godoc
// GET /api/users/profile
// Header: Authorization: Bearer <token>
// Middleware FirebaseAuth đã gắn uid vào context trước đó.
func GetProfile(c *gin.Context) {
	uid := c.GetString("uid")

	user, err := services.GetUserByUID(c.Request.Context(), uid)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Không tìm thấy user"})
		return
	}

	c.JSON(http.StatusOK, user)
}

// UpdateProfile godoc
// PUT /api/users/profile
// Header: Authorization: Bearer <token>
// Body: UserPreferences (ăn kiêng, số người, kinh phí mặc định,...)
func UpdateProfile(c *gin.Context) {
	uid := c.GetString("uid")

	var prefs models.UserPreferences
	if err := c.ShouldBindJSON(&prefs); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	if err := services.UpdateUserPreferences(c.Request.Context(), uid, prefs); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi cập nhật profile"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Cập nhật thành công"})
}