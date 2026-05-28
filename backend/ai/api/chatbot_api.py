from fastapi import APIRouter, HTTPException
from schemas.payloads import *
from ai_chatbot.nlp_parser import detect_intent_with_ai
from ai_chatbot.consultant_rag import generate_final_response
from ai_chatbot.identify_logic import identify_dish_from_image
import asyncio

router = APIRouter()

@router.post("/intent_parse", response_model=BaseResponse)
async def intent_parse_endpoint(request: ChatIntentRequest):
    try:
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
        final_data = await asyncio.to_thread(generate_final_response, request)
        return BaseResponse(success=True, message="Tạo phản hồi thành công", data=final_data)
    except Exception as e:
        return BaseResponse(success=False, error=str(e))

@router.post("/identify_dish", response_model=BaseResponse)
async def identify_dish_endpoint(request: AIIdentifyDishRequest):
    """Endpoint nhận diện món ăn từ Base64 image (Multimodal)"""
    try:
        img_b64 = request.image_base64
        message = request.message
            
        result = await asyncio.to_thread(identify_dish_from_image, img_b64, message)
        return BaseResponse(success=True, message="Nhận diện thành công", data=result)
    except Exception as e:
        return BaseResponse(success=False, message="Lỗi nhận diện món ăn", error=str(e))
