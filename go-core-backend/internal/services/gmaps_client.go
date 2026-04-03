package services

type MockPlaceData struct {
	ID      string
	Name    string
	Address string
	Rating  string // Giả sử nhận chuỗi "4.6 sao"
	Price   int
	IsOpen  bool
}

type GMapsClient struct{}

func NewGMapsClient() *GMapsClient {
	return &GMapsClient{}
}

// Lấy dữ liệu giả lập không cần mạng
func (s *GMapsClient) GetMockDetails(id string) MockPlaceData {
	return MockPlaceData{
		ID:      id,
		Name:    "Bún Cá Bé Hai - Châu Đốc",
		Address: "Đường Chi Lăng, TP. Châu Đốc",
		Rating:  "4.6 sao",
		Price:   50000,
		IsOpen:  true,
	}
}