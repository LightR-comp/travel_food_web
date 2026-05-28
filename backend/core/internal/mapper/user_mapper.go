
package mappers

import (
	"backend/core/internal/models"
	"backend/core/internal/utils"
)

func ParsePreferences(p models.UserPreferences) models.ContextPreferences {
	return models.ContextPreferences{
		Budget: int(p.BudgetPerPerson),
		Dietary: utils.SplitCSV(p.Dietary),
		FoodTypes: utils.SplitCSV(p.FoodTypes),
	}
}