# chatbot_api.py chứa các endpoint liên quan đến việc trò chuyện với người dùng, bao gồm endpoint chính để nhận tin nhắn từ người dùng và trả về phản hồi từ AI.
# Đây là nơi chúng ta sẽ xây dựng các endpoint để xử lý tin nhắn từ người dùng
#  bao gồm việc nhận dữ liệu về tin nhắn sau đó sử dụng các hàm trong thư mục 'ai_chatbot' để tạo ra phản hồi phù hợp, cuối cùng trả về kết quả cho người dùng.
# cụ thể phân tích intent của người dùng, gửi cho go chọc vào database, nhận kết quả, sau đó xây dựng câu trả lời cho người dùng dựa trên kết quả đó.


from fastapi import APIRouter
from schemas.payloads import ChatRequest, ChatResponse

router = APIRouter()

@router.post("/chat", response_model=ChatResponse)
async def chat_endpoint(request: ChatRequest):
    # Chuyển tin nhắn về chữ thường
    user_msg = request.message.lower()
    
    # MOCK LOGIC: Phản hồi dựa trên từ khóa đơn giản
    if "chào" in user_msg or "hello" in user_msg:
        reply_text = "Chào bạn! Tôi là trợ lý AI du lịch ẩm thực. Tôi có thể giúp bạn tìm quán ăn phù hợp với sở thích và tâm trạng hôm nay."
    
    elif "đói" in user_msg or "ăn" in user_msg or "gợi ý" in user_msg:
        reply_text = "Bạn đang muốn tìm món gì? Hãy cho tôi biết sơ qua về ngân sách và bạn đi cùng mấy người nhé!"
        
    else:
        # Nếu không trúng từ khóa nào, nó sẽ nhại lại lời người dùng
        reply_text = f"Tôi đã nhận được tin nhắn: '{request.message}'."

    # Trả về kết quả khớp 100% với định dạng ChatResponse trong payloads.py
    return ChatResponse(
        reply=reply_text,
        status="success"
    )