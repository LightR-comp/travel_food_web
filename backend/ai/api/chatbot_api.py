from fastapi import APIRouter, HTTPException
from schemas.payloads import *
from ai_chatbot.nlp_parser import detect_intent_with_ai
from ai_chatbot.consultant_rag import generate_final_response
from ai_chatbot.identify_logic import identify_dish_from_image
import asyncio

router = APIRouter()
# Các endpoint cho chatbot phân tích ý định và tạo phản hồi
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

# Endpoint mới cho nhận diện món ăn từ ảnh (Multimodal)
@router.post("/identify_dish", response_model=BaseResponse)
async def identify_dish_endpoint(request: dict):
    """Endpoint nhận diện món ăn từ Base64 image (Multimodal)"""
    try:
        img_b64 = request.get("image_base64")
        if not img_b64:
            raise HTTPException(status_code=400, detail="Thiếu dữ liệu hình ảnh (base64)")
            
        # Chạy logic nhận diện (chứa prompt Gemini) trong thread riêng
        result = await asyncio.to_thread(identify_dish_from_image, img_b64)
        return BaseResponse(success=True, message="Nhận diện thành công", data=result)
    except Exception as e:
        return BaseResponse(success=False, message="Lỗi nhận diện món ăn", error=str(e))
