# nutrition.py chứa các hàm tiện ích để xử lý thông tin dinh dưỡng, ăn kiêng
# Logic mới: Sử dụng hàm build_allergy_prompt từ prompts.py để chuẩn hóa câu lệnh gửi cho AI

from core.prompts import build_allergy_prompt
def calculate_allergy_penalties(user_allergies, raw_menu):
    """
    Tính toán điểm phạt cho từng món ăn dựa trên thành phần dị ứng.
    
    Biến:
    - user_allergies (list): Danh sách chuỗi các chất gây dị ứng (vị dụ: ['hải sản', 'đậu phộng']).
    - raw_menu (list): Danh sách các đối tượng món ăn. Mỗi đối tượng là một dict:
        {
            "id": int,
            "name": str,
            "ingredients": list (danh sách nguyên liệu, ví dụ: ['tôm', 'bột mì'])
        }
    - scores (dict): Biến lưu trữ trọng số cuối cùng cho từng ID món ăn. 
      Giá trị -1.0 nghĩa là bị loại bỏ hoàn toàn, 0.0 là an toàn.
    """
    
    # Khởi tạo dict: mặc định mọi món ăn đều có trọng số 0
    scores = {str(item['id']): 0.0 for item in raw_menu}
    
    if not user_allergies:
        return scores

    # Chuyển đổi list dị ứng sang set để tìm kiếm tối ưu hơn
    allergy_set = set([a.lower() for a in user_allergies])

    for item in raw_menu:
        # Lấy danh sách nguyên liệu của món ăn
        ingredients = [i.lower() for i in item.get('ingredients', [])]
        
        # Kiểm tra xem có bất kỳ nguyên liệu nào trùng với danh sách dị ứng không
        for ingredient in ingredients:
            if any(allergy in ingredient for allergy in allergy_set):
                # Gán trọng số phạt nặng cho món ăn này
                scores[str(item['id'])] = -1.0
                break # Đã tìm thấy thành phần dị ứng, chuyển sang món tiếp theo
                
    return scores