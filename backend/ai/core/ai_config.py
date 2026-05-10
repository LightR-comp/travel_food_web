# core/ai_config.py
import google.generativeai as genai
import os

genai.configure(api_key=os.getenv("GEMINI_KEY"))
# Khởi tạo 1 lần dùng cho cả hội
shared_model = genai.GenerativeModel('gemini-1.5-pro')