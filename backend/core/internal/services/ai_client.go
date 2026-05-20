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
		return nil, fmt.Errorf("python AI xử lý thất bại: %v (Lỗi nội bộ: %v)", wrapper.Message, wrapper.Error)
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

// CallAIIdentifyDish gọi API Python để nhận diện món ăn qua hình ảnh
func CallAIIdentifyDish(req dto.AIIdentifyDishRequest) (*dto.AIIdentifyDishResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

	// Image processing có thể mất thời gian, đặt timeout 60s
	client := &http.Client{Timeout: 60 * time.Second}
	baseURL := strings.TrimRight(config.AppConfig.AIServiceURL, "/")
	url := baseURL + "/api/v1/bot/identify_dish"

	resp, err := client.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, fmt.Errorf("không thể kết nối tới AI Service: %v", err)
	}
	defer resp.Body.Close()

	bodyBytes, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("AI Service báo lỗi HTTP %d: %s", resp.StatusCode, string(bodyBytes))
	}

	var result struct {
		Success bool                       `json:"success"`
		Data    dto.AIIdentifyDishResponse `json:"data"`
	}
	if err := json.Unmarshal(bodyBytes, &result); err != nil {
		return nil, err
	}
	return &result.Data, nil
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

		log.Printf("[DEBUG_AI_CLIENT] Processing restaurant '%s' (ID: %d). Menu items from DB: %d", r.Name, r.ID, len(r.Menu))

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

			var dishImg string
			if len(m.Images) > 0 {
				// Đây chính là link lấy từ bảng DishImages trường ImageURL
				dishImg = m.Images[0].ImageURL
			} else {
				dishImg = "https://placehold.co/200x200?text=No+Dish+Image"
			}

			return map[string]interface{}{
				"name":        m.Name,
				"price":       m.Price,
				"ingredients": ingredients,
				"image_url":   dishImg,
			}
		}

		// 1. Nếu người dùng tìm món cụ thể, thực hiện lọc trong menu
		if hasDishQuery && dishQuery != "" {
			// Tách query thành các từ (keywords) và chuyển về chữ thường
			keywords := strings.Fields(strings.ToLower(dishQuery))

			// Xác định ngưỡng khớp (ít nhất 2 từ, hoặc bằng số lượng từ nếu query ngắn hơn 2)
			threshold := 2
			if len(keywords) < 2 {
				threshold = len(keywords)
			}

			for _, m := range r.Menu {
				// Mở rộng không gian tìm kiếm sang cả tên món và nguyên liệu để tăng độ chính xác
				searchSpace := strings.ToLower(m.Name + " " + m.Ingredients)
				matchCount := 0

				for _, kw := range keywords {
					if strings.Contains(searchSpace, kw) {
						matchCount++
					}
				}

				if matchCount >= threshold {
					featuredDishes = append(featuredDishes, createDishMap(m))
				}
			}

			// Logic dự phòng (Fallback): Nếu lọc theo từ khóa không ra món nào, tự động lấy 3 món đầu tiên.
			// Điều này đảm bảo `featured_dishes` không bao giờ bị rỗng.
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
			// Trường hợp không có dish query: Lấy toàn bộ menu
			for _, m := range r.Menu {
				featuredDishes = append(featuredDishes, createDishMap(m))
			}
		}

		// Ưu tiên lấy giá từ cột price_range của nhà hàng
		displayPrice := float64(r.PriceRange)

		// Nếu có menu, tính giá trung bình để có con số cập nhật nhất
		if len(r.Menu) > 0 {
			var totalPrice float64
			for _, item := range r.Menu {
				totalPrice += item.Price
			}
			displayPrice = totalPrice / float64(len(r.Menu))
		}

		resImage := ""
		if len(r.Images) > 0 {
			// Lấy ảnh đầu tiên của quán
			resImage = r.Images[0].ImageURL
		}
		if resImage == "" {
			resImage = "https://placehold.co/400x300?text=" + r.Name
		}

		results = append(results, map[string]interface{}{
			"id":              r.ID,
			"res_name":        r.Name,
			"rating":          r.Rating,
			"price":           displayPrice, // Trả về price_range hoặc giá trung bình menu
			"image_url":       resImage,
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
