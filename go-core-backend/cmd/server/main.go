// main.go là điểm khởi đầu của ứng dụng
// nơi chúng ta thiết lập server, cấu hình các route và chạy server
// Đây là nơi chúng ta sẽ load cấu hình, khởi tạo router Gin, thiết lập các route cơ bản và sau đó chạy server trên cổng được chỉ định trong file config.

package main

import (
	"fmt"
	"net/http"

	"go-core-backend/internal/config"
	"go-core-backend/internal/routes"

	"github.com/gin-gonic/gin"
)
func main() {
	// Load cấu hình
	config.LoadConfig()

	// Khởi tạo server Gin mặc định
	r :=gin.Default()
	

	// Thêm dòng này để tắt cảnh báo "Trusted Proxies"
	r.SetTrustedProxies(nil)

	// Tạo endpoint test /ping
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Go Server is running",
			"data": nil,
			"error": nil,
		})
	})
		
	// Thiết lập các route
	routes.SetupRouter(r)

	//Lấy port từ file config
	port := config.AppConfig.Port
	fmt.Print("Server is running on port: ", port)


}