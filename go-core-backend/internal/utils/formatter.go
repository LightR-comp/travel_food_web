package utils

import (
	"math"
	"strconv"
	"strings"
)

func CalculateDistance(lat1, lng1, lat2, lng2 float64) float64 {
	const R = 6371 // Bán kính Trái Đất tính bằng km

	dLat := (lat2 - lat1) * (math.Pi / 180.0)
	dLng := (lng2 - lng1) * (math.Pi / 180.0)

	lat1Rad := lat1 * (math.Pi / 180.0)
	lat2Rad := lat2 * (math.Pi / 180.0)

	a := math.Sin(dLat/2)*math.Sin(dLat/2) +
		math.Sin(dLng/2)*math.Sin(dLng/2)*math.Cos(lat1Rad)*math.Cos(lat2Rad)

	c := 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))

	return R * c
}

// FormatPrice: Chuyển đổi số nguyên (ví dụ: 550000) thành chuỗi có dấu phân cách (550.000)
func FormatPrice(price int) string {
	s := strconv.Itoa(price)
	n := len(s)
	if n <= 3 {
		return s
	}

	var result []string
	// Duyệt từ cuối chuỗi lên để thêm dấu chấm phân cách hàng nghìn
	for i := n; i > 0; i -= 3 {
		start := i - 3
		if start < 0 {
			start = 0
		}
		result = append([]string{s[start:i]}, result...)
	}

	return strings.Join(result, ".")
}

// FormatDistance: Chuyển đổi chuỗi khoảng cách từ API (ví dụ: "1200m") sang số thực km (1.2)
func FormatDistance(rawDist string) float64 {
	// Loại bỏ chữ "m" và khoảng trắng nếu có
	cleanStr := strings.TrimSuffix(strings.ToLower(rawDist), "m")
	cleanStr = strings.TrimSpace(cleanStr)

	meters, err := strconv.ParseFloat(cleanStr, 64)
	if err != nil {
		return 0.0
	}

	// Chuyển từ mét sang kilomet
	return meters / 1000
}

// FormatStatusText: Chuyển đổi giá trị bool thành văn bản hiển thị trạng thái
func FormatStatusText(isOpen bool) string {
	if isOpen {
		return "Đang mở cửa"
	}
	return "Đã đóng cửa"
}
