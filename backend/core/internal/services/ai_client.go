
package services

import (
	"fmt"
	
	"bytes"
	"net/http"
	"encoding/json"
	"context"
	"io"
	"log"
	"sort"
	"strings"
	"time"

	"backend/core/internal/config"
	"backend/core/internal/models"

	"backend/core/internal/dto"
)

type pythonBaseResponse struct {
	Success bool                    `json:"success"`
	Message string                  `json:"message"`
	Data    dto.AIRecommendResponse `json:"data"`
	Error   interface{}             `json:"error"`
}

func CallPythonEngine(reqData dto.AIRecommendRequest) (*dto.AIRecommendResponse, error) {
	jsonData, err := json.Marshal(reqData)
	if err != nil {
		return nil, fmt.Errorf("lỗi đóng gói JSON payload: %v", err)
	}

	var prettyJSON bytes.Buffer
	if err := json.Indent(&prettyJSON, jsonData, "", "  "); err == nil {
		log.Printf("\n[DEBUG_SEND_TO_PYTHON]:\n%s\n", prettyJSON.String())
	} else {
		log.Printf("[DEBUG_SEND_TO_PYTHON_RAW]: %s", string(jsonData))
	}

	client := &http.Client{
		Timeout: 15 * time.Second,
	}

	pythonURL := config.AppConfig.AIServiceURL + "/api/v1/engine/recommend"
	resp, err := client.Post(pythonURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, fmt.Errorf("không thể kết nối tới Python AI Service: %v", err)
	}
	defer resp.Body.Close()

	bodyBytes, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("lỗi đọc response body: %v", err)
	}

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("python service báo lỗi HTTP %d: %s", resp.StatusCode, string(bodyBytes))
	}

	var wrapper pythonBaseResponse
	if err := json.Unmarshal(bodyBytes, &wrapper); err != nil {
		return nil, fmt.Errorf("lỗi giải mã cấu trúc BaseResponse: %v. Body: %s", err, string(bodyBytes))
	}

	if !wrapper.Success {
		return nil, fmt.Errorf("python AI xử lý thất bại: %v (Lỗi nội bộ: %v)", wrapper.Message, wrapper.Error)
	}

	return &wrapper.Data, nil
}

func CallAIIntentParse(req dto.AIIntentParseRequest) (*dto.AIIntentParseResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

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

func CallAIChatGenerate(req dto.AIChatGenerateRequest) (*dto.AIChatGenerateResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

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

func CallAIIdentifyDish(req dto.AIIdentifyDishRequest) (*dto.AIIdentifyDishResponse, error) {
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

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

type rankedRestaurant struct {
	restaurant models.Restaurant
	finalScore float64
}

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

	if userID > 0 && len(restaurants) > 0 {
		relevanceScores, err := CalculateChatRelevanceScores(ctx, userID, restaurants)
		if err != nil {
			log.Printf("[Chatbot] Lỗi tính điểm liên quan từ lịch sử chat: %v", err)
		} else {
			const (
				relevanceWeight = 0.2
				maxBonusScore   = 2.5 
			)

			for _, r := range restaurants {
				matchCount := relevanceScores[r.ID]

				bonusScore := float64(matchCount) * relevanceWeight
				if bonusScore > maxBonusScore {
					bonusScore = maxBonusScore 
				}

				finalScore := r.Rating + bonusScore

				rankedList = append(rankedList, rankedRestaurant{
					restaurant: r,
					finalScore: finalScore,
				})
			}

			sort.Slice(rankedList, func(i, j int) bool {
				return rankedList[i].finalScore > rankedList[j].finalScore
			})
		}
	} else {
		for _, r := range restaurants {
			rankedList = append(rankedList, rankedRestaurant{
				restaurant: r,
				finalScore: r.Rating, 
			})
		}
	}

	dishQuery, hasDishQuery := entities["dish"].(string)

	limit := 3
	if len(rankedList) < limit {
		limit = len(rankedList)
	}
	topRankedList := rankedList[:limit]

	var results []map[string]interface{}
	seenNames := make(map[string]bool) 

	for _, rankedItem := range topRankedList {
		r := rankedItem.restaurant
		finalScore := rankedItem.finalScore

		log.Printf("[DEBUG_AI_CLIENT] Processing restaurant '%s' (ID: %d). Menu items from DB: %d", r.Name, r.ID, len(r.Menu))

		if _, seen := seenNames[r.Name]; seen {
			continue
		}
		seenNames[r.Name] = true

		featuredDishes := []map[string]interface{}{}
		createDishMap := func(m models.MenuItem) map[string]interface{} {
			var ingredients []string
			if m.Ingredients != "" {
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

		if hasDishQuery && dishQuery != "" {
			keywords := strings.Fields(strings.ToLower(dishQuery))

			threshold := 2
			if len(keywords) < 2 {
				threshold = len(keywords)
			}

			for _, m := range r.Menu {
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
			for _, m := range r.Menu {
				featuredDishes = append(featuredDishes, createDishMap(m))
			}
		}

		displayPrice := float64(r.PriceRange)

		if len(r.Menu) > 0 {
			var totalPrice float64
			for _, item := range r.Menu {
				totalPrice += item.Price
			}
			displayPrice = totalPrice / float64(len(r.Menu))
		}

		resImage := ""
		if len(r.Images) > 0 {
			resImage = r.Images[0].ImageURL
		}
		if resImage == "" {
			resImage = "https://placehold.co/400x300?text=" + r.Name
		}

		results = append(results, map[string]interface{}{
			"id":              r.ID,
			"res_name":        r.Name,
			"rating":          r.Rating,
			"price":           displayPrice, 
			"image_url":       resImage,
			"distance_km":     1.5, 
			"type":            r.Type,
			"featured_dishes": featuredDishes,
			"final_score":     finalScore, 
		})
	}

	if results == nil {
		return []map[string]interface{}{}
	}
	return results
}
