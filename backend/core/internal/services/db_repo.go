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
	"sort"
	"strings"
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
	user := os.Getenv("DB_USER")        
	password := os.Getenv("DB_PASSWORD") 

	connStr := fmt.Sprintf("sqlserver://%s:%s@%s:%s?database=%s&encrypt=true&trustServerCertificate=true",
		user, password, host, port, dbName)

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

	log.Println("[DB] Kết nối Database thành công.")
	log.Println("[DB] Database:", os.Getenv("DB_NAME"))
}

func GetDB() *sql.DB {
	return db
}


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
	} else {
		_, _ = db.ExecContext(ctx, `
			UPDATE Users
			SET name = CASE WHEN name = '' OR name IS NULL THEN @name ELSE name END,
			    avatar_url = CASE WHEN @avatar != '' THEN @avatar ELSE avatar_url END,
			    updated_at = GETDATE()
			WHERE id = @userID
		`,
			sql.Named("name", name),
			sql.Named("avatar", avatar),
			sql.Named("userID", userID),
		)
	}

	return GetUserByID(ctx, userID)
}

func GetUserByID(ctx context.Context, userID int) (*models.User, error) {
	if db == nil {
		return nil, fmt.Errorf("database not initialized")
	}

	var user models.User
	query := `SELECT id, email, name, avatar_url, created_at, updated_at FROM users WHERE id = @p1`

	err := db.QueryRowContext(ctx, query, sql.Named("p1", userID)).Scan(
		&user.ID,
		&user.Email,
		&user.Name,
		&user.AvatarURL,
		&user.CreatedAt,
		&user.UpdatedAt,
	)

	if err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("user not found")
		}
		return nil, fmt.Errorf("failed to get user: %w", err)
	}

	fmt.Printf("GetUserByID - UserID: %d, AvatarURL: '%s'\n", user.ID, user.AvatarURL)

	return &user, nil
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

	menuMap, err := getMenusByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Menu = menuMap[restaurants[i].ID]
		}
	}

	imageMap, err := getImagesByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Images = imageMap[restaurants[i].ID]
		}
	}

	return restaurants, nil
}

func getMenusByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.MenuItem, error) {
	if len(ids) == 0 {
		return make(map[int][]models.MenuItem), nil
	}

	placeholders := make([]string, len(ids))
	args := make([]interface{}, len(ids))
	for i, id := range ids {
		paramName := fmt.Sprintf("id%d", i)
		placeholders[i] = "@" + paramName
		args[i] = sql.Named(paramName, id)
	}

	query := fmt.Sprintf(`
		SELECT restaurant_id, id, name, description, price, food_type, ingredients, story
		FROM MenuItems 
		WHERE restaurant_id IN (%s)
	`, strings.Join(placeholders, ","))

	log.Printf("[DEBUG_DB] Executing Query: %s", query)
	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.MenuItem)
	totalItemsFetched := 0
	for rows.Next() {
		var item models.MenuItem
		var description, ingredients, story sql.NullString

		if err := rows.Scan(
			&item.RestaurantID, &item.ID, &item.Name, &description,
			&item.Price, &item.FoodType, &ingredients, &story,
		); err != nil {
			log.Printf("[DB_SCAN_ERROR] Lỗi khi đọc dòng MenuItem: %v", err)
			continue 
		}

		if description.Valid {
			item.Description = description.String
		}
		if ingredients.Valid {
			item.Ingredients = ingredients.String
		}
		if story.Valid {
			item.Story = story.String
		}

		result[item.RestaurantID] = append(result[item.RestaurantID], item)
		totalItemsFetched++
	}

	
	var allItemIDs []int
	for _, items := range result {
		for _, itm := range items {
			allItemIDs = append(allItemIDs, itm.ID)
		}
	}

	if len(allItemIDs) > 0 {
		dishImgMap, err := getImagesByMenuItemIDs(ctx, allItemIDs)
		if err != nil {
			log.Printf("[DB] Lỗi lấy ảnh món ăn: %v", err)
			return result, nil
		}

		for resID, items := range result {
			for j := range items {
				if imgs, ok := dishImgMap[items[j].ID]; ok {
					result[resID][j].Images = imgs
				} else {
					result[resID][j].Images = []models.DishImage{}
				}
			}
		}
	}

	return result, nil
}

func getImagesByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.RestaurantImage, error) {
	// Sử dụng parameterized query để tránh SQL injection
	placeholders := make([]string, len(ids))
	args := make([]interface{}, len(ids))
	for i, id := range ids {
		paramName := fmt.Sprintf("id%d", i)
		placeholders[i] = "@" + paramName
		args[i] = sql.Named(paramName, id)
	}

	query := fmt.Sprintf(`
		SELECT id, restaurant_id, image_url, caption, is_thumbnail, created_at
		FROM RestaurantImages
		WHERE restaurant_id IN (%s)
		ORDER BY is_thumbnail DESC
	`, strings.Join(placeholders, ","))

	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.RestaurantImage)
	for rows.Next() {
		var img models.RestaurantImage
		var restaurantID int
		var caption sql.NullString
		if err := rows.Scan(
			&img.ID, &restaurantID, &img.ImageURL,
			&caption, &img.IsThumbnail, &img.CreatedAt,
		); err != nil {
			continue
		}
		if caption.Valid {
			img.Caption = caption.String
		}
		result[restaurantID] = append(result[restaurantID], img)
	}
	return result, nil
}

func getImagesByMenuItemIDs(ctx context.Context, ids []int) (map[int][]models.DishImage, error) {
	if len(ids) == 0 {
		return make(map[int][]models.DishImage), nil
	}

	placeholders := make([]string, len(ids))
	args := make([]interface{}, len(ids))
	for i, id := range ids {
		paramName := fmt.Sprintf("id%d", i)
		placeholders[i] = "@" + paramName
		args[i] = sql.Named(paramName, id)
	}

	query := fmt.Sprintf(`
		SELECT id, menu_item_id, image_url, caption, is_thumbnail, created_at
		FROM DishImages
		WHERE menu_item_id IN (%s)
		ORDER BY is_thumbnail DESC
	`, strings.Join(placeholders, ","))

	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.DishImage)
	for rows.Next() {
		var img models.DishImage
		var caption sql.NullString
		if err := rows.Scan(&img.ID, &img.MenuItemID, &img.ImageURL, &caption, &img.IsThumbnail, &img.CreatedAt); err != nil {
			continue
		}
		if caption.Valid {
			img.Caption = caption.String
		}
		result[img.MenuItemID] = append(result[img.MenuItemID], img)
	}
	return result, nil
}

func CreateReview(ctx context.Context, rv models.UserRating) (*models.UserRating, error) {
	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return nil, fmt.Errorf("CreateReview begin tx: %w", err)
	}
	defer tx.Rollback() 

	row := tx.QueryRowContext(ctx, `
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
		return nil, fmt.Errorf("CreateReview scan rating: %w", err)
	}

	if len(rv.Images) > 0 {
		stmt, err := tx.PrepareContext(ctx, `
			INSERT INTO UserRatingImages (user_rating_id, image_url, created_at)
			OUTPUT INSERTED.id, INSERTED.created_at
			VALUES (@ratingId, @imgUrl, GETDATE())
		`)
		if err != nil {
			return nil, fmt.Errorf("CreateReview prepare img stmt: %w", err)
		}
		defer stmt.Close()

		for i, img := range rv.Images {
			var newImgID int
			var newImgCreatedAt time.Time

			err := stmt.QueryRowContext(ctx,
				sql.Named("ratingId", rv.ID),
				sql.Named("imgUrl", img.ImageURL),
			).Scan(&newImgID, &newImgCreatedAt)

			if err != nil {
				return nil, fmt.Errorf("CreateReview insert img failed at index %d: %w", i, err)
			}

			rv.Images[i].ID = newImgID
			rv.Images[i].UserRatingID = rv.ID
			rv.Images[i].CreatedAt = newImgCreatedAt
		}
	} else {
		rv.Images = []models.UserRatingImage{}
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("CreateReview commit tx: %w", err)
	}

	return &rv, nil
}

func getImagesByUserRatingIDs(ctx context.Context, ratingIDs []int) (map[int][]models.UserRatingImage, error) {
	result := make(map[int][]models.UserRatingImage)
	if len(ratingIDs) == 0 {
		return result, nil
	}

	placeholders := make([]string, len(ratingIDs))
	args := make([]interface{}, len(ratingIDs))
	for i, id := range ratingIDs {
		paramName := fmt.Sprintf("rid%d", i)
		placeholders[i] = "@" + paramName
		args[i] = sql.Named(paramName, id)
	}

	query := fmt.Sprintf(`
		SELECT id, user_rating_id, image_url, created_at
		FROM UserRatingImages
		WHERE user_rating_id IN (%s)
		ORDER BY id ASC
	`, strings.Join(placeholders, ","))

	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var img models.UserRatingImage
		if err := rows.Scan(&img.ID, &img.UserRatingID, &img.ImageURL, &img.CreatedAt); err != nil {
			continue
		}
		result[img.UserRatingID] = append(result[img.UserRatingID], img)
	}
	return result, nil
}

func GetReviewsByRestaurant(ctx context.Context, restaurantID int) ([]models.UserRating, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT ur.id, ur.user_id, ISNULL(u.name, N'Ẩn danh'), ISNULL(u.avatar_url, ''), ur.restaurant_id, ur.rating, ur.comment, ur.created_at
		FROM UserRatings ur
		LEFT JOIN Users u ON ur.user_id = u.id
		WHERE ur.restaurant_id = @rid
		ORDER BY ur.created_at DESC
	`, sql.Named("rid", restaurantID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var reviews []models.UserRating
	var reviewIDs []int

	for rows.Next() {
		var rv models.UserRating
		if err := rows.Scan(&rv.ID, &rv.UserID, &rv.UserName, &rv.UserAvatar, &rv.RestaurantID, &rv.Rating, &rv.Comment, &rv.CreatedAt); err != nil {
			continue
		}
		rv.Images = []models.UserRatingImage{} 
		reviews = append(reviews, rv)
		reviewIDs = append(reviewIDs, rv.ID)
	}

	if len(reviewIDs) == 0 {
		return []models.UserRating{}, nil
	}

	imgMap, err := getImagesByUserRatingIDs(ctx, reviewIDs)
	if err == nil {
		for i := range reviews {
			if imgs, found := imgMap[reviews[i].ID]; found {
				reviews[i].Images = imgs
			}
		}
	}

	return reviews, nil
}

func UpdateReview(ctx context.Context, reviewID int, userID int, update models.UserRating) error {
	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return fmt.Errorf("UpdateReview begin tx: %w", err)
	}
	defer tx.Rollback() 

	result, err := tx.ExecContext(ctx, `
		UPDATE UserRatings SET rating = @rating, comment = @comment
		WHERE id = @id AND user_id = @uid
	`,
		sql.Named("rating", update.Rating),
		sql.Named("comment", update.Comment),
		sql.Named("id", reviewID),
		sql.Named("uid", userID),
	)
	if err != nil {
		return fmt.Errorf("UpdateReview update rating: %w", err)
	}

	n, _ := result.RowsAffected()
	if n == 0 {
		return fmt.Errorf("không tìm thấy review hoặc không có quyền")
	}

	_, err = tx.ExecContext(ctx, `
		DELETE FROM UserRatingImages WHERE user_rating_id = @id
	`, sql.Named("id", reviewID))
	if err != nil {
		return fmt.Errorf("UpdateReview delete old images: %w", err)
	}

	if len(update.Images) > 0 {
		stmt, err := tx.PrepareContext(ctx, `
			INSERT INTO UserRatingImages (user_rating_id, image_url, created_at)
			VALUES (@ratingId, @imgUrl, GETDATE())
		`)
		if err != nil {
			return fmt.Errorf("UpdateReview prepare img stmt: %w", err)
		}
		defer stmt.Close()

		for _, img := range update.Images {
			_, err := stmt.ExecContext(ctx,
				sql.Named("ratingId", reviewID),
				sql.Named("imgUrl", img.ImageURL),
			)
			if err != nil {
				return fmt.Errorf("UpdateReview insert image failed: %w", err)
			}
		}
	}

	if err := tx.Commit(); err != nil {
		return fmt.Errorf("UpdateReview commit tx: %w", err)
	}

	return nil
}

func DeleteReview(ctx context.Context, reviewID int, userID int) error {
	rows, err := db.QueryContext(ctx, `
		SELECT uri.image_url FROM UserRatingImages uri
		INNER JOIN UserRatings ur ON uri.user_rating_id = ur.id
		WHERE ur.id = @id AND ur.user_id = @uid
	`, sql.Named("id", reviewID), sql.Named("uid", userID))

	var imageUrls []string
	if err == nil {
		for rows.Next() {
			var url string
			if err := rows.Scan(&url); err == nil {
				imageUrls = append(imageUrls, url)
			}
		}
		rows.Close()
	}

	result, err := db.ExecContext(ctx, `
		DELETE FROM UserRatings WHERE id = @id AND user_id = @uid
	`,
		sql.Named("id", reviewID),
		sql.Named("uid", userID),
	)
	if err != nil {
		return fmt.Errorf("DeleteReview: %w", err)
	}

	n, _ := result.RowsAffected()
	if n == 0 {
		return fmt.Errorf("không tìm thấy review hoặc không có quyền")
	}

	for _, url := range imageUrls {
		filePath := strings.TrimPrefix(url, "/")
		if err := os.Remove(filePath); err != nil {
			log.Printf("[WARN] Không thể xóa file ảnh vật lý %s: %v", filePath, err)
		}
	}

	return nil
}

func updateAvgRating(restaurantID int) {
	_, err := db.Exec(`
		UPDATE Restaurants
		SET rating = (SELECT AVG(CAST(rating AS FLOAT)) FROM UserRatings WHERE restaurant_id = @rid)
		WHERE id = @rid
	`, sql.Named("rid", restaurantID))

	if err != nil {
		log.Printf("[DB] Lỗi cập nhật rating trung bình: %v", err)
	}
}

func GetForumPostsByRestaurantID(ctx context.Context, restaurantID int) ([]models.Post, error) {
	query := `
		SELECT TOP 5 id, author_id, prefix, title, summary, thumbnail_url, 
		             type, view_count, reply_count, is_locked, created_at, updated_at
		FROM Posts
		WHERE restaurant_id = @rid
		ORDER BY created_at DESC
	`
	rows, err := db.QueryContext(ctx, query, sql.Named("rid", restaurantID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var posts []models.Post
	for rows.Next() {
		var p models.Post
		err := rows.Scan(
			&p.ID, &p.AuthorID, &p.Prefix, &p.Title, &p.Summary, &p.ThumbnailURL,
			&p.Type, &p.ViewCount, &p.ReplyCount, &p.IsLocked, &p.CreatedAt, &p.UpdatedAt,
		)
		if err != nil {
			continue
		}
		p.Comments = []models.Comment{}
		posts = append(posts, p)
	}
	return posts, nil
}

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

func RegisterLocal(ctx context.Context, username, password, name, email string) (*models.User, error) {
	var count int
	row := db.QueryRowContext(ctx, `
		SELECT COUNT(*) FROM UserAuth 
		WHERE provider = 'local' AND provider_id = @username
	`, sql.Named("username", username))
	row.Scan(&count)
	if count > 0 {
		return nil, fmt.Errorf("username đã được sử dụng")
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return nil, fmt.Errorf("lỗi hash password")
	}

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

	if err := bcrypt.CompareHashAndPassword([]byte(passwordHash), []byte(password)); err != nil {
		return nil, fmt.Errorf("username hoặc mật khẩu không đúng")
	}

	return GetUserByID(ctx, userID)
}

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

	return token, email, nil 
}

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


func CalculateDistance(lat1, lng1, lat2, lng2 float64) float64 {
	const EarthRadius = 6371.0 

	dLat := (lat2 - lat1) * (math.Pi / 180)
	dLng := (lng2 - lng1) * (math.Pi / 180)

	a := math.Sin(dLat/2)*math.Sin(dLat/2) +
		math.Cos(lat1*(math.Pi/180))*math.Cos(lat2*(math.Pi/180))*
			math.Sin(dLng/2)*math.Sin(dLng/2)

	c := 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))
	return EarthRadius * c
}

func isOpenNow(openTime, closeTime string) bool {
	now := time.Now()
	parse := func(s string) time.Time {
		t, _ := time.Parse("15:04", s)
		return time.Date(now.Year(), now.Month(), now.Day(),
			t.Hour(), t.Minute(), 0, 0, now.Location())
	}

	open := parse(openTime)
	close := parse(closeTime)

	if open.Before(close) {
		return now.After(open) && now.Before(close)
	}
	return now.After(open) || now.Before(close)
}

func SearchRestaurants(
	ctx context.Context,
	q string,
	minPrice *float64, 
	maxPrice *float64,
	filters []string,
	sortBy string,
	userLat, userLng float64,
	limit int,
) ([]models.Restaurant, int, error) {

	var conditions []string
	var args []interface{}
	argCount := 1


	if q != "" {
		searchTerm := "%" + q + "%"

		conditions = append(conditions, fmt.Sprintf(`
			(
				r.name LIKE @p%d OR
				r.type LIKE @p%d OR
				EXISTS (
					SELECT 1
					FROM MenuItems m
					WHERE m.restaurant_id = r.id
					AND m.name LIKE @p%d
				)
			)
		`, argCount, argCount, argCount))

		args = append(args, searchTerm)
		argCount++
	}


	if minPrice != nil {
		conditions = append(conditions, fmt.Sprintf("r.price_range >= @p%d", argCount))
		args = append(args, *minPrice)
		argCount++
	}

	if maxPrice != nil {
		conditions = append(conditions, fmt.Sprintf("r.price_range <= @p%d", argCount))
		args = append(args, *maxPrice)
		argCount++
	}

	for _, filter := range filters {
		switch filter {
		case "favorite":
			conditions = append(conditions, "r.rating >= 4.5")
		case "good_rating":
			conditions = append(conditions, "r.rating >= 4.0")
		case "restaurant":
			conditions = append(conditions, "r.type LIKE N'%sang trọng%'")
		case "popular":
			conditions = append(conditions, "r.type LIKE N'%bình dân%'")
		case "bakery":
			conditions = append(conditions, "r.type LIKE N'%bakery%'")
		case "family":
			conditions = append(conditions, "r.type LIKE N'%gia đình%'")
		}
	}

	whereClause := ""
	if len(conditions) > 0 {
		whereClause = "WHERE " + strings.Join(conditions, " AND ")
	}

	query := fmt.Sprintf(`
		SELECT DISTINCT
			r.id,
			r.name,
			r.address,
			r.lat,
			r.lng,
			r.rating,
			r.price_range,
			r.open_time,
			r.close_time,
			r.type
		FROM Restaurants r
		%s
	`, whereClause)

	rows, err := db.QueryContext(ctx, query, args...)
	if err != nil {
		return nil, 0, fmt.Errorf("query restaurants: %w", err)
	}
	defer rows.Close()

	var restaurants []models.Restaurant
	var ids []int

	for rows.Next() {
		var r models.Restaurant

		err := rows.Scan(
			&r.ID,
			&r.Name,
			&r.Address,
			&r.Lat,
			&r.Lng,
			&r.Rating,
			&r.PriceRange,
			&r.OpenTime,
			&r.CloseTime,
			&r.Type,
		)
		if err != nil {
			continue
		}

		r.Images = []models.RestaurantImage{}
		r.Menu = []models.MenuItem{}

		
		if userLat != 0 && userLng != 0 {
			r.DistanceKm = CalculateDistance(userLat, userLng, r.Lat, r.Lng)
		}

		
		r.IsOpen = isOpenNow(r.OpenTime, r.CloseTime)

		restaurants = append(restaurants, r)
		ids = append(ids, r.ID)
	}

	if err := rows.Err(); err != nil {
		return nil, 0, fmt.Errorf("scan restaurants: %w", err)
	}

	if len(ids) == 0 {
		return []models.Restaurant{}, 0, nil
	}

	imageMap, err := getImagesByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			if imgs, found := imageMap[restaurants[i].ID]; found {
				restaurants[i].Images = imgs
			}
		}
	}

	menuPlaceholders := make([]string, len(ids))
	menuArgs := make([]interface{}, len(ids))
	for i, id := range ids {
		menuPlaceholders[i] = fmt.Sprintf("@mid%d", i)
		menuArgs[i] = sql.Named(fmt.Sprintf("mid%d", i), id)
	}

	menuQuery := fmt.Sprintf(`
		SELECT
			id,
			restaurant_id,
			name,
			description,
			price,
			food_type,
			ingredients,
			story
		FROM MenuItems
		WHERE restaurant_id IN (%s)
	`, strings.Join(menuPlaceholders, ","))

	if q != "" {
		menuQuery += fmt.Sprintf(" AND name LIKE @mq%d", len(ids))
		menuArgs = append(menuArgs, sql.Named(fmt.Sprintf("mq%d", len(ids)), "%"+q+"%"))
	}

	menuRows, err := db.QueryContext(ctx, menuQuery, menuArgs...)
	if err == nil {
		defer menuRows.Close()

		menuMap := make(map[int][]models.MenuItem)

		for menuRows.Next() {
			var mi models.MenuItem

			err := menuRows.Scan(
				&mi.ID,
				&mi.RestaurantID,
				&mi.Name,
				&mi.Description,
				&mi.Price,
				&mi.FoodType,
				&mi.Ingredients,
				&mi.Story,
			)
			if err == nil {
				menuMap[mi.RestaurantID] = append(menuMap[mi.RestaurantID], mi)
			}
		}

		for i := range restaurants {
			if items, found := menuMap[restaurants[i].ID]; found {
				restaurants[i].Menu = items
			}
		}
	}

	switch sortBy {
	case "rating":
		sort.Slice(restaurants, func(i, j int) bool {
			return restaurants[i].Rating > restaurants[j].Rating
		})
	case "distance":
		if userLat != 0 && userLng != 0 {
			sort.Slice(restaurants, func(i, j int) bool {
				return restaurants[i].DistanceKm < restaurants[j].DistanceKm
			})
		}
	case "price_asc":
		sort.Slice(restaurants, func(i, j int) bool {
			return restaurants[i].PriceRange < restaurants[j].PriceRange
		})
	case "price_desc":
		sort.Slice(restaurants, func(i, j int) bool {
			return restaurants[i].PriceRange > restaurants[j].PriceRange
		})
	}

	totalCount := len(restaurants)
	if totalCount > limit {
		restaurants = restaurants[:limit]
	}

	return restaurants, totalCount, nil
}

func GetRestaurantDetail(ctx context.Context, id int) (*models.RestaurantDetail, error) {
	query := `
		SELECT 
			r.id, r.name, r.address, r.lat, r.lng, r.rating, r.price_range, 
			r.open_time, r.close_time, r.type, r.created_at,
			ISNULL(s.story, '') AS story
		FROM Restaurants r
		LEFT JOIN RestaurantStories s ON r.id = s.restaurant_id
		WHERE r.id = @id
	`
	var rd models.RestaurantDetail
	err := db.QueryRowContext(ctx, query, sql.Named("id", id)).Scan(
		&rd.ID, &rd.Name, &rd.Address, &rd.Lat, &rd.Lng, &rd.Rating,
		&rd.PriceRange, &rd.OpenTime, &rd.CloseTime, &rd.Type, &rd.CreatedAt, &rd.Story,
	)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("không tìm thấy nhà hàng")
	}
	if err != nil {
		return nil, err
	}

	rd.IsOpen = isOpenNow(rd.OpenTime, rd.CloseTime)

	menuMap, err := getMenusByRestaurantIDs(ctx, []int{id})
	if err == nil {
		rd.Menu = menuMap[id]
	}

	reviews, err := GetReviewsByRestaurant(ctx, id)
	if err == nil {
		rd.UserRatings = reviews
	}

	imageMap, err := getImagesByRestaurantIDs(ctx, []int{id})
	if err == nil && len(imageMap[id]) > 0 {
		rd.Images = imageMap[id]
	} else {
		rd.Images = []models.RestaurantImage{}
	}

	forumPosts, err := GetForumPostsByRestaurantID(ctx, rd.ID)
	if err == nil {
		rd.ForumPosts = forumPosts
	} else {
		rd.ForumPosts = []models.Post{}
	}

	return &rd, nil
}

func GetPopularRestaurants(ctx context.Context, limit int) ([]models.Restaurant, error) {
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
	var ids []int

	for rows.Next() {
		var r models.Restaurant
		err := rows.Scan(
			&r.ID, &r.Name, &r.Address, &r.Lat, &r.Lng,
			&r.Rating, &r.PriceRange, &r.OpenTime, &r.CloseTime, &r.Type,
		)
		if err != nil {
			continue
		}

		r.Menu = []models.MenuItem{}
		r.Images = []models.RestaurantImage{}

		r.IsOpen = isOpenNow(r.OpenTime, r.CloseTime)

		restaurants = append(restaurants, r)
		ids = append(ids, r.ID)
	}

	if len(ids) > 0 {
		imageMap, err := getImagesByRestaurantIDs(ctx, ids)
		if err == nil {
			for i := range restaurants {
				if imgs, found := imageMap[restaurants[i].ID]; found {
					restaurants[i].Images = imgs
				}
			}
		}
	}

	return restaurants, nil
}

func GetTrendingDishes(ctx context.Context, limit int) ([]map[string]interface{}, error) {
	query := `
		WITH RankedDishes AS (
			SELECT 
				m.id AS dish_id, 
				m.name AS dish_name, 
				m.price, 
				m.description, 
				m.ingredients,
				r.id AS restaurant_id, 
				r.name AS restaurant_name, 
				r.address, 
				r.lat,
				r.lng,
				r.rating, 
				r.type,
				r.open_time,
				r.close_time,
				ROW_NUMBER() OVER (PARTITION BY r.id ORDER BY m.price DESC) AS rn
			FROM MenuItems m
			JOIN Restaurants r ON m.restaurant_id = r.id
		)
		SELECT TOP (@limit) 
			dish_id, dish_name, price, description, ingredients,
			restaurant_id, restaurant_name, address, lat, lng, rating, type, open_time, close_time
		FROM RankedDishes
		WHERE rn = 1
		ORDER BY rating DESC, price DESC
	`

	rows, err := db.QueryContext(ctx, query, sql.Named("limit", limit))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var dishIDs []int
	var tempItems []map[string]interface{}

	for rows.Next() {
		var dID, rID int
		var dName, dDesc, dIngre, rName, rAddr, rType string
		var price, rating, rLat, rLng float64
		var openTime, closeTime string

		if err := rows.Scan(&dID, &dName, &price, &dDesc, &dIngre, &rID, &rName, &rAddr, &rLat, &rLng, &rating, &rType, &openTime, &closeTime); err != nil {
			continue
		}

		badge := "Popular"
		if rating >= 4.5 {
			badge = "Must try"
		}

		item := map[string]interface{}{
			"dish_info": map[string]interface{}{
				"id":          dID,
				"name":        dName,
				"price":       price,
				"description": dDesc,
				"badge":       badge,
				"image_url":   "",
			},
			"restaurant_info": map[string]interface{}{
				"id":         rID,
				"name":       rName,
				"address":    rAddr,
				"lat":        rLat,
				"lng":        rLng,
				"rating":     rating,
				"type":       rType,
				"is_open":    isOpenNow(openTime, closeTime),
				"open_time":  openTime,
				"close_time": closeTime,
			},
		}

		tempItems = append(tempItems, item)
		dishIDs = append(dishIDs, dID)
	}

	if len(dishIDs) > 0 {
		imageMap, err := getImagesByMenuItemIDs(ctx, dishIDs)
		if err == nil {
			for _, item := range tempItems {
				dishInfo := item["dish_info"].(map[string]interface{})
				dID := dishInfo["id"].(int)

				images := imageMap[dID]
				var finalImg string

				for _, img := range images {
					if img.IsThumbnail {
						finalImg = img.ImageURL
						break
					}
				}

				if finalImg == "" && len(images) > 0 {
					finalImg = images[0].ImageURL
				}

				dishInfo["image_url"] = finalImg
			}
		}
	}

	if tempItems == nil {
		return []map[string]interface{}{}, nil
	}

	return tempItems, nil
}

func UpdateAvgRating(restaurantID int) {
	_, err := db.Exec(`
		UPDATE Restaurants
		SET rating = (SELECT AVG(CAST(rating AS FLOAT)) FROM UserRatings WHERE restaurant_id = @rid)
		WHERE id = @rid
	`, sql.Named("rid", restaurantID))
	if err != nil {
		log.Printf("[DB] Lỗi cập nhật rating trung bình: %v", err)
	}
}


func SearchRestaurantsForChatbot(ctx context.Context, entities map[string]interface{}) ([]models.Restaurant, error) {
	query := `
		SELECT r.id, r.name, r.address, r.lat, r.lng, r.rating, r.price_range, r.open_time, r.close_time, r.type
		FROM Restaurants r
		WHERE 1=1
	`
	var namedArgs []interface{}

	if dish, ok := entities["dish"].(string); ok && dish != "" {
		query += ` AND (r.name LIKE @dish OR r.id IN (SELECT restaurant_id FROM MenuItems WHERE name LIKE @dish))`
		namedArgs = append(namedArgs, sql.Named("dish", "%"+dish+"%"))
	}

	if location, ok := entities["location"].(string); ok && location != "" {
		query += ` AND r.address LIKE @loc`
		namedArgs = append(namedArgs, sql.Named("loc", "%"+location+"%"))
	}

	query += ` ORDER BY r.rating DESC OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY`

	rows, err := db.QueryContext(ctx, query, namedArgs...)
	if err != nil {
		return nil, fmt.Errorf("SearchRestaurantsForChatbot: %w", err)
	}
	defer rows.Close()

	var restaurants []models.Restaurant
	var ids []int

	for rows.Next() {
		var r models.Restaurant
		if err := rows.Scan(
			&r.ID, &r.Name, &r.Address, &r.Lat, &r.Lng,
			&r.Rating, &r.PriceRange, &r.OpenTime, &r.CloseTime, &r.Type,
		); err != nil {
			continue
		}
		restaurants = append(restaurants, r)
		ids = append(ids, r.ID)
	}

	if len(ids) == 0 {
		return restaurants, nil
	}

	menuMap, err := getMenusByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Menu = menuMap[restaurants[i].ID]
		}
	}

	imageMap, err := getImagesByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Images = imageMap[restaurants[i].ID]
		}
	}

	return restaurants, nil
}


func tokenize(text string) map[string]bool {
	replacer := strings.NewReplacer(",", " ", ".", " ", ";", " ", ":", " ", "!", " ", "?", " ", "(", " ", ")", " ")
	text = replacer.Replace(text)

	words := strings.Fields(strings.ToLower(text))
	tokenSet := make(map[string]bool)
	for _, word := range words {
		if len(word) > 2 {
			tokenSet[word] = true
		}
	}
	return tokenSet
}


func CalculateChatRelevanceScores(ctx context.Context, userID int, restaurants []models.Restaurant) (map[int]int, error) {
	since := time.Now().AddDate(0, 0, -7)
	rows, err := db.QueryContext(ctx, `
		SELECT user_message FROM ChatHistory 
		WHERE user_id = @uid AND created_at >= @since
	`, sql.Named("uid", userID), sql.Named("since", since))
	if err != nil {
		return nil, fmt.Errorf("lỗi lấy lịch sử chat gần đây: %w", err)
	}
	defer rows.Close()

	var allUserMessages strings.Builder
	for rows.Next() {
		var msg string
		if err := rows.Scan(&msg); err == nil {
			allUserMessages.WriteString(msg)
			allUserMessages.WriteString(" ")
		}
	}
	userKeywords := tokenize(allUserMessages.String())

	if len(userKeywords) == 0 {
		return make(map[int]int), nil
	}

	relevanceScores := make(map[int]int)

	for _, r := range restaurants {
		var restaurantContent strings.Builder
		restaurantContent.WriteString(r.Name + " " + r.Type + " ")
		for _, menuItem := range r.Menu {
			restaurantContent.WriteString(menuItem.Name + " " + menuItem.Description + " " + menuItem.Ingredients + " ")
		}
		restaurantTags := tokenize(restaurantContent.String())

		matchCount := 0
		for keyword := range userKeywords {
			if _, found := restaurantTags[keyword]; found {
				matchCount++
			}
		}
		relevanceScores[r.ID] = matchCount
	}

	return relevanceScores, nil
}

type ChatHistoryEntry struct {
	ID          int       `json:"id"`
	UserID      int       `json:"user_id"`
	UserMessage string    `json:"user_message"`
	BotReply    string    `json:"bot_reply"`
	CreatedAt   time.Time `json:"created_at"`
}

type ChatSuggestionLogEntry struct {
	ChatHistoryID  int64
	RestaurantID   int
	RestaurantName string
	Score          float64
}

func SaveChatHistory(ctx context.Context, userID int, userMessage, botReply string) (int64, error) {
	var newID int64
	query := `
		INSERT INTO ChatHistory (user_id, user_message, bot_reply, created_at)
		OUTPUT INSERTED.id
		VALUES (@uid, @userMsg, @botReply, GETDATE())
	`
	row := db.QueryRowContext(ctx, query,
		sql.Named("uid", userID),
		sql.Named("userMsg", userMessage),
		sql.Named("botReply", botReply),
	)
	err := row.Scan(&newID)
	if err != nil {
		log.Printf("[DB] Lỗi lưu lịch sử chat: %v", err)
		return 0, err
	}
	return newID, nil
}

func SaveChatSuggestions(ctx context.Context, chatHistoryID int64, suggestions []ChatSuggestionLogEntry) error {
	if len(suggestions) == 0 {
		return nil
	}

	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return fmt.Errorf("lỗi bắt đầu transaction: %w", err)
	}
	defer tx.Rollback() 

	stmt, err := tx.PrepareContext(ctx, `
		INSERT INTO ChatSuggestionLog (chat_history_id, restaurant_id, restaurant_name, score, created_at)
		VALUES (@chatId, @resId, @resName, @score, GETDATE())
	`,
	)
	if err != nil {
		return fmt.Errorf("lỗi chuẩn bị statement: %w", err)
	}
	defer stmt.Close()

	for _, s := range suggestions {
		_, err := stmt.ExecContext(ctx,
			sql.Named("chatId", chatHistoryID),
			sql.Named("resId", s.RestaurantID),
			sql.Named("resName", s.RestaurantName),
			sql.Named("score", s.Score),
		)
		if err != nil {
			return fmt.Errorf("lỗi thực thi insert cho suggestion (resId: %d): %w", s.RestaurantID, err)
		}
	}

	return tx.Commit() 
}

func GetChatHistoryByUserID(ctx context.Context, userID int) ([]ChatHistoryEntry, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT id, user_id, user_message, bot_reply, created_at
		FROM ChatHistory
		WHERE user_id = @uid
		ORDER BY created_at ASC
	`, sql.Named("uid", userID))
	if err != nil {
		return nil, fmt.Errorf("GetChatHistoryByUserID: %w", err)
	}
	defer rows.Close()

	var history []ChatHistoryEntry
	for rows.Next() {
		var h ChatHistoryEntry
		if err := rows.Scan(&h.ID, &h.UserID, &h.UserMessage, &h.BotReply, &h.CreatedAt); err == nil {
			history = append(history, h)
		}
	}
	return history, nil
}



func UpdateUserName(ctx context.Context, userID int, name string) error {
	_, err := db.ExecContext(ctx, `
        UPDATE Users SET name = @name, updated_at = GETDATE()
        WHERE id = @id
    `,
		sql.Named("name", name),
		sql.Named("id", userID),
	)
	return err
}
