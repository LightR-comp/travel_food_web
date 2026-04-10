from fastapi import APIRouter
from schemas.payloads import ChatRequest, ChatResponse
# Import trực tiếp hàm từ 2 file của ai_chatbot
from ai_chatbot.nlp_parser import detect_intent
from ai_chatbot.consultant_rag import generate_response

router = APIRouter()

@router.post("/chat", response_model=ChatResponse)
async def chat_endpoint(request: ChatRequest):
    user_msg = request.message
    
    # 1. Gọi hàm nhận diện ý định từ file nlp_parser.py
    intent = detect_intent(user_msg)
    
    # 2. Xử lý logic
    if intent == "opening_hours":
        reply = "Cửa hàng mở cửa từ 8h sáng đến 10h tối."
    elif intent == "location":
        reply = "Địa chỉ tại 227 Nguyễn Văn Cừ, Quận 5."
    else:
        # 3. Gọi hàm tạo câu trả lời từ file consultant_rag.py
        # Giả sử tạm thời db_data là một chuỗi trống hoặc lấy từ request
        db_context = "Thông tin món ăn: Phở, Bún chả, Cơm tấm" 
        reply = generate_response(user_msg, db_context)

    return ChatResponse(
        reply=reply,
        status="success"
    )