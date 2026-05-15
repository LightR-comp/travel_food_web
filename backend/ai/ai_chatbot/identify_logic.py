import base64
import io
import json
from PIL import Image
from core.ai_config import shared_model

def identify_dish_from_image(image_b64: str):
    """
    Sử dụng Gemini Multimodal để nhận diện món ăn và trả về công thức.
    """
    try:
        # 1. Giải mã ảnh
        image_data = base64.b64decode(image_b64)
        img = Image.open(io.BytesIO(image_data))

        # 2. Tạo prompt
        prompt = """
        Bạn là một chuyên gia ẩm thực tài ba. Hãy nhìn vào bức ảnh này và:
        1. Xác định chính xác tên món ăn (Vietnamese Name).
        2. Liệt kê các nguyên liệu chính để làm món này.
        3. Cung cấp các bước thực hiện món ăn đó (công thức tóm tắt).

        Yêu cầu trả về định dạng JSON duy nhất như sau:
        {
            "dish_name": "Tên món ăn",
            "ingredients": ["Nguyên liệu 1", "Nguyên liệu 2", ...],
            "recipe": "Các bước thực hiện..."
        }
        Ngôn ngữ sử dụng: Tiếng Việt.
        """

        # 3. Gọi Gemini (Gemini 1.5 hỗ trợ truyền cả text và PIL Image)
        response = shared_model.generate_content([prompt, img])
        
        # 4. Parse kết quả JSON (Cải thiện độ ổn định bằng cách tìm biên JSON)
        raw_text = response.text
        start_idx = raw_text.find('{')
        end_idx = raw_text.rfind('}') + 1
        
        if start_idx != -1 and end_idx > start_idx:
            json_str = raw_text[start_idx:end_idx]
            return json.loads(json_str)
        else:
            raise ValueError("AI không trả về định dạng JSON hợp lệ")

    except Exception as e:
        print(f"Error in identify_dish_from_image: {e}")
        return {
            "dish_name": "Không xác định",
            "ingredients": [],
            "recipe": "Xin lỗi, tôi gặp trục trặc khi phân tích hình ảnh này.",
            "message": str(e)
        }