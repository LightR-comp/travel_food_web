// strings_helper.go chứa các hàm tiện ích để xử lý chuỗi, bao gồm việc tách chuỗi CSV thành slice of strings, xây dựng bộ lọc từ ngữ cảnh người dùng và chuyển đổi giữa các mô hình dữ liệu khác nhau để giao tiếp với Python AI Service.
// Đây là nơi chúng ta sẽ xây dựng các hàm tiện ích để giúp cho việc xử lý dữ liệu trở nên dễ dàng và hiệu quả hơn trong quá trình gợi ý quán ăn cho người dùng.


package utils

import (
	"strings"

	"go-core-backend/internal/models"

	"go-core-backend/internal/dto"
)

// SplitCSV: Chuyển chuỗi CSV thành slice of strings, ví dụ "chicken,garlic" -> []string{"chicken", "garlic"}
func SplitCSV(s string) []string {
	if s == "" {
		return []string{}
	}
	return strings.Split(s, ",")
}

// BuildFilter: Chuyển đổi UserContext thành RestaurantFilter để truy vấn cơ sở dữ liệu
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

// Chuyển đổi RecommendRequest thành UserContext để gửi sang Python AI Service
func ToUserContext(req dto.RecommendRequest) models.UserContext {
	return models.UserContext{
		UserID: req.UserID,
		Location: models.Location{
			Lat: req.Location.Lat,
			Lng: req.Location.Lng,
			RadiusKm: 5,
		},
		Preferences: models.ContextPreferences{
			Budget: req.Preferences.Budget,
			People: req.Preferences.People,
			Dietary: req.Preferences.Dietary,
			Mood: req.Preferences.Mood,
		},
	}
}

// Chuyển đổi Restaurant thành AIRestaurantInput để gửi sang Python AI Service
func BuildAIInput(r models.Restaurant) dto.AIRestaurantInput {
	return dto.AIRestaurantInput{
		ID: r.ID,
		Rating: r.Rating,
		Price: float64(r.PriceRange),
		DistanceKm: r.DistanceKm,

		Type: r.Type,
		
		FeaturedDishes: extractFeaturedDishes(r.Menu),
	}
}

// Hàm phụ để trích xuất thông tin món ăn đặc trưng từ menu của nhà hàng, chuyển thành định dạng phù hợp cho AI input
func extractFeaturedDishes(menu []models.MenuItem) []dto.AISummaryDishInput {
	var dishes []dto.AISummaryDishInput
	for _, item := range menu {
		dishes = append(dishes, dto.AISummaryDishInput{
			Name: item.Name,
			Price: item.Price,	
			Ingredients: SplitCSV(item.Ingredients),
		})
	}
	return dishes
}