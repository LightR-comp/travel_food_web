package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"strings"
	"time"

	_ "github.com/denisenkom/go-mssqldb"
	"google.golang.org/genai"
)

type RestaurantInfo struct {
	ID          int
	Name        string
	Address     string
	Type        string
	Rating      float64
	MenuSummary string
}

func main() {
	// ==========================================
	// CẤU HÌNH CỨNG THÔNG TIN CHẠY MỘT LẦN TẠI ĐÂY
	// ==========================================
	dbPassword := "123456"
	dbName     := "travel_food_db"
	geminiKey  := "AIzaSyA1bYGeCliticrpLRKT0MlWsPT6Ym0lBwU"
	dbHost     := "localhost"
	// ==========================================

	if geminiKey == "" {
		log.Fatalf("Lỗi: Vui lòng điền geminiKey trước khi chạy tool")
	}

	// 1. Thiết lập chuỗi kết nối Database
	connString := fmt.Sprintf("sqlserver://%s:%s@%s:%d?database=%s",
		"sa",
		dbPassword,
		dbHost,
		1433,
		dbName,
	)
	db, err := sql.Open("mssql", connString)
	if err != nil {
		log.Fatalf("Lỗi kết nối DB: %v", err)
	}
	defer db.Close()

	// 2. Khởi tạo Gemini Client trực tiếp bằng API Key cấu hình cứng
	ctx := context.Background()
	aiClient, err := genai.NewClient(ctx, &genai.ClientConfig{
		APIKey: geminiKey,
	})
	if err != nil {
		log.Fatalf("Lỗi khởi tạo Gemini Client: %v", err)
	}

	// 3. Tìm các quán ăn chưa có dòng dữ liệu nào bên bảng riêng RestaurantStories (s.restaurant_id IS NULL)
	// Hoặc những quán đã có dòng nhưng cột story bị rỗng
	query := `
		SELECT r.id, r.name, r.address, r.type, r.rating 
		FROM Restaurants r
		LEFT JOIN RestaurantStories s ON r.id = s.restaurant_id
		WHERE s.restaurant_id IS NULL OR s.story IS NULL OR s.story = ''
	`
	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		log.Fatalf("Lỗi query danh sách nhà hàng: %v", err)
	}
	defer rows.Close()

	var restaurants []RestaurantInfo
	for rows.Next() {
		var r RestaurantInfo
		err := rows.Scan(&r.ID, &r.Name, &r.Address, &r.Type, &r.Rating)
		if err != nil {
			continue
		}
		restaurants = append(restaurants, r)
	}

	fmt.Printf("Tìm thấy %d quán ăn chưa có câu chuyện thương hiệu trong bảng riêng.\n", len(restaurants))

	// 4. Duyệt qua từng quán ăn để thu thập menu làm ngữ cảnh và gọi AI sinh story
	for _, r := range restaurants {
		fmt.Printf("-> Đang xử lý quán: %s...\n", r.Name)

		// Gom nhanh danh sách tên món ăn của quán này giúp AI hiểu rõ phong cách ẩm thực của quán
		menuQuery := "SELECT name FROM MenuItems WHERE restaurant_id = ?"
		menuRows, err := db.QueryContext(ctx, menuQuery, r.ID)
		var dishes []string
		if err == nil {
			for menuRows.Next() {
				var dishName string
				if err := menuRows.Scan(&dishName); err == nil {
					dishes = append(dishes, dishName)
				}
			}
			menuRows.Close()
		}
		
		r.MenuSummary = strings.Join(dishes, ", ")
		if r.MenuSummary == "" {
			r.MenuSummary = "Các món ăn đặc sản theo phong cách riêng của quán"
		}

		prompt := fmt.Sprintf(`
			Bạn là một nhà sáng tạo nội dung ẩm thực chuyên nghiệp. Hãy viết một đoạn câu chuyện thương hiệu (story) ngắn gọn, cuốn hút và truyền cảm hứng cho quán ăn sau đây để hiển thị trên ứng dụng tìm kiếm địa điểm.

			Thông tin quán ăn:
			- Tên quán: %s
			- Loại hình: %s
			- Địa chỉ: %s
			- Đánh giá hiện tại: %.1f/5 sao
			- Các món ăn có trong thực đơn: %s

			Yêu cầu:
			- Ngôn ngữ: Tiếng Việt văn phong ấm áp, tự nhiên, khơi gợi vị giác và tạo cảm giác chào đón.
			- Nội dung: Tập trung vào không gian, hương vị đặc trưng đặc sắc, hoặc cái tâm truyền tải vào món ăn làm nên thương hiệu riêng của quán.
			- Độ dài: Ngắn gọn vừa vặn từ 3 đến 4 câu (tối đa 120 từ) để hiển thị đẹp trên giao diện mobile.
			- Định dạng: Chỉ trả về chuỗi văn bản thuần túy, tuyệt đối không chứa các ký tự định dạng markdown như **, # hoặc dấu gạch đầu dòng.
		`, r.Name, r.Type, r.Address, r.Rating, r.MenuSummary)

		// Gọi Gemini API sử dụng model gemini-2.5-flash
		resp, err := aiClient.Models.GenerateContent(ctx, "gemini-2.5-flash", genai.Text(prompt), nil)
		if err != nil {
			fmt.Printf("❌ Lỗi gọi AI cho quán %s: %v\n", r.Name, err)
			continue
		}

		story := strings.TrimSpace(resp.Text())
		if story == "" {
			fmt.Printf("❌ AI trả về chuỗi rỗng cho quán %s\n", r.Name)
			continue
		}

		// 5. Sử dụng MERGE để Chèn mới hoặc Cập nhật trực tiếp vào bảng riêng RestaurantStories
		// Đồng bộ tham số dạng dấu chấm hỏi ? chuẩn hóa cho SQL Server
		updateQuery := `
			MERGE RestaurantStories AS target
			USING (SELECT ? AS restaurant_id, ? AS story) AS source
			ON (target.restaurant_id = source.restaurant_id)
			WHEN MATCHED THEN
				UPDATE SET target.story = source.story, target.updated_at = GETDATE()
			WHEN NOT MATCHED THEN
				INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());
		`
		_, err = db.ExecContext(ctx, updateQuery, r.ID, story)
		if err != nil {
			fmt.Printf("❌ Lỗi cập nhật bảng RestaurantStories cho quán %s: %v\n", r.Name, err)
			continue
		}

		fmt.Printf(" Đã cập nhật story vào bảng riêng cho quán: %s\n", r.Name)
		
		// Giãn cách nhẹ 1 giây để tránh bị Rate Limit tài khoản Free
		time.Sleep(1 * time.Second)
	}

	fmt.Println(" Toàn bộ quá trình sinh và lưu story vào bảng riêng đã hoàn tất thành công!")
}