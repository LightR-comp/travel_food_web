package handlers

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"

	"backend/core/internal/models"
	"backend/core/internal/services"
)

// ---- Helper trả về format chuẩn ----
func successResponse(c *gin.Context, message string, data any) {
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": message,
		"data":    data,
		"error":   nil,
	})
}

func errorResponse(c *gin.Context, status int, message string, err string) {
	c.JSON(status, gin.H{
		"success": false,
		"message": message,
		"data":    nil,
		"error":   err,
	})
}

// Login OAuth (Google/Facebook)
func Login(c *gin.Context) {
	var req struct {
		IDToken  string `json:"id_token" binding:"required"`
		Provider string `json:"provider" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu id_token hoặc provider", err.Error())
		return
	}

	token, err := services.VerifyIDToken(c.Request.Context(), req.IDToken)
	if err != nil {
		errorResponse(c, http.StatusUnauthorized, "Token không hợp lệ", err.Error())
		return
	}

	email, _ := token.Claims["email"].(string)
	name, _ := token.Claims["name"].(string)
	avatar, _ := token.Claims["picture"].(string)

	user, err := services.UpsertUser(
		c.Request.Context(),
		token.UID, email, name, avatar,
		models.AuthProvider(req.Provider),
	)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi lưu thông tin user", err.Error())
		return
	}

	jwtToken, err := services.GenerateJWT(user.ID)
	if err != nil {
    	c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo token"})
    	return
	}
	
	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng nhập thành công",
		"token":   jwtToken,
		"user":    user,
	})
}

// GetProfile lấy thông tin user hiện tại
func GetProfile(c *gin.Context) {
	userID := c.GetInt("user_id")

	user, err := services.GetUserByID(c.Request.Context(), userID)
	if err != nil {
		errorResponse(c, http.StatusNotFound, "Không tìm thấy user", err.Error())
		return
	}

	successResponse(c, "Lấy thông tin thành công", user)
}

// UpdateProfile cập nhật preferences
func UpdateProfile(c *gin.Context) {
	userID := c.GetInt("user_id")

	var prefs models.UserPreferences
	if err := c.ShouldBindJSON(&prefs); err != nil {
		errorResponse(c, http.StatusBadRequest, "Dữ liệu không hợp lệ", err.Error())
		return
	}

	if err := services.UpdateUserPreferences(c.Request.Context(), userID, prefs); err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi cập nhật profile", err.Error())
		return
	}

	successResponse(c, "Cập nhật thành công", nil)
}

// ForgotPassword gửi reset link qua email
func ForgotPassword(c *gin.Context) {
	var req struct {
		Username string `json:"username" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu username", err.Error())
		return
	}

	token, email, err := services.CreatePasswordResetToken(c.Request.Context(), req.Username)
	if err != nil {
		successResponse(c, "Nếu tài khoản tồn tại, hướng dẫn đặt lại mật khẩu đã được gửi", nil)
		return
	}

	resetLink := fmt.Sprintf("%s/reset-password?token=%s", os.Getenv("FRONTEND_URL"), token)

	// Dev mode
	if os.Getenv("SMTP_HOST") == "" {
		successResponse(c, "Dev mode: token đặt lại mật khẩu", gin.H{
			"token":      token,
			"reset_link": resetLink,
			"email":      email,
		})
		return
	}

	if err := services.SendResetEmail(email, resetLink); err != nil {
		log.Printf("[ForgotPassword] Lỗi gửi email: %v", err)
	}

	successResponse(c, "Nếu tài khoản tồn tại, hướng dẫn đặt lại mật khẩu đã được gửi", nil)
}

// ResetPassword đổi mật khẩu mới
func ResetPassword(c *gin.Context) {
	var req struct {
		Token       string `json:"token"        binding:"required"`
		NewPassword string `json:"new_password" binding:"required,min=6"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu token hoặc mật khẩu mới (tối thiểu 6 ký tự)", err.Error())
		return
	}

	if err := services.ResetPassword(c.Request.Context(), req.Token, req.NewPassword); err != nil {
		errorResponse(c, http.StatusBadRequest, err.Error(), err.Error())
		return
	}

	successResponse(c, "Đặt lại mật khẩu thành công", nil)
}
