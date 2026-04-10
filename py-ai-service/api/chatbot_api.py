# chatbot_api.py chứa các endpoint liên quan đến việc trò chuyện với người dùng, bao gồm endpoint chính để nhận tin nhắn từ người dùng và trả về phản hồi từ AI.
# Đây là nơi chúng ta sẽ xây dựng các endpoint để xử lý tin nhắn từ người dùng
#  bao gồm việc nhận dữ liệu về tin nhắn sau đó sử dụng các hàm trong thư mục 'ai_chatbot' để tạo ra phản hồi phù hợp, cuối cùng trả về kết quả cho người dùng.
# cụ thể phân tích intent của người dùng, gửi cho go chọc vào database, nhận kết quả, sau đó xây dựng câu trả lời cho người dùng dựa trên kết quả đó.
import requests # Cần thư viện này để gọi sang Go
from fastapi import APIRouter, HTTPException
from core.config import settings
from schemas.payloads import ChatRequest, ChatResponse
from ai_chatbot.nlp_parser import detect_intent
from ai_chatbot.consultant_rag import generate_response

router = APIRouter()

@router.post("/chat", response_model=ChatResponse)
async def chat_endpoint(request: ChatRequest):
    try:
        user_msg = request.message
        
        # 1. Phân tích intent (nlp_parser.py)
        intent = detect_intent(user_msg)
        
        # 2. Xử lý các Intent cố định (không cần chọc DB)
        if intent == "opening_hours":
            reply = "Cửa hàng mở cửa từ 8h sáng đến 10h tối hằng ngày."
        elif intent == "location":
            reply = "Địa chỉ tại 227 Nguyễn Văn Cừ, Quận 5, TP.HCM."
        
        # 3. Với các intent cần dữ liệu (menu_info, general_consultation)
        else:
            # GỌI SANG GO-BACKEND để lấy dữ liệu từ MSSQL
            # Giả sử Go có một endpoint: /api/db-context
            db_data = ""
            try:
                # Bạn sẽ cấu hình GO_BACKEND_URL trong config.py
                go_response = requests.get(f"{settings.GO_BACKEND_URL}/api/db-context", params={"intent": intent})
                if go_response.status_code == 200:
                    db_data = go_response.json().get("data", "")
            except Exception as e:
                print(f"Lỗi khi gọi Go-backend: {e}")
                db_data = "Thông tin món ăn tạm thời không khả dụng." # Fallback

            # 4. Đưa dữ liệu từ Go vào AI để xây dựng câu trả lời (consultant_rag.py)
            reply = generate_response(user_msg, db_data)

        return ChatResponse(
            reply=reply,
            status="success"
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))