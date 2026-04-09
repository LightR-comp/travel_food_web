package services

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
)

type GoongDetail struct {
	Result struct {
		Name             string `json:"name"`
		FormattedAddress string `json:"formatted_address"`
		Geometry         struct {
			Location struct {
				Lat float64 `json:"lat"`
				Lng float64 `json:"lng"`
			} `json:"location"`
		} `json:"geometry"`
	} `json:"result"`
	Status string `json:"status"`
}

type GoongAutocomplete struct {
	Predictions []struct {
		PlaceID              string `json:"place_id"`
		Description          string `json:"description"`
		StructuredFormatting struct {
			MainText      string `json:"main_text"`
			SecondaryText string `json:"secondary_text"`
		} `json:"structured_formatting"`
	} `json:"predictions"`
	Status string `json:"status"`
}

type GMapsClient struct {
	APIKey string
}

func NewGMapsClient() *GMapsClient {
	return &GMapsClient{APIKey: os.Getenv("GOONG_API_KEY")}
}
//Dùng hàm này để lấy tọa độ động, tức là khi người dùng nhập tên địa điểm, chúng ta sẽ gọi Autocomplete để lấy tọa độ của địa điểm đó, thay vì dùng tọa độ cứng như trong main3.go
func (s *GMapsClient) Autocomplete(input string, limit int, lat, lng float64, radius int) (GoongAutocomplete, error) {
	encodedInput := url.QueryEscape(input)
	apiUrl := fmt.Sprintf("https://rsapi.goong.io/Place/AutoComplete?api_key=%s&input=%s&limit=%d&location=%f,%f&radius=%d",
		s.APIKey, encodedInput, limit, lat, lng, radius)

	resp, err := http.Get(apiUrl)
	if err != nil {
		return GoongAutocomplete{}, err
	}
	defer resp.Body.Close()

	var res GoongAutocomplete
	json.NewDecoder(resp.Body).Decode(&res)
	return res, nil
}
// Hàm này dùng để lấy chi tiết của một địa điểm dựa trên PlaceID, bao gồm tên, địa chỉ đầy đủ và tọa độ chính xác của quán ăn đó
func (s *GMapsClient) GetPlaceDetail(placeID string) (GoongDetail, error) {
	apiUrl := fmt.Sprintf("https://rsapi.goong.io/Place/Detail?place_id=%s&api_key=%s", placeID, s.APIKey)
	resp, err := http.Get(apiUrl)
	if err != nil {
		return GoongDetail{}, err
	}
	defer resp.Body.Close()

	var res GoongDetail
	json.NewDecoder(resp.Body).Decode(&res)
	return res, nil
}