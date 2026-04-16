import pytest
from fastapi.testclient import TestClient
from unittest.mock import MagicMock, patch
from schemas.payloads import ChatFinalData, PlaceInfo
with patch("core.ai_config.shared_model", MagicMock()):
    from api.chatbot_api import app

MOCK_INTENT_RESULT = {
    "intent": "find_food",
    "entities": {"dish": "phở", "location": "quận 1"},
    "confidence": 0.95
}

@pytest.fixture
def client():
    return TestClient(app)

@pytest.fixture
def mock_detect_intent():
    # ✅ Patch đúng chỗ — nơi chatbot_api.py dùng hàm này
    with patch("api.chatbot_api.detect_intent_with_ai", return_value=MOCK_INTENT_RESULT) as m:
        yield m

@pytest.fixture
def mock_generate_response():
    # ✅ Trả về Pydantic object thật — serialize đúng
    mock_data = ChatFinalData(
        reply="Thử Phở Thìn nhé!",
        suggested_places=[]
    )
    with patch("api.chatbot_api.generate_final_response", return_value=mock_data) as m:
        yield m