
import math
import sys
import os
from system_assistant.nutrition import is_safe_for_diet, calculate_taste_match
from system_assistant.emotion_weather import calculate_emotion_weather_match
import json


def _get_virtual_tags(r_type: str, dishes: list) -> list:
    """Hàm bổ trợ: Tạo nhãn từ 'type' và 'ingredients'."""
    tags = {r_type.lower()}
    for dish in dishes:
        ingredients = getattr(dish, 'ingredients', []) if not isinstance(dish, dict) else dish.get('ingredients', [])
        tags.update([ing.lower() for ing in ingredients])
    return list(tags)

import math

def calculate_budget_fit(
    user_budget,
    people,
    restaurant_price,
    virtual_tags
):
    budget_per_person = user_budget / max(1, people)

    # Normalize price ratio
    x = restaurant_price / max(1, budget_per_person)

    tags = set(tag.lower() for tag in virtual_tags)

    
    mu = 0.9
    sigma = 0.22


    premium_tags = {
        "steak", "sushi", "fine dining",
        "omakase", "wine", "romantic"
    }

    group_tags = {
        "bbq", "buffet", "lẩu",
        "hotpot", "family"
    }

    cheap_tags = {
        "street food", "student",
        "fast food", "snack"
    }

    if tags & premium_tags:
        mu += 0.18
        sigma += 0.05

    if people >= 4 and tags & group_tags:
        mu += 0.12
        sigma += 0.08

    if tags & cheap_tags:
        mu -= 0.15

    score = math.exp(
        -((x - mu) ** 2) / (2 * sigma ** 2)
    )

    
    if x > 1.6:
        score *= 0.6

    if x < 0.4:
        score *= 0.85

    return round(max(0.0, min(score, 1.0)), 3)

def determine_dynamic_weights(prefs):
    budget = prefs.get("budget", 0)
    people = max(1, prefs.get("people", 1))
    budget_per_person = budget / people
    mood = prefs.get("mood", "").lower()
    
    if budget_per_person <= 55000:
        return {"taste": 0.3, "emotion": 0.1, "budget": 0.6}
    if any(m in mood for m in ["chill", "romantic", "stress"]):
        return {"taste": 0.3, "emotion": 0.5, "budget": 0.2}
    return {"taste": 0.4, "emotion": 0.3, "budget": 0.3}

import math

def calculate_total_score(
    s_taste,
    s_emotion,
    s_budget,
    weights
):
    epsilon = 1e-6

    score = (
        (s_taste + epsilon) ** weights["taste"]
        *
        (s_emotion + epsilon) ** weights["emotion"]
        *
        (s_budget + epsilon) ** weights["budget"]
    )

    return round(score, 4)


def process_scoring(ai_input_data):
    user_context = ai_input_data.get("user_context", {})
    prefs = user_context.get("preferences", {})
    restaurants = ai_input_data.get("restaurants", [])
    
    weights = determine_dynamic_weights(prefs)
    results = []

    for r_data in restaurants:
        r = r_data if isinstance(r_data, dict) else r_data.dict()
        r_id = r.get("id") 
        
        v_tags = _get_virtual_tags(r.get("type", ""), r.get("featured_dishes", []))
        
        if not is_safe_for_diet(prefs.get("dietary", []), v_tags):
            continue 

        s_taste = calculate_taste_match(prefs.get("food_types", []), v_tags)
        s_emotion = calculate_emotion_weather_match(
            prefs.get("mood", ""), 
            prefs.get("weather", ""), 
            v_tags, 
            r.get("rating", 0)
        )
        s_budget = calculate_budget_fit(
            prefs.get("budget", 0), 
            prefs.get("people", 1), 
            r.get("price", 0),
            v_tags
        )

        total_score = max(0.1,calculate_total_score(s_taste, s_emotion, s_budget, weights))
        
        dist = r.get("distance_km", 0)
        if dist > 1.0:
            total_score *= math.pow(0.9, dist - 1.0)

        scores_map = {
            "taste": s_taste,
            "emotion": s_emotion,
            "budget": s_budget
        }
        
        best_attr = max(scores_map, key=scores_map.get)
        worst_attr = min(scores_map, key=scores_map.get)

        if total_score >= 0.7:
            reasons = {
                "taste": "Hương vị cực chuẩn gu và đúng món bạn đang tìm.",
                "emotion": "Không gian xuất sắc, cực kỳ hợp với tâm trạng của bạn.",
                "budget": "Giá cả vô cùng hợp lý, là lựa chọn cực tiết kiệm."
            }
            reason = reasons[best_attr]
            if dist <= 1.5: reason += " Lại còn rất gần bạn nữa!"
        elif 0.4 <= total_score < 0.7:
            reason = "Một lựa chọn ổn, đáp ứng cơ bản các yêu cầu của bạn."
            if scores_map["budget"] < 0.5:
                reason = "Món ăn khá ổn nhưng mức giá hơi cao một chút so với dự tính."
            elif dist > 3.0:
                reason = "Quán rất ngon nhưng khoảng cách hơi xa, bạn cân nhắc nhé."
        else:
            negative_reasons = {
                "taste": "Khẩu vị quán này có vẻ không phù hợp với sở thích của bạn.",
                "emotion": "Không gian hoặc đánh giá chưa thực sự tương thích với mood hiện tại.",
                "budget": "Mức giá quán này vượt quá xa so với ngân sách bạn đề ra."
            }
            reason = f"Quán cách bạn tận {dist}km, khá xa để di chuyển." if dist > 7.0 else negative_reasons[worst_attr]

        results.append({
            "id": r_id,
            "score": round(total_score, 3),
            "reason": reason
        })

    results.sort(key=lambda x: x["score"], reverse=True)
    return {"results": results}