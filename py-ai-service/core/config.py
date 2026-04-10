import os
from dotenv import load_dotenv


# config.py chứa các cấu hình chung cho Python AI Service
# bao gồm các hằng số, biến môi trường và các thiết lập liên quan đến việc kết nối với Go Core Backend, cấu hình AI, và các thông số khác cần thiết cho hoạt động của service.
# Đây là nơi chúng ta sẽ xây dựng các cấu hình chung để đảm bảo rằng service hoạt động một cách nhất quán và dễ dàng bảo trì, đồng thời giúp cho việc phát triển và mở rộng service.

load_dotenv()

class Settings:
    # --- App Settings ---
    APP_NAME = "SmartTravelAIService"
    DEBUG = os.getenv("DEBUG", "True") == "True"
    PORT = int(os.getenv("PORT", 8000))

    # --- Go Core Backend Connection ---
    # Đây là nơi cấu hình để Python gọi ngược lại Go nếu cần
    GO_BACKEND_URL = os.getenv("GO_BACKEND_URL", "http://localhost:8080")

    # --- Weather API (OpenWeatherMap) ---
    WEATHER_API_KEY = os.getenv("WEATHER_API_KEY", "your_key_here")
    WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    # --- AI Model Config ---
    AI_API_KEY = os.getenv("AI_API_KEY")
    DEFAULT_CITY = "Ho Chi Minh City"
    AI_MODEL_NAME = "gemini-1.5-flash" # Hoặc gemini-pro

    # --- Database (Nếu Python cần kết nối trực tiếp MSSQL giống Go) ---
    # DB_URL = os.getenv("DATABASE_URL")

settings = Settings()

settings = Settings()
