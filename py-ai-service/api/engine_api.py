# engine_api.py chứa các endpoint liên quan đến việc gợi ý quán ăn, bao gồm endpoint chính để nhận yêu cầu từ Go Core Backend và trả về danh sách quán ăn đã được chấm điểm và lý do.
# Đây là nơi chúng ta sẽ xây dựng các endpoint để xử lý yêu cầu gợi ý
# từ Go Core Backend, bao gồm việc nhận dữ liệu về người dùng và danh sách quán ăn, sau đó sử dụng các hàm trong thư mục 'recommendation_engine' để tính toán điểm số và xây dựng lý do cho từng quán ăn, cuối cùng trả về kết quả cho Go Core Backend.

from fastapi import APIRouter
from schemas.payloads import RecommendRequest, RecommendResponse, AIResultItem

router = APIRouter()

@router.post("/recommend", response_model=RecommendResponse)
async def recommend_endpoint(request: RecommendRequest):
    user_ctx = request.user_context
    ai_results = []
    
    # Lặp qua từng quán ăn mà Go gửi sang
    for restaurant in request.restaurants:
        # --------------------------------------------------------------------
        # logic gọi LLM (Gemini) hoặc thuật toán ở đây
        # --------------------------------------------------------------------
        
        # Giả lập AI tính điểm sơ bộ
        base_score = restaurant.rating / 5.0  # Quy đổi rating thành điểm cơ sở (0 -> 1)
        
        # Xét tiêu chí ngân sách
        if restaurant.price > (user_ctx.budget / user_ctx.people):
            base_score -= 0.15
            price_reason = "Hơi vượt ngân sách nhưng chất lượng xứng đáng."
        else:
            base_score += 0.1
            price_reason = "Mức giá cực kỳ lý tưởng cho bạn."
            
        # Xét tiêu chí khoảng cách
        if restaurant.distance_km <= 2.0:
            base_score += 0.1
            distance_reason = "Rất gần bạn."
        else:
            distance_reason = "Đường đi hơi xa một chút."

        # Đảm bảo điểm số luôn nằm trong khoảng an toàn từ 0.1 đến 0.99
        final_score = max(0.1, min(0.99, base_score))
        
        # Tạo lý do tổng hợp
        final_reason = f"{price_reason} {distance_reason} Rất hợp với tâm trạng '{user_ctx.mood}' của bạn lúc này."

        result_item = AIResultItem(
            id=restaurant.id,
            score=round(final_score, 2), # Làm tròn 2 chữ số thập phân
            reason=final_reason
        )
        ai_results.append(result_item)
        
    # Sắp xếp danh sách trả về: Quán điểm cao nhất lên đầu
    ai_results.sort(key=lambda x: x.score, reverse=True)

    # Trả về đúng format {"results": [ {...}, {...} ]}
    return RecommendResponse(results=ai_results)