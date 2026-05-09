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
	"sort"
	"strings"
	"time"

	//Lấy URL AI Python từ config
	"backend/core/internal/config"
	"backend/core/internal/models"

	"backend/core/internal/dto"
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
	pythonURL := config.AppConfig.AIServiceURL + "/recommend"
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

// rankedRestaurant là một helper struct để giữ một nhà hàng và điểm số đã tính toán của nó để sắp xếp.
type rankedRestaurant struct {
	// Giữ con trỏ để tránh copy struct lớn
	restaurant models.Restaurant
	finalScore float64
}

// FetchRestaurantsFromEntities nhận Entities để chọc vào Database lấy data quán ăn (GIAI ĐOẠN 2)
// Nó cũng sẽ tính toán lại điểm và sắp xếp dựa trên lịch sử tương tác của người dùng.
func FetchRestaurantsFromEntities(ctx context.Context, entities map[string]interface{}, userID int) []map[string]interface{} {
	if entities == nil {
		entities = make(map[string]interface{})
	}

	restaurants, err := SearchRestaurantsForChatbot(ctx, entities)
	if err != nil {
		log.Printf("[Chatbot] Lỗi truy vấn DB: %v", err)
		return []map[string]interface{}{}
	}

	var rankedList []rankedRestaurant

	// GIAI ĐOẠN 2.1: Re-ranking dựa trên lịch sử trò chuyện (implicit relevance)
	if userID > 0 && len(restaurants) > 0 {
		// Thay vì đếm lượt click/like (tương tác tường minh), chúng ta sẽ tính điểm liên quan
		// bằng cách phân tích từ khóa trong toàn bộ lịch sử chat của người dùng
		// và so sánh với thông tin (tags) của nhà hàng. Đây là một dạng cá nhân hóa ngầm.
		// Hàm GetUserInteractionCounts cũ vẫn được giữ lại để phục vụ cho endpoint /recommend.
		relevanceScores, err := CalculateChatRelevanceScores(ctx, userID, restaurants)
		if err != nil {
			log.Printf("[Chatbot] Lỗi tính điểm liên quan từ lịch sử chat: %v", err)
			// Không làm gián đoạn, chỉ log lỗi và tiếp tục với danh sách ban đầu
		} else {
			// --- Logic tính điểm và sắp xếp lại ---
			const (
				// Trọng số này có thể cần tinh chỉnh. 0.2 điểm cho mỗi từ khóa khớp.
				relevanceWeight = 0.2
				maxBonusScore   = 2.5 // Điểm thưởng tối đa để không làm sai lệch điểm rating gốc
			)

			for _, r := range restaurants {
				// Lấy điểm khớp từ map, mặc định là 0
				matchCount := relevanceScores[r.ID]

				// Tính điểm thưởng
				bonusScore := float64(matchCount) * relevanceWeight
				if bonusScore > maxBonusScore {
					bonusScore = maxBonusScore // Áp dụng mức trần (max cap)
				}

				// final_score = old_score + bonus_score. old_score ở đây là r.Rating
				finalScore := r.Rating + bonusScore

				rankedList = append(rankedList, rankedRestaurant{
					restaurant: r,
					finalScore: finalScore,
				})
			}

			// Sắp xếp danh sách theo finalScore giảm dần
			sort.Slice(rankedList, func(i, j int) bool {
				return rankedList[i].finalScore > rankedList[j].finalScore
			})
		}
	} else {
		// Nếu không có re-ranking, chuyển đổi `restaurants` thành `rankedList` với điểm số mặc định
		for _, r := range restaurants {
			rankedList = append(rankedList, rankedRestaurant{
				restaurant: r,
				finalScore: r.Rating, // Điểm ban đầu là rating gốc
			})
		}
	}

	// --- Phần còn lại của hàm giữ nguyên, xử lý danh sách `restaurants` đã được re-rank và giới hạn top 3 ---
	dishQuery, hasDishQuery := entities["dish"].(string)

	// Chỉ lấy Top 3 để xử lý và gửi cho AI
	limit := 3
	if len(rankedList) < limit {
		limit = len(rankedList)
	}
	topRankedList := rankedList[:limit]

	var results []map[string]interface{}
	seenNames := make(map[string]bool) // Map để theo dõi các tên nhà hàng đã được xử lý

	for _, rankedItem := range topRankedList {
		r := rankedItem.restaurant
		finalScore := rankedItem.finalScore

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
			"final_score":     finalScore, // Thêm điểm số đã tính vào đây
		})
	}

	if results == nil {
		return []map[string]interface{}{}
	}
	return results
}
