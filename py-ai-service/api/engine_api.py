# engine_api.py chứa các endpoint liên quan đến việc gợi ý quán ăn, bao gồm endpoint chính để nhận yêu cầu từ Go Core Backend và trả về danh sách quán ăn đã được chấm điểm và lý do.
# Đây là nơi chúng ta sẽ xây dựng các endpoint để xử lý yêu cầu gợi ý
# từ Go Core Backend, bao gồm việc nhận dữ liệu về người dùng và danh sách quán ăn, sau đó sử dụng các hàm trong thư mục 'recommendation_engine' để tính toán điểm số và xây dựng lý do cho từng quán ăn, cuối cùng trả về kết quả cho Go Core Backend.

import os
import json
import google.generativeai as genai
from dotenv import load_dotenv
from fastapi import APIRouter, HTTPException
from schemas.payloads import RecommendRequest, RecommendResponse, AIResultItem, BaseResponse
from recommendation_engine.scoring import process_scoring

load_dotenv()
router = APIRouter()

# Cấu hình Gemini
api_key = os.getenv("GEMINI_API_KEY")
genai.configure(api_key=api_key)
model = genai.GenerativeModel('gemini-1.5-flash')

@router.post("/recommend", response_model=BaseResponse)
async def recommend_endpoint(request: RecommendRequest):
    try:
        # 1. Chuyển đổi dữ liệu từ Pydantic Model sang Dict để khớp với hàm process_scoring
        # model_dump() sẽ biến toàn bộ request thành dictionary
        ai_input_dict = request.model_dump()
        
        # 2. Chạy logic scoring thuần túy (Toán học + Quy tắc nhóm)
        # Hàm này trả về: {"results": [{"id":..., "score":..., "reason":...}, ...]}
        scoring_output = process_scoring(ai_input_dict)
        results_from_logic = scoring_output.get("results", [])

        if not results_from_logic:
            return BaseResponse(
                success=True,
                message="Không có quán ăn nào phù hợp với yêu cầu dinh dưỡng/sở thích.",
                data=RecommendResponse(recommended_restaurants=[]),
                error=None
            )

        # 3. Sử dụng Gemini để "viết lại" lý do cho hấp dẫn hơn (Dựa trên kết quả scoring)
        # Chúng ta chỉ gửi 5 quán đứng đầu cho AI để tiết kiệm tài nguyên và giữ độ tập trung
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
            response = model.generate_content(prompt)
            # Làm sạch chuỗi JSON từ AI
            raw_text = response.text.strip().replace("```json", "").replace("```", "")
            ai_reasons = json.loads(raw_text).get("reasons", {})
        except Exception as ai_err:
            print(f"Gemini Error: {ai_err} - Falling back to logic reasons.")
            ai_reasons = {}

        # 4. Tổng hợp dữ liệu cuối cùng
        final_recommendations = []
        for item in results_from_logic:
            # Ưu tiên lấy lý do từ AI, nếu không có thì dùng lý do mặc định từ scoring.py
            final_reason = ai_reasons.get(str(item["id"]), item["reason"])
            
            final_recommendations.append(AIResultItem(
                id=item["id"],
                score=item["score"],
                reason=final_reason
            ))

        # 5. Đóng gói vào BaseResponse
        data_payload = RecommendResponse(recommended_restaurants=final_recommendations)
        
        return BaseResponse(
            success=True,
            message="Đề xuất quán ăn thành công",
            data=data_payload,
            error=None
        )

    except Exception as e:
        # Xử lý lỗi hệ thống (ví dụ: lỗi logic, lỗi import...)
        return BaseResponse(
            success=False,
            message="Lỗi hệ thống trong quá trình xử lý Engine",
            data=None,
            error=str(e)
        )