from dotenv import load_dotenv, find_dotenv
from core.ai_config import shared_model
from schemas.payloads import ChatGenerationRequest, ChatFinalData, PlaceInfo
import logging

logger = logging.getLogger(__name__)


load_dotenv(find_dotenv())


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
            restaurant_ingredients = set()
            featured_dishes = res.get('featured_dishes', [])
            for dish in featured_dishes:
                ingredients_in_dish = [ing.lower().strip() for ing in dish.get('ingredients', [])]
                restaurant_ingredients.update(ingredients_in_dish)
            
            found_allergens_set = user_allergies & restaurant_ingredients
            if found_allergens_set:
                found_allergens_str = ", ".join(found_allergens_set)
                warning_restaurants.append((res, f"Có thể chứa nguyên liệu bạn dị ứng: {found_allergens_str}"))
            else:
                safe_restaurants.append((res, "Phù hợp với yêu cầu của bạn"))

        except Exception as e:
            logger.warning(f"Lỗi khi xử lý nhà hàng ID {res.get('id')}: {e}")
            continue  

    return safe_restaurants, warning_restaurants


def generate_final_response(request: ChatGenerationRequest) -> ChatFinalData:
    
    user_allergies = set()
    if request.user_context and request.user_context.preferences:
        dietary = request.user_context.preferences.dietary or []
        user_allergies = set(a.lower() for a in dietary)

    safe_restaurants, warning_restaurants = _filter_restaurants(request, user_allergies)

    def _get_all_ingredients_for_prompt(restaurant_dict):
        all_ings = set() # Dùng set để tránh lặp lại nguyên liệu
        for dish in restaurant_dict.get("featured_dishes", []):
            for ingredient in dish.get("ingredients", []):
                all_ings.add(ingredient.lower())
        return list(all_ings)

    safe_list = "\n".join(f"- {r.get('res_name', '')} ({r.get('price', 0)}đ): có các món chứa {', '.join(_get_all_ingredients_for_prompt(r))}" for r, _ in safe_restaurants)
    warning_list = "\n".join(f"- {r.get('res_name', '')}: {reason}" for r, reason in warning_restaurants)

    prompt = f"""Bạn là trợ lý ẩm thực YumMap, vai trò của bạn là một người bạn đồng hành thân thiện và am hiểu.
    Dựa vào thông tin dưới đây, hãy đưa ra một câu trả lời tư vấn tự nhiên, ngắn gọn và hữu ích cho người dùng.

    ## Bối cảnh cuộc trò chuyện:
    - Câu hỏi của người dùng: "{request.user_message}"
    - Dị ứng người dùng cần tránh: {', '.join(user_allergies) if user_allergies else 'Không có'}

    ## Dữ liệu tôi đã tìm thấy:
    - Các nhà hàng phù hợp và an toàn:
    {safe_list if safe_list else "Rất tiếc, tôi chưa tìm thấy quán nào hoàn toàn phù hợp."}
    - Các nhà hàng cần cân nhắc (có thể chứa chất dị ứng):
    {warning_list if warning_list else "Không có"}

    ## Yêu cầu cho bạn:
    1. Viết một câu trả lời duy nhất, không cần lặp lại danh sách trên.
    2. Ưu tiên giới thiệu các nhà hàng trong danh sách "phù hợp và an toàn".
    3. Nếu có nhà hàng cần cân nhắc, hãy cảnh báo nhẹ nhàng.
    4. Giọng văn phải thật tự nhiên, như đang nói chuyện với một người bạn.
    """

    try:
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
    except ValueError as ve:
        logger.error(f"Lỗi giá trị đầu vào cho Gemini: {ve}")
        ai_reply = f"Dạ, câu hỏi này làm AI bối rối một chút. (Lỗi chi tiết: {str(ve)})"
    except Exception as e:
        logger.exception(f"Lỗi không xác định khi gọi Gemini: {e}")
        ai_reply = f"Dạ, em đang gặp chút sự cố ạ. (Lỗi AI: {str(e)})"

    suggested_places = []
    try:
        for is_safe, items in [(True, safe_restaurants), (False, warning_restaurants)]:
            for res, reason in items:
                
                score_to_save = res.get("final_score")
                if score_to_save is None:
                    score_to_save = res.get("rating", 0.0)
                    logger.warning(f"Không tìm thấy 'final_score' cho nhà hàng ID {res.get('id')}. Dùng 'rating' gốc làm fallback.")

                place = PlaceInfo(
                    restaurant={
                        "id": res.get("id", 0),
                        "res_name": res.get("res_name", "Không tên"),
                        "rating": res.get("rating", 0.0),
                        "price": res.get("price", 0.0),
                        "image_url": res.get("image_url", ""),
                        "distance_km": res.get("distance_km", 0.0), # SỬA: Lấy distance_km từ Go
                        "type": res.get("type", "restaurant"), # SỬA: Lấy type từ Go
                        # Dùng `or []` để xử lý cả trường hợp key không tồn tại hoặc giá trị là None
                        "featured_dishes": res.get("featured_dishes") or []
                    },
                    ai_reason=reason,
                    score=score_to_save,
                    allergy_friendly=is_safe,
                    tags=["An toàn"] if is_safe else ["Cần lưu ý"]
                )
                suggested_places.append(place)
    except Exception as e:
        logger.error(f"Lỗi khi build suggested_places: {e}", exc_info=True)

    return ChatFinalData(reply=ai_reply, suggested_places=suggested_places)