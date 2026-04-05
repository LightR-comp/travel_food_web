
package handlers

import (
	"go-core-backend/internal/services"
	"go-core-backend/internal/utils"
)

// Hàm này dùng để lấy object dữ liệu đã được format chuẩn
func PreparePlaceResponse(id string, service *services.GMapsClient) map[string]interface{} {
	raw := service.GetMockDetails(id)

	
	return map[string]interface{}{
		"success": true,
		"message": "Mock data success",
		"data": map[string]interface{}{
			"id": raw.ID, // Bắt buộc có ID
			"restaurant_info": map[string]interface{}{
				"name": raw.Name,
				"contact": map[string]interface{}{
					"address": raw.Address,
				},
				"operating_hours": map[string]interface{}{
					"is_open_now": raw.IsOpen, // snake_case
					"status_text": utils.FormatStatusText(raw.IsOpen),
				},
			},
			"meta": map[string]interface{}{
				"rating":      utils.ExtractNumber(raw.Rating),
				"distance_km": 1.2,
				"price_range": utils.FormatPriceK(raw.Price),
			},
		},
		"error": nil,
	}
}