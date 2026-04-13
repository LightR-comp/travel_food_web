import google.generativeai as genai
from typing import Any

# config API
genai.configure(api_key="YOUR_API_KEY")
model = genai.GenerativeModel('gemini-pro')

<<<<<<< HEAD
from flask import Flask, request, jsonify
# import google.generativeai as genai

app = Flask(__name__)

# Setup Gemini (nếu đã có API Key)
# genai.configure(api_key="YOUR_GEMINI_API_KEY")
# model = genai.GenerativeModel('gemini-pro')

@app.route('/generate-response', methods=['POST']) # Tạo endpoint

# Hàm tạo câu trả lời
def generate_response():
    data = request.json # Nhận phần data đã được tổng hợp từ Go
    user_query = data.get("query") # Lấy câu hỏi gốc
    db_data = data.get("db_data") # Thông tin Go lấy từ MSSQL gửi sang
    
    # Prompt Engineering: Dùng promt này gửi cho API để nhận được câu trả lời
=======
def generate_final_response(user_query: str, db_data: Any) -> str:
>>>>>>> main
    prompt = f"""
    Bạn là trợ lý AI chuyên về ẩm thực. 
    Dữ liệu từ hệ thống (MSSQL): {db_data}
    Câu hỏi của khách: "{user_query}"
    
    Nhiệm vụ: 
    - Dựa hoàn toàn vào dữ liệu hệ thống để trả lời khách hàng.
    - Nếu dữ liệu có giờ mở cửa, địa chỉ, hãy trích xuất chính xác.
    - Phong cách: Ngắn gọn, lịch sự, dùng "Dạ", "ạ".
    """
    
    try:
        response = model.generate_content(prompt)
        return response.text
    except Exception as e:
        return "Dạ hiện tại em chưa tra cứu được thông tin này, anh/chị đợi em tí nhé ạ."