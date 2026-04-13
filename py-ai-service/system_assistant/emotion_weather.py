import requests
from core.config import settings

class ContextScorer:
    """
    Tính toán trọng số ưu tiên dựa trên ngữ cảnh thực tế.
    """
    def __init__(self):
        # Định nghĩa các quy tắc ưu tiên
        # Key: Từ khóa thời tiết/cảm xúc | Value: Dict {Category: Weight}
        self.rules = {
            "mưa": {"Lẩu": 1.5, "Đồ nướng": 1.4, "Soup": 1.3},
            "nóng": {"Kem": 1.8, "Trà sữa": 1.5, "Salad": 1.3, "Lẩu": 0.5},
            "lạnh": {"Lẩu": 1.7, "Đồ nướng": 1.6, "Cà phê": 1.2},
            "buồn": {"Đồ ngọt": 1.5, "Tráng miệng": 1.4, "Comfort Food": 1.3},
            "stress": {"Cay": 1.4, "Snack": 1.2}
        }

    def get_weather_desc(self, city=None):
        """
        Lấy mô tả thời tiết từ API.
        Biến:
        - city (str): Tên thành phố lấy từ config hoặc request.
        - response (obj): Đối tượng phản hồi từ OpenWeatherMap.
        - weather_main (str): Từ khóa chính của thời tiết (ví dụ: 'Rain', 'Clouds', 'Clear').
        """
        city = city or settings.DEFAULT_CITY
        params = {
            "q": city,
            "appid": settings.WEATHER_API_KEY,
            "units": "metric"
        }
        try:
            res = requests.get(settings.WEATHER_BASE_URL, params=params)
            if res.status_code == 200:
                data = res.json()
                # Trả về từ khóa chính của thời tiết để khớp với rules
                return data['weather'][0]['main'].lower()
            return "clear"
        except Exception:
            return "clear"

    def get_context_multipliers(self, user_emotion, city=None):
        """
        Tính toán hệ số nhân cho các danh mục (Categories).
        Biến:
        - user_emotion (str): Cảm xúc người dùng gửi lên.
        - weather_key (str): Từ khóa thời tiết lấy được từ API.
        - final_weights (dict): Tổng hợp hệ số nhân cuối cùng.
          Mặc định mỗi Category có trọng số là 1.0 (không đổi).
        """
        weather_key = self.get_weather_desc(city)
        final_weights = {}

        # 1. Kiểm tra trọng số theo thời tiết
        for key, category_map in self.rules.items():
            if key in weather_key:
                for cat, weight in category_map.items():
                    final_weights[cat] = final_weights.get(cat, 1.0) * weight
        
        # 2. Kiểm tra trọng số theo cảm xúc
        emotion_key = user_emotion.lower()
        for key, category_map in self.rules.items():
            if key in emotion_key:
                for cat, weight in category_map.items():
                    final_weights[cat] = final_weights.get(cat, 1.0) * weight

        return final_weights