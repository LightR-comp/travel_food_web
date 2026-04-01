package services

import (
	"fmt"
	//Thao tác với mảng byte trong Ram
	//biến JSON tĩnh thành luồng dữ liệu để gửi qua HTTP
	"bytes"
	//Gửi HTTP request
	"net/http"
	//Xử lý JSON response từ AI Python
	"encoding/json"
	//Đọc response body từ HTTP response
	"io"

	"time"
	//Lấy URL AI Python từ config
	"go-core-backend/internal/config"
)

//// AIRecommendRequest: Định nghĩa cấu trúc dữ liệu Request gửi từ Go sang Python
type AIRecommendRequest struct {
	// Intent của user, ví dụ: "Tôi muốn ăn phở với 10 người, ngân sách 200k/người, ở quận 1"
	UserIntent  string `json:"user_intent"`
	// Tạm thời truyền mảng ID, có thể mở rộng thành Struct chứa thông tin chi tiết sau.
	Restaurants []int  `json:"restaurants"`
}

// AIRecommendResponse: Định nghĩa cấu trúc dữ liệu Response nhận từ Python về Go
type AIRecommendResponse struct {
	// Danh sách ID quán ăn được AI Python đề xuất dựa trên Intent của user và điểm được ai python chấm cho từng quán
	Recommendations []int `json:"recommendations"`
	// Điểm số đánh giá của AI Python cho từng quán, ví dụ: 0.85, 0.92
	Scores          []float64 `json:"scores"`
	//Câu tư vấn thêm ngắn gọn, ví dụ: quán hơi chật 
	Reasoning      string `json:"reasoning"`
}

// CallPythonEngine: Gửi HTTP POST request tới Python AI Service và parse kết quả trả về
func CallPythonEngine(reqData AIRecommendRequest) (*AIRecommendResponse, error) {
	// Bước 1: Serialize struct của Go thành định dạng chuỗi JSON (Marshal)
	jsonData, err := json.Marshal(reqData)
	if err != nil {
		return nil, fmt.Errorf("lỗi đóng gói JSON payload: %v", err)
	}
	// Bước 2: Khởi tạo HTTP Client.
	// Thiết lập Timeout (15s) là bắt buộc để ngăn chặn tình trạng treo luồng (thread blocking) 
	// khi Python AI Service không phản hồi kịp thời hoặc gặp lỗi.
	client := &http.Client{
		Timeout: 15 * time.Second, 
	}

	//Bước 3: Định nghĩa endpoint của Python service.
	pythonURL := config.AppConfig.AIServiceURL
	// Thực thi HTTP POST request với payload là JSON.
	resp, err := client.Post(pythonURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, fmt.Errorf("lỗi gọi Python AI Service: %v", err)
	}	
	// Đảm bảo đóng response body sau khi đọc xong để tránh rò rỉ tài nguyên (resource leak)
	defer resp.Body.Close()
	//Bước 4: Kiểm tra HTTP Status Code trả về từ service đích.
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("Python AI Service trả về lỗi, status code: %d", resp.StatusCode)
	}	
	//Bước 5: Đọc luồng dữ liệu thô (raw bytes) từ Response Body
	bodyBytes, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("lỗi đọc response body từ Python AI Service: %v", err)
	}	
	//Bước 6: Deserialize (Unmarshal) chuỗi JSON nhận được thành struct Go
	var aiResponse AIRecommendResponse
	if err := json.Unmarshal(bodyBytes, &aiResponse); err != nil {
		return nil, fmt.Errorf("lỗi parse định dạng JSON từ Python service: %v", err)
	}	
	//Bước 7: Trả về kết quả đã được parse thành struct Go
	return &aiResponse, nil
}