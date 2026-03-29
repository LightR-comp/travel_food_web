from fastapi import FastAPI


app = FastAPI(title="Smart Tourism AI Service")

@app.get("/")
def read_root():
    return {"message": "AI Service đang chạy ngon lành!"}

@app.post("/recommend")
def dummy_recommend():
    return {"status": "success", "message": "Đây là danh sách quán ăn giả vờ từ Python"}