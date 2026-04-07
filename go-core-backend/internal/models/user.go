package models
import "time"

type User struct {
	ID        int       `db:"id" json:"id"`
	Email     string    `db:"email" json:"email"`
	Name      string    `db:"name" json:"name"`
	AvatarURL string    `db:"avatar_url" json:"avatar_url"`

	CreatedAt time.Time `db:"created_at" json:"created_at"`
	UpdatedAt time.Time `db:"updated_at" json:"updated_at"`
}


type AuthProvider string

const (
	ProviderGoogle   AuthProvider = "google"
	ProviderFacebook AuthProvider = "facebook"
	ProviderLocal    AuthProvider = "local"
)

type UserAuth struct {
	ID           int          `db:"id" json:"id"`
	UserID       int          `db:"user_id" json:"user_id"`
	Provider     AuthProvider `db:"provider" json:"provider"`

	ProviderID   string       `db:"provider_id" json:"provider_id"`
	PasswordHash string       `db:"password_hash" json:"-"` // không trả ra API

	CreatedAt    time.Time    `db:"created_at" json:"created_at"`
}


type UserPreferences struct {
	UserID int `db:"user_id" json:"user_id"`

	BudgetPerPerson float64 `db:"budget_per_person" json:"budget_per_person"`

	Dietary  string `db:"dietary" json:"dietary"`     // "vegan,vegetarian"
	FoodTypes string `db:"food_types" json:"food_types"` // "japanese,bbq"

	CreatedAt time.Time `db:"created_at" json:"created_at"`
	UpdatedAt time.Time `db:"updated_at" json:"updated_at"`
}


type Location struct {
	Lat      float64 `json:"lat"`
	Lng      float64 `json:"lng"`
	RadiusKm float64 `json:"radius_km"` // default: 5km
}

type ContextPreferences struct {
	Budget   int      `json:"budget"`
	People   int      `json:"people"`

	Dietary  []string `json:"dietary"`
	FoodTypes []string `json:"food_types"`

	Mood     string   `json:"mood"`
	Weather  string   `json:"weather"`
}


type UserContext struct {
	UserID int `json:"user_id"`

	Location    Location           `json:"location"`
	Preferences ContextPreferences `json:"preferences"`
}