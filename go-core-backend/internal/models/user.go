// user.go chứa các mô hình dữ liệu liên quan đến người dùng, bao gồm thông tin cơ bản về người dùng, thông tin xác thực, sở thích ăn uống và ngữ cảnh hiện tại của người dùng.
// Đây là nơi chúng ta sẽ định nghĩa cấu trúc dữ liệu cho người dùng, giúp cho việc lưu trữ và truy xuất thông tin về người dùng trở nên dễ dàng và hiệu quả hơn trong quá trình gợi ý quán ăn cho người dùng.

package models
import "time"

// User đại diện cho thông tin người dùng cơ bản
type User struct {
	ID        int       `db:"id" json:"id"`
	Email     string    `db:"email" json:"email"`
	Name      string    `db:"name" json:"name"`
	AvatarURL string    `db:"avatar_url" json:"avatar_url"`

	CreatedAt time.Time `db:"created_at" json:"created_at"`
	UpdatedAt time.Time `db:"updated_at" json:"updated_at"`
}

// UserAuth lưu thông tin xác thực của người dùng, hỗ trợ nhiều phương thức đăng nhập
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

// UserPreferences lưu trữ sở thích ăn uống của người dùng, có thể được cập nhật qua thời gian
type UserPreferences struct {
	UserID int `db:"user_id" json:"user_id"`

	BudgetPerPerson float64 `db:"budget_per_person" json:"budget_per_person"`

	Dietary  string `db:"dietary" json:"dietary"`     // "vegan,vegetarian"
	FoodTypes string `db:"food_types" json:"food_types"` // "japanese,bbq"

	CreatedAt time.Time `db:"created_at" json:"created_at"`
	UpdatedAt time.Time `db:"updated_at" json:"updated_at"`
}

// UserContext lưu trữ ngữ cảnh hiện tại của người dùng, có thể được sử dụng để gợi ý quán ăn phù hợp
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