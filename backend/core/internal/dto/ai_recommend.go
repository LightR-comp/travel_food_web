
package dto

import (
	"backend/core/internal/models"
)

type AIRecommendRequest struct {
	UserIntent  models.UserContext `json:"user_context"`
	Restaurants []AIRestaurantInput `json:"restaurants"`
}
type AIRestaurantInput struct {
	ID         int     `json:"id"`
	Name       string  `json:"res_name"` 
	Rating     float64 `json:"rating"`
	Price      float64 `json:"price"`
	ImageURL   string  `json:"image_url"`
	DistanceKm float64 `json:"distance_km"`
	Type       string   `json:"type"`
	FeaturedDishes []AISummaryDishInput `json:"featured_dishes"`
}

type AISummaryDishInput struct {
	Name        string   `json:"name"`
	Price       float64  `json:"price"`
	Ingredients  []string `json:"ingredients"`
}

type AIRecommendResponse struct {
	RecommendedRestaurants []AIRestaurantOutput `json:"recommended_restaurants"`
}

type AIRestaurantOutput struct {
	ID         int     `json:"id"`
	Score      float64 `json:"score"` 
	Reason     string  `json:"reason"` 
}
