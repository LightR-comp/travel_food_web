import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    # Weather API (OpenWeatherMap)
    WEATHER_API_KEY = os.getenv("WEATHER_API_KEY", "your_key_here")
    WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    # AI Model Config
    AI_API_KEY = os.getenv("AI_API_KEY")
    DEFAULT_CITY = "Ho Chi Minh City"

settings = Settings()