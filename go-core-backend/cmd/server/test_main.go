package main

import (
	"encoding/json"
	"fmt"
	"go-core-backend/internal/handlers"
	"go-core-backend/internal/services"
)

func main() {
	fmt.Println("--- KIỂM TRA HỆ THỐNG MOCK DATA CỦA MINH ---")

	// 1. Khởi tạo dịch vụ giả
	mockService := services.NewGMapsClient()

	// 2. Chạy thử logic xử lý địa điểm
	result := handlers.PreparePlaceResponse("res_123", mockService)

	// 3. In kết quả JSON để soi lỗi snake_case và cấu trúc
	prettyJSON, _ := json.MarshalIndent(result, "", "  ")
	
	fmt.Println("\n[KẾT QUẢ JSON ĐÚNG CHUẨN GIAI ĐOẠN 7]:")
	fmt.Println(string(prettyJSON))

	// Tự động kiểm tra ID
	data := result["data"].(map[string]interface{})
	if data["id"] != nil {
		fmt.Println("\n Kiểm tra ID: Thành công")
	} else {
		fmt.Println("\n Kiểm tra ID: Thất bại (Thiếu field ID)")
	}
}