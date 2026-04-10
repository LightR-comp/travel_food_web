# payloads.py chứa các mô hình dữ liệu (schemas) để định nghĩa cấu trúc của dữ liệu đầu vào và đầu ra cho các API của Python AI Service.
# Đây là nơi chúng ta sẽ xây dựng các mô hình dữ liệu sử dụng Pydantic
# để đảm bảo rằng dữ liệu được gửi đến và trả về từ API đã được kiểm tra và có cấu trúc rõ ràng, giúp cho việc phát triển và bảo trì service trở nên dễ dàng hơn.
#phù hợp với các endpoint đã được định nghĩa trong main.py và các router trong thư mục 'api'.
# đồng bộ với các mô hình dữ liệu được sử dụng trong Go Core Backend để đảm bảo rằng dữ liệu được truyền giữa hai service có cấu trúc nhất quán và dễ dàng xử lý.

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