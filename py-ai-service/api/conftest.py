import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient
from unittest.mock import MagicMock, patch
from schemas.payloads import ChatFinalData

with patch("core.ai_config.shared_model", MagicMock()):
    from api.chatbot_api import app

MOCK_INTENT_RESULT = {
    "intent": "find_food",
    "entities": {"dish": "phở", "location": "quận 1"},
    "confidence": 0.95
}

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
        "location": {"lat": 10.7769, "lng": 106.7009, "radius_km": 5.0},
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

@pytest.fixture
def client():
    return TestClient(app)

@pytest.fixture
def mock_detect_intent():
    with patch("api.chatbot_api.detect_intent_with_ai", return_value=MOCK_INTENT_RESULT) as m:
        yield m

@pytest.fixture
def mock_generate_response():
    mock_data = ChatFinalData(reply="Thử Phở Thìn nhé!", suggested_places=[])
    with patch("api.chatbot_api.generate_final_response", return_value=mock_data) as m:
        yield m