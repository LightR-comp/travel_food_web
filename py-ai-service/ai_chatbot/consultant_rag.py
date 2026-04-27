import logging
from core.ai_config import shared_model
from schemas.payloads import ChatGenerationRequest, ChatFinalData, PlaceInfo
from google.api_core.exceptions import (
    ResourceExhausted,
    ServiceUnavailable,
    InvalidArgument,
    DeadlineExceeded,
)

logger = logging.getLogger(__name__)


class AllergyProcessingError(Exception):
    pass

class RestaurantFilterError(Exception):
    pass


def _filter_restaurants(request: ChatGenerationRequest, user_allergies: set):
    safe_restaurants = []
    warning_restaurants = []

    for res in request.found_restaurants:
        try:
            ingredients = " ".join(
                d.name.lower() for d in res.featured_dishes
            ) if res.featured_dishes else ""
            has_allergen = any(allergen in ingredients for allergen in user_allergies)

            if has_allergen:
                warning_restaurants.append((res, "Có thể chứa nguyên liệu bạn dị ứng"))
            else:
                safe_restaurants.append((res, "Phù hợp với yêu cầu của bạn"))

        except AttributeError as e:
            logger.warning(f"Dữ liệu nhà hàng không hợp lệ (id={getattr(res, 'id', 'unknown')}): {e}")
            continue

    return safe_restaurants, warning_restaurants


def generate_final_response(request: ChatGenerationRequest) -> ChatFinalData:

    try:
        user_allergies = set(
            a.lower() for a in (request.user_context.preferences.dietary or [])
        ) if request.user_context else set()
    except AttributeError as e:
        logger.error(f"Không đọc được preferences: {e}", exc_info=True)
        raise AllergyProcessingError("Dữ liệu người dùng không hợp lệ") from e

    try:
        safe_restaurants, warning_restaurants = _filter_restaurants(request, user_allergies)
    except Exception as e:
        logger.error(f"Lỗi phân loại nhà hàng: {e}", exc_info=True)
        raise RestaurantFilterError("Không thể phân loại nhà hàng") from e

    safe_list = "\n".join(
        f"- ID {r.id}: {r.res_name}, giá {r.price}" for r, _ in safe_restaurants
    )
    warning_list = "\n".join(
        f"- {r.res_name}: {reason}" for r, reason in warning_restaurants
    )

    prompt = f"""
    Bạn là trợ lý YumMap.
    Người dùng hỏi: "{request.user_message}"
    Dị ứng người dùng: {', '.join(user_allergies) if user_allergies else 'Không có'}
    Nhà hàng phù hợp:
    {safe_list if safe_list else "Chưa tìm thấy"}
    Nhà hàng cần lưu ý:
    {warning_list if warning_list else "Không có"}
    Nhiệm vụ: Tư vấn ẩm thực lịch sự, ưu tiên nhà hàng an toàn, cảnh báo rõ nếu có dị ứng.
    """

    try:
        ai_reply = shared_model.generate_content(prompt).text
    except ResourceExhausted as e:
        logger.error(f"Gemini hết quota: {e}")
        ai_reply = "Dạ, hệ thống AI đang quá tải, bạn thử lại sau ít phút nhé!"
    except DeadlineExceeded as e:
        logger.warning(f"Gemini timeout: {e}")
        ai_reply = "Dạ, kết nối AI hơi chậm, bạn thử gửi lại nhé!"
    except ServiceUnavailable as e:
        logger.critical(f"Gemini unavailable: {e}", exc_info=True)
        ai_reply = "Dạ, dịch vụ AI đang bảo trì, em vẫn hiển thị danh sách nhà hàng!"
    except InvalidArgument as e:
        logger.error(f"Prompt không hợp lệ: {e}", exc_info=True)
        ai_reply = "Dạ, em gặp lỗi xử lý câu hỏi ạ."
    except Exception as e:
        logger.exception(f"Lỗi không xác định: {e}")
        ai_reply = "Dạ, em đang gặp chút sự cố ạ."

    try:
        warning_set = {r for r, _ in warning_restaurants}
        safe_set = {r for r, _ in safe_restaurants}
        suggested_places = [
            PlaceInfo(
                restaurant=res,
                ai_reason=reason,
                allergy_friendly=res not in warning_set,
                tags=["An toàn"] if res in safe_set else ["Cần lưu ý"]
            )
            for res, reason in safe_restaurants + warning_restaurants
        ]
    except Exception as e:
        logger.error(f"Lỗi build suggested_places: {e}", exc_info=True)
        suggested_places = []

    return ChatFinalData(reply=ai_reply, suggested_places=suggested_places)