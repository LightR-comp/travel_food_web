

package utils

import (
	"strings"

	"backend/core/internal/models"

	"backend/core/internal/dto"
)

func SplitCSV(s string) []string {
	if s == "" {
		return []string{}
	}
	return strings.Split(s, ",")
}

func BuildFilter(ctx models.UserContext) models.RestaurantFilter {
	return models.RestaurantFilter{
		Lat: ctx.Location.Lat,
		Lng: ctx.Location.Lng,
		RadiusKm: ctx.Location.RadiusKm,

		MaxPrice: ctx.Preferences.Budget,
		FoodTypes: ctx.Preferences.FoodTypes,

		IsOpen: true,
	}
}

func ToUserContext(req dto.RecommendRequest) models.UserContext {
	dietary := req.Preferences.Dietary
	if dietary == nil {
		dietary = []string{}
	}
	foodTypes := req.Preferences.FoodTypes
	if foodTypes == nil {
		foodTypes = []string{}
	}

	return models.UserContext{
		UserID: req.UserID,
		Location: models.Location{
			Lat:      req.Location.Lat,
			Lng:      req.Location.Lng,
			RadiusKm: 5,
		},
		Preferences: models.ContextPreferences{
			Budget:    req.Preferences.Budget,
			People:    req.Preferences.People,
			Dietary:   dietary,
			FoodTypes: foodTypes,
			Mood:      req.Preferences.Mood,
		},
	}
}

func BuildAIInput(r models.Restaurant) dto.AIRestaurantInput {
	var imageURL string
	for _, img := range r.Images {
		if img.IsThumbnail {
			imageURL = img.ImageURL
			break
		}
	}
	if imageURL == "" && len(r.Images) > 0 {
		imageURL = r.Images[0].ImageURL
	}

	return dto.AIRestaurantInput{
		ID:             r.ID,
		Name:           r.Name,
		Rating:         r.Rating,
		Price:          float64(r.PriceRange),
		ImageURL:       imageURL,
		DistanceKm:     r.DistanceKm,
		Type:           r.Type,
		FeaturedDishes: extractFeaturedDishes(r.Menu),
	}
}

func extractFeaturedDishes(menu []models.MenuItem) []dto.AISummaryDishInput {
	dishes := []dto.AISummaryDishInput{}
	for _, item := range menu {
		dishes = append(dishes, dto.AISummaryDishInput{
			Name:        item.Name,
			Price:       item.Price,
			Ingredients: SplitCSV(item.Ingredients),
		})
	}
	return dishes
}