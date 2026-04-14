# scoring.py chứa các hàm để tính toán điểm số cho các quán ăn dựa trên các tiêu chí của nhóm
# Đây là nơi chúng ta sẽ xây dựng các hàm để tính toán điểm số cho các quán ăn dựa trên các tiêu chí đã xác định trong giai đoạn thiết kế.
# Các hàm này sẽ được sử dụng trong quá trình gợi ý quán ăn
# trả về điểm số cho từng quán ăn

import math
import sys
import os
from system_assistant.nutrition import is_safe_for_diet, calculate_taste_match
from system_assistant.emotion_weather import calculate_emotion_weather_match
import json


def calculate_budget_fit(user_budget, people, restaurant_price, restaurant_tags):
    """Tính điểm Kinh phí (0.0 -> 1.0) tích hợp tối ưu cho nhóm đông người."""
    budget_per_person = user_budget / max(1, people)
    
    if restaurant_price <= budget_per_person:
        score = 1.0
    else:
        penalty_ratio = (restaurant_price - budget_per_person) / budget_per_person
        score = max(0.0, math.exp(-5 * penalty_ratio))
        
    if people >= 4:
        group_tags = {"buffet", "goi_mon_lon", "combo_gia_dinh", "khau_phan_lon"}
        if group_tags.intersection(set(restaurant_tags)):
            score = min(1.0, score + 0.15) 
            
    return round(score, 3)

def determine_dynamic_weights(user_context):
    """Tự động điều chỉnh trọng số dựa trên ngữ cảnh."""
    budget = user_context.get("budget", 0)
    mood = user_context.get("mood", "")
    people = max(1, user_context.get("people", 1))
    
    if budget / people <= 50000:
        return {"taste": 0.40, "emotion": 0.10, "budget": 0.50}
    if mood in ["romantic", "family", "chill"]:
        return {"taste": 0.35, "emotion": 0.50, "budget": 0.15}
        
    return {"taste": 0.45, "emotion": 0.35, "budget": 0.20}
# ==========================================
# 3. HÀM XỬ LÝ CHÍNH GIAO TIẾP VỚI GO BACKEND
# ==========================================

def process_scoring(ai_input_data):
    """Nhận JSON Giai đoạn 3 và trả về JSON Giai đoạn 5 theo API Contract."""
    user_context = ai_input_data.get("user_context", {})
    restaurants = ai_input_data.get("restaurants", [])
    
    user_budget = user_context.get("budget", 0)
    user_people = user_context.get("people", 1)
    user_dietary = user_context.get("dietary", [])
    user_mood = user_context.get("mood", "")
    user_weather = user_context.get("weather", "normal")
    user_tastes = user_context.get("taste", []) 
    
    weights = determine_dynamic_weights(user_context)
    results = []
    
    for r in restaurants:
        r_id = r.get("id")
        r_price = r.get("price", 0)
        r_rating = r.get("rating", 0.0)
        r_distance = r.get("distance_km", 0.0)
        r_tags = r.get("tags", [])
        
        # 1. Bức tường lửa (Lọc qua module nutrition)
        if not is_safe_for_diet(user_dietary, r_tags):
            continue 
            
        # 2. Tính điểm thành phần (Gọi module ngoài và hàm cục bộ)
        taste_score = calculate_taste_match(user_tastes, r_tags)
        emotion_score = calculate_emotion_weather_match(user_mood, user_weather, r_tags, r_rating)
        budget_score = calculate_budget_fit(user_budget, user_people, r_price, r_tags)
        
        # 3. Tính điểm tổng
        total_score = (taste_score * weights["taste"]) + \
                      (emotion_score * weights["emotion"]) + \
                      (budget_score * weights["budget"])
        
        # 4. Phạt khoảng cách
        if r_distance > 5.0:
            total_score *= 0.85
        elif r_distance > 10.0:
            total_score *= 0.60
            
        # 5. Sinh lý do
        reason = "Lựa chọn an toàn, đáp ứng đủ các tiêu chí cơ bản của bạn."
        if budget_score == 1.0 and user_people >= 4 and set(["buffet", "goi_mon_lon"]).intersection(r_tags):
            reason = "Cực kỳ tối ưu chi phí cho nhóm đông người."
        elif emotion_score > 0.85:
            reason = "Không gian hoàn hảo, cực kỳ phù hợp với ngữ cảnh hiện tại."
        elif taste_score == 1.0 and r_rating >= 4.5:
            reason = "Hương vị chuẩn xác đúng những gì bạn thèm, được đánh giá rất cao."
        elif r_distance <= 1.0 and total_score > 0.7:
            reason = "Rất gần bạn, tiện lợi di chuyển ngay lúc này."

        results.append({
            "id": r_id,
            "score": round(total_score, 3),
            "reason": reason
        })
        
    results.sort(key=lambda x: x["score"], reverse=True)
    
    return {
        "results": results
    }