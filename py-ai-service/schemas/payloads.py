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
    image_url: str
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

class IntentData(BaseModel):
    intent: str
    entities: dict
    confidence: float

class ChatGenerationRequest(BaseModel):
    user_message: str = Field(min_length=1, max_length=500)
    found_restaurants: list = Field(max_length=20)
    user_context: Optional[UserContext] = None

class PlaceInfo(BaseModel):
    restaurant: RestaurantInput
    ai_reason: Optional[str] = None
    allergy_friendly: bool = False
    tags: List[str] = []

class ChatFinalData(BaseModel):
    reply: str
    suggested_places: List[PlaceInfo]