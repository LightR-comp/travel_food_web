# py-ai-service/core/prompts.py

ALLERGY_FILTER_PROMPT = """
Dựa trên thông tin dị ứng của người dùng: {allergies}.
Hãy kiểm tra danh sách món ăn: {menu}.
Loại bỏ các món nguy hiểm và giải thích ngắn gọn lý do.
"""

WEATHER_EMOTION_PROMPT = """
Thông tin hiện tại:
- Thời tiết: {weather}
- Cảm xúc người dùng: {emotion}
Gợi ý 3 món ăn/hoạt động phù hợp nhất với trạng thái này.
"""