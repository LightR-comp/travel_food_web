import google.generativeai as genai # Temporary
from typing import Dict, Any

# config API
genai.configure(api_key="YOUR_API_KEY")
model = genai.GenerativeModel('gemini-pro')

def detect_intent_with_ai(user_text: str) -> Dict[str, Any]:
    prompt = f"""
    Phân tích câu sau: "{user_text}"
    Trả về JSON với các nhãn:
    - intent: (find_food, opening_hours, location_query, menu_query, general_consultation)
    - entities: (budget, people, dietary, mood, location_name)
    
    Yêu cầu: snake_case, format JSON.
    """
    
    try:
        response = model.generate_content(prompt)
        # Đây là ví dụ dữ liệu AI sẽ trả về sau khi parse
        '''# Giả sử user_text = "Tìm quán bún cá tầm 100k cho 2 người không cay ở Quận 1"
        mock_ai_response = {
            "intent": "find_food",
            "confidence": 0.98,
            "entities": {
                "budget": 100000,
                "people": 2,
                "dietary": ["no_spicy"],
                "mood": None,
                "location_name": "Quận 1"
            }
        }'''
        
        return response
        
    except Exception as e:
        return {
            "intent": "general_consultation",
            "confidence": 0.0,
            "entities": {}
        }