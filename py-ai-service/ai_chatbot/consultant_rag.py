import google.generativeai as genai
from typing import Any

# config API
genai.configure(api_key="YOUR_API_KEY")
model = genai.GenerativeModel('gemini-pro')

def generate_final_response(user_query: str, db_data: Any) -> str:
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