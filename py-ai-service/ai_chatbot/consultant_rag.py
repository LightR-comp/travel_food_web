from core.ai_config import shared_model # Import từ core
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
    """Tách logic lọc ra riêng — dễ test và catch lỗi độc lập"""
    safe_restaurants = []
    warning_restaurants = []

    for res in request.found_restaurants:
        try:
            ingredients = res.featured_dishes.lower() if res.featured_dishes else ""
            has_allergen = any(allergen in ingredients for allergen in user_allergies)

            if has_allergen:
                warning_restaurants.append((res, "Có thể chứa nguyên liệu bạn dị ứng"))
            else:
                safe_restaurants.append((res, "Phù hợp với yêu cầu của bạn"))

        except AttributeError as e:
            # Dữ liệu nhà hàng bị thiếu field
            logger.warning(f"Dữ liệu nhà hàng không hợp lệ (id={getattr(res, 'id', 'unknown')}): {e}")
            continue  # Bỏ qua nhà hàng lỗi, xử lý tiếp

    return safe_restaurants, warning_restaurants


def generate_final_response(request: ChatGenerationRequest) -> ChatFinalData:

    # --- Bước 1: Xử lý dị ứng ---
    try:
        user_allergies = set(a.lower() for a in (request.user_context.preferences.dietary or []))
    except AttributeError as e:
        logger.error(f"Không đọc được preferences từ user_context: {e}", exc_info=True)
        raise AllergyProcessingError("Dữ liệu người dùng không hợp lệ") from e

    # --- Bước 2: Phân loại nhà hàng ---
    try:
        safe_restaurants, warning_restaurants = _filter_restaurants(request, user_allergies)
    except Exception as e:
        logger.error(f"Lỗi khi phân loại nhà hàng: {e}", exc_info=True)
        raise RestaurantFilterError("Không thể phân loại nhà hàng") from e

    safe_list = "\n".join(f"- {r.res_name} ({r.price}): {r.featured_dishes}" for r, _ in safe_restaurants)
    warning_list = "\n".join(f"- {r.res_name}: {reason}" for r, reason in warning_restaurants)

    prompt = f"""Bạn là trợ lý ẩm thực YumMap, thân thiện và am hiểu.
    Câu hỏi: "{request.user_message}"
    Dị ứng người dùng: {', '.join(user_allergies) if user_allergies else 'Không có'}
    Nhà hàng phù hợp:
    {safe_list if safe_list else "Chưa tìm thấy"}
    Nhà hàng cần lưu ý:
    {warning_list if warning_list else "Không có"}
    Hãy tư vấn ngắn gọn, ưu tiên nhà hàng an toàn."""

    # --- Bước 3: Gọi AI ---
    try:
        ai_reply = shared_model.generate_content(prompt).text

    except ResourceExhausted as e:
        # Hết quota → không retry, báo ngay
        logger.error(f"Gemini API hết quota: {e}")
        ai_reply = "Dạ, hệ thống AI đang quá tải, em chưa thể tư vấn ngay được ạ. Bạn thử lại sau ít phút nhé!"

    except DeadlineExceeded as e:
        # Timeout → có thể retry
        logger.warning(f"Gemini API timeout: {e}")
        ai_reply = "Dạ, kết nối AI hơi chậm lúc này ạ. Bạn thử gửi lại câu hỏi nhé!"

    except ServiceUnavailable as e:
        # Server Gemini down
        logger.critical(f"Gemini service unavailable: {e}", exc_info=True)
        ai_reply = "Dạ, dịch vụ AI đang bảo trì ạ. Em vẫn hiển thị danh sách nhà hàng cho bạn!"

    except InvalidArgument as e:
        # Prompt bị lỗi format — lỗi code, cần fix
        logger.error(f"Prompt không hợp lệ — kiểm tra lại template: {e}", exc_info=True)
        ai_reply = "Dạ, em gặp lỗi xử lý câu hỏi ạ."

    except Exception as e:
        # Lỗi không xác định — log đầy đủ để debug
        logger.exception(f"Lỗi không xác định khi gọi Gemini: {e}")
        ai_reply = "Dạ, em đang gặp chút sự cố ạ."

    # --- Bước 4: Build response — lỗi ở đây không ảnh hưởng ai_reply ---
    try:
        warning_set = {r for r, _ in warning_restaurants}
        safe_set = {r for r, _ in safe_restaurants}

        suggested_places = [
            PlaceInfo(
                restaurant=res,
                ai_reason=reason,
                allergy_friendly=res not in warning_set,  # Bỏ list comprehension lồng nhau
                tags=["An toàn"] if res in safe_set else ["Cần lưu ý"]
            )
            for res, reason in safe_restaurants + warning_restaurants
        ]
    except Exception as e:
        logger.error(f"Lỗi khi build suggested_places: {e}", exc_info=True)
        suggested_places = []  # Fallback — vẫn trả về ai_reply

    return ChatFinalData(reply=ai_reply, suggested_places=suggested_places)
