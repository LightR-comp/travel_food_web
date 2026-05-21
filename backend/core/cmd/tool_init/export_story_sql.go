package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"
	"strings"

	_ "github.com/denisenkom/go-mssqldb"
)

type StoryExport struct {
	RestaurantName string
	Story          string
}

func main() {
	// ==========================================
	// CẤU HÌNH THÔNG TIN DATABASE
	// ==========================================
	dbPassword := "123456"
	dbName     := "travel_food_db"
	dbHost     := "localhost"
	outputFile := "insert_stories.sql"
	// ==========================================

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

	ctx := context.Background()

	// 2. JOIN sang bảng Restaurants để lấy Name thay vì bốc ID cô định
	query := `
		SELECT r.name, s.story 
		FROM RestaurantStories s
		INNER JOIN Restaurants r ON s.restaurant_id = r.id
		WHERE s.story IS NOT NULL AND s.story <> ''`
		
	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		log.Fatalf("Lỗi query lấy dữ liệu story và tên nhà hàng: %v", err)
	}
	defer rows.Close()

	var exports []StoryExport
	for rows.Next() {
		var exp StoryExport
		if err := rows.Scan(&exp.RestaurantName, &exp.Story); err != nil {
			continue
		}
		exports = append(exports, exp)
	}

	if len(exports) == 0 {
		fmt.Println("Không có dữ liệu story nào trong database để xuất!")
		return
	}

	// 3. Tiến hành build nội dung file SQL bằng strings.Builder
	var sb strings.Builder
	sb.WriteString("-- File SQL backup dữ liệu câu chuyện quán ăn (RestaurantStories)\n")
	sb.WriteString("-- Tự động giải quyết lệch ID giữa các máy thành viên bằng cách dò theo [name]\n")
	sb.WriteString("-- Tạo tự động bằng tool Go nâng cấp\n\n")
	
	sb.WriteString("BEGIN TRANSACTION;\n\n")

	for _, exp := range exports {
		// Xử lý dấu nháy đơn để tránh lỗi cú pháp SQL Server
		safeName := strings.ReplaceAll(exp.RestaurantName, "'", "''")
		safeStory := strings.ReplaceAll(exp.Story, "'", "''")

		// Thay vì truyền cứng ID, bốc Subquery lấy ID từ tên quán ăn
		sqlStatement := fmt.Sprintf(`-- Câu chuyện cho quán: %s
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'%s' AS story 
    FROM Restaurants 
    WHERE name = N'%s'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

`, exp.RestaurantName, safeStory, safeName)

		sb.WriteString(sqlStatement)
	}

	sb.WriteString("COMMIT TRANSACTION;\n")

	// 4. Ghi chuỗi dữ liệu ra file vật lý
	err = os.WriteFile(outputFile, []byte(sb.String()), 0644)
	if err != nil {
		log.Fatalf("Lỗi khi ghi file SQL: %v", err)
	}

	fmt.Printf(" Tải dữ liệu thành công! Đã xuất %d câu chuyện ra file '%s' chống lệch ID nhóm!\n", len(exports), outputFile)
}