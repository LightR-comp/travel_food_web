package services

import (
	"context"
	"crypto/rand"
	"database/sql"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
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
// CHAT HISTORY
// ============================================================

type ChatHistoryEntry struct {
	ID          int       `json:"id"`
	UserID      int       `json:"user_id"`
	UserMessage string    `json:"user_message"`
	BotReply    string    `json:"bot_reply"`
	CreatedAt   time.Time `json:"created_at"`
}

// SaveChatHistory lưu tin nhắn của user và bot vào DB
func SaveChatHistory(ctx context.Context, userID int, userMessage string, botReply string) error {
	_, err := db.ExecContext(ctx, `
		INSERT INTO ChatHistory (user_id, user_message, bot_reply, created_at)
		VALUES (@uid, @userMsg, @botReply, GETDATE())
	`,
		sql.Named("uid", userID),
		sql.Named("userMsg", userMessage),
		sql.Named("botReply", botReply),
	)
	if err != nil {
		log.Printf("[DB] Lỗi lưu lịch sử chat: %v", err)
	}
	return err
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

	menuMap, err := getMenusByRestaurantIDs(ctx, ids)
	if err == nil {
		for i := range restaurants {
			restaurants[i].Menu = menuMap[restaurants[i].ID]
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

// SearchRestaurantsForChatbot truy vấn quán ăn dựa trên các thực thể intent từ người dùng (Chatbot)
func SearchRestaurantsForChatbot(ctx context.Context, entities map[string]interface{}) ([]models.Restaurant, error) {
	query := `
		SELECT r.id, r.name, r.address, r.lat, r.lng, r.rating, r.price_range, r.open_time, r.close_time, r.type
		FROM Restaurants r
		WHERE 1=1
	`
	var namedArgs []interface{}

	// Lọc theo món ăn (nằm trong tên quán hoặc menu)
	if dish, ok := entities["dish"].(string); ok && dish != "" {
		query += ` AND (r.name LIKE @dish OR r.id IN (SELECT restaurant_id FROM MenuItems WHERE name LIKE @dish))`
		namedArgs = append(namedArgs, sql.Named("dish", "%"+dish+"%"))
	}

	// Lọc theo vị trí (gần đúng qua address)
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

	return restaurants, nil
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
// FORUM
// ============================================================

/*func CreateTopic(ctx context.Context, topic models.ForumTopic) (*models.ForumTopic, error) {
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
}*/

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
