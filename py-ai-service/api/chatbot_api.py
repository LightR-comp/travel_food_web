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
    user_msg = request.message.lower()
    
    if "chào" in user_msg or "hello" in user_msg:
        reply_text = "Chào bạn! Tôi là trợ lý AI du lịch ẩm thực. Tôi có thể giúp bạn tìm quán ăn phù hợp với sở thích và tâm trạng hôm nay."
    
    elif "đói" in user_msg or "ăn" in user_msg or "gợi ý" in user_msg:
        reply_text = "Bạn đang muốn tìm món gì? Hãy cho tôi biết sơ qua về ngân sách và bạn đi cùng mấy người nhé!"
        
    else:
        reply_text = f"Tôi đã nhận được tin nhắn: '{request.message}'."

    return ChatResponse(
        reply=reply_text,
        status="success"
    )

@router.post("/parse-intent", response_model = IntentResponse)
async def parse_intent_endpoint(request: ChatRequest):

    analysis_result = detect_intent_with_ai(request.message)
    
    return {
        "intent": analysis_result["intent"],
        "confidence": analysis_result["confidence"],
        "preferences": analysis_result["entities"]
    }

@router.post("/generate-response", response_model = RecommendResponse)
async def recommend_endpoint(request: ChatRequest):
    try:
        # Đây là nơi bạn xử lý logic để lấy danh sách quán ăn
        # Giả lập dữ liệu tìm được từ database
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
        
        return RecommendResponse(
            recommendations=mock_results,
            total_found=len(mock_results)
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Lỗi hệ thống: {str(e)}")



if __name__ == "__main__":
    uvicorn.run(router, host="0.0.0.0", port=8000)
