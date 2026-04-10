// firebase_client.go chứa các hàm để tương tác với Firebase, bao gồm việc lưu trữ và truy xuất thông tin về người dùng, quán ăn, menu và diễn đàn.
// Đây là nơi chúng ta sẽ xây dựng các hàm để thực hiện các truy vấn Firebase, đảm bảo rằng chúng ta có thể lưu trữ và truy xuất dữ liệu một cách hiệu quả và an toàn.

package services

import (
	"context"
	"fmt"
	"os"
	"sync"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/option"
)

var (
	firebaseAuth *auth.Client
	once         sync.Once
)

func InitFirebase(ctx context.Context) error {
	var errInit error

	once.Do(func() {
		credPath := os.Getenv("FIREBASE_CREDENTIAL_PATH")
		if credPath == "" {
			errInit = fmt.Errorf("missing FIREBASE_CREDENTIAL_PATH")
			return
		}

		app, err := firebase.NewApp(ctx, nil, option.WithCredentialsFile(credPath))
		if err != nil {
			errInit = err
			return
		}

		client, err := app.Auth(ctx)
		if err != nil {
			errInit = err
			return
		}

		firebaseAuth = client
	})

	return errInit
}

func VerifyIDToken(ctx context.Context, token string) (*auth.Token, error) {
	if firebaseAuth == nil {
		return nil, fmt.Errorf("firebase chưa init")
	}
	return firebaseAuth.VerifyIDToken(ctx, token)
}