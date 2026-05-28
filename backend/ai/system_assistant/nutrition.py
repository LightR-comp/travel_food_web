
DIETARY_BLACKLIST = {
    "no_spicy": ["cay_nong", "nhieu_ot", "gia_vi_manh", "ot", "tieu", "sate"],
    "allergy_seafood": ["hai_san", "tom", "cua", "muc", "oc", "ca", "mam_tom", "nuoc_mam"],
    "allergy_peanut": ["dau_phong", "lac", "me", "bo_dau_phong", "nuoc_cham_dau_phong"],
    "no_onion": ["hanh_la", "hanh_tay", "hanh_phi", "toi", "he"],
    "no_sugar": ["nhieu_duong", "ngot", "nuoc_ngot", "tra_sua", "che"],
    "vegetarian": ["thit_bo", "thit_heo", "thit_ga", "hai_san", "nuoc_mam", "mo_dong_vat", "nuoc_ham_xuong"],
    "vegan": ["thit_bo", "thit_heo", "thit_ga", "hai_san", "nuoc_mam", "trung", "sua", "pho_mai", "mat_ong"]
}



DIETARY_WHITELIST = {
    "vegetarian": ["chay", "nha_hang_chay", "thuan_chay"],
    "vegan": ["thuan_chay", "vegan"]
}

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
    if not user_dietary_list:
        return True 
        
    resto_tags_set = set(restaurant_tags)
    
    for diet in user_dietary_list:
        # 1. Quét Danh sách đen
        forbidden_tags = DIETARY_BLACKLIST.get(diet, [])
        if resto_tags_set.intersection(set(forbidden_tags)):
            return False 
            
        required_tags = DIETARY_WHITELIST.get(diet)
        if required_tags:
            if not resto_tags_set.intersection(set(required_tags)):
                return False

    return True

def calculate_taste_match(user_tastes, restaurant_tags):
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