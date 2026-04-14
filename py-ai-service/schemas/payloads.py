# payloads.py chứa các mô hình dữ liệu (schemas) để định nghĩa cấu trúc của dữ liệu đầu vào và đầu ra cho các API của Python AI Service.
# Đây là nơi chúng ta sẽ xây dựng các mô hình dữ liệu sử dụng Pydantic
# để đảm bảo rằng dữ liệu được gửi đến và trả về từ API đã được kiểm tra và có cấu trúc rõ ràng, giúp cho việc phát triển và bảo trì service trở nên dễ dàng hơn.
#phù hợp với các endpoint đã được định nghĩa trong main.py và các router trong thư mục 'api'.
# đồng bộ với các mô hình dữ liệu được sử dụng trong Go Core Backend để đảm bảo rằng dữ liệu được truyền giữa hai service có cấu trúc nhất quán và dễ dàng xử lý.

from pydantic import BaseModel
from typing import List, Optional, Any

'''
Tất cả các giao tiếp API với Go phải tuân thủ theo format sau:
'''
class BaseResponse(BaseModel):
    success: bool
    message: Optional[str] = ""
    data: Optional[Any] = None
    error: Optional[Any] = None
'''
Trong đó, phần data sẽ được thay thế tùy theo từng trường hợp. 
'''

### RECOMMEND FLOW

# GIAI ĐOẠN 3: GO -> PYTHON (INPUT)

# 1. Các Sub-model cho UserContext (Khớp với models.UserContext của Go)
class LocationInput(BaseModel): # Vị trí người dùng
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


# 2. Các Sub-model cho Restaurant (Khớp với dto.AIRestaurantInput của Go)
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



### CHATBOT_FLOW:


# Lần gọi 1: Phân tích ý định
class ChatIntentRequest(BaseModel): # GO trả về
    message: str
    user_id: int

class IntentData(BaseModel):   # python trả về
    intent: str               # find_food, allergy_inquiry, greeting
    entities: dict            # {"food_type": "bún bò", "budget": 50000}
    confidence: float

# Lần gọi 2: Tạo câu trả lời tự nhiên
class ChatGenerationRequest(BaseModel): # GO trả về
    user_message: str
    intent: str
    user_context: UserContext             # Thông tin dị ứng, mood của user
    found_restaurants: List[RestaurantInput] # Danh sách quán Go vừa tìm được. Nếu found_restaurants gửi qua là [],
    # Python sẽ hiểu là "À, đây là tán gẫu/văn hóa, mình tự bịa nội dung dựa trên user_message thôi".

# Thông tin vị trí
class PlaceInfo(BaseModel):
    # Đối tượng gốc nằm ở đây
    restaurant: RestaurantInput 
    
    # Các trường do AI bổ sung
    ai_reason: Optional[str] = None
    allergy_friendly: bool = False
    tags: List[str] = []

class ChatFinalData(BaseModel): # python trả về
    reply: str                            # Câu trả lời tự nhiên (Natural Language)
    suggested_places: List[PlaceInfo]  

# Generate response
class GenerateRequest(BaseModel):
    user_query: str
    db_data: Any

class BaseResponse(BaseModel):
    success: bool
    message: Optional[str] = ""
    data: Optional[Any] = None
    error: Optional[Any] = None
