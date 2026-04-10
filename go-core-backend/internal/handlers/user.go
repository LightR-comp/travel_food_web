// user.go chứa các hàm xử lý liên quan đến người dùng, bao gồm đăng nhập, lấy thông tin profile và cập nhật profile. 
// Đây là nơi chúng ta sẽ xây dựng logic để xác thực người dùng thông qua token
// lưu trữ thông tin người dùng vào cơ sở dữ liệu và cung cấp API để frontend có thể lấy và cập nhật thông tin người dùng một cách dễ dàng.

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

//Đăng ký tài khoản Local
func Register(c *gin.Context) {
	var req struct {
		Username string `json:"username" binding:"required"`
		Password string `json:"password" binding:"required"`
		Name     string `json:"name" binding:"required"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu username, password hoặc name"})
		return
	}

	user, err := services.RegisterLocal(c.Request.Context(), req.Username, req.Password, req.Name)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo tài khoản"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng ký thành công",
		"user":    user,
	})
}

func LocalLogin(c *gin.Context) {
	var req struct {
		Username string `json:"username" binding:"required"`
		Password string `json:"password" binding:"required"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu username hoặc password"})
		return
	}

	user, err := services.LocalLogin(c.Request.Context(), req.Username, req.Password)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Tên đăng nhập hoặc mật khẩu không đúng"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng nhập thành công",
		"user":    user,
	})
}

