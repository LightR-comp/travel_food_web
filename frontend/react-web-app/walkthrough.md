# YumMap – React Frontend Walkthrough

## Tổng Quan

React + Vite + Tailwind CSS frontend cho ứng dụng AI Food & Tourism **YumMap**, được xây dựng dựa trên các UI mockups (Dashboard.png, Search.png, Detail.png, Chatbot.png, login.png, sign_up.png) và API Contract.

---

## Cấu Trúc Thư Mục

```
react-web-app/
├── public/
│   └── favicon.svg
├── src/
│   ├── api/
│   │   ├── axiosInstance.js      # JWT interceptors, proxy to :8080
│   │   ├── authApi.js            # login, register, logout, getMe
│   │   ├── restaurantApi.js      # trending, search, getById, posts
│   │   └── chatbotApi.js         # sendMessage (4-stage RAG workflow)
│   ├── context/
│   │   └── AuthContext.jsx       # JWT session management
│   ├── utils/
│   │   └── formatters.js         # formatPrice, debounce, isValidEmail...
│   ├── components/
│   │   ├── ui/
│   │   │   ├── InputField.jsx    # Pill input with eye-toggle
│   │   │   ├── AuthButton.jsx    # 4 variants: primary/facebook/google/outline
│   │   │   └── index.jsx         # Badge, Tag, StarRating, Distance, PriceTag, Toast, Spinner
│   │   ├── layout/
│   │   │   ├── Header.jsx        # Sticky, search bar, user dropdown, mobile menu
│   │   │   ├── NavTabs.jsx       # Active-state tab navigation
│   │   │   └── Footer.jsx        # Dark footer with social links
│   │   ├── dashboard/
│   │   │   ├── HeroBanner.jsx    # City hero image + search bar
│   │   │   ├── FoodCardCarousel.jsx  # Horizontal scroll with arrows
│   │   │   └── PopularPosts.jsx  # 2-col grid blog posts
│   │   ├── search/
│   │   │   ├── SearchSidebar.jsx # Map + price slider + filter checkboxes
│   │   │   └── RestaurantListItem.jsx  # Horizontal result card
│   │   ├── detail/
│   │   │   ├── PhotoGallery.jsx  # Asymmetric grid + lightbox
│   │   │   └── MenuSection.jsx   # Menu tables + combo section
│   │   └── chatbot/
│   │       └── ChatbotModal.jsx  # Floating widget + ChatBubble + typing indicator
│   ├── pages/
│   │   ├── HomePage.jsx          # Dashboard with 3 sections
│   │   ├── SearchPage.jsx        # Search with sidebar + debounced results
│   │   ├── DetailPage.jsx        # Full restaurant detail
│   │   ├── LoginPage.jsx         # Split layout auth page
│   │   └── SignupPage.jsx        # Floating logo + peach form
│   ├── App.jsx                   # Router + AuthProvider + Chatbot
│   ├── main.jsx
│   └── index.css                 # Tailwind v4, CSS vars, animations
├── index.html                    # Google Fonts: Baloo 2, Inter, Dancing Script
├── vite.config.js                # Tailwind plugin + proxy /api → :8080
└── .env.example                  # Backend URL template
```

---

## Chạy Dev Server

```bash
cd frontend-design/react-web-app
npm install
npm run dev
# → http://localhost:5173/
```

---

## Các Trang

| Route         | Page         | Mô tả |
|---------------|--------------|--------|
| `/`           | HomePage     | Hero + TOP TRENDINGS + POPULAR POSTS + GOOD SPOTS |
| `/search`     | SearchPage   | Sidebar filter + danh sách kết quả debounced |
| `/detail/:id` | DetailPage   | Gallery + info + menu + AI analysis |
| `/login`      | LoginPage    | Split layout cor/pink background |
| `/signup`     | SignupPage   | Floating logo + peach form panel |

---

## Kết Nối Backend

### Swap Mock → Real API

Tất cả API calls đều có comment rõ ràng:

```js
// --- MOCK (remove when Go backend is ready) ---
await new Promise((r) => setTimeout(r, 800));
return { success: true, data: {...} };

// --- REAL (uncomment when backend ready) ---
// const { data } = await axiosInstance.post('/auth/login', credentials);
// return data;
```

### Go Backend (port 8080)
Cấu hình trong `vite.config.js`:
```js
proxy: { '/api': { target: 'http://localhost:8080', changeOrigin: true } }
```

### Python AI Chatbot
- **Stage 1**: `POST /api/chat/message` → Go proxies → Python intent parse
- **Stage 4**: Python trả về `{ reply, suggested_places[] }` → hiển thị trong ChatbotModal

### Auth Flow
- Login → `localStorage.setItem('yummap_token', token)`
- Mọi request → Header: `Authorization: Bearer <token>`
- 401 response → auto redirect `/login`

---

## Color Palette (từ mockups)

| Variable         | Value     | Dùng cho |
|------------------|-----------|----------|
| `--primary`      | `#E8623A` | Buttons, links |
| `--accent`       | `#F5A623` | Stars, highlights |
| `--coral-bg`     | `#F0786A` | Auth page background |
| `--peach`        | `#FDECD8` | Signup form panel |
| `--cream`        | `#FFF8EE` | Page background cards |
| `--dark`         | `#2C1810` | Primary text |
| `--yellow-panel` | `#FEF3C0` | Login welcome side |

---

## Validation Rules (SignupPage)

| Field            | Rule |
|------------------|------|
| Họ và tên        | Bắt buộc |
| Email            | Regex email chuẩn |
| Tài khoản        | ≥ 3 ký tự |
| Mật khẩu         | ≥ 8 ký tự |
| Nhập lại mật khẩu | Phải khớp |

