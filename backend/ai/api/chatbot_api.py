from fastapi import APIRouter
from schemas.payloads import *
from ai_chatbot.nlp_parser import detect_intent_with_ai
from ai_chatbot.consultant_rag import generate_final_response
import asyncio

router = APIRouter()

@router.post("/intent_parse", response_model=BaseResponse)
async def intent_parse_endpoint(request: ChatIntentRequest):
    try:
        # Hàm detect_intent_with_ai tự lấy shared_model từ core
        result = await asyncio.to_thread(detect_intent_with_ai, request.message)
        data = IntentData(
            intent=result.get("intent", "none"),
            entities=result.get("entities", {}),
            confidence=result.get("confidence", 0.0)
        )
        return BaseResponse(success=True, message="Phân tích thành công", data=data)
    except Exception as e:
        return BaseResponse(success=False, error=str(e))

@router.post("/generate_response", response_model=BaseResponse)
async def generate_response_endpoint(request: ChatGenerationRequest):
    try:
        # Hàm generate_final_response tự lấy shared_model từ core
        final_data = await asyncio.to_thread(generate_final_response, request)
        return BaseResponse(success=True, message="Tạo phản hồi thành công", data=final_data)
    except Exception as e:
        return BaseResponse(success=False, error=str(e))
