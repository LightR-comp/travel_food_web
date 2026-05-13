from core.ai_config import shared_model
from schemas.payloads import ChatGenerationRequest, ChatFinalData, PlaceInfo
import logging
from google.api_core.exceptions import (
    ResourceExhausted,      # Hết quota API
    ServiceUnavailable,     # Gemini server down
    InvalidArgument,        # Prompt sai format
    DeadlineExceeded,       # Timeout
)

logger = logging.getLogger(__name__)


# --- Custom Exceptions ---
class AllergyProcessingError(Exception):
    """Lỗi khi xử lý dữ liệu dị ứng người dùng"""
    pass

class RestaurantFilterError(Exception):
    """Lỗi khi phân loại nhà hàng"""
    pass


def _filter_restaurants(request: ChatGenerationRequest, user_allergies: set):
    safe_restaurants = []
    warning_restaurants = []

    for res in request.found_restaurants:
        try:
            # Lấy tất cả ingredients từ các món ăn trong 'featured_dishes'
            all_ingredients = []
            featured_dishes = res.get('featured_dishes', [])
            for dish in featured_dishes:
                all_ingredients.extend(dish.get('ingredients', []))

            ingredients_str = ", ".join(all_ingredients).lower()
            
            has_allergen = any(allergen in ingredients_str for allergen in user_allergies)

            if has_allergen:
                warning_restaurants.append((res, "Có thể chứa nguyên liệu bạn dị ứng"))
            else:
                safe_restaurants.append((res, "Phù hợp với yêu cầu của bạn"))

        except Exception as e:
            logger.warning(f"Dữ liệu nhà hàng không hợp lệ: {e}")
            continue  # Bỏ qua nhà hàng lỗi, xử lý tiếp

    return safe_restaurants, warning_restaurants


def generate_final_response(request: ChatGenerationRequest) -> ChatFinalData:

    # --- Bước 1: Xử lý dị ứng ---
    user_allergies = set()
    if request.user_context and request.user_context.preferences:
        dietary = request.user_context.preferences.dietary or []
        user_allergies = set(a.lower() for a in dietary)

    # --- Bước 2: Phân loại nhà hàng ---
    safe_restaurants, warning_restaurants = _filter_restaurants(request, user_allergies)

    safe_list = "\n".join(f"- {r.get('res_name', '')} ({r.get('price', 0)}đ): {', '.join(r.get('ingredients', []))}" for r, _ in safe_restaurants)
    warning_list = "\n".join(f"- {r.get('res_name', '')}: {reason}" for r, reason in warning_restaurants)

    prompt = f"""Bạn là trợ lý ẩm thực YumMap, thân thiện và am hiểu.
    Câu hỏi: "{request.user_message}"
    Dị ứng người dùng: {', '.join(user_allergies) if user_allergies else 'Không có'}
    Nhà hàng phù hợp:
    {safe_list if safe_list else "Chưa tìm thấy"}
    Nhà hàng cần lưu ý:
    {warning_list if warning_list else "Không có"}
    Hãy tư vấn ngắn gọn, ưu tiên nhà hàng an toàn."""

    # --- Bước 3: Gọi AI ---

            
    # Tắt toàn bộ bộ lọc an toàn để AI không bao giờ từ chối trả lời
    response = shared_model.generate_content(
    prompt,
    safety_settings={
                'HARM_CATEGORY_HARASSMENT': 'BLOCK_NONE',
                'HARM_CATEGORY_HATE_SPEECH': 'BLOCK_NONE',
                'HARM_CATEGORY_SEXUALLY_EXPLICIT': 'BLOCK_NONE',
                'HARM_CATEGORY_DANGEROUS_CONTENT': 'BLOCK_NONE'
        }
    )
    ai_reply = response.text


    # --- Bước 4: Build response — lỗi ở đây không ảnh hưởng ai_reply ---
    suggested_places = []
    try:
        for is_safe, items in [(True, safe_restaurants), (False, warning_restaurants)]:
            for res, reason in items:
                place = PlaceInfo(
                    restaurant={
                        "id": res.get("id", 0),
                        "res_name": res.get("res_name", "Không tên"),
                        "rating": res.get("rating", 0.0),
                        "price": res.get("price", 0.0),
                        "image_url": res.get("image_url", ""),
                        "distance_km": 0.0,
                        "type": "restaurant",
                        # Dùng `or []` để xử lý cả trường hợp key không tồn tại hoặc giá trị là None
                        "featured_dishes": res.get("featured_dishes") or []
                    },
                    ai_reason=reason,
                    allergy_friendly=is_safe,
                    tags=["An toàn"] if is_safe else ["Cần lưu ý"]
                )
                suggested_places.append(place)
    except Exception as e:
        logger.error(f"Lỗi khi build suggested_places: {e}", exc_info=True)

    return ChatFinalData(reply=ai_reply, suggested_places=suggested_places)
