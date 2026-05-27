package services

import (
	"context"
	"database/sql"
	"fmt"
	"mime/multipart"
	"strings"
	"time"
)

var avatarDB *sql.DB

func InitServiceDB(database *sql.DB) {
	avatarDB = database
	fmt.Printf("✅ InitServiceDB called, avatarDB initialized: %v\n", avatarDB != nil)
}

// UploadAvatar - upload avatar lên Cloudinary (không lưu local)
func UploadAvatar(ctx context.Context, userID int, file *multipart.FileHeader) (string, error) {
	fmt.Printf("  --> UploadAvatar service started (CLOUDINARY MODE)\n")
	fmt.Printf("  --> UserID: %d, File: %s\n", userID, file.Filename)

	// Kiểm tra database connection
	if avatarDB == nil {
		fmt.Printf("  --> ERROR: Database not initialized! Call InitServiceDB first.\n")
		return "", fmt.Errorf("database not initialized")
	}
	fmt.Printf("  --> Database connection OK\n")

	// Validate file type
	allowedTypes := map[string]bool{
		".jpg":  true,
		".jpeg": true,
		".png":  true,
		".gif":  true,
		".webp": true,
	}
	ext := strings.ToLower(file.Filename[strings.LastIndex(file.Filename, "."):])
	if !allowedTypes[ext] {
		return "", fmt.Errorf("định dạng file không được hỗ trợ: %s", ext)
	}

	// Validate file size (max 5MB)
	if file.Size > 5*1024*1024 {
		return "", fmt.Errorf("kích thước file không được vượt quá 5MB")
	}

	// Mở file
	src, err := file.Open()
	if err != nil {
		fmt.Printf("  --> ERROR opening file: %v\n", err)
		return "", fmt.Errorf("không thể mở file: %w", err)
	}
	defer src.Close()

	// Tạo folder name trên Cloudinary: avatars/user_{userID}
	folder := fmt.Sprintf("avatars/user_%d", userID)
	fmt.Printf("  --> Uploading to Cloudinary folder: %s\n", folder)

	// Upload lên Cloudinary (dùng hàm đã có trong cloud.go)
	avatarURL, err := UploadToCloudinary(ctx, src, folder)
	if err != nil {
		fmt.Printf("  --> ERROR Cloudinary upload: %v\n", err)
		return "", fmt.Errorf("upload ảnh thất bại: %w", err)
	}

	fmt.Printf("  --> Cloudinary upload success, URL: %s\n", avatarURL)

	// Cập nhật database với URL từ Cloudinary
	fmt.Printf("  --> Updating database for userID: %d\n", userID)
	err = UpdateAvatarURL(ctx, userID, avatarURL)
	if err != nil {
		fmt.Printf("  --> ERROR updating database: %v\n", err)
		return "", fmt.Errorf("database update failed: %w", err)
	}
	fmt.Printf("  --> Database updated successfully\n")

	fmt.Println("==== END UploadAvatar (CLOUDINARY) =====")
	return avatarURL, nil
}

// UpdateAvatarURL - cập nhật avatar_url trong database
func UpdateAvatarURL(ctx context.Context, userID int, avatarURL string) error {
	if avatarDB == nil {
		return fmt.Errorf("database not initialized")
	}

	fmt.Printf("  --> UpdateAvatarURL: userID=%d, avatarURL=%s\n", userID, avatarURL)

	// Dùng @p1, @p2 cho SQL Server, GETDATE() cho timestamp
	query := `UPDATE users SET avatar_url = @p1, updated_at = GETDATE() WHERE id = @p2`
	result, err := avatarDB.ExecContext(ctx, query,
		sql.Named("p1", avatarURL),
		sql.Named("p2", userID),
	)
	if err != nil {
		return fmt.Errorf("không thể cập nhật avatar: %w", err)
	}

	rowsAffected, _ := result.RowsAffected()
	fmt.Printf("  --> Rows affected: %d\n", rowsAffected)

	// Verify để debug
	var verifyURL string
	verifyQuery := `SELECT avatar_url FROM users WHERE id = @p1`
	err = avatarDB.QueryRowContext(ctx, verifyQuery, sql.Named("p1", userID)).Scan(&verifyURL)
	if err != nil {
		fmt.Printf("  --> Verify error: %v\n", err)
	} else {
		fmt.Printf("  --> Verified avatar_url: '%s'\n", verifyURL)
	}

	return nil
}

// DeleteAvatar - xóa avatar (chỉ xóa trong database, không xóa trên Cloudinary)
func DeleteAvatar(ctx context.Context, userID int) error {
	if avatarDB == nil {
		return fmt.Errorf("database not initialized")
	}

	// Lấy avatar URL cũ để log
	var oldAvatarURL string
	query := `SELECT avatar_url FROM users WHERE id = @p1`
	err := avatarDB.QueryRowContext(ctx, query, sql.Named("p1", userID)).Scan(&oldAvatarURL)
	if err != nil && err != sql.ErrNoRows {
		return fmt.Errorf("không thể lấy avatar cũ: %w", err)
	}

	fmt.Printf("  --> Deleting avatar for user %d, old URL: %s\n", userID, oldAvatarURL)

	// Cập nhật database thành avatar rỗng
	return UpdateAvatarURL(ctx, userID, "")
}