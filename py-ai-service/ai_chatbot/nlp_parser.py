import json
import re
from typing import Dict, Any
from core.ai_config import shared_model # Import từ core

def detect_intent_with_ai(user_text: str) -> Dict[str, Any]:
    prompt = f"""
    Bạn là AI phân tích cho YumMap. Câu hỏi: "{user_text}"
    Trả về JSON duy nhất:
    {{
        "intent": "find_food" | "culture" | "story" | "greeting" | "none",
        "entities": {{"dish": "", "budget": 0, "people": 0, "location": "", "dietary": []}},
        "confidence": 0.95
    }}
    Lưu ý: Chỉ trả về JSON, không giải thích gì thêm.
    """
    try:
        # Sử dụng chung model đã được cấu hình
        response = shared_model.generate_content(prompt)
        clean_json = re.sub(r'```json|```', '', response.text).strip()
        return json.loads(clean_json)
    except Exception as e:
        print(f"Error in nlp_parser: {e}")
        return {"intent": "none", "entities": {}, "confidence": 0.0}