from fastapi import APIRouter, HTTPException
from schemas.payloads import (
    ChatRequest,
    ChatResponse,
    IntentResponse,
    PlaceInfo,
    RecommendResponse
)
from ai_chatbot.nlp_parser import *
from ai_chatbot.consultant_rag import *
import uvicorn

router = APIRouter()


@router.post("/chat", response_model=ChatResponse)
async def chat_endpoint(request: ChatRequest):
    try:
        analysis = detect_intent_with_ai(request.message)
        intent = analysis["intent"]
        entities = analysis["entities"]
        
        reply_text = ""
        recommendations = None

        # BƯỚC 2: Xử lý logic dựa trên Intent
        if intent == "greeting":
            reply_text = "Chào bạn! Tôi là YumMap AI. Bạn muốn tìm món gì ngon hôm nay?"
            
        elif intent == "find_food" or intent == "recommendation":
            # Gọi logic lấy dữ liệu (RAG hoặc Database)
            # Ở đây tôi dùng lại mock_results của bạn
            mock_results = [
                PlaceInfo(
                    name="Quán Bún Bò Chú Sáng", 
                    address="123 Lê Lợi, Quận 1", 
                    rating=4.5, 
                    price_range="50k - 100k"
                ),
                PlaceInfo(
                    name="Cơm Tấm Đêm", 
                    address="456 Nguyễn Huệ, Quận 1", 
                    rating=4.2, 
                    price_range="30k - 60k"
                )
            ]
            
            recommendations = mock_results
            reply_text = f"Dựa trên sở thích của bạn, tôi tìm thấy {len(mock_results)} địa điểm tuyệt vời đây!"

        elif intent == "small_talk":
            # Có thể dùng consultant_rag để trả lời các câu hỏi linh tinh
            reply_text = "Tôi luôn sẵn sàng hỗ trợ bạn về ẩm thực và du lịch."
            
        else:
            reply_text = "Xin lỗi, tôi chưa hiểu ý bạn lắm. Bạn có thể nói rõ hơn về món ăn bạn muốn tìm không?"

        # BƯỚC 3: Trả về phản hồi tổng hợp
        return ChatResponse(
            reply=reply_text,
            status="success",
            data=recommendations # Gửi kèm danh sách quán ăn (nếu có)
        )

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Lỗi Chatbot: {str(e)}")


if __name__ == "__main__":
    uvicorn.run(router, host="0.0.0.0", port=8000)