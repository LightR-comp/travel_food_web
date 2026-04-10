import requests
from core.config import settings
from core.prompts import WEATHER_EMOTION_PROMPT

class EmotionWeatherAssistant:
    def __init__(self, ai_engine):
        self.ai_engine = ai_engine

    def get_weather(self, city=None):
        city = city or settings.DEFAULT_CITY
        params = {
            "q": city,
            "appid": settings.WEATHER_API_KEY,
            "units": "metric",
            "lang": "vi"
        }
        try:
            response = requests.get(settings.WEATHER_BASE_URL, params=params)
            if response.status_code == 200:
                data = response.json()
                return f"{data['main']['temp']}°C, {data['weather'][0]['description']}"
            return "Không lấy được thông tin thời tiết"
        except Exception as e:
            return f"Lỗi kết nối thời tiết: {str(e)}"

    def provide_suggestion(self, emotion, city=None):
        weather_info = self.get_weather(city)
        # Format prompt từ core/prompts.py
        full_prompt = WEATHER_EMOTION_PROMPT.format(
            weather=weather_info,
            emotion=emotion
        )
        # Gọi sang AI engine để nhận phản hồi thông minh
        return self.ai_engine.generate_response(full_prompt)