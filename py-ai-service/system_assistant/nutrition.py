# nutrition.py chứa các hàm tiện ích để xử lý thông tin dinh dưỡng, ăn kiêng
# nutrition.py chứa các hàm tiện ích để xử lý thông tin dinh dưỡng, ăn kiêng
# Logic mới: Sử dụng hàm build_allergy_prompt từ prompts.py để chuẩn hóa câu lệnh gửi cho AI

from core.prompts import build_allergy_prompt
from ai_chatbot.consultant_rag import generate_response

def filter_menu(user_allergies, raw_menu):
    """
    user_allergies: List các loại dị ứng (ví dụ: ['hải sản', 'đậu phộng'])
    raw_menu: List các món ăn lấy từ Database (Go-backend gửi sang)
    """
    
    # Nếu không có thông tin dị ứng, trả về menu gốc
    if not user_allergies:
        return raw_menu 
        
    # Bước 1: Gọi hàm từ prompts.py để xây dựng câu lệnh chuẩn cho AI
    prompt = build_allergy_prompt(user_allergies, raw_menu)
    
    # Bước 2: Gọi trực tiếp hàm xử lý AI từ consultant_rag.py để lấy kết quả lọc
    return generate_response(prompt, str(raw_menu))