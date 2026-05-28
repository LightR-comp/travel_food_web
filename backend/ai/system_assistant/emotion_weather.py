
MOOD_MAPPING = {
    "romantic": ["yen_tinh", "sang_trong", "view_dep", "den_mo"],
    "sad": ["am_cung", "nhac_nhe", "yen_tinh", "ngot_ngao"],
    "happy": ["soi_dong", "nhau", "on_ao", "khong_gian_mo"],
    "chill": ["ngoai_troi", "nhac_acoustic", "view_dep"],
    "stress": ["thien_nhien", "yen_tinh", "khong_gian_mo"],
    "tired": ["yen_tinh", "phuc_vu_tot", "thanh_dam"],
    "excited": ["buffet", "soi_dong", "nhieu_nang_luong"],
    "angry": ["mat_me", "yen_tinh", "rong_rai"],
    "lonely": ["am_cung", "quay_bar", "quan_nho"],
    "family": ["rong_rai", "ban_lon", "khu_vui_choi", "am_cung"]
}

WEATHER_MAPPING = {
    "rainy": ["lau", "nuong", "sup", "nong_hoi", "am_cung", "trong_nha"],
    "hot": ["mat_me", "trai_cay", "kem", "salad", "khong_gian_lanh", "may_lanh"],
    "cold": ["lau", "nuong", "cay_nong", "nhieu_calo"]
}

def calculate_emotion_weather_match(user_mood, current_weather, restaurant_tags, restaurant_rating):
    """
    Tính điểm trải nghiệm kết hợp giữa Cảm xúc và Thời tiết.
    Thang điểm: 0.0 đến 1.0
    """
    resto_tags_set = set(restaurant_tags)
    
    mood_score = 0.0
    target_mood_tags = set(MOOD_MAPPING.get(user_mood, []))
    
    if target_mood_tags:
        mood_match_count = len(target_mood_tags.intersection(resto_tags_set))
        if mood_match_count >= 2:
            mood_score = 0.6
        elif mood_match_count == 1:
            mood_score = 0.4
        else:
            if user_mood in ["romantic", "family", "chill"] and restaurant_rating >= 4.5:
                mood_score = 0.3
            else:
                mood_score = 0.1
    else:
        mood_score = 0.6 

    weather_score = 0.0
    target_weather_tags = set(WEATHER_MAPPING.get(current_weather, []))
    
    if target_weather_tags:
        weather_match_count = len(target_weather_tags.intersection(resto_tags_set))
        if weather_match_count >= 1:
            weather_score = 0.4
        else:
            weather_score = 0.1
    else:
        weather_score = 0.4
        
    return round(mood_score + weather_score, 2)