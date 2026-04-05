from pydantic import BaseModel
from typing import List, Optional

# GIAI ĐOẠN 3: GO -> PYTHON (INPUT)
class UserContext(BaseModel):
    budget: int
    people: int
    dietary: List[str]
    mood: str

class RestaurantInput(BaseModel):
    id: int
    rating: float
    price: int
    distance_km: float

class RecommendRequest(BaseModel):
    user_context: UserContext
    restaurants: List[RestaurantInput]

# GIAI ĐOẠN 5: PYTHON -> GO (OUTPUT)
class AIResultItem(BaseModel):
    id: int
    score: float
    reason: str

class RecommendResponse(BaseModel):
    results: List[AIResultItem]
    
# Chatbot 
class ChatRequest(BaseModel):
    user_id: int
    message: str

class ChatResponse(BaseModel):
    reply: str
    status: str = "success"