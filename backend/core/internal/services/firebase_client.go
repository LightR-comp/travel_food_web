
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
		firebaseJSON := os.Getenv("FIREBASE_CREDENTIALS")
		var opt option.ClientOption

		if firebaseJSON != "" {
			opt = option.WithCredentialsJSON([]byte(firebaseJSON))
		} else {
			opt = option.WithCredentialsFile("../../config/serviceAccountKey.json")
		}

		app, err := firebase.NewApp(ctx, nil, opt)
		if err != nil {
			errInit = fmt.Errorf("failed to initialize firebase app: %v", err)
			return
		}

		client, err := app.Auth(ctx)
		if err != nil {
			errInit = fmt.Errorf("failed to initialize firebase auth client: %v", err)
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
