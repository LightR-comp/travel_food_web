import pytest
from unittest.mock import patch


# ==================== /intent_parse ====================

class TestIntentParse:

    def test_happy_path(self, client, mock_detect_intent):
        """Gửi message hợp lệ → trả về intent đúng"""
        response = client.post("/intent_parse", json={"message": "Tìm phở ngon quận 1"})

        assert response.status_code == 200
        body = response.json()
        assert body["success"] is True
        assert body["data"]["intent"] == "find_food"
        assert body["data"]["confidence"] == 0.95
        assert body["data"]["entities"]["dish"] == "phở"
        mock_detect_intent.assert_called_once_with("Tìm phở ngon quận 1")

    def test_empty_message(self, client):
        """Message rỗng → 422 validation error (Pydantic bắt)"""
        response = client.post("/intent_parse", json={"message": ""})
        assert response.status_code == 422

    def test_missing_message_field(self, client):
        """Thiếu field message → 422"""
        response = client.post("/intent_parse", json={})
        assert response.status_code == 422

    def test_ai_throws_exception(self, client):
        """AI bị lỗi → endpoint trả success=False, không crash server"""
        with patch(
            "api.chatbot_api.detect_intent_with_ai",
            side_effect=Exception("Gemini timeout")
        ):
            response = client.post("/intent_parse", json={"message": "Tìm phở"})

        assert response.status_code == 200  # Endpoint không crash
        body = response.json()
        assert body["success"] is False
        assert "Gemini timeout" in body["error"]

    def test_message_too_long(self, client):
        """Message vượt max_length → 422"""
        response = client.post("/intent_parse", json={"message": "a" * 501})
        assert response.status_code == 422


# ==================== /generate_response ====================

VALID_GENERATION_PAYLOAD = {
    "user_message": "Tìm phở không hành",
    "found_restaurants": [
        {
            "id": 1,
            "res_name": "Phở Thìn",
            "rating": 4.5,
            "price": 50000.0,
            "image_url": "https://example.com/pho.jpg",
            "distance_km": 1.2,
            "type": "Việt Nam",
            "featured_dishes": [
                {
                    "name": "Phở bò",
                    "price": 50000.0,
                    "ingredients": ["bò", "bánh phở", "hành"]
                }
            ]
        }
    ],
    "user_context": {
        "user_id": 1,
        "location": {
            "lat": 10.7769,
            "lng": 106.7009,
            "radius_km": 5.0
        },
        "preferences": {
            "budget": 100000,
            "people": 2,
            "dietary": ["hành"],
            "food_types": ["phở"],
            "mood": "",
            "weather": ""
        }
    }
}

class TestGenerateResponse:

    def test_happy_path(self, client, mock_generate_response):
        """Request hợp lệ → trả về reply và suggested_places"""
        response = client.post("/generate_response", json=VALID_GENERATION_PAYLOAD)

        assert response.status_code == 200
        body = response.json()
        assert body["success"] is True
        assert "reply" in body["data"]

    def test_empty_restaurants(self, client, mock_generate_response):
        """Không có nhà hàng nào → vẫn chạy, AI tự xử lý"""
        payload = {**VALID_GENERATION_PAYLOAD, "found_restaurants": []}
        response = client.post("/generate_response", json=payload)

        assert response.status_code == 200
        assert response.json()["success"] is True

    def test_ai_throws_exception(self, client):
        """AI lỗi → trả success=False"""
        with patch(
           "api.chatbot_api.generate_final_response",
            side_effect=Exception("API quota exceeded")
        ):
            response = client.post("/generate_response", json=VALID_GENERATION_PAYLOAD)

        assert response.status_code == 200
        body = response.json()
        assert body["success"] is False

    def test_no_user_context(self, client, mock_generate_response):
        """Không có user_context → không crash"""
        payload = {**VALID_GENERATION_PAYLOAD, "user_context": None}
        response = client.post("/generate_response", json=payload)
        assert response.status_code == 200