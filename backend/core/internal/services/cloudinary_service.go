package services

import (
	"backend/core/internal/config"
	"context"
	"fmt"
	"io"
	"log"

	"github.com/cloudinary/cloudinary-go/v2"
	"github.com/cloudinary/cloudinary-go/v2/api/uploader"
)

var cld *cloudinary.Cloudinary

func InitCloudinary() {
	cloudName := config.AppConfig.CloudinaryCloudName
	apiKey := config.AppConfig.CloudinaryAPIKey
	apiSecret := config.AppConfig.CloudinaryAPISecret

	if cloudName == "" || apiKey == "" || apiSecret == "" {
		log.Printf("[Cloudinary] Cảnh báo: Thiếu cấu hình trong .env (CloudName: %v, APIKey: %v, APISecret: %v). Ảnh sẽ không được upload.",
			cloudName != "",
			apiKey != "",
			apiSecret != "",
		)
		return
	}

	var err error
	cld, err = cloudinary.NewFromParams(cloudName, apiKey, apiSecret)
	if err != nil {
		log.Fatalf("[Cloudinary] Không thể khởi tạo client: %v", err)
	}

	log.Println("[Cloudinary] Khởi tạo service thành công.")
}

func UploadToCloudinary(ctx context.Context, fileReader io.Reader, folder string) (string, error) {
	if cld == nil {
		return "", fmt.Errorf("cloudinary service chưa được cấu hình")
	}

	resp, err := cld.Upload.Upload(ctx, fileReader, uploader.UploadParams{Folder: folder})
	if err != nil {
		return "", fmt.Errorf("lỗi khi gửi file lên Cloudinary: %w", err)
	}

	return resp.SecureURL, nil
}
