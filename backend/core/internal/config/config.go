package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	Port                string
	DBHost              string
	DBPort              string
	DBUser              string
	DBPassword          string
	DBName              string
	AIServiceURL        string
	GoongMapsAPIKey     string
	GeminiAPIKey        string
	FirebaseCredentials string 
	CloudinaryCloudName string
	CloudinaryAPIKey    string
	CloudinaryAPISecret string
}

var AppConfig Config

func LoadConfig() {
	err := godotenv.Load("../../config/.env")
	if err != nil {
		log.Printf("Chạy môi trường Production (Render) hoặc thiếu file .env local: %v", err)
	}

	AppConfig = Config{
		Port:                getEnv("PORT", "8080"),
		DBHost:              getEnv("DB_HOST", "127.0.0.1"),
		DBPort:              getEnv("DB_PORT", "1433"),
		DBUser:              getEnv("DB_USER", "sa"),
		DBPassword:          getEnv("DB_PASSWORD", ""),
		DBName:              getEnv("DB_NAME", "travel_food_db"),
		AIServiceURL:        getEnv("AI_SERVICE_URL", "http://localhost:8000"),
		GoongMapsAPIKey:     getEnv("GOONG_MAPS_API_KEY", ""),
		GeminiAPIKey:        getEnv("GEMINI_API_KEY", ""),
		FirebaseCredentials: getEnv("FIREBASE_CREDENTIALS", ""), 
		CloudinaryCloudName: getEnv("CLOUDINARY_CLOUD_NAME", ""),
		CloudinaryAPIKey:    getEnv("CLOUDINARY_API_KEY", ""),
		CloudinaryAPISecret: getEnv("CLOUDINARY_API_SECRET", ""),
	}
}


func getEnv(key string, defaultValue string) string {
	if value, exists := os.LookupEnv(key); exists {
		return value
	}
	return defaultValue
}