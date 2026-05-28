
package models

import "time"

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
	Type      string  `db:"type" json:"type"` 
	// runtime
	DistanceKm float64 `json:"distance_km"`
	IsOpen     bool    `json:"is_open"`

	Menu       []MenuItem `json:"menu"`
	Images     []RestaurantImage `json:"images"`

	CreatedAt  time.Time `db:"created_at" json:"created_at"`
	UpdatedAt  time.Time `db:"updated_at" json:"updated_at"`
}
type RestaurantDetail struct {
	Restaurant
	ForumPosts []Post `json:"forum_posts"`
	UserRatings []UserRating `json:"user_ratings"`
	Story      string `json:"story"`
}

type UserRating struct {
	ID           int       `db:"id" json:"id"`
	UserID       int       `db:"user_id" json:"user_id"`
	UserName     string    `db:"name" json:"user_name"`
	UserAvatar   string    `db:"avatar_url" json:"avatar"`
	RestaurantID int       `db:"restaurant_id" json:"restaurant_id"`
	Rating       float64   `db:"rating" json:"rating"`
	Comment      string    `db:"comment" json:"comment"`
	Images       []UserRatingImage `json:"images"`
	CreatedAt    time.Time `db:"created_at" json:"created_at"`
}

type UserRatingImage struct {
	ID           int       `json:"id"`
	UserRatingID int       `json:"user_rating_id"`
	ImageURL     string    `json:"image_url"`
	CreatedAt    time.Time `json:"created_at"`
}

type RestaurantFilter struct {
	Lat      float64 `json:"lat"`
	Lng      float64 `json:"lng"`
	RadiusKm float64 `json:"radius_km"`

	MinPrice int `json:"min_price"`
	MaxPrice int `json:"max_price"`
	FoodTypes []string `json:"food_types"`

	IsOpen bool `json:"is_open"`
}

type RestaurantImage struct {
	ID           int       `json:"id"`
	RestaurantID int       `json:"restaurant_id"`
	ImageURL     string    `json:"image_url"`
	Caption      string    `json:"caption"`
	IsThumbnail  bool      `json:"is_thumbnail"`
	CreatedAt    time.Time `json:"created_at"`
}