# prompts.py chứa các hàm để xây dựng các prompt cho AI, bao gồm việc xây dựng prompt
# Đây là nơi chúng ta sẽ xây dựng các hàm để tạo ra các prompt phù hợp
# dùng để sinh text reason, sinh câu trả lời chatbot, sinh funfact về top quán ăn dược chấm điểm cao,..

# --- Các Template gốc ---
ALLERGY_FILTER_TEMPLATE = """
Dựa trên thông tin dị ứng của người dùng: {allergies}.
Hãy kiểm tra danh sách món ăn: {menu}.
Loại bỏ các món nguy hiểm và giải thích ngắn gọn lý do.
"""

WEATHER_EMOTION_TEMPLATE = """
Thông tin hiện tại:
- Thời tiết: {weather}
- Cảm xúc người dùng: {emotion}
Gợi ý 3 món ăn hoặc hoạt động du lịch phù hợp nhất với trạng thái này. 
Yêu cầu: Phản hồi bằng giọng văn thân thiện, mời gọi.
"""

FUNFACT_TEMPLATE = """
Dựa trên danh sách các quán ăn được đánh giá cao sau đây: {top_restaurants}.
Hãy viết một dòng "Bạn có biết?" (Fun Fact) thú vị về sự phổ biến hoặc đặc điểm chung của các quán này để thu hút du khách.
Yêu cầu: Ngắn gọn, sáng tạo, tối đa 2 câu.
"""

# --- Các hàm xây dựng Prompt ---

def build_allergy_prompt(allergies, menu):
    """Hàm xây dựng prompt lọc dị ứng"""
    return ALLERGY_FILTER_TEMPLATE.format(
        allergies=", ".join(allergies) if isinstance(allergies, list) else allergies,
        menu=menu
    )

def build_weather_emotion_prompt(weather, emotion):
    """Hàm xây dựng prompt gợi ý theo thời tiết và cảm xúc"""
    return WEATHER_EMOTION_TEMPLATE.format(weather=weather, emotion=emotion)

def build_funfact_prompt(top_restaurants):
    """Hàm xây dựng prompt sinh funfact cho top quán ăn"""
    return FUNFACT_TEMPLATE.format(top_restaurants=top_restaurants)

def build_reasoning_prompt(user_query, selected_item):
    """Hàm sinh prompt giải thích tại sao hệ thống lại gợi ý món ăn/địa điểm này"""
    return f"""
    Người dùng muốn: "{user_query}"
    Chúng ta đã chọn gợi ý: "{selected_item}"
    Hãy viết một đoạn giải thích ngắn (khoảng 20 từ) lý do tại sao gợi ý này lại phù hợp nhất với yêu cầu của họ.
    """