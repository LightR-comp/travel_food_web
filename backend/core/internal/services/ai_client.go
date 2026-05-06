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
	"context"
	"io"
	"log"
	"strings"
	"time"

	//Lấy URL AI Python từ config
	"backend/core/internal/config"
	"backend/core/internal/models"

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

// Dùng cho chatbot.go
// CallAIIntentParse gọi API Python để phân tích Intent (GIAI ĐOẠN 1)
func CallAIIntentParse(req dto.AIIntentParseRequest) (*dto.AIIntentParseResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

	// Nới lỏng thời gian chờ lên 30 giây vì Google Gemini có thể phản hồi chậm
	client := &http.Client{Timeout: 40 * time.Second}
	baseURL := strings.TrimRight(config.AppConfig.AIServiceURL, "/")
	url := baseURL + "/api/v1/bot/intent_parse"

	resp, err := client.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		bodyBytes, _ := io.ReadAll(resp.Body)
		return nil, fmt.Errorf("API Intent Parse lỗi HTTP %d: %s", resp.StatusCode, string(bodyBytes))
	}

	bodyBytes, _ := io.ReadAll(resp.Body)
	var result dto.AIIntentParseResponse
	if err := json.Unmarshal(bodyBytes, &result); err != nil {
		return nil, err
	}
	return &result, nil
}

// CallAIChatGenerate gọi API Python để tạo câu văn tự nhiên (GIAI ĐOẠN 3 -> 4)
func CallAIChatGenerate(req dto.AIChatGenerateRequest) (*dto.AIChatGenerateResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

	// Nới lỏng thời gian chờ lên 40 giây cho bước tạo câu trả lời dài
	client := &http.Client{Timeout: 40 * time.Second}
	baseURL := strings.TrimRight(config.AppConfig.AIServiceURL, "/")
	url := baseURL + "/api/v1/bot/generate_response"

	resp, err := client.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		bodyBytes, _ := io.ReadAll(resp.Body)
		return nil, fmt.Errorf("API Chat Generate lỗi HTTP %d: %s", resp.StatusCode, string(bodyBytes))
	}

	bodyBytes, _ := io.ReadAll(resp.Body)
	var result dto.AIChatGenerateResponse
	if err := json.Unmarshal(bodyBytes, &result); err != nil {
		return nil, err
	}
	return &result, nil
}

// FetchRestaurantsFromEntities nhận Entities để chọc vào Database lấy data quán ăn (GIAI ĐOẠN 2)
func FetchRestaurantsFromEntities(ctx context.Context, entities map[string]interface{}) []map[string]interface{} {
	if entities == nil {
		entities = make(map[string]interface{})
	}

	restaurants, err := SearchRestaurantsForChatbot(ctx, entities)
	if err != nil {
		log.Printf("[Chatbot] Lỗi truy vấn DB: %v", err)
		return []map[string]interface{}{}
	}

	dishQuery, hasDishQuery := entities["dish"].(string)

	var results []map[string]interface{}
	seenNames := make(map[string]bool) // Map để theo dõi các tên nhà hàng đã được xử lý

	for _, r := range restaurants {
		// Bỏ qua nếu tên nhà hàng này đã được thêm vào kết quả
		if _, seen := seenNames[r.Name]; seen {
			continue
		}
		seenNames[r.Name] = true

		// Khởi tạo là một slice rỗng (non-nil) để đảm bảo JSON output là `[]` thay vì `null`
		featuredDishes := []map[string]interface{}{}
		// Helper để tạo map món ăn, tránh lặp code
		createDishMap := func(m models.MenuItem) map[string]interface{} {
			var ingredients []string
			if m.Ingredients != "" {
				// SỬA LỖI: DB lưu ingredients dạng "shrimp,flour", không phải JSON.
				// Cần dùng strings.Split để xử lý, tương tự cách xử lý 'dietary' ở chatbot.go.
				items := strings.Split(m.Ingredients, ",")
				for _, item := range items {
					trimmedItem := strings.TrimSpace(item)
					if trimmedItem != "" {
						ingredients = append(ingredients, trimmedItem)
					}
				}
			}
			if ingredients == nil {
				ingredients = []string{}
			}
			return map[string]interface{}{
				"name":        m.Name,
				"price":       m.Price,
				"ingredients": ingredients,
			}
		}

		if hasDishQuery && dishQuery != "" {
			// Người dùng tìm món cụ thể
			lowerDishQuery := strings.ToLower(dishQuery)
			for _, m := range r.Menu {
				if strings.Contains(strings.ToLower(m.Name), lowerDishQuery) {
					featuredDishes = append(featuredDishes, createDishMap(m))
				}
			}

			// Nếu không tìm thấy món nào khớp, lấy 3 món đầu tiên làm gợi ý
			if len(featuredDishes) == 0 && len(r.Menu) > 0 {
				limit := 3
				if len(r.Menu) < 3 {
					limit = len(r.Menu)
				}
				for i := 0; i < limit; i++ {
					featuredDishes = append(featuredDishes, createDishMap(r.Menu[i]))
				}
			}
		} else {
			// Người dùng không tìm món cụ thể, lấy toàn bộ menu (giữ nguyên hành vi cũ)
			for _, m := range r.Menu {
				featuredDishes = append(featuredDishes, createDishMap(m))
			}
		}

		// Tính giá trung bình từ menu để thay cho giá hardcode
		var avgPrice float64
		if len(r.Menu) > 0 {
			var totalPrice float64
			for _, item := range r.Menu {
				totalPrice += item.Price
			}
			avgPrice = totalPrice / float64(len(r.Menu))
		}

		results = append(results, map[string]interface{}{
			"id":              r.ID,
			"res_name":        r.Name,
			"rating":          r.Rating,
			"price":           avgPrice, // Sử dụng giá trung bình tính được
			"image_url":       "https://placehold.co/400x300?text=" + r.Name,
			"distance_km":     1.5, // Giả định khi không có tọa độ người dùng
			"type":            r.Type,
			"featured_dishes": featuredDishes,
		})
	}

	if results == nil {
		return []map[string]interface{}{}
	}
	return results
