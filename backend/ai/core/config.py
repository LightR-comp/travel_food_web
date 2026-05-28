import os
from dotenv import load_dotenv


load_dotenv()

class Settings:
    APP_NAME = "YumMap"
    DEBUG = os.getenv("DEBUG", "True") == "True"
    PORT = int(os.getenv("PORT", 8000))

    GO_BACKEND_URL = os.getenv("GO_BACKEND_URL", "http://localhost:8080")

    WEATHER_API_KEY = os.getenv("WEATHER_API_KEY", "your_key_here")
    WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    GEMINI_API_KEY = os.getenv("GEMINI_API_KEY") or os.getenv("GOOGLE_API_KEY")
    DEFAULT_CITY = "Ho Chi Minh City"
    GEMINI_MODEL_NAME = os.getenv("GEMINI_MODEL_NAME", "gemini-2.5-flash") # Model dùng chung cho toàn bộ AI service


settings = Settings()