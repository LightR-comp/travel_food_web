# payloads.py chứa các mô hình dữ liệu (schemas) để định nghĩa cấu trúc của dữ liệu đầu vào và đầu ra cho các API của Python AI Service.
# Đây là nơi chúng ta sẽ xây dựng các mô hình dữ liệu sử dụng Pydantic
# để đảm bảo rằng dữ liệu được gửi đến và trả về từ API đã được kiểm tra và có cấu trúc rõ ràng, giúp cho việc phát triển và bảo trì service trở nên dễ dàng hơn.
#phù hợp với các endpoint đã được định nghĩa trong main.py và các router trong thư mục 'api'.
# đồng bộ với các mô hình dữ liệu được sử dụng trong Go Core Backend để đảm bảo rằng dữ liệu được truyền giữa hai service có cấu trúc nhất quán và dễ dàng xử lý.

from pydantic import BaseModel, field_validator, Field
from typing import List, Optional, Any

class BaseResponse(BaseModel):
    success: bool
    message: Optional[str] = ""
    data: Optional[Any] = None
    error: Optional[Any] = None

class LocationInput(BaseModel):
    lat: float
    lng: float
    radius_km: float = 5.0

class ContextPreferencesInput(BaseModel):
    budget: int
    people: int
    dietary: List[str] = []
    food_types: List[str] = []
    mood: str = ""
    weather: str = ""

class UserContext(BaseModel):
    user_id: int
    location: LocationInput
    preferences: ContextPreferencesInput

class SummaryDishInput(BaseModel):
    name: str
    price: float
    ingredients: List[str] = []

class RestaurantInput(BaseModel):
    id: int
    res_name: str
    rating: float
    price: float
    image_url: str = "" 
    distance_km: float
    type: str
    featured_dishes: List[SummaryDishInput] = []

class RecommendRequest(BaseModel):
    user_context: UserContext
    restaurants: List[RestaurantInput]

class AIResultItem(BaseModel):
    id: int
    score: float
    reason: str

class RecommendResponse(BaseModel):
    recommended_restaurants: List[AIResultItem]

class ChatIntentRequest(BaseModel):
    message: str = Field(min_length=1, max_length=500)

    @field_validator("message")
    @classmethod
    def message_not_blank(cls, v):
        if not v.strip():
            raise ValueError("Tin nhắn không được để trống")
        return v.strip()

### CHATBOT_FLOW:


# Lần gọi 1: Phân tích ý định
class ChatIntentRequest(BaseModel):
    message: str = Field(min_length=1, max_length=500)

    @field_validator("message")
    @classmethod
    def message_not_blank(cls, v):
        if not v.strip():
            raise ValueError("Tin nhắn không được để trống")
        return v.strip()

class IntentData(BaseModel):   # python trả về
    intent: str               # find_food, allergy_inquiry, greeting
    entities: dict            # {"food_type": "bún bò", "budget": 50000}
    confidence: float

# Lần gọi 2: Tạo câu trả lời tự nhiên
class ChatGenerationRequest(BaseModel):
    user_message: str = Field(min_length=1, max_length=500)
    found_restaurants: list = Field(max_length=20)  # Tránh list khổng lồ
    user_context: Optional[UserContext] = None

class PlaceInfo(BaseModel):
    restaurant: RestaurantInput
    ai_reason: Optional[str] = None
    allergy_friendly: bool = False
    tags: List[str] = []

class ChatFinalData(BaseModel):
    reply: str
    suggested_places: List[PlaceInfo]