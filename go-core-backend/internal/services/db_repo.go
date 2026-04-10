package services

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"os"

	_ "github.com/denisenkom/go-mssqldb"

	"smart-tourism/internal/models"
)

var db *sql.DB

func InitDB() {
	connStr := os.Getenv("DB_CONNECTION_STRING")
	if connStr == "" {
		log.Fatal("[DB] DB_CONNECTION_STRING chưa được set trong .env")
	}

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
}

// ============================================================
// USER
// ============================================================

func UpsertUser(ctx context.Context, uid, email, name, avatar string) (*models.User, error) {
	query := `
		MERGE Users AS target
		USING (SELECT @uid AS uid) AS source ON target.uid = source.uid
		WHEN MATCHED THEN
			UPDATE SET name = @name, avatar = @avatar, updated_at = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (uid, email, name, avatar, created_at, updated_at)
			VALUES (@uid, @email, @name, @avatar, GETDATE(), GETDATE());
	`
	_, err := db.ExecContext(ctx, query,
		sql.Named("uid", uid),
		sql.Named("email", email),
		sql.Named("name", name),
		sql.Named("avatar", avatar),
	)
	if err != nil {
		return nil, fmt.Errorf("UpsertUser: %w", err)
	}

	return GetUserByUID(ctx, uid)
}

func GetUserByUID(ctx context.Context, uid string) (*models.User, error) {
	row := db.QueryRowContext(ctx, `
		SELECT uid, email, name, avatar,
		       allergies, default_budget, default_people, cuisine_types
		FROM Users WHERE uid = @uid
	`, sql.Named("uid", uid))

	var u models.User
	var allergiesJSON, cuisineJSON sql.NullString

	err := row.Scan(
		&u.UID, &u.Email, &u.Name, &u.Avatar,
		&allergiesJSON, &u.Preferences.DefaultBudget, &u.Preferences.DefaultPeople, &cuisineJSON,
	)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("user không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetUserByUID: %w", err)
	}

	parseJSONStringArray(allergiesJSON.String, &u.Preferences.Allergies)
	parseJSONStringArray(cuisineJSON.String, &u.Preferences.CuisineTypes)

	return &u, nil
}

func UpdateUserPreferences(ctx context.Context, uid string, prefs models.UserPreferences) error {
	allergiesJSON := toJSONArray(prefs.Allergies)
	cuisineJSON := toJSONArray(prefs.CuisineTypes)

	_, err := db.ExecContext(ctx, `
		UPDATE Users SET
			allergies       = @allergies,
			default_budget  = @budget,
			default_people  = @people,
			cuisine_types   = @cuisine,
			updated_at      = GETDATE()
		WHERE uid = @uid
	`,
		sql.Named("allergies", allergiesJSON),
		sql.Named("budget", prefs.DefaultBudget),
		sql.Named("people", prefs.DefaultPeople),
		sql.Named("cuisine", cuisineJSON),
		sql.Named("uid", uid),
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
				r.id, r.name, r.address, r.latitude, r.longitude,
				r.phone, r.description, r.open_time, r.close_time,
				r.image_url, r.cuisine_type, r.avg_rating, r.price_range,
				6371 * 2 * ASIN(SQRT(
					POWER(SIN(RADIANS(r.latitude  - @lat) / 2), 2) +
					COS(RADIANS(@lat)) * COS(RADIANS(r.latitude)) *
					POWER(SIN(RADIANS(r.longitude - @lng) / 2), 2)
				)) AS distance_km
			FROM Restaurants r
			WHERE r.is_active = 1
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
			&r.ID, &r.Name, &r.Address, &r.Latitude, &r.Longitude,
			&r.Phone, &r.Description, &r.OpenTime, &r.CloseTime,
			&r.ImageURL, &r.CuisineType, &r.AvgRating, &r.PriceRange,
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

	reviewMap, err := getReviewsByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Reviews = reviewMap[restaurants[i].ID]
		}
	}

	return restaurants, nil
}

func getMenusByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.MenuItem, error) {
	query := fmt.Sprintf(`
		SELECT restaurant_id, id, name, price, description, ingredients, image_url
		FROM MenuItems
		WHERE restaurant_id IN (%s) AND is_available = 1
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
		var ingredientsJSON sql.NullString
		if err := rows.Scan(
			&restaurantID, &item.ID, &item.Name, &item.Price,
			&item.Description, &ingredientsJSON, &item.ImageURL,
		); err != nil {
			continue
		}
		parseJSONStringArray(ingredientsJSON.String, &item.Ingredients)
		result[restaurantID] = append(result[restaurantID], item)
	}
	return result, nil
}

func getReviewsByRestaurantIDs(ctx context.Context, ids []int) (map[int][]models.Review, error) {
	query := fmt.Sprintf(`
		SELECT rv.restaurant_id, rv.id, rv.user_uid, u.name AS user_name,
		       rv.rating, rv.comment, rv.created_at
		FROM Reviews rv
		LEFT JOIN Users u ON rv.user_uid = u.uid
		WHERE rv.restaurant_id IN (%s)
		ORDER BY rv.created_at DESC
	`, intSliceToSQL(ids))

	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	result := make(map[int][]models.Review)
	for rows.Next() {
		var rv models.Review
		var restaurantID int
		if err := rows.Scan(
			&restaurantID, &rv.ID, &rv.UserUID, &rv.UserName,
			&rv.Rating, &rv.Comment, &rv.CreatedAt,
		); err != nil {
			continue
		}
		result[restaurantID] = append(result[restaurantID], rv)
	}
	return result, nil
}

// ============================================================
// REVIEW
// ============================================================

func CreateReview(ctx context.Context, rv models.Review) (*models.Review, error) {
	row := db.QueryRowContext(ctx, `
		INSERT INTO Reviews (restaurant_id, user_uid, rating, comment, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@rid, @uid, @rating, @comment, GETDATE())
	`,
		sql.Named("rid", rv.RestaurantID),
		sql.Named("uid", rv.UserUID),
		sql.Named("rating", rv.Rating),
		sql.Named("comment", rv.Comment),
	)
	if err := row.Scan(&rv.ID, &rv.CreatedAt); err != nil {
		return nil, fmt.Errorf("CreateReview: %w", err)
	}

	go updateAvgRating(rv.RestaurantID)

	return &rv, nil
}

func GetReviewsByRestaurant(ctx context.Context, restaurantID int) ([]models.Review, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT rv.id, rv.user_uid, u.name, rv.rating, rv.comment, rv.created_at
		FROM Reviews rv
		LEFT JOIN Users u ON rv.user_uid = u.uid
		WHERE rv.restaurant_id = @rid
		ORDER BY rv.created_at DESC
	`, sql.Named("rid", restaurantID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var reviews []models.Review
	for rows.Next() {
		var rv models.Review
		rv.RestaurantID = restaurantID
		rows.Scan(&rv.ID, &rv.UserUID, &rv.UserName, &rv.Rating, &rv.Comment, &rv.CreatedAt)
		reviews = append(reviews, rv)
	}
	return reviews, nil
}

func UpdateReview(ctx context.Context, reviewID int, uid string, update models.Review) error {
	result, err := db.ExecContext(ctx, `
		UPDATE Reviews SET rating = @rating, comment = @comment
		WHERE id = @id AND user_uid = @uid
	`,
		sql.Named("rating", update.Rating),
		sql.Named("comment", update.Comment),
		sql.Named("id", reviewID),
		sql.Named("uid", uid),
	)
	if err != nil {
		return err
	}
	n, _ := result.RowsAffected()
	if n == 0 {
		return fmt.Errorf("không tìm thấy review hoặc không có quyền")
	}

	go updateAvgRating(update.RestaurantID)
	return nil
}

func DeleteReview(ctx context.Context, reviewID int, uid string) error {
	result, err := db.ExecContext(ctx, `
		DELETE FROM Reviews WHERE id = @id AND user_uid = @uid
	`,
		sql.Named("id", reviewID),
		sql.Named("uid", uid),
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
// FORUM
// ============================================================

func CreateTopic(ctx context.Context, topic models.ForumTopic) (*models.ForumTopic, error) {
	row := db.QueryRowContext(ctx, `
		INSERT INTO ForumTopics (user_uid, title, content, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@uid, @title, @content, GETDATE())
	`,
		sql.Named("uid", topic.UserUID),
		sql.Named("title", topic.Title),
		sql.Named("content", topic.Content),
	)
	if err := row.Scan(&topic.ID, &topic.CreatedAt); err != nil {
		return nil, fmt.Errorf("CreateTopic: %w", err)
	}
	return &topic, nil
}

func GetTopics(ctx context.Context) ([]models.ForumTopic, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT t.id, t.user_uid, u.name, t.title, t.content, t.created_at
		FROM ForumTopics t
		LEFT JOIN Users u ON t.user_uid = u.uid
		ORDER BY t.created_at DESC
	`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var topics []models.ForumTopic
	for rows.Next() {
		var t models.ForumTopic
		rows.Scan(&t.ID, &t.UserUID, &t.UserName, &t.Title, &t.Content, &t.CreatedAt)
		topics = append(topics, t)
	}
	return topics, nil
}

func CreateComment(ctx context.Context, comment models.ForumComment) (*models.ForumComment, error) {
	row := db.QueryRowContext(ctx, `
		INSERT INTO ForumComments (topic_id, user_uid, content, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@topicID, @uid, @content, GETDATE())
	`,
		sql.Named("topicID", comment.TopicID),
		sql.Named("uid", comment.UserUID),
		sql.Named("content", comment.Content),
	)
	if err := row.Scan(&comment.ID, &comment.CreatedAt); err != nil {
		return nil, fmt.Errorf("CreateComment: %w", err)
	}
	return &comment, nil
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
