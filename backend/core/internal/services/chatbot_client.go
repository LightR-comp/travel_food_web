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
	"strings"
	"time"

	//Lấy URL AI Python từ config
	"backend/core/internal/config"

	"backend/core/internal/dto"
)

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
	// TODO: Sau này sẽ móc vào hàm DB thực tế dùng builder SQL động.
	// Hiện tại trả về mảng rỗng để pass qua luồng chatbot an toàn.
	return []map[string]interface{}{}
}
