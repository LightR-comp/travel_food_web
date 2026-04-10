# Thống nhất về phong cách lập trình và định dạng json

## 1. Quy tắc chung (BẮT BUỘC):

### 1.1. Tất cả API phải theo format chuẩn:

```json
{
  "success": true,
  "message": "optional message",
  "data": {},
  "error": null
}
```

### 1.2. Ý nghĩa field:

| Field   | Kiểu           | Ý nghĩa                     |
| ------- | -------------- | --------------------------- |
| success | boolean        | request có thành công không |
| message | string         | mô tả ngắn                  |
| data    | object / array | dữ liệu chính               |
| error   | object / null  | thông tin lỗi               |

## 2. Naming Convention:

### 2.1. Bắt buộc dùng snake_case:

Đúng:
"open_now": true
"price_range": "50k-100k"
Sai:
"openNow": true
"PriceRange": "..."

### 2.2. Tên phải rõ nghĩa

| Sai   | Đúng            |
| ----- | --------------- |
| data1 | restaurants     |
| info  | restaurant_info |
| x     | score           |

## 3. Quy định ID:

### 3.1. Tất cả object phải có id

{
"id": 1
}

### 3.2. Dùng ID để mapping

## 4. JSON RULES THEO TỪNG GIAI ĐOẠN:

### 4.1 GIAI ĐOẠN 1 — Frontend → Go:

Mục tiêu: Thu thập user intent + context
VD JSON chuẩn:

```json
{
  "user_id": 1,
  "location": {
    "lat": 10.7626,
    "lng": 106.6602
  },
  "preferences": {
    "budget": 100000,
    "people": 2,
    "dietary": ["no_spicy"],
    "mood": "romantic"
  }
}
```

### 4.2 GIAI ĐOẠN 2 — Go → DB Repo:

Mục tiêu: Tạo filter để query data
JSON nội bộ:

```json
{
  "filters": {
    "budget": 100000,
    "max_distance_km": 5,
    "people": 2
  }
}
```

Database trả về:

```json
{
  "restaurants": [
    {
      "id": 1,
      "name": "Bún Cá Bé Hai - Châu Đốc",
      "rating": 4.6,
      "price": 50000,
      "distance_km": 1.2,
      "menu": [
        {
          "name": "Bún cá lóc",
          "price": 40000
        },
        {
          "name": "Bún cá heo quay",
          "price": 50000
        }
      ]
    },
    {
      "id": 2,
      "name": "Phở Ông Tám",
      "rating": 4.4,
      "price": 60000,
      "distance_km": 0.8,
      "menu": [
        {
          "name": "Phở bò tái",
          "price": 60000
        },
        {
          "name": "Phở gà",
          "price": 55000
        }
      ]
    }
  ]
}
```

### 4.3 GIAI ĐOẠN 3 — Go → Python (AI INPUT):

Mục tiêu: Chuẩn bị dữ liệu cho AI

```json
{
  "user_context": {
    "budget": 100000,
    "people": 2,
    "dietary": ["no_spicy"],
    "mood": "romantic"
  },
  "restaurants": [
    {
      "id": 1,
      "rating": 4.6,
      "price": 50000,
      "distance_km": 1.2
    },
    {
      "id": 2,
      "rating": 4.4,
      "price": 60000,
      "distance_km": 0.8
    }
  ]
}
```

### 4.4 GIAI ĐOẠN 4 — Python xử lý (Internal):

Mục tiêu: Filter + tính điểm
Filter:

```json
{
  "restaurants_filtered": [
    {
      "id": 1,
      "rating": 4.6,
      "price": 50000,
      "distance_km": 1.2
    },
    {
      "id": 2,
      "rating": 4.4,
      "price": 60000,
      "distance_km": 0.8
    }
  ]
}
```

Scoring:

```json
{
  "scores": [
    {
      "id": 1,
      "score": 0.93
    },
    {
      "id": 2,
      "score": 0.88
    }
  ]
}
```

### 4.5 GIAI ĐOẠN 5 — Python → Go (AI OUTPUT):

```json
{
  "results": [
    {
      "id": 1,
      "score": 0.93,
      "reason": "Món nhẹ, không cay, phù hợp không gian buổi sáng"
    },
    {
      "id": 2,
      "score": 0.88,
      "reason": "Gần hơn nhưng hương vị đậm hơn"
    }
  ]
}
```

### 4.6 GIAI ĐOẠN 6 — Go merge data:

Mục tiêu: Kết hợp DB + AI
Logic:
match theo id
gắn score + reason vào restaurant
JSON:

```json
{
  "restaurants": [
    {
      "id": 1,
      "name": "Bún Cá Bé Hai - Châu Đốc",
      "rating": 4.6,
      "price": 50000,
      "distance_km": 1.2,
      "score": 0.93,
      "reason": "Món nhẹ, không cay, phù hợp không gian buổi sáng"
    },
    {
      "id": 2,
      "name": "Phở Ông Tám",
      "rating": 4.4,
      "price": 60000,
      "distance_km": 0.8,
      "score": 0.88,
      "reason": "Gần hơn nhưng hương vị đậm hơn"
    }
  ]
}
```

### 4.7 Go → Frontend (FINAL RESPONSE):

```json
{
  "success": true,
  "message": "Recommend success",
  "data": {
    "restaurants": [
      {
        "id": 1,
        "restaurant_info": {
          "name": "Bún Cá Bé Hai - Châu Đốc",
          "contact": {
            "address": "Đường Chi Lăng, Phường Châu Phú A, TP. Châu Đốc",
            "phone": "0296 3866 888"
          },
          "operating_hours": {
            "schedule": "06:00 - 10:30",
            "is_open_now": true,
            "status_text": "Đang mở cửa (Sắp đóng cửa trong 30 phút nữa)"
          },
          "history": "Quán bắt đầu từ một gánh bún nhỏ ven đường, sau nhiều năm phát triển đã trở thành địa điểm nổi tiếng tại Châu Đốc.",
          "fun_facts": [
            "Quán từng được nhiều food vlogger nổi tiếng ghé thăm",
            "Luôn đông khách vào buổi sáng"
          ]
        },
        "signature_dish": {
          "dish_name": "Bún cá lóc đồng (kèm heo quay)",
          "cultural_origin": "Ẩm thực miền Tây Nam Bộ, chịu ảnh hưởng văn hóa Khmer",
          "flavor_profile": "Nước lèo thanh nhẹ, có màu vàng từ nghệ, không cay",
          "trivia": [
            "Ăn kèm heo quay là đặc trưng của Châu Đốc",
            "Nước mắm chấm đóng vai trò quan trọng trong hương vị"
          ]
        },
        "meta": {
          "rating": 4.6,
          "distance_km": 1.2,
          "price_range": "40k-70k"
        },
        "ai_analysis": {
          "score": 0.93,
          "reason": "Món nhẹ, không cay, phù hợp không gian buổi sáng"
        }
      },
      {
        "id": 2,
        "restaurant_info": {
          "name": "Phở Ông Tám",
          "contact": {
            "address": "123 Nguyễn Huệ, Quận 1, TP.HCM",
            "phone": "0909 123 456"
          },
          "operating_hours": {
            "schedule": "05:30 - 12:00",
            "is_open_now": true,
            "status_text": "Đang mở cửa"
          },
          "history": "Quán phở gia truyền hơn 20 năm, nổi tiếng với nước dùng đậm đà.",
          "fun_facts": [
            "Nước dùng được ninh hơn 12 tiếng",
            "Khách nước ngoài rất ưa chuộng"
          ]
        },
        "signature_dish": {
          "dish_name": "Phở bò tái",
          "cultural_origin": "Ẩm thực miền Bắc Việt Nam",
          "flavor_profile": "Đậm đà, thơm mùi bò, nước dùng trong",
          "trivia": ["Có thể ăn kèm trứng lòng đào", "Thường ăn cùng quẩy"]
        },
        "meta": {
          "rating": 4.4,
          "distance_km": 0.8,
          "price_range": "50k-80k"
        },
        "ai_analysis": {
          "score": 0.88,
          "reason": "Gần hơn nhưng hương vị đậm hơn"
        }
      }
    ]
  },
  "error": null
}
```
