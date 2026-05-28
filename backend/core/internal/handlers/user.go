package handlers

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/gin-gonic/gin"

	"backend/core/internal/models"
	"backend/core/internal/services"
)

var db *sql.DB

func InitUserHandler(database *sql.DB) {
	db = database
}

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

func Login(c *gin.Context) {
	var req struct {
		IDToken  string `json:"id_token" binding:"required"`
		Provider string `json:"provider" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu id_token hoặc provider", err.Error())
		return
	}

	firebaseToken, err := services.VerifyIDToken(c.Request.Context(), req.IDToken)
	if err != nil {
		errorResponse(c, http.StatusUnauthorized, "Token không hợp lệ", err.Error())
		return
	}

	email, _ := firebaseToken.Claims["email"].(string)
	name, _ := firebaseToken.Claims["name"].(string)
	avatar, _ := firebaseToken.Claims["picture"].(string)

	user, err := services.UpsertUser(
		c.Request.Context(),
		firebaseToken.UID, email, name, avatar,
		models.AuthProvider(req.Provider),
	)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi lưu thông tin user", err.Error())
		return
	}

	jwtToken, err := services.GenerateJWT(user.ID)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi tạo token", err.Error())
		return
	}

	successResponse(c, "Đăng nhập thành công", gin.H{
		"token": jwtToken,
		"user":  user,
	})
}

func Register(c *gin.Context) {
	var req struct {
		Username string `json:"username"  binding:"required"`
		Password string `json:"password"  binding:"required"`
		Name     string `json:"full_name" binding:"required"`
		Email    string `json:"email"     binding:"required"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu thông tin đăng ký", err.Error())
		return
	}

	user, err := services.RegisterLocal(c.Request.Context(), req.Username, req.Password, req.Name, req.Email)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, err.Error(), err.Error())
		return
	}

	successResponse(c, "Đăng ký thành công", gin.H{"user_id": user.ID})
}

func LocalLogin(c *gin.Context) {
	var req struct {
		Username string `json:"username" binding:"required"`
		Password string `json:"password" binding:"required"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu username hoặc password", err.Error())
		return
	}

	user, err := services.LocalLogin(c.Request.Context(), req.Username, req.Password)
	if err != nil {
		errorResponse(c, http.StatusUnauthorized, "Tên đăng nhập hoặc mật khẩu không đúng", err.Error())
		return
	}

	token, err := services.GenerateJWT(user.ID)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi tạo token", err.Error())
		return
	}

	successResponse(c, "Đăng nhập thành công", gin.H{
		"token": token,
		"user":  user,
	})
}

func GetProfile(c *gin.Context) {
	userID := c.GetInt("user_id")

	fmt.Printf("GetProfile called - userID: %d\n", userID)

	user, err := services.GetUserByID(c.Request.Context(), userID)
	if err != nil {
		fmt.Printf("GetProfile error: %v\n", err)
		errorResponse(c, http.StatusNotFound, "Không tìm thấy user", err.Error())
		return
	}

	fmt.Printf("GetProfile success - user: %+v\n", user)
	fmt.Printf("AvatarURL: '%s'\n", user.AvatarURL)

	successResponse(c, "Lấy thông tin thành công", user)
}

func UpdateProfile(c *gin.Context) {
	userID := c.GetInt("user_id")
	log.Printf("[UpdateProfile] userID=%d, raw=%v", userID, c.Keys)

	var req struct {
		Name string `json:"name"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Dữ liệu không hợp lệ", err.Error())
		return
	}

	if err := services.UpdateUserName(c.Request.Context(), userID, req.Name); err != nil {
		errorResponse(c, http.StatusInternalServerError, "Lỗi cập nhật tên", err.Error())
		return
	}

	successResponse(c, "Cập nhật thành công", nil)
}


func UploadAvatar(c *gin.Context) {
	userID := c.GetInt("user_id")

	fmt.Printf("===== START UploadAvatar =====\n")
	fmt.Printf("UserID: %d\n", userID)

	file, err := c.FormFile("avatar")
	if err != nil {
		fmt.Printf("ERROR FormFile: %v\n", err)
		errorResponse(c, http.StatusBadRequest, "Không tìm thấy file ảnh", err.Error())
		return
	}

	fmt.Printf("File name: %s\n", file.Filename)
	fmt.Printf("File size: %d bytes\n", file.Size)

	allowedTypes := map[string]bool{
		".jpg":  true,
		".jpeg": true,
		".png":  true,
		".gif":  true,
		".webp": true,
	}
	ext := strings.ToLower(filepath.Ext(file.Filename))
	fmt.Printf("File extension: %s\n", ext)

	if !allowedTypes[ext] {
		fmt.Printf("ERROR: Invalid file type\n")
		errorResponse(c, http.StatusBadRequest, "Định dạng file không hợp lệ", "")
		return
	}

	if file.Size > 5*1024*1024 {
		fmt.Printf("ERROR: File too large\n")
		errorResponse(c, http.StatusBadRequest, "Kích thước file không được vượt quá 5MB", "")
		return
	}

	fmt.Printf("Calling services.UploadAvatar...\n")
	avatarURL, err := services.UploadAvatar(c.Request.Context(), userID, file)
	if err != nil {
		fmt.Printf("ERROR UploadAvatar service: %v\n", err)
		errorResponse(c, http.StatusInternalServerError, "Upload avatar thất bại", err.Error())
		return
	}

	fmt.Printf("Upload success: %s\n", avatarURL)

	user, err := services.GetUserByID(c.Request.Context(), userID)
	if err != nil {
		fmt.Printf("WARNING: Cannot get updated user: %v\n", err)
		successResponse(c, "Upload avatar thành công", gin.H{
			"avatar_url": avatarURL,
		})
		return
	}

	fmt.Printf("User updated successfully, avatar_url: %s\n", user.AvatarURL)
	fmt.Printf("===== END UploadAvatar =====\n")

	successResponse(c, "Upload avatar thành công", gin.H{
		"avatar_url": user.AvatarURL,
		"user":       user,
	})
}

func DeleteAvatar(c *gin.Context) {
	userID := c.GetInt("user_id")

	err := services.DeleteAvatar(c.Request.Context(), userID)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Xóa avatar thất bại", err.Error())
		return
	}

	successResponse(c, "Xóa avatar thành công", nil)
}

func UpdateAvatar(c *gin.Context) {
	userID := c.GetInt("user_id")

	var req struct {
		AvatarURL string `json:"avatar_url" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		errorResponse(c, http.StatusBadRequest, "Thiếu avatar_url", err.Error())
		return
	}

	err := services.UpdateAvatarURL(c.Request.Context(), userID, req.AvatarURL)
	if err != nil {
		errorResponse(c, http.StatusInternalServerError, "Cập nhật avatar thất bại", err.Error())
		return
	}

	successResponse(c, "Cập nhật avatar thành công", gin.H{
		"avatar_url": req.AvatarURL,
	})
}

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
