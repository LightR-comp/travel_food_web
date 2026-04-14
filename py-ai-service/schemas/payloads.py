# payloads.py chứa các mô hình dữ liệu (schemas) để định nghĩa cấu trúc của dữ liệu đầu vào và đầu ra cho các API của Python AI Service.
# Đây là nơi chúng ta sẽ xây dựng các mô hình dữ liệu sử dụng Pydantic
# để đảm bảo rằng dữ liệu được gửi đến và trả về từ API đã được kiểm tra và có cấu trúc rõ ràng, giúp cho việc phát triển và bảo trì service trở nên dễ dàng hơn.
#phù hợp với các endpoint đã được định nghĩa trong main.py và các router trong thư mục 'api'.
# đồng bộ với các mô hình dữ liệu được sử dụng trong Go Core Backend để đảm bảo rằng dữ liệu được truyền giữa hai service có cấu trúc nhất quán và dễ dàng xử lý.

from pydantic import BaseModel
from typing import List, Optional, Any

# GIAI ĐOẠN 3: GO -> PYTHON (INPUT)

# 1. Các Sub-model cho UserContext (Khớp với models.UserContext của Go)
class LocationInput(BaseModel):
    lat: float
    lng: float
    radius_km: float = 5.0

class ContextPreferencesInput(BaseModel):
    budget: int
    people: int
    dietary: List[str]
    mood: str

class RestaurantInput(BaseModel):
    id: int
    rating: float
    price: float  
    distance_km: float
    type: str    
    featured_dishes: List[SummaryDishInput] = [] 

class RecommendRequest(BaseModel):
    user_context: UserContext  # Map với json:"user_context" của Go
    restaurants: List[RestaurantInput]


# GIAI ĐOẠN 5: PYTHON -> GO (OUTPUT)
class AIResultItem(BaseModel):
    id: int
    score: float
    reason: str

class RecommendResponse(BaseModel):
    # Đổi tên field cho khớp json:"recommended_restaurants" của Go
    recommended_restaurants: List[AIResultItem]
    
# Chatbot 

# Phản hồi cho Go
class BaseResponse(BaseModel): 
    success: bool
    message: Optional[str] = ""
    data: Optional[Any] = None
    error: Optional[Any] = None

# Nhận từ Go
class ChatRequest(BaseModel):
    user_id: int
    session_id: str
    message: str
    image_url: Optional[str] = None
    context: Optional[UserContext] = None # Go sẽ gửi kèm cái này nếu cần AI tư vấn sâu

class ChatData(BaseModel):
    reply: str
    intent: Optional[str] = None
    recommendations: Optional[List[PlaceInfo]] = None

# Ý định
class IntentResponse(BaseModel):
    intent: str
    entities: dict       

# Thông tin vị trí
class PlaceInfo(BaseModel):
    id: int
    name: str
    address: str
    rating: float
    price_range: str
    image_url: str
    tags: List[str]
    allergy_friendly: bool
    ai_reason: Optional[str] = None # Lý do AI gợi ý 