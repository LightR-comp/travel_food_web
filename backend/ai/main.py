# main.py là điểm khởi đầu của Python AI Service
# nơi chúng ta sẽ thiết lập FastAPI và gắn các router (API) từ thư mục 'api' vào app chính.
# Đây là nơi chúng ta sẽ định nghĩa các endpoint chính của service, bao gồm cả endpoint gợi ý quán ăn và endpoint để kiểm tra trạng thái của service.


from fastapi import FastAPI
from httpx import request
from api import engine_api, chatbot_api
from schemas.payloads import RecommendRequest, RecommendResponse, BaseResponse, AIResultItem


app = FastAPI(title="Smart Tourism AI Service")

# Gắn các router (API) từ thư mục 'api' vào app chính
app.include_router(engine_api.router, prefix="/api/v1/engine", tags=["Recommendation Engine"])
app.include_router(chatbot_api.router, prefix="/api/v1/bot", tags=["Chatbot"])

@app.get("/")
def read_root():
    return {"message": "AI Service đang chạy ngon lành!"}
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)