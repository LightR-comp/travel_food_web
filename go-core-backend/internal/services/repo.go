package services

import "time"

// ─────────────────────────────────────────
// Domain Models
// ─────────────────────────────────────────

type Restaurant struct {
	ID          string   `json:"id"`
	Name        string   `json:"name"`
	Category    string   `json:"category"` // e.g. "Vietnamese", "Seafood", "BBQ"
	Address     string   `json:"address"`
	City        string   `json:"city"`
	Rating      float64  `json:"rating"`
	PriceRange  string   `json:"price_range"`
	Tags        []string `json:"tags"`
	ImageURL    string   `json:"image_url"`
	OpenHours   string   `json:"open_hours"`
	PhoneNumber string   `json:"phone_number"`
}

type MenuItem struct {
	ID           string  `json:"id"`
	RestaurantID string  `json:"restaurant_id"`
	Name         string  `json:"name"`
	Description  string  `json:"description"`
	Price        float64 `json:"price"` // VND (thousands)
	Category     string  `json:"category"`
	IsPopular    bool    `json:"is_popular"`
	ImageURL     string  `json:"image_url"`
}

type UserProfile struct {
	ID               string    `json:"id"`
	Name             string    `json:"name"`
	Email            string    `json:"email"`
	PreferredCuisine []string  `json:"preferred_cuisine"`
	BudgetRange      string    `json:"budget_range"`
	Location         string    `json:"location"`
	CreatedAt        time.Time `json:"created_at"`
}

// ─────────────────────────────────────────
// Repository Interface
// ─────────────────────────────────────────

type DBRepository interface {
	GetAllRestaurants() ([]Restaurant, error)
	GetRestaurantByID(id string) (*Restaurant, error)
	GetRestaurantsByCity(city string) ([]Restaurant, error)
	GetRestaurantsByCategory(category string) ([]Restaurant, error)
	GetMenuByRestaurantID(restaurantID string) ([]MenuItem, error)
	GetUserByID(userID string) (*UserProfile, error)
	GetUserByEmail(email string) (*UserProfile, error)
}

// ─────────────────────────────────────────
// Mock Implementation
// ─────────────────────────────────────────

type MockDBRepository struct{}

func NewMockDBRepository() DBRepository {
	return &MockDBRepository{}
}

// --- Mock Data ---

var mockRestaurants = []Restaurant{
	{
		ID: "r001", Name: "Phở Hòa Pasteur", Category: "Vietnamese",
		Address: "260C Pasteur, Phường 8", City: "Ho Chi Minh City",
		Rating: 4.5, PriceRange: "$",
		Tags:        []string{"pho", "breakfast", "noodles", "local-favorite"},
		ImageURL:    "https://example.com/images/pho-hoa.jpg",
		OpenHours:   "06:00 - 23:00",
		PhoneNumber: "028 3829 7943",
	},
	{
		ID: "r002", Name: "Quán Cơm Tấm Thuận Kiều", Category: "Vietnamese",
		Address: "135 Võ Văn Tần, Quận 3", City: "Ho Chi Minh City",
		Rating: 4.4, PriceRange: "$",
		Tags:        []string{"com-tam", "broken-rice", "pork-chop", "local"},
		ImageURL:    "https://example.com/images/com-tam.jpg",
		OpenHours:   "06:00 - 22:00",
		PhoneNumber: "028 3930 4848",
	},
}

var mockMenuItems = []MenuItem{
	// Phở Hòa Pasteur (r001)
	{ID: "m001", RestaurantID: "r001", Name: "Phở Bò Tái", Description: "Phở bò tái chín với nước dùng đậm đà", Price: 65, Category: "Noodles", IsPopular: true, ImageURL: "https://example.com/menu/pho-bo-tai.jpg"},
	{ID: "m002", RestaurantID: "r001", Name: "Phở Gà", Description: "Phở gà xé với nước dùng gà thanh ngọt", Price: 60, Category: "Noodles", IsPopular: false, ImageURL: "https://example.com/menu/pho-ga.jpg"},
	{ID: "m003", RestaurantID: "r001", Name: "Phở Đặc Biệt", Description: "Phở với đầy đủ topping: tái, nạm, gân, sách", Price: 85, Category: "Noodles", IsPopular: true, ImageURL: "https://example.com/menu/pho-dac-biet.jpg"},

	// Cơm Tấm Thuận Kiều (r002)
	{ID: "m009", RestaurantID: "r002", Name: "Cơm Tấm Sườn Bì Chả", Description: "Cơm tấm với sườn nướng, bì và chả trứng", Price: 65, Category: "Rice", IsPopular: true, ImageURL: "https://example.com/menu/com-tam.jpg"},
	{ID: "m010", RestaurantID: "r002", Name: "Cơm Tấm Sườn Đặc Biệt", Description: "Phần sườn to hơn, thêm ốp la", Price: 80, Category: "Rice", IsPopular: false, ImageURL: "https://example.com/menu/com-tam-dac-biet.jpg"},
}

var mockUsers = []UserProfile{
	{
		ID: "u001", Name: "Nguyễn Văn An", Email: "an.nguyen@example.com",
		PreferredCuisine: []string{"Vietnamese", "Seafood"},
		BudgetRange:      "$",
		Location:         "Ho Chi Minh City",
		CreatedAt:        time.Now().AddDate(0, -6, 0),
	},
	{
		ID: "u002", Name: "Trần Thị Bình", Email: "binh.tran@example.com",
		PreferredCuisine: []string{"BBQ", "Seafood"},
		BudgetRange:      "$$",
		Location:         "Ho Chi Minh City",
		CreatedAt:        time.Now().AddDate(0, -2, 0),
	},
}

// ─────────────────────────────────────────
// Method Implementations
// ─────────────────────────────────────────

func (r *MockDBRepository) GetAllRestaurants() ([]Restaurant, error) {
	return mockRestaurants, nil
}

func (r *MockDBRepository) GetRestaurantByID(id string) (*Restaurant, error) {
	for _, restaurant := range mockRestaurants {
		if restaurant.ID == id {
			return &restaurant, nil
		}
	}
	return nil, nil
}

func (r *MockDBRepository) GetRestaurantsByCity(city string) ([]Restaurant, error) {
	var results []Restaurant
	for _, restaurant := range mockRestaurants {
		if restaurant.City == city {
			results = append(results, restaurant)
		}
	}
	return results, nil
}

func (r *MockDBRepository) GetRestaurantsByCategory(category string) ([]Restaurant, error) {
	var results []Restaurant
	for _, restaurant := range mockRestaurants {
		if restaurant.Category == category {
			results = append(results, restaurant)
		}
	}
	return results, nil
}

func (r *MockDBRepository) GetMenuByRestaurantID(restaurantID string) ([]MenuItem, error) {
	var results []MenuItem
	for _, item := range mockMenuItems {
		if item.RestaurantID == restaurantID {
			results = append(results, item)
		}
	}
	return results, nil
}

func (r *MockDBRepository) GetUserByID(userID string) (*UserProfile, error) {
	for _, user := range mockUsers {
		if user.ID == userID {
			return &user, nil
		}
	}
	return nil, nil
}

func (r *MockDBRepository) GetUserByEmail(email string) (*UserProfile, error) {
	for _, user := range mockUsers {
		if user.Email == email {
			return &user, nil
		}
	}
	return nil, nil
}
