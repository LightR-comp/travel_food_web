package services

import (
	"context"
	"database/sql"
	"fmt"
	"io"
	"mime/multipart"
	"os"
	"path/filepath"
	"strings"
	"time"
)

var avatarDB *sql.DB

func InitServiceDB(database *sql.DB) {
	avatarDB = database
}

func UploadAvatar(ctx context.Context, userID int, file *multipart.FileHeader) (string, error) {
	fmt.Printf("  --> UploadAvatar service started\n")
	fmt.Printf("  --> UserID: %d, File: %s\n", userID, file.Filename)

	if avatarDB == nil {
		fmt.Printf("  --> ERROR: Database not initialized! Call InitServiceDB first.\n")
		return "", fmt.Errorf("database not initialized")
	}
	fmt.Printf("  --> Database connection OK\n")

	err := os.MkdirAll("uploads/avatars", 0755)
	if err != nil {
		fmt.Printf("  --> ERROR creating directory: %v\n", err)
		return "", err
	}

	filename := fmt.Sprintf("%d_%d%s", userID, time.Now().Unix(), filepath.Ext(file.Filename))
	filepath := fmt.Sprintf("uploads/avatars/%s", filename)

	fmt.Printf("  --> Saving to: %s\n", filepath)

	src, err := file.Open()
	if err != nil {
		fmt.Printf("  --> ERROR opening file: %v\n", err)
		return "", err
	}
	defer src.Close()

	dst, err := os.Create(filepath)
	if err != nil {
		fmt.Printf("  --> ERROR creating file: %v\n", err)
		return "", err
	}
	defer dst.Close()

	_, err = io.Copy(dst, src)
	if err != nil {
		fmt.Printf("  --> ERROR copying file: %v\n", err)
		return "", err
	}

	avatarURL := fmt.Sprintf("/uploads/avatars/%s", filename)
	fmt.Printf("  --> File saved, URL: %s\n", avatarURL)

	fmt.Printf("  --> Updating database for userID: %d\n", userID)
	err = UpdateAvatarURL(ctx, userID, avatarURL)
	if err != nil {
		fmt.Printf("  --> ERROR updating database: %v\n", err)
		os.Remove(filepath)
		return "", fmt.Errorf("database update failed: %w", err)
	}
	fmt.Printf("  --> Database updated successfully\n")

	fmt.Println("==== END UploadAvatar =====")
	return avatarURL, nil
}

func UpdateAvatarURL(ctx context.Context, userID int, avatarURL string) error {
	if avatarDB == nil {
		return fmt.Errorf("database not initialized")
	}

	fmt.Printf("  --> UpdateAvatarURL: userID=%d, avatarURL=%s\n", userID, avatarURL)

	// SỬA: $1, $2 thành @p1, @p2 cho SQL Server
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

func DeleteAvatar(ctx context.Context, userID int) error {
	if avatarDB == nil {
		return fmt.Errorf("database not initialized")
	}

	var oldAvatarURL string
	// SỬA: $1 thành @p1
	query := `SELECT avatar_url FROM users WHERE id = @p1`
	err := avatarDB.QueryRowContext(ctx, query, sql.Named("p1", userID)).Scan(&oldAvatarURL)
	if err != nil && err != sql.ErrNoRows {
		return fmt.Errorf("không thể lấy avatar cũ: %w", err)
	}

	if oldAvatarURL != "" {
		filePath := strings.TrimPrefix(oldAvatarURL, "/")
		if _, err := os.Stat(filePath); err == nil {
			os.Remove(filePath)
		}
	}

	return UpdateAvatarURL(ctx, userID, "")
}
