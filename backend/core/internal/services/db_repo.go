package services

import (
	"context"
	"crypto/rand"
	"database/sql"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
	"math"
	"os"
	"time"

	_ "github.com/denisenkom/go-mssqldb"

	"backend/core/internal/models"

	"golang.org/x/crypto/bcrypt"
)

var db *sql.DB

func InitDB() {
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	dbName := os.Getenv("DB_NAME")

	connStr := fmt.Sprintf("sqlserver://%s:%s?database=%s&trusted_connection=yes",
		host, port, dbName)

	var err error
	db, err = sql.Open("sqlserver", connStr)
	if err != nil {
		log.Fatalf("[DB] Không thể mở kết nối: %v", err)
	}

	if err = db.Ping(); err != nil {
		log.Fatalf("[DB] Không thể ping MSSQL: %v", err)
	}

	db.SetMaxOpenConns(25)
	db.SetMaxIdleConns(10)

	log.Println("[DB] Kết nối MSSQL thành công.")
	log.Println("[DB] Database:", os.Getenv("DB_NAME"))
}

// ============================================================
// USER
// ============================================================

func UpsertUser(ctx context.Context, providerID, email, name, avatar string, provider models.AuthProvider) (*models.User, error) {
	// 1. Check user đã tồn tại chưa qua email
	var userID int
	row := db.QueryRowContext(ctx, `
		SELECT u.id FROM Users u
		INNER JOIN UserAuth ua ON u.id = ua.user_id
		WHERE ua.provider = @provider AND ua.provider_id = @providerID
	`,
		sql.Named("provider", provider),
		sql.Named("providerID", providerID),
	)

	err := row.Scan(&userID)

	if err == sql.ErrNoRows {
		// 2. Chưa có → tạo mới User
		newRow := db.QueryRowContext(ctx, `
			INSERT INTO Users (email, name, avatar_url, created_at, updated_at)
			OUTPUT INSERTED.id
			VALUES (@email, @name, @avatar, GETDATE(), GETDATE())
		`,
			sql.Named("email", email),
			sql.Named("name", name),
			sql.Named("avatar", avatar),
		)
		if err := newRow.Scan(&userID); err != nil {
			return nil, fmt.Errorf("UpsertUser insert: %w", err)
		}

		// 3. Tạo UserAuth
		_, err = db.ExecContext(ctx, `
			INSERT INTO UserAuth (user_id, provider, provider_id, created_at)
			VALUES (@userID, @provider, @providerID, GETDATE())
		`,
			sql.Named("userID", userID),
			sql.Named("provider", provider),
			sql.Named("providerID", providerID),
		)
		if err != nil {
			return nil, fmt.Errorf("UpsertUser auth: %w", err)
		}
	} else if err != nil {
		return nil, fmt.Errorf("UpsertUser check: %w", err)
	}

	return GetUserByID(ctx, userID)
}

func GetUserByID(ctx context.Context, id int) (*models.User, error) {
	row := db.QueryRowContext(ctx, `
		SELECT id, email, name, avatar_url, created_at, updated_at
		FROM Users WHERE id = @id
	`, sql.Named("id", id))

	var u models.User
	err := row.Scan(&u.ID, &u.Email, &u.Name, &u.AvatarURL, &u.CreatedAt, &u.UpdatedAt)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("user không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetUserByID: %w", err)
	}
	return &u, nil
}

func UpdateUserPreferences(ctx context.Context, userID int, prefs models.UserPreferences) error {
	_, err := db.ExecContext(ctx, `
		MERGE UserPreferences AS target
		USING (SELECT @userID AS user_id) AS source ON target.user_id = source.user_id
		WHEN MATCHED THEN
			UPDATE SET
				budget_per_person = @budget,
				dietary           = @dietary,
				food_types        = @foodTypes,
				updated_at        = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (user_id, budget_per_person, dietary, food_types, created_at, updated_at)
			VALUES (@userID, @budget, @dietary, @foodTypes, GETDATE(), GETDATE());
	`,
		sql.Named("userID", userID),
		sql.Named("budget", prefs.BudgetPerPerson),
		sql.Named("dietary", prefs.Dietary),
		sql.Named("foodTypes", prefs.FoodTypes),
	)
	return err
}

// ============================================================
// RESTAURANT
// ============================================================

type NearbyQuery struct {
	Latitude  float64
	Longitude float64
	RadiusKm  float64
}

func GetRestaurantsNearby(ctx context.Context, q NearbyQuery) ([]models.Restaurant, error) {
	query := `
		WITH Nearby AS (
			SELECT
				r.id, r.name, r.address, r.lat, r.lng,
				r.rating, r.price_range, r.open_time, r.close_time, r.type,
				6371 * 2 * ASIN(SQRT(
					POWER(SIN(RADIANS(r.lat - @lat) / 2), 2) +
					COS(RADIANS(@lat)) * COS(RADIANS(r.lat)) *
					POWER(SIN(RADIANS(r.lng - @lng) / 2), 2)
				)) AS distance_km
			FROM Restaurants r
		)
		SELECT * FROM Nearby
		WHERE distance_km <= @radius
		ORDER BY distance_km ASC
	`

	rows, err := db.QueryContext(ctx, query,
		sql.Named("lat", q.Latitude),
		sql.Named("lng", q.Longitude),
		sql.Named("radius", q.RadiusKm),
	)
	if err != nil {
		return nil, fmt.Errorf("GetRestaurantsNearby: %w", err)
	}
	defer rows.Close()

	var restaurants []models.Restaurant
	var ids []int

	for rows.Next() {
		var r models.Restaurant
		if err := rows.Scan(
			&r.ID, &r.Name, &r.Address, &r.Lat, &r.Lng,
			&r.Rating, &r.PriceRange, &r.OpenTime, &r.CloseTime, &r.Type,
			&r.DistanceKm,
		); err != nil {
			continue
		}
		restaurants = append(restaurants, r)
		ids = append(ids, r.ID)
	}

	if len(ids) == 0 {
		return restaurants, nil
	}

	// Lấy menu
	menuMap, err := getMenusByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Menu = menuMap[restaurants[i].ID]
		}
	}

	// Lấy ảnh
	imageMap, err := getImagesByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Images = imageMap[restaurants[i].ID]
		}
	}

	return restaurants, nil
}

func getMenusByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.MenuItem, error) {
	query := fmt.Sprintf(`
		SELECT restaurant_id, id, name, description, price, food_type, ingredients
		FROM MenuItems
		WHERE restaurant_id IN (%s)
	`, intSliceToSQL(ids))

	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.MenuItem)
	for rows.Next() {
		var item models.MenuItem
		var restaurantID int
		if err := rows.Scan(
			&restaurantID, &item.ID, &item.Name, &item.Description,
			&item.Price, &item.FoodType, &item.Ingredients,
		); err != nil {
			continue
		}
		result[restaurantID] = append(result[restaurantID], item)
	}
	return result, nil
}


// Image handling
func getImagesByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.RestaurantImage, error) {
	query := fmt.Sprintf(`
		SELECT id, restaurant_id, image_url, caption, is_thumbnail, created_at
		FROM RestaurantImages
		WHERE restaurant_id IN (%s)
		ORDER BY is_thumbnail DESC
	`, intSliceToSQL(ids))

	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.RestaurantImage)
	for rows.Next() {
		var img models.RestaurantImage
		var restaurantID int
		if err := rows.Scan(
			&img.ID, &restaurantID, &img.ImageURL,
			&img.Caption, &img.IsThumbnail, &img.CreatedAt,
		); err != nil {
			continue
		}
		result[restaurantID] = append(result[restaurantID], img)
	}
	return result, nil
}

func CreateReview(ctx context.Context, rv models.UserRating) (*models.UserRating, error) {
	row := db.QueryRowContext(ctx, `
		INSERT INTO UserRatings (restaurant_id, user_id, rating, comment, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@rid, @uid, @rating, @comment, GETDATE())
	`,
		sql.Named("rid", rv.RestaurantID),
		sql.Named("uid", rv.UserID),
		sql.Named("rating", rv.Rating),
		sql.Named("comment", rv.Comment),
	)
	if err := row.Scan(&rv.ID, &rv.CreatedAt); err != nil {
		return nil, fmt.Errorf("CreateReview: %w", err)
	}
	return &rv, nil
}

func GetReviewsByRestaurant(ctx context.Context, restaurantID int) ([]models.UserRating, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT id, user_id, restaurant_id, rating, comment, created_at
		FROM UserRatings
		WHERE restaurant_id = @rid
		ORDER BY created_at DESC
	`, sql.Named("rid", restaurantID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var reviews []models.UserRating
	for rows.Next() {
		var rv models.UserRating
		rows.Scan(&rv.ID, &rv.UserID, &rv.RestaurantID, &rv.Rating, &rv.Comment, &rv.CreatedAt)
		reviews = append(reviews, rv)
	}
	return reviews, nil
}

func UpdateReview(ctx context.Context, reviewID int, userID int, update models.UserRating) error {
	result, err := db.ExecContext(ctx, `
		UPDATE UserRatings SET rating = @rating, comment = @comment
		WHERE id = @id AND user_id = @uid
	`,
		sql.Named("rating", update.Rating),
		sql.Named("comment", update.Comment),
		sql.Named("id", reviewID),
		sql.Named("uid", userID),
	)
	if err != nil {
		return err
	}
	n, _ := result.RowsAffected()
	if n == 0 {
		return fmt.Errorf("không tìm thấy review hoặc không có quyền")
	}
	return nil
}

func DeleteReview(ctx context.Context, reviewID int, userID int) error {
	result, err := db.ExecContext(ctx, `
		DELETE FROM UserRatings WHERE id = @id AND user_id = @uid
	`,
		sql.Named("id", reviewID),
		sql.Named("uid", userID),
	)
	if err != nil {
		return err
	}
	n, _ := result.RowsAffected()
	if n == 0 {
		return fmt.Errorf("không tìm thấy review hoặc không có quyền")
	}
	return nil
}

func updateAvgRating(restaurantID int) {
	db.Exec(`
		UPDATE Restaurants
		SET avg_rating = (SELECT AVG(CAST(rating AS FLOAT)) FROM Reviews WHERE restaurant_id = @rid)
		WHERE id = @rid
	`, sql.Named("rid", restaurantID))
}

// ============================================================
// HELPER UTILS
// ============================================================

func intSliceToSQL(ids []int) string {
	s := ""
	for i, id := range ids {
		if i > 0 {
			s += ","
		}
		s += fmt.Sprintf("%d", id)
	}
	return s
}

func toJSONArray(arr []string) string {
	if len(arr) == 0 {
		return "[]"
	}
	b, _ := json.Marshal(arr)
	return string(b)
}

func parseJSONStringArray(raw string, dest *[]string) {
	if raw == "" || raw == "[]" {
		return
	}
	json.Unmarshal([]byte(raw), dest)
}

func GetUserByProviderID(ctx context.Context, providerID string) (*models.User, error) {
	row := db.QueryRowContext(ctx, `
		SELECT u.id, u.email, u.name, u.avatar_url, u.created_at, u.updated_at
		FROM Users u
		INNER JOIN UserAuth ua ON u.id = ua.user_id
		WHERE ua.provider_id = @providerID
	`, sql.Named("providerID", providerID))

	var u models.User
	err := row.Scan(&u.ID, &u.Email, &u.Name, &u.AvatarURL, &u.CreatedAt, &u.UpdatedAt)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("user không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetUserByProviderID: %w", err)
	}
	return &u, nil
}

func GetUserPreferences(ctx context.Context, userID int) (*models.UserPreferences, error) {
	row := db.QueryRowContext(ctx, `
		SELECT user_id, budget_per_person, dietary, food_types, created_at, updated_at
		FROM UserPreferences WHERE user_id = @userID
	`, sql.Named("userID", userID))

	var p models.UserPreferences
	err := row.Scan(&p.UserID, &p.BudgetPerPerson, &p.Dietary, &p.FoodTypes, &p.CreatedAt, &p.UpdatedAt)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("preferences không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetUserPreferences: %w", err)
	}
	return &p, nil
}

// Local user
func RegisterLocal(ctx context.Context, username, password, name, email string) (*models.User, error) {
	// 1. Kiểm tra username đã tồn tại chưa
	var count int
	row := db.QueryRowContext(ctx, `
		SELECT COUNT(*) FROM UserAuth 
		WHERE provider = 'local' AND provider_id = @username
	`, sql.Named("username", username))
	row.Scan(&count)
	if count > 0 {
		return nil, fmt.Errorf("username đã được sử dụng")
	}

	// 2. Hash password
	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return nil, fmt.Errorf("lỗi hash password")
	}

	// 3. Tạo user mới với email thật
	var userID int
	newRow := db.QueryRowContext(ctx, `
		INSERT INTO Users (email, name, avatar_url, created_at, updated_at)
		OUTPUT INSERTED.id
		VALUES (@email, @name, '', GETDATE(), GETDATE())
	`,
		sql.Named("email", email),
		sql.Named("name", name),
	)
	if err := newRow.Scan(&userID); err != nil {
		return nil, fmt.Errorf("lỗi tạo user: %w", err)
	}

	// 4. Lưu UserAuth
	_, err = db.ExecContext(ctx, `
		INSERT INTO UserAuth (user_id, provider, provider_id, password_hash, created_at)
		VALUES (@userID, 'local', @username, @hash, GETDATE())
	`,
		sql.Named("userID", userID),
		sql.Named("username", username),
		sql.Named("hash", string(hash)),
	)
	if err != nil {
		return nil, fmt.Errorf("lỗi lưu auth")
	}

	return GetUserByID(ctx, userID)
}

func LocalLogin(ctx context.Context, username, password string) (*models.User, error) {
	// 1. Lấy password hash từ DB theo username
	var userID int
	var passwordHash string
	row := db.QueryRowContext(ctx, `
		SELECT user_id, password_hash FROM UserAuth
		WHERE provider = 'local' AND provider_id = @username
	`, sql.Named("username", username))

	if err := row.Scan(&userID, &passwordHash); err == sql.ErrNoRows {
		return nil, fmt.Errorf("username hoặc mật khẩu không đúng")
	} else if err != nil {
		return nil, err
	}

	// 2. So sánh password
	if err := bcrypt.CompareHashAndPassword([]byte(passwordHash), []byte(password)); err != nil {
		return nil, fmt.Errorf("username hoặc mật khẩu không đúng")
	}

	return GetUserByID(ctx, userID)
}

// Tạo reset token, lưu DB, trả về token để gửi mail
func CreatePasswordResetToken(ctx context.Context, username string) (string, string, error) {
    // Lấy user_id VÀ email từ DB
    var userID int
    var email string
    row := db.QueryRowContext(ctx, `
        SELECT ua.user_id, u.email 
        FROM UserAuth ua
        INNER JOIN Users u ON ua.user_id = u.id
        WHERE ua.provider = 'local' AND ua.provider_id = @username
    `, sql.Named("username", username))

    if err := row.Scan(&userID, &email); err == sql.ErrNoRows {
        return "", "", fmt.Errorf("không tìm thấy tài khoản")
    } else if err != nil {
        return "", "", err
    }

    // Tạo token như cũ
    b := make([]byte, 32)
    rand.Read(b)
    token := hex.EncodeToString(b)
    exp := time.Now().Add(15 * time.Minute)

    db.ExecContext(ctx, `
        UPDATE UserAuth SET reset_token = @token, reset_token_exp = @exp
        WHERE provider = 'local' AND provider_id = @username
    `,
        sql.Named("token", token),
        sql.Named("exp", exp),
        sql.Named("username", username),
    )

    return token, email, nil // trả về cả email
}

// Đổi mật khẩu mới sau khi xác thực token
func ResetPassword(ctx context.Context, token, newPassword string) error {
    var userID int
    var expTime time.Time

    row := db.QueryRowContext(ctx, `
        SELECT user_id, reset_token_exp FROM UserAuth
        WHERE reset_token = @token AND provider = 'local'
    `, sql.Named("token", token))

    if err := row.Scan(&userID, &expTime); err == sql.ErrNoRows {
        return fmt.Errorf("token không hợp lệ hoặc đã hết hạn")
    } else if err != nil {
        return err
    }

    if time.Now().After(expTime) {
        return fmt.Errorf("token đã hết hạn")
    }

    hash, err := bcrypt.GenerateFromPassword([]byte(newPassword), bcrypt.DefaultCost)
    if err != nil {
        return fmt.Errorf("lỗi hash password")
    }

    _, err = db.ExecContext(ctx, `
        UPDATE UserAuth
        SET password_hash   = @hash,
            reset_token     = NULL,
            reset_token_exp = NULL
        WHERE user_id = @userID AND provider = 'local'
    `,
        sql.Named("hash", string(hash)),
        sql.Named("userID", userID),
    )
    return err
}

// [Nhut]
// SearchRestaurants, GetRestaurantDetail, GetPopularRestaurants sẽ nằm ở đây, handler chỉ gọi service.
// CalculateDistance: Tính khoảng cách giữa 2 điểm (Lat, Lng) theo đơn vị Km
func CalculateDistance(lat1, lng1, lat2, lng2 float64) float64 {
	const EarthRadius = 6371.0 // Bán kính Trái Đất tính theo Km
	
	dLat := (lat2 - lat1) * (math.Pi / 180)
	dLng := (lng2 - lng1) * (math.Pi / 180)
	
	a := math.Sin(dLat/2)*math.Sin(dLat/2) +
		math.Cos(lat1*(math.Pi/180))*math.Cos(lat2*(math.Pi/180))*
			math.Sin(dLng/2)*math.Sin(dLng/2)
	
	c := 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))
	return EarthRadius * c
}

// SearchRestaurants: Não bộ tìm kiếm trả về data thô và tổng số lượng
func SearchRestaurants(ctx context.Context, q string, minPrice, maxPrice float64, userLat, userLng float64) ([]models.Restaurant, int, error) {
	query := `
		SELECT DISTINCT TOP 7 r.id, r.name, r.address, r.lat, r.lng, 
		       r.rating, r.price_range, r.type
		FROM Restaurants r
		LEFT JOIN MenuItems m ON r.id = m.restaurant_id
		WHERE 1=1
	`
	var args []interface{}
	argCount := 1

	if q != "" {
		searchTerm := "%" + q + "%"
		query += fmt.Sprintf(" AND (r.name LIKE @p%d OR r.type LIKE @p%d OR m.name LIKE @p%d)", argCount, argCount, argCount)
		args = append(args, searchTerm)
		argCount++
	}

	if minPrice > 0 {
		query += fmt.Sprintf(" AND (m.price >= @p%d OR r.price_range >= @p%d)", argCount, argCount+1)
		args = append(args, minPrice, minPrice)
		argCount += 2
	}

	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, 0, err
	}
	defer rows.Close()

	var results []models.Restaurant
	for rows.Next() {
		var r models.Restaurant
		if err := rows.Scan(&r.ID, &r.Name, &r.Address, &r.Lat, &r.Lng, &r.Rating, &r.PriceRange, &r.Type); err != nil {
			continue
		}
		
		if userLat != 0 && userLng != 0 {
			r.DistanceKm = CalculateDistance(userLat, userLng, r.Lat, r.Lng)
		}
		
		r.Menu = []models.MenuItem{}
		results = append(results, r)
	}

	return results, len(results), nil
}

// GetRestaurantDetail: Lấy chi tiết nhà hàng, bao gồm menu và reviews
// Chưa hoàn thiện vì còn thiếu bảng ảnh, nhưng sẽ trả về được menu và reviews để handler có thể hiển thị chi tiết.
func GetRestaurantDetail(ctx context.Context, id int) (*models.RestaurantDetail, error) {
    // 1. Lấy thông tin gốc của quán
    query := `
        SELECT id, name, address, lat, lng, rating, price_range, 
               open_time, close_time, type, created_at
        FROM Restaurants WHERE id = @id
    `
    var rd models.RestaurantDetail
    err := db.QueryRowContext(ctx, query, sql.Named("id", id)).Scan(
        &rd.ID, &rd.Name, &rd.Address, &rd.Lat, &rd.Lng, &rd.Rating, 
        &rd.PriceRange, &rd.OpenTime, &rd.CloseTime, &rd.Type, &rd.CreatedAt,
    )
    if err == sql.ErrNoRows {
        return nil, fmt.Errorf("không tìm thấy nhà hàng")
    }
    if err != nil {
        return nil, err
    }

    // 2. Lấy Menu (Dùng hàm có sẵn để lấy menu theo restaurant ID)
    menuMap, err := getMenusByRestaurantIDs(ctx, []int{id})
    if err == nil {
        rd.Menu = menuMap[id]
    }

    // 3. Lấy Reviews để làm phần đánh giá khách hàng
    reviews, err := GetReviewsByRestaurant(ctx, id)
    if err == nil {
        rd.UserRatings = reviews
    }

    // 4. Mock thêm mảng ảnh (nếu SQL chưa có bảng ảnh riêng)
    rd.Images = []string{"banner.jpg", "view_quan.jpg"}

    return &rd, nil
}

// GetPopularRestaurants: Lấy danh sách quán ăn uy tín cho trang chủ
func GetPopularRestaurants(ctx context.Context, limit int) ([]models.Restaurant, error) {
	// Lấy những quán có Rating cao nhất, giới hạn số lượng (ví dụ: top 6 quán)
	query := `
		SELECT TOP (@limit) 
			id, name, address, lat, lng, rating, price_range, 
			open_time, close_time, type
		FROM Restaurants
		ORDER BY rating DESC, id DESC
	`

	rows, err := db.QueryContext(ctx, query, sql.Named("limit", limit))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var restaurants []models.Restaurant
	for rows.Next() {
		var r models.Restaurant
		err := rows.Scan(
			&r.ID, &r.Name, &r.Address, &r.Lat, &r.Lng, 
			&r.Rating, &r.PriceRange, &r.OpenTime, &r.CloseTime, &r.Type,
		)
		if err != nil {
			continue
		}
		
		// Gán mảng rỗng cho Menu để tránh bị null khi trả về JSON
		r.Menu = []models.MenuItem{}
		restaurants = append(restaurants, r)
	}

	return restaurants, nil
}

// GetTrendingDishes: Lấy quán ăn dựa trên các món ăn đang nổi tiếng
func GetTrendingDishes(ctx context.Context, limit int) ([]map[string]interface{}, error) {
	// Query lấy món ăn trending kèm thông tin quán sở hữu món đó
	query := `
		SELECT TOP (@limit) 
			m.id AS dish_id, m.name AS dish_name, m.price, m.description, m.ingredients,
			r.id AS restaurant_id, r.name AS restaurant_name, r.address, r.rating, r.type
		FROM MenuItems m
		JOIN Restaurants r ON m.restaurant_id = r.id
		ORDER BY r.rating DESC, m.price DESC -- Ưu tiên quán xịn và món đặc sắc
	`

	rows, err := db.QueryContext(ctx, query, sql.Named("limit", limit))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var trendingList []map[string]interface{}
	for rows.Next() {
		var dID, rID int
		var dName, dDesc, dIngre, rName, rAddr, rType string
		var price, rating float64

		err := rows.Scan(&dID, &dName, &price, &dDesc, &dIngre, &rID, &rName, &rAddr, &rating, &rType)
		if err != nil {
			continue
		}

		// Logic tạo huy hiệu (Badge) tự động
		badge := "Popular"
		if rating >= 4.5 {
			badge = "Must try"
		}

		// Tạo cấu trúc dữ liệu xoay quanh món ăn nổi tiếng
		item := map[string]interface{}{
			"dish_info": map[string]interface{}{
				"id":          dID,
				"name":        dName,
				"price":       price,
				"description": dDesc,
				"image_url":   fmt.Sprintf("https://storage.yummap.vn/dishes/%d.jpg", dID), // URL ảnh món ăn
				"badge":       badge,
			},
			"restaurant_info": map[string]interface{}{
				"id":      rID,
				"name":    rName,
				"address": rAddr,
				"rating":  rating,
				"type":    rType,
			},
		}
		trendingList = append(trendingList, item)
	}

	return trendingList, nil
}