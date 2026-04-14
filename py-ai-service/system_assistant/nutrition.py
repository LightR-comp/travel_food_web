# nutrition.py chứa các hàm tiện ích để xử lý thông tin dinh dưỡng, ăn kiêng
# Logic mới: Sử dụng hàm build_allergy_prompt từ prompts.py để chuẩn hóa câu lệnh gửi cho AI

# 1. DIETARY BLACKLIST (DANH SÁCH ĐEN)

DIETARY_BLACKLIST = {
    "no_spicy": ["cay_nong", "nhieu_ot", "gia_vi_manh", "ot", "tieu", "sate"],
    "allergy_seafood": ["hai_san", "tom", "cua", "muc", "oc", "ca", "mam_tom", "nuoc_mam"],
    "allergy_peanut": ["dau_phong", "lac", "me", "bo_dau_phong", "nuoc_cham_dau_phong"],
    "no_onion": ["hanh_la", "hanh_tay", "hanh_phi", "toi", "he"],
    "no_sugar": ["nhieu_duong", "ngot", "nuoc_ngot", "tra_sua", "che"],
    # Người ăn chay không ăn thịt cá, nhưng có thể ăn trứng/sữa
    "vegetarian": ["thit_bo", "thit_heo", "thit_ga", "hai_san", "nuoc_mam", "mo_dong_vat", "nuoc_ham_xuong"],
    # Người thuần chay kiêng toàn bộ đạm động vật
    "vegan": ["thit_bo", "thit_heo", "thit_ga", "hai_san", "nuoc_mam", "trung", "sua", "pho_mai", "mat_ong"]
}


# 2. DIETARY WHITELIST (DANH SÁCH TRẮNG)
# Ánh xạ [Chế độ ăn nghiêm ngặt] -> [Các tag BẮT BUỘC PHẢI CÓ]

DIETARY_WHITELIST = {
    # Quán ăn bình thường không có thịt chưa chắc đã nấu riêng nồi, phải có tag chuyên chay mới an toàn
    "vegetarian": ["chay", "nha_hang_chay", "thuan_chay"],
    "vegan": ["thuan_chay", "vegan"]
}
# 2. TASTE MAPPING (MASTER DATA KHẨU VỊ)
TASTE_MAPPING = {
    "spicy": ["cay_nong", "nhieu_ot", "gia_vi_manh", "nuoc_dung_cay"],
    "sweet": ["ngot", "che", "kem", "banh", "tra_sua"],
    "sour": ["chua", "chanh", "giam", "len_men", "lau_thai"],
    "bitter": ["dang", "cafe", "matcha", "socola_den"],
    "salty": ["man", "dam_da", "nhieu_muoi", "kho_quet"],
    "umami": ["ngot_thit", "nuoc_ham", "hai_san", "nuoc_dung_xuong"],
    "bland": ["thanh_dam", "it_gia_vi", "luoc", "hap", "salad"]
}
def is_safe_for_diet(user_dietary_list, restaurant_tags):
    """
    Kiểm tra quán ăn có vi phạm các tiêu chuẩn kiêng kị không.
    Trả về True nếu an toàn, False nếu có rủi ro.
    """
    if not user_dietary_list:
        return True # Không kiêng gì thì an toàn 100%
        
    resto_tags_set = set(restaurant_tags)
    
    for diet in user_dietary_list:
        # 1. Quét Danh sách đen
        forbidden_tags = DIETARY_BLACKLIST.get(diet, [])
        if resto_tags_set.intersection(set(forbidden_tags)):
            return False # Bắt được tag cấm -> Báo không an toàn ngay lập tức
            
        # 2. Quét Danh sách trắng (dành cho chế độ ăn đặc thù)
        required_tags = DIETARY_WHITELIST.get(diet)
        if required_tags:
            # Nếu quán không sở hữu ít nhất 1 tag nằm trong whitelist -> Loại
            if not resto_tags_set.intersection(set(required_tags)):
                return False

    return True

def calculate_taste_match(user_tastes, restaurant_tags):
    """Tính điểm Khẩu vị (0.0 -> 1.0) dựa trên mức độ trùng khớp tag."""
    if not user_tastes: 
        return 1.0 
        
    target_tags = set()
    for t in user_tastes:
        target_tags.update(TASTE_MAPPING.get(t, []))
        
    if not target_tags or not restaurant_tags:
        return 0.0
        
    match_count = len(target_tags.intersection(set(restaurant_tags)))
    
    if match_count >= len(user_tastes): 
        return 1.0
    if match_count > 0: 
        return round(match_count / max(1, len(user_tastes)), 2)
    
    return 0.1