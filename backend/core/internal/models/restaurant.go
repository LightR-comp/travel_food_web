// restaurant.go chứa các mô hình dữ liệu liên quan đến quán ăn, bao gồm thông tin cơ bản về quán ăn, chi tiết hơn về quán ăn và các tiêu chí để lọc quán ăn khi truy vấn cơ sở dữ liệu.
// Đây là nơi chúng ta sẽ định nghĩa cấu trúc dữ liệu cho quán ăn, giúp cho việc lưu trữ và truy xuất thông tin về quán ăn trở nên dễ dàng và hiệu quả hơn trong quá trình gợi ý quán ăn cho người dùng.

package models

import "time"

// Restaurant đại diện cho thông tin cơ bản của một quán ăn
type Restaurant struct {
	ID       int     `db:"id" json:"id"`
	Name     string  `db:"name" json:"name"`
	Address  string  `db:"address" json:"address"`

	Lat      float64 `db:"lat" json:"lat"`
	Lng      float64 `db:"lng" json:"lng"`

	Rating   float64 `db:"rating" json:"rating"`
	PriceRange int   `db:"price_range" json:"price_range"`

	OpenTime  string  `db:"open_time" json:"open_time"`
	CloseTime string  `db:"close_time" json:"close_time"`
	Type      string  `db:"type" json:"type"` // "japanese", "bbq", "italian", v.v.
	// runtime
	DistanceKm float64 `json:"distance_km"`
	IsOpen     bool    `json:"is_open"`

	Menu       []MenuItem `json:"menu"`

	CreatedAt  time.Time `db:"created_at" json:"created_at"`
	UpdatedAt  time.Time `db:"updated_at" json:"updated_at"`
}
// RestaurantDetail mở rộng thông tin của Restaurant, có thể bao gồm các trường chi tiết hơn như hình ảnh, đánh giá của người dùng, v.v.
type RestaurantDetail struct {
	Restaurant

	// Thông tin chi tiết hơn có thể được thêm vào đây, ví dụ: hình ảnh, đánh giá của người dùng, v.v.
	Images      []string `json:"images"`
	UserRatings []UserRating `json:"user_ratings"`
}

type UserRating struct {
	ID           int       `db:"id" json:"id"`
	UserID       int       `db:"user_id" json:"user_id"`
	RestaurantID int       `db:"restaurant_id" json:"restaurant_id"`
	Rating       float64   `db:"rating" json:"rating"`
	Comment      string    `db:"comment" json:"comment"`
	CreatedAt    time.Time `db:"created_at" json:"created_at"`
}

// RestaurantFilter định nghĩa các tiêu chí để lọc quán ăn khi truy vấn cơ sở dữ liệu, có thể được xây dựng từ UserContext
type RestaurantFilter struct {
	Lat      float64 `json:"lat"`
	Lng      float64 `json:"lng"`
	RadiusKm float64 `json:"radius_km"`

	MinPrice int `json:"min_price"`
	MaxPrice int `json:"max_price"`
	FoodTypes []string `json:"food_types"`

	IsOpen bool `json:"is_open"`
}