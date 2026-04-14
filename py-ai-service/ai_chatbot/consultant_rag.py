from core.ai_config import shared_model # Import từ core
from schemas.payloads import ChatGenerationRequest, ChatFinalData, PlaceInfo

def generate_final_response(request: ChatGenerationRequest) -> ChatFinalData:
    res_list_str = ""
    for r in request.found_restaurants:
        res_list_str += f"- ID {r.id}: {r.res_name}, giá {r.price}, nguyên liệu: {r.featured_dishes}\n"

    prompt = f"""
    Bạn là trợ lý YumMap. 
    Người dùng hỏi: "{request.user_message}"
    Dữ liệu Database: {res_list_str if request.found_restaurants else "Trống"}
    Dị ứng người dùng: {request.user_context.preferences.dietary}
    Nhiệm vụ: Tư vấn ẩm thực lịch sự, có kèm cảnh báo dị ứng nếu cần.
    """
    try:
        # Sử dụng chung model đã được cấu hình
        ai_reply = shared_model.generate_content(prompt).text
        
        suggested_places = [
            PlaceInfo(restaurant=res, ai_reason="Gợi ý cho bạn", allergy_friendly=True, tags=["Gợi ý"])
            for res in request.found_restaurants
        ]
        return ChatFinalData(reply=ai_reply, suggested_places=suggested_places)
    except Exception:
        return ChatFinalData(reply="Dạ, em đang gặp chút lỗi xử lý ạ.", suggested_places=[])