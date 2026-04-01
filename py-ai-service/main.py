from fastapi import FastAPI
from api import engine_api, chatbot_api


app = FastAPI(title="Smart Tourism AI Service")

# Gắn các router (API) từ thư mục 'api' vào app chính
app.include_router(engine_api.router, prefix="/api/v1/engine", tags=["Recommendation Engine"])
app.include_router(chatbot_api.router, prefix="/api/v1/bot", tags=["Chatbot"])

@app.get("/")
def read_root():
    return {"message": "AI Service đang chạy ngon lành!"}

@app.post("/recommend")
def dummy_recommend():
    return {"status": "success", "message": "Đây là danh sách quán ăn giả vờ từ Python"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)