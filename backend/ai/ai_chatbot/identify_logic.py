import base64
import io
import json
from PIL import Image
from core.ai_config import shared_model

def identify_dish_from_image(image_b64: str, message: str):
    """
    Sử dụng Gemini Multimodal để nhận diện món ăn.
    :param image_b64: Chuỗi base64 của hình ảnh.
    :param message: Tin nhắn của người dùng, dùng để xác định có cần nguyên liệu không.
    """
    try:
        # 1. Giải mã ảnh
        image_data = base64.b64decode(image_b64)
        img = Image.open(io.BytesIO(image_data))

        # 2. Tạo prompt động dựa trên message của người dùng
        if "công thức" in (message or "").lower():
            # Nếu người dùng hỏi công thức
            prompt = """
            Bạn là một chuyên gia ẩm thực tài ba. Hãy nhìn vào bức ảnh này và:
            1. Xác định chính xác tên món ăn (Vietnamese Name).
            2. Liệt kê các nguyên liệu chính để làm món này.
            3. Cung cấp công thức (nếu người user có yêu cầu).

            Yêu cầu trả về định dạng JSON duy nhất như sau:
            {
                "dish_name": "Tên món ăn",
                "ingredients": ["Nguyên liệu 1", "Nguyên liệu 2", ...],
                "recipe": "Các bước thực hiện..."
            }
            Ngôn ngữ sử dụng: Tiếng Việt.
            """
        else:
            # Nếu người dùng chỉ gửi ảnh để nhận diện
            prompt = """
            Bạn là một chuyên gia ẩm thực tài ba. Hãy nhìn vào bức ảnh này và:
            1. Xác định chính xác tên món ăn (Vietnamese Name).
            2. Liệt kê các nguyên liệu chính để làm món này.

            Yêu cầu trả về định dạng JSON duy nhất như sau:
            {
                "dish_name": "Tên món ăn",
                "ingredients": ["Nguyên liệu 1", "Nguyên liệu 2", ...],
                "recipe": ""
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
            parsed_result = json.loads(json_str)

            # --- BƯỚC CHUẨN HÓA DỮ LIỆU ---
            # Lấy các giá trị, có thể là None nếu AI không trả về
            dish_name = parsed_result.get("dish_name")
            ingredients = parsed_result.get("ingredients")
            recipe = parsed_result.get("recipe")

            # Đảm bảo cấu trúc trả về luôn nhất quán
            final_result = {
                "dish_name": dish_name if isinstance(dish_name, str) and dish_name else "Không thể nhận diện",
                "ingredients": ingredients if isinstance(ingredients, list) else [],
                "recipe": recipe if isinstance(recipe, str) else ""
            }
            return final_result
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