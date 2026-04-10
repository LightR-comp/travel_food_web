package services

import (
	"context"
	"log"
	"os"
	"sync"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/option"
)

var (
	firebaseAuth *auth.Client
	firebaseOnce sync.Once
)

// InitFirebase khởi tạo Firebase Admin SDK một lần duy nhất (Singleton).
// Đọc đường dẫn file service account JSON từ biến môi trường FIREBASE_CREDENTIAL_PATH.
func InitFirebase() {
	firebaseOnce.Do(func() {
		credPath := os.Getenv("FIREBASE_CREDENTIAL_PATH")
		if credPath == "" {
			log.Fatal("[Firebase] FIREBASE_CREDENTIAL_PATH chưa được set trong .env")
		}

		opt := option.WithCredentialsFile(credPath)
		app, err := firebase.NewApp(context.Background(), nil, opt)
		if err != nil {
			log.Fatalf("[Firebase] Khởi tạo app thất bại: %v", err)
		}

		authClient, err := app.Auth(context.Background())
		if err != nil {
			log.Fatalf("[Firebase] Khởi tạo auth client thất bại: %v", err)
		}

		firebaseAuth = authClient
		log.Println("[Firebase] Khởi tạo thành công.")
	})
}

// VerifyIDToken xác thực Google ID Token gửi lên từ client.
// Trả về *auth.Token chứa UID và claims nếu hợp lệ.
func VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error) {
	return firebaseAuth.VerifyIDToken(ctx, idToken)
}
