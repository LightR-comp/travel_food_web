package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

//AppConfig chứa toàn bộ cấu hình hệ thống
type Config struct {
	Port        string
	DBHost      string
	DBPort      string
	DBUser      string
	DBPassword  string
	DBName      string
	AIServiceURL string
	GoogleMapsAPIKey string
	GeminiAPIKey string
}

// biến global để DB Repo, AI Client gọi
var AppConfig Config

// LoadConfig load cấu hình từ file .env vào biến global Config
func LoadConfig() {
	// Load .env file
	err := godotenv.Load("../.env")
	if err != nil {
		log.Printf("Error loading .env file: %v", err)
	}

	AppConfig = Config{
		Port:             getEnv("PORT", "8080"),
		DBHost:           getEnv("DB_HOST", "127.0.0.1"),
		DBPort:           getEnv("DB_PORT", "1433"),
		DBUser:           getEnv("DB_USER", "sa"),
		DBPassword:       getEnv("DB_PASSWORD", ""),
		DBName:           getEnv("DB_NAME", "travel_food_db"),
		AIServiceURL:     getEnv("AI_SERVICE_URL", "http://localhost:8000"),
		GoogleMapsAPIKey: getEnv("GOOGLE_MAPS_API_KEY", ""),
		GeminiAPIKey:     getEnv("GEMINI_API_KEY", ""),
	}
}	

// getEnv lấy giá trị từ biến môi trường, nếu không có thì trả về giá trị mặc định
func getEnv(key string, defaultValue string) string{
		if value, exists := os.LookupEnv(key); exists {
			return value
		}
		return defaultValue
}