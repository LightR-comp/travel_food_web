import google.generativeai as genai
from core.config import settings

if not settings.GEMINI_API_KEY:
    raise ValueError("Không tìm thấy GEMINI_API_KEY hoặc GOOGLE_API_KEY trong file .env. Vui lòng kiểm tra lại!")

genai.configure(api_key=settings.GEMINI_API_KEY)

shared_model = genai.GenerativeModel(settings.GEMINI_MODEL_NAME)
