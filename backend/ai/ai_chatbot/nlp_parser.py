import json
import re
from typing import Dict, Any
from functools import lru_cache
from core.ai_config import shared_model

from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())
 

INTENT_PROMPT_TEMPLATE = """Bạn là AI phân tích ý định người dùng cho ứng dụng ẩm thực YumMap.
## Các intent hợp lệ:
- find_food: Tìm món ăn, nhà hàng, đồ ăn
- culture: Hỏi về văn hóa ẩm thực, nguồn gốc món ăn
- story: Câu chuyện, lịch sử về món ăn
- greeting: Chào hỏi, cảm ơn
- none: Không liên quan ẩm thực
## Ví dụ:
Input: "Tìm phở ngon quận 1 dưới 100k"
Output: {{"intent": "find_food", "entities": {{"dish": "phở", "budget": 100000, "location": "quận 1", "dietary": []}}, "confidence": 0.98}}
Input: "Phở có nguồn gốc từ đâu?"
Output: {{"intent": "culture", "entities": {{"dish": "phở"}}, "confidence": 0.95}}
## Phân tích câu sau:
"{user_text}"
Trả về JSON duy nhất, không giải thích:"""


@lru_cache(maxsize=1000)
def _cached_detect_intent(user_text: str) -> str:
    prompt = INTENT_PROMPT_TEMPLATE.format(user_text=user_text)
    response = shared_model.generate_content(prompt)
    return re.sub(r'```json|```', '', response.text).strip()

def detect_intent_with_ai(user_text: str) -> Dict[str, Any]:
    try:
        clean_json = _cached_detect_intent(user_text.lower().strip())
        return json.loads(clean_json)
    except Exception as e:
        print(f"Error in nlp_parser: {e}")
        return {"intent": "none", "entities": {}, "confidence": 0.0}
