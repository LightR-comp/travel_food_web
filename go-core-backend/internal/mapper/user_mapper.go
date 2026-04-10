// user_mapper.go chứa các hàm để chuyển đổi dữ liệu giữa các mô hình khác nhau liên quan đến người dùng.

package mappers

import (
	"go-core-backend/internal/models"
	"go-core-backend/internal/utils"
)

func ParsePreferences(p models.UserPreferences) models.ContextPreferences {
	return models.ContextPreferences{
		Budget: int(p.BudgetPerPerson),
		Dietary: utils.SplitCSV(p.Dietary),
		FoodTypes: utils.SplitCSV(p.FoodTypes),
	}
}