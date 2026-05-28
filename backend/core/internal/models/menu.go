
package models

import "time"

type MenuItem struct {
	ID           int `db:"id" json:"id"`
	RestaurantID int `db:"restaurant_id" json:"restaurant_id"`

	Name        string `db:"name" json:"name"`
	Description string `db:"description" json:"description"`

	Price    float64 `db:"price" json:"price"`
	FoodType string  `db:"food_type" json:"food_type"`

	Ingredients string `db:"ingredients" json:"ingredients"` 
	Story       string `db:"story" json:"story"`             

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

	Ingredients string    `db:"ingredients" json:"ingredients"` 
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
