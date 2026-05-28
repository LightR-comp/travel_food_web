
import json
from fastapi import APIRouter, HTTPException
from schemas.payloads import RecommendRequest, RecommendResponse, AIResultItem, BaseResponse
from recommendation_engine.scoring import process_scoring
#thêm để liên kết với phần chatbot
from schemas.payloads import ChatIntentRequest, ChatGenerationRequest
from ai_chatbot.nlp_parser import detect_intent_with_ai
from ai_chatbot.consultant_rag import generate_final_response
from core.ai_config import shared_model

router = APIRouter()


@router.post("/recommend", response_model=BaseResponse)
async def recommend_endpoint(request: RecommendRequest):
    try:
        ai_input_dict = request.model_dump()
        
        scoring_output = process_scoring(ai_input_dict)
        results_from_logic = scoring_output.get("results", [])
        
        if not results_from_logic:
            return BaseResponse(
                success=True,
                message="Không có quán ăn nào phù hợp với yêu cầu dinh dưỡng/sở thích.",
                data=RecommendResponse(recommended_restaurants=[]),
                error=None
            )

        
        top_results = results_from_logic[:5] 
        user_mood = request.user_context.preferences.mood
        user_weather = request.user_context.preferences.weather

        prompt = f"""
        Bạn là trợ lý ảo YumMap. Hãy viết lại lý do đề xuất quán ăn dựa trên tâm trạng: {user_mood} và thời tiết: {user_weather}.
        Tôi sẽ gửi cho bạn danh sách quán kèm lý do cơ bản. Hãy làm nó hấp dẫn hơn (tiếng Việt, <20 từ).
        
        Danh sách: {top_results}
        
        Trả về JSON duy nhất: {{"reasons": {{"ID_QUAN": "lý do mới", ...}}}}
        """

        try:
            response = shared_model.generate_content(prompt)
            raw_text = response.text.strip().replace("```json", "").replace("```", "")
            ai_reasons = json.loads(raw_text).get("reasons", {})
        except Exception as ai_err:
            print(f"Gemini Error: {ai_err} - Falling back to logic reasons.")
            ai_reasons = {}

        final_recommendations = []
        for item in results_from_logic:
            final_reason = ai_reasons.get(str(item["id"]), item["reason"])
            
            final_recommendations.append(AIResultItem(
                id=item["id"],
                score=item["score"],
                reason=final_reason
            ))

        data_payload = RecommendResponse(recommended_restaurants=final_recommendations)
        
        return BaseResponse(
            success=True,
            message="Đề xuất quán ăn thành công",
            data=data_payload,
            error=None
        )

    except Exception as e:
        return BaseResponse(
            success=False,
            message="Lỗi hệ thống trong quá trình xử lý Engine",
            data=None,
            error=str(e)
        )
