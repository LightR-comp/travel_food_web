from core.prompts import ALLERGY_FILTER_PROMPT

class NutritionAssistant:
    def __init__(self, ai_engine):
        self.ai_engine = ai_engine

    def filter_menu(self, user_allergies, raw_menu):
        """
        user_allergies: List các loại dị ứng (ví dụ: ['hải sản', 'đậu phộng'])
        raw_menu: List các món ăn lấy từ Database sau khi bạn thiết kế xong Models
        """
        if not user_allergies:
            return raw_menu # Không dị ứng thì trả về hết
            
        prompt = ALLERGY_FILTER_PROMPT.format(
            allergies=", ".join(user_allergies),
            menu=str(raw_menu)
        )
        
        # AI sẽ phân tích món nào có thành phần gây dị ứng và loại bỏ
        return self.ai_engine.generate_response(prompt)