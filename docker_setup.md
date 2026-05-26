# Hướng dẫn setup Docker cho YumMap

## Cấu trúc file cần đặt

```
travel_food_web/
├── docker-compose.yml              ← file này
├── infra/
├── frontend/
│   └── react-web-app/
│       ├── Dockerfile              ← copy từ frontend.Dockerfile
│       └── nginx.conf              ← copy file nginx.conf
└── backend/
    ├── core/
    │   └── Dockerfile              ← copy từ backend.Dockerfile
    └── ai/
        └── Dockerfile              ← copy từ ai.Dockerfile
```

## Bước 1 — Đặt file đúng chỗ

```bash
# Copy Dockerfile vào đúng thư mục
cp frontend.Dockerfile  frontend/react-web-app/Dockerfile
cp nginx.conf           frontend/react-web-app/nginx.conf
cp backend.Dockerfile   backend/core/Dockerfile
cp ai.Dockerfile        backend/ai/Dockerfile
cp docker-compose.yml   ./docker-compose.yml
```

## Bước 2 — Cho phép SQL Server nhận kết nối từ Docker

Vì SQL Server chạy trên Windows local, cần bật TCP/IP:

1. Mở **SQL Server Configuration Manager**
2. **SQL Server Network Configuration** → **Protocols for MSSQLSERVER**
3. Bật **TCP/IP**
4. Restart SQL Server service

Sau đó sửa connection string trong `backend/core/.env`:
```env
DB_HOST=host.docker.internal
DB_PORT=1433
DB_NAME=travel_food_db
```

## Bước 3 — Kiểm tra file .env

**`backend/core/.env`** phải có:
```env
DB_HOST=host.docker.internal
DB_PORT=1433
DB_NAME=travel_food_db
FIREBASE_CREDENTIAL_PATH=/app/serviceAccountKey.json
CLOUDINARY_CLOUD_NAME=xxx
CLOUDINARY_API_KEY=xxx
CLOUDINARY_API_SECRET=xxx
JWT_SECRET=xxx
PORT=8080
AI_SERVICE_URL=http://ai:8000
FRONTEND_URL=http://localhost:5173
```

**`backend/ai/.env`** phải có:
```env
GOOGLE_API_KEY=xxx
```

## Bước 4 — Chạy Docker

```bash
# Build và chạy tất cả
docker-compose up --build

# Chạy nền (background)
docker-compose up --build -d

# Xem log
docker-compose logs -f

# Dừng
docker-compose down
```

## Truy cập sau khi chạy

| Service | URL |
|---------|-----|
| Frontend | http://localhost:5173 |
| Backend API | http://localhost:8080 |
| AI Service | http://localhost:8000 |

## Lưu ý

- File `serviceAccountKey.json` phải có trong `backend/core/` trước khi build
- SQL Server phải bật TCP/IP và cho phép kết nối từ `host.docker.internal`
- Lần đầu build sẽ lâu (~5-10 phút) do download dependencies