// ai_client.go chứa các hàm để giao tiếp với Python AI Service, bao gồm việc gửi yêu cầu và nhận phản hồi từ service đó.
// Đây là nơi chúng ta sẽ xây dựng logic để gọi Python AI Service, truyền dữ liệu về Intent của người dùng và danh sách các quán ăn, và nhận lại các gợi ý từ AI để trả về cho frontend.

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

	"go-core-backend/internal/dto"
)


// CallPythonEngine: Gửi HTTP POST request tới Python AI Service và parse kết quả trả về
func CallPythonEngine(reqData dto.AIRecommendRequest) (*dto.AIRecommendResponse, error) {
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
	var aiResponse dto.AIRecommendResponse
	if err := json.Unmarshal(bodyBytes, &aiResponse); err != nil {
		return nil, fmt.Errorf("lỗi parse định dạng JSON từ Python service: %v", err)
	}	
	//Bước 7: Trả về kết quả đã được parse thành struct Go
	return &aiResponse, nil
}