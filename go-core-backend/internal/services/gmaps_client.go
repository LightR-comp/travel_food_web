// gmaps_client.go chứa các hàm để tương tác với Maps API, bao gồm việc lấy thông tin chi tiết về quán ăn dựa trên ID của quán ăn đó.
// Đây là nơi chúng ta sẽ xây dựng các hàm để gọi Maps API, đảm bảo rằng chúng ta có thể lấy được thông tin chi tiết về quán ăn một cách chính xác và nhanh chóng, phục vụ cho việc trả về dữ liệu đã được format chuẩn cho frontend hiển thị.

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