	package utils

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

var numberRegex = regexp.MustCompile(`[0-9]*\.?[0-9]+`)

func ExtractNumber(input string) float64 {
	match := numberRegex.FindString(input)
	if match == "" { return 0 }
	val, _ := strconv.ParseFloat(match, 64)
	return val
}

// 1. Chuyển đổi Khoảng cách về đơn vị KM
func FormatDistance(input string) float64 {
	cleanInput := strings.ToLower(strings.ReplaceAll(input, " ", ""))
	val := ExtractNumber(cleanInput)
	if strings.Contains(cleanInput, "m") && !strings.Contains(cleanInput, "km") {
		return val / 1000
	}
	return val
}

// 2. Định dạng giá tiền kiểu "40k-70k"
func FormatPriceK(amount int) string {
	return fmt.Sprintf("%dk", amount/1000)
}

// 3. Format trạng thái hoạt động
func FormatStatusText(isOpen bool) string {
	if isOpen { return "Đang mở cửa" }
	return "Đã đóng cửa"
}