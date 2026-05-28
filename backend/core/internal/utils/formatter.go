
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

func FormatDistance(input string) float64 {
	cleanInput := strings.ToLower(strings.ReplaceAll(input, " ", ""))
	val := ExtractNumber(cleanInput)
	if strings.Contains(cleanInput, "m") && !strings.Contains(cleanInput, "km") {
		return val / 1000
	}
	return val
}

func FormatPriceK(amount int) string {
	return fmt.Sprintf("%dk", amount/1000)
}

func FormatStatusText(isOpen bool) string {
	if isOpen { return "Đang mở cửa" }
	return "Đã đóng cửa"
}