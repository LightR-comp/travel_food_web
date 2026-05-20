// menu.go chứa các mô hình dữ liệu liên quan đến menu của quán ăn, bao gồm thông tin về món ăn, giá cả, loại thực phẩm và các thành phần nguyên liệu.
// Đây là nơi chúng ta sẽ định nghĩa cấu trúc dữ liệu cho menu, giúp cho việc lưu trữ và truy xuất thông tin về các món ăn trở nên dễ dàng và hiệu quả hơn trong quá trình gợi ý quán ăn cho người dùng.

package models

import "time"

// MenuItem đại diện cho một món ăn trong menu của quán
type MenuItem struct {
	ID           int `db:"id" json:"id"`
	RestaurantID int `db:"restaurant_id" json:"restaurant_id"`

	Name        string `db:"name" json:"name"`
	Description string `db:"description" json:"description"`

	Price    float64 `db:"price" json:"price"`
	FoodType string  `db:"food_type" json:"food_type"`

	Ingredients string `db:"ingredients" json:"ingredients"` // "chicken,garlic"
	Story       string `db:"story" json:"story"`             // Câu chuyện đằng sau món ăn, có thể được sử dụng để gợi ý nếu người dùng quan tâm đến trải nghiệm ẩm thực

	CreatedAt time.Time `db:"created_at" json:"created_at"`
	UpdatedAt time.Time `db:"updated_at" json:"updated_at"`

	Images []DishImage `json:"images"`
}
type FeaturedDish struct {
	ID           int `db:"id" json:"id"`
	RestaurantID int `db:"restaurant_id" json:"restaurant_id"`

	Name        string `db:"name" json:"name"`
	Description string `db:"description" json:"description"`

	Price    float64 `db:"price" json:"price"`
	FoodType string  `db:"food_type" json:"food_type"`

	Ingredients string    `db:"ingredients" json:"ingredients"` // "chicken,garlic"
	CreatedAt   time.Time `db:"created_at" json:"created_at"`
	UpdatedAt   time.Time `db:"updated_at" json:"updated_at"`
}

type DishImage struct {
	ID          int       `db:"id" json:"id"`
	MenuItemID  int       `db:"menu_item_id" json:"menu_item_id"`
	ImageURL    string    `db:"image_url" json:"image_url"`
	Caption     string    `db:"caption" json:"caption"`
	IsThumbnail bool      `db:"is_thumbnail" json:"is_thumbnail"`
	CreatedAt   time.Time `db:"created_at" json:"created_at"`
}
