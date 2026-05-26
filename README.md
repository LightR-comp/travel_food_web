# 🍜 YumMap — Khám Phá Ẩm Thực Việt Nam

> Ứng dụng web khám phá và gợi ý ẩm thực tại TP.HCM, tích hợp AI chatbot nhận diện món ăn và gợi ý nhà hàng cá nhân hóa.

---

## 👥 Thông Tin Nhóm

| Họ và tên | MSSV | Vai trò |
|-----------|------|---------|    
| Phạm Nguyễn Quang Sáng | 24120132 | General leader (Frontend & Backend) |
| Lê Công Minh Nhựt | 24120196 | Leader 1 Backend (Go) |
| Nguyễn Thành Đạt | 24120173 | Leader 2 Frontend  |
| Nguyễn Lê Anh Kiên | 24120196 | Backend |
| Nguyễn Khánh Đăng | 24120171 | Backend |
| Võ Đình Đình | 24120287 | Frontend |
| Võ Nhật Minh | 24120202 | Backend |

---

## 📌 Giới Thiệu

**YumMap** là ứng dụng web hỗ trợ người dùng:
- Tìm kiếm nhà hàng, món ăn theo vị trí, giá cả, loại ẩm thực
- Nhận gợi ý cá nhân hóa qua chatbot AI (Google Gemini)
- Nhận diện món ăn từ hình ảnh
- Chia sẻ đánh giá trải nghiệm ẩm thực trên diễn đàn

---

## 🏗️ Kiến Trúc Hệ Thống

```
Frontend (React + Vite)     :5173
        ↓ Vite Proxy
Backend (Go + Gin)          :8080
        ↓
┌───────────────────────────────┐
│  SQL Server (MSSQL)           │
│  AI Service (Python + FastAPI) :8000 │
│  Cloudinary (lưu ảnh)         │
│  Firebase (OAuth)             │
└───────────────────────────────┘
```

---

## 🛠️ Công Nghệ Sử Dụng

### Frontend
| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|---------|
| React | 18 | UI framework |
| Vite | 5 | Build tool |
| Tailwind CSS | 3 | Styling |
| React Router | 6 | Routing |
| Axios | - | HTTP client |
| Firebase SDK | - | OAuth login |

### Backend (Go)
| Công nghệ | Mục đích |
|-----------|---------|
| Go 1.21+ | Ngôn ngữ chính |
| Gin | HTTP framework |
| JWT | Xác thực |
| Firebase Admin SDK | Verify OAuth token |
| Cloudinary Go SDK | Upload ảnh |

### AI Service (Python)
| Công nghệ | Mục đích |
|-----------|---------|
| FastAPI | Web framework |
| Google Gemini | Mô hình ngôn ngữ |
| VADER / TextBlob | Phân tích cảm xúc |
| NLTK | Xử lý ngôn ngữ tự nhiên |

### Database
- **Microsoft SQL Server** — dữ liệu nhà hàng, người dùng, lịch sử chat

---

## 🚀 Hướng Dẫn Cài Đặt

### Yêu Cầu
- Node.js 18+
- Go 1.21+
- Python 3.10+
- SQL Server 2019+

### 1. Clone Repository

```bash
git clone https://github.com/your-org/travel_food_web.git
cd travel_food_web
```

### 2. Cấu Hình Database

Mở SQL Server Management Studio, chạy lần lượt:

```
backend/database/init_schema.sql
backend/database/data.sql
backend/database/ChatHistory.sql
```

### 3. Cấu Hình Backend (Go)

Tạo file `backend/core/.env`:

```env
DB_HOST=localhost
DB_PORT=1433
DB_NAME=travel_food_db

FIREBASE_CREDENTIAL_PATH=./serviceAccountKey.json

CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

AI_SERVICE_URL=http://localhost:8000
FRONTEND_URL=http://localhost:5173
PORT=8080
JWT_SECRET=your_jwt_secret
```

Đặt file `serviceAccountKey.json` vào `backend/core/` (lấy từ Firebase Console → Project Settings → Service Accounts).

Chạy backend:

```bash
cd backend/core
go run cmd/server/main.go
```

### 4. Cấu Hình AI Service (Python)

Tạo file `backend/ai/.env`:

```env
GOOGLE_API_KEY=your_gemini_api_key
```

Cài dependencies và chạy:

```bash
cd backend/ai
pip install -r requirements.txt
uvicorn main:app --port 8000
```

### 5. Cấu Hình Frontend (React)

Tạo file `frontend/react-web-app/.env`:

```env
VITE_API_URL=http://localhost:8080/api/v1
VITE_AI_URL=http://localhost:8000
VITE_APP_NAME=YumMap
```

Cài dependencies và chạy:

```bash
cd frontend/react-web-app
npm install
npm run dev
```

### 6. Truy Cập Ứng Dụng

Mở trình duyệt: **http://localhost:5173**

---

## 📁 Cấu Trúc Thư Mục

```
travel_food_web/
├── backend/
│   ├── ai/                     # Python AI Service
│   │   ├── ai_chatbot/         # Chatbot logic
│   │   ├── api/                # FastAPI endpoints
│   │   ├── core/               # AI config (Gemini)
│   │   ├── main.py
│   │   └── requirements.txt
│   ├── core/                   # Go Backend
│   │   ├── cmd/server/main.go
│   │   ├── internal/
│   │   │   ├── config/
│   │   │   ├── dto/
│   │   │   ├── handlers/       # HTTP handlers
│   │   │   ├── middlewares/
│   │   │   ├── models/
│   │   │   ├── routes/
│   │   │   └── services/       # Business logic + DB
│   │   ├── go.mod
│   │   └── .env
│   └── database/               # SQL scripts
│       ├── init_schema.sql
│       ├── data.sql
│       └── ChatHistory.sql
└── frontend/
    └── react-web-app/
        ├── src/
        │   ├── api/            # API calls
        │   ├── assets/
        │   ├── components/
        │   │   ├── chatbot/    # ChatbotModal
        │   │   ├── dashboard/  # FoodCard, Carousel
        │   │   ├── layout/     # Header, NavTabs
        │   │   └── ui/         # Shared components
        │   ├── config/
        │   │   └── firebase.js
        │   ├── context/
        │   │   └── AuthContext.jsx
        │   ├── pages/          # Các trang chính
        │   └── App.jsx
        ├── .env
        └── vite.config.js
```

---

## 🔌 API Endpoints

### Xác Thực
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/api/v1/auth/register` | Đăng ký tài khoản |
| POST | `/api/v1/auth/login` | Đăng nhập local |
| POST | `/api/v1/auth/oauth` | Đăng nhập Google/Facebook |
| POST | `/api/v1/auth/forgot-password` | Quên mật khẩu |

### Người Dùng
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/api/v1/me` | Lấy thông tin cá nhân |
| PUT | `/api/v1/me` | Cập nhật tên |
| POST | `/api/v1/me/avatar` | Upload avatar |

### Nhà Hàng
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/api/v1/restaurants/popular` | Nhà hàng nổi bật |
| GET | `/api/v1/restaurants/search` | Tìm kiếm |
| GET | `/api/v1/restaurants/:id` | Chi tiết nhà hàng |

### Chatbot AI
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/api/v1/chat/message` | Gửi tin nhắn / ảnh |
| GET | `/api/v1/chat/history/:userId` | Lịch sử chat |

### Diễn Đàn
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/api/v1/posts` | Danh sách bài viết |
| GET | `/api/v1/posts/popular` | Bài viết nổi bật |
| POST | `/api/v1/posts` | Đăng bài (cần auth) |

---

## ✨ Tính Năng Chính

- 🏠 **Trang chủ** — Top trending, Good spots, Popular posts
- 🔍 **Tìm kiếm** — Lọc theo loại, giá, khoảng cách
- 🤖 **AI Chatbot** — Gợi ý nhà hàng theo ngôn ngữ tự nhiên
- 📷 **Nhận diện ảnh** — Xác định món ăn từ hình ảnh
- 🔐 **Đăng nhập** — Local, Google OAuth, Facebook OAuth
- 👤 **Profile** — Xem và cập nhật thông tin cá nhân
- 💬 **Diễn đàn** — Chia sẻ review ẩm thực

---

## 📝 Lưu Ý

- File `serviceAccountKey.json` và `.env` **không được commit** lên Git
- Đảm bảo `.gitignore` có các dòng:
  ```
  .env
  serviceAccountKey.json
  uploads/
  ```
- Gemini API key miễn phí có giới hạn quota — xem tại https://ai.google.dev/pricing
