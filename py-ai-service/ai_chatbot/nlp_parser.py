from flask import Flask, request, jsonify # Lần lượt để gọi API, nhận data từ Go và đóng gói thành file json

app = Flask(__name__) # Tạo API webserver tên là app (chatbot)

# Hàm này là hàm chính để phân tích ý định người dùng
def detect_intent(text): 
    text = text.lower() # Chuyển tất cả về chữ thường
    # Nhận diện cơ bản trước một vài tình huống
    if any(word in text for word in ["mở cửa", "giờ làm việc", "mấy giờ"]):
        return "opening_hours" 
    if any(word in text for word in ["địa chỉ", "ở đâu", "vị trí"]):
        return "location"
    if any(word in text for word in ["thực đơn", "món ăn", "menu"]):
        return "menu_info"
    
    return "general_consultation" # Giới thiệu tổng quan theo những mục cố định

@app.route('/parse-intent', methods=['POST']) # Tạo một đường dẫn (endpoint) tên là /parse-intent 
def parse_intent(): 
    data = request.json
    user_text = data.get("text", "") # Trích nội dung querry của người dùng
    intent = detect_intent(user_text) # Sử dụng hàm phân tích ý định
    
    return jsonify({
        "intent": intent,
        "confidence": 1.0 # Độ tin cậy trả về
    })

if __name__ == '__main__':
    app.run(port=5000) # Mở port webserver đã tạo, Go sẽ gọi vào port này