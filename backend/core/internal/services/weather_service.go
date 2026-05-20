package services

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"time"
)

type OpenWeatherResponse struct {
	Main struct {
		Temp     float64 `json:"temp"`
		Humidity int     `json:"humidity"`
	} `json:"main"`
	Weather []struct {
		Main        string `json:"main"`
		Description string `json:"description"`
		Icon        string `json:"icon"`
	} `json:"weather"`
}

type WeatherData struct {
	Lat         float64 `json:"lat"`
	Lng         float64 `json:"lng"`
	Condition   string  `json:"condition"`
	Description string  `json:"description"`
	Temperature float64 `json:"temperature"`
	Humidity    int     `json:"humidity"`
	IconURL     string  `json:"icon_url"`
}

func GetLiveWeather(lat, lng float64) (*WeatherData, error) {
	apiKey := os.Getenv("WEATHER_API_KEY")
	url := fmt.Sprintf("https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%s&units=metric&lang=vi", lat, lng, apiKey)

	client := &http.Client{Timeout: 5 * time.Second}
	resp, err := client.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("openweather api error: status %d", resp.StatusCode)
	}

	var openWeatherResp OpenWeatherResponse
	if err := json.NewDecoder(resp.Body).Decode(&openWeatherResp); err != nil {
		return nil, err
	}

	if len(openWeatherResp.Weather) == 0 {
		return nil, fmt.Errorf("no weather data found")
	}

	data := &WeatherData{
		Lat:         lat,
		Lng:         lng,
		Condition:   openWeatherResp.Weather[0].Main,
		Description: openWeatherResp.Weather[0].Description,
		Temperature: openWeatherResp.Main.Temp,
		Humidity:    openWeatherResp.Main.Humidity,
		IconURL:     fmt.Sprintf("https://openweathermap.org/img/wn/%s@2x.png", openWeatherResp.Weather[0].Icon),
	}

	return data, nil
}