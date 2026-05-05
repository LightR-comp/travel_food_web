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
	"backend/core/internal/config"

	"backend/core/internal/dto"
	"log"
)

// pythonBaseResponse: Cấu trúc tương ứng với BaseResponse bên Python Pydantic
type pythonBaseResponse struct {
	Success bool                    `json:"success"`
	Message string                  `json:"message"`
	Data    dto.AIRecommendResponse `json:"data"`
	Error   interface{}             `json:"error"`
}

// CallPythonEngine: Gửi request tới Python AI Service và bóc tách dữ liệu từ BaseResponse
func CallPythonEngine(reqData dto.AIRecommendRequest) (*dto.AIRecommendResponse, error) {
	// 1. Chuyển đổi struct Go sang JSON
	jsonData, err := json.Marshal(reqData)
	if err != nil {
		return nil, fmt.Errorf("lỗi đóng gói JSON payload: %v", err)
	}

    	// In ra console dạng JSON đẹp (Indent) để Nhựt dễ soi tên trường (Tag)
    	var prettyJSON bytes.Buffer
    	if err := json.Indent(&prettyJSON, jsonData, "", "  "); err == nil {
        	log.Printf("\n[DEBUG_SEND_TO_PYTHON]:\n%s\n", prettyJSON.String())
    	} else {
        // Nếu không indent được thì in thẳng chuỗi thô
        	log.Printf("[DEBUG_SEND_TO_PYTHON_RAW]: %s", string(jsonData))
	}


	// 2. Cấu hình HTTP Client với Timeout
	client := &http.Client{
		Timeout: 15 * time.Second,
	}

	// 3. Gọi API Python
	pythonURL := config.AppConfig.AIServiceURL + "/api/v1/engine/recommend"
	resp, err := client.Post(pythonURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, fmt.Errorf("không thể kết nối tới Python AI Service: %v", err)
	}
	defer resp.Body.Close()

	// 4. Đọc dữ liệu trả về
	bodyBytes, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("lỗi đọc response body: %v", err)
	}

	// Kiểm tra Status Code không phải 200
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("python service báo lỗi HTTP %d: %s", resp.StatusCode, string(bodyBytes))
	}

	// 5. Parse vào struct trung gian để bóc tách Wrapper JSON
	var wrapper pythonBaseResponse
	if err := json.Unmarshal(bodyBytes, &wrapper); err != nil {
		return nil, fmt.Errorf("lỗi giải mã cấu trúc BaseResponse: %v. Body: %s", err, string(bodyBytes))
	}

	// 6. Kiểm tra logic success từ phía Python
	if !wrapper.Success {
		return nil, fmt.Errorf("python AI xử lý thất bại: %v", wrapper.Message)
	}

	// Trả về phần Data (chứa RecommendedRestaurants)
	return &wrapper.Data, nil
}