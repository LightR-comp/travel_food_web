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
	if entities == nil {
		entities = make(map[string]interface{})
	}

	restaurants, err := SearchRestaurantsForChatbot(ctx, entities)
	if err != nil {
		log.Printf("[Chatbot] Lỗi truy vấn DB: %v", err)
		return []map[string]interface{}{}
	}

	var results []map[string]interface{}
	for _, r := range restaurants {
		var featuredDishes []map[string]interface{}
		for _, m := range r.Menu {
			var ingredients []string
			if m.Ingredients != "" {
				json.Unmarshal([]byte(m.Ingredients), &ingredients)
			}
			if ingredients == nil {
				ingredients = []string{}
			}
			featuredDishes = append(featuredDishes, map[string]interface{}{
				"name":        m.Name,
				"price":       m.Price,
				"ingredients": ingredients,
			})
		}

		results = append(results, map[string]interface{}{
			"id":              r.ID,
			"res_name":        r.Name,
			"rating":          r.Rating,
			"price":           50000.0, // Đặt mặc định hoặc parse từ price_range, pydantic cần float
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
}
