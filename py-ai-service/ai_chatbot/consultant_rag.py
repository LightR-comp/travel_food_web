from flask import Flask, request, jsonify
# import google.generativeai as genai

app = Flask(__name__)

# Setup Gemini (nếu bạn đã có API Key)
# genai.configure(api_key="YOUR_GEMINI_API_KEY")
# model = genai.GenerativeModel('gemini-pro')

@app.route('/generate-response', methods=['POST']) # Tạo endpoint

# Hàm tạo câu trả lời
def generate_response():
    data = request.json # Nhận phần data đã được tổng hợp từ Go
    user_query = data.get("query") # Lấy câu hỏi gốc
    db_data = data.get("db_data") # Thông tin Go lấy từ MSSQL gửi sang
    
    # Prompt Engineering: Dùng promt này gửi cho API để nhận được câu trả lời
    prompt = f"""
    Bạn là trợ lý ảo thông minh của cửa hàng. 
    Dựa trên thông tin dưới đây: "{db_data}"
    Hãy trả lời câu hỏi của khách hàng: "{user_query}"
    Yêu cầu: Trả lời ngắn gọn, lịch sự, đúng trọng tâm thông tin được cung cấp.
    """
    # response_text = model.generate_content(prompt).text
    
    # Giả lập response 
    response_text = f"Chào bạn, sau đây là dữ liệu mà mình thu thập được dựa trên câu hỏi của bạn:\n {db_data}.\nBạn cần hỗ trợ thêm thì cứ nói cho mình biết nhé."

    return jsonify({
        "answer": response_text
    })

if __name__ == '__main__':
    app.run(port=5001)