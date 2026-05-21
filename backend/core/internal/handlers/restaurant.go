package handlers

// restaurant.go chứa các handler liên quan đến quán ăn (restaurant)
import (
	"backend/core/internal/models"
	"backend/core/internal/services"
	"context"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

// GET /api/restaurants/search (Bộ lọc & Tìm kiếm cốt lõi)
// Chức năng: Cung cấp "não bộ" xử lý tìm kiếm cho toàn bộ website tại trang Search.
// Cách hoạt động: Nhận các gói tham số (Query Parameters) từ người dùng nhập vào để tạo câu query DB linh hoạt.
// q: Tìm tìm văn bản (Chỉ cần chuỗi này, server sẽ tự đi quét tên món ăn, danh mục menu và cả tên quán).
// min_price & max_price: Khoảng giá (Ví dụ từ 50k đến 100k).
// filters: Lọc riêng (chỉ lấy nhà hàng đánh giá tốt, bình dân...).
// sort: Cách sắp xếp danh sách kết quả (theo rating, theo distance).
// Dữ liệu trả về: Danh sách lớn chứa các Block nhà hàng đạt chuẩn với bộ lọc + con số thống kê total (để in ra có n kết quả).

func SearchRestaurants(c *gin.Context) {
	q := c.Query("q")
	userLat, _ := strconv.ParseFloat(c.Query("lat"), 64)
	userLng, _ := strconv.ParseFloat(c.Query("lng"), 64)
	sortBy := c.DefaultQuery("sort_by", "rating")
	filters := c.QueryArray("filters")
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "20"))

	// =========================
	// PRICE FILTER
	// Chỉ truyền pointer khi query param thực sự được gửi lên
	// =========================
	var minPrice, maxPrice *float64

	if minStr, exists := c.GetQuery("min_price"); exists && minStr != "" {
		if val, err := strconv.ParseFloat(minStr, 64); err == nil {
			minPrice = &val
		}
	}

	if maxStr, exists := c.GetQuery("max_price"); exists && maxStr != "" {
		if val, err := strconv.ParseFloat(maxStr, 64); err == nil {
			maxPrice = &val
		}
	}

	ctx := c.Request.Context()
	results, total, err := services.SearchRestaurants(
		ctx,
		q,
		minPrice,
		maxPrice,
		filters,
		sortBy,
		userLat,
		userLng,
		limit,
	)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "Server Error",
			"data":    nil,
			"error":   err.Error(),
		})
		return
	}

	type CleanRestaurant struct {
		models.Restaurant
		CreatedAt interface{} `json:"created_at,omitempty"`
		UpdatedAt interface{} `json:"updated_at,omitempty"`
	}

	cleanResults := make([]CleanRestaurant, len(results))
	for i, r := range results {
		cleanResults[i] = CleanRestaurant{Restaurant: r}
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Success",
		"data": gin.H{
			"total":       total,
			"restaurants": cleanResults,
		},
		"error": nil,
	})
}

// GET /api/restaurants/:id (Trang Chi Tiết)
// Chức năng: Điểm đáp duy nhất cho Trang Chi Tiết (Detail Page). Lấy thông tin tỉ mỉ của riêng 1 nhà hàng cụ thể. Chữ :id trên link sẽ được thay bằng ID thực (Ví dụ: /api/restaurants/12).
func GetRestaurantDetail(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

    detail, err := services.GetRestaurantDetail(c.Request.Context(), id)
    if err != nil {
        c.JSON(404, gin.H{
            "success": false,
            "message": "Không tìm thấy quán",
            "data":    nil,
            "error":   err.Error(),
        })
        return
    }

    c.JSON(200, gin.H{
        "success": true,
        "message": "Lấy thông tin thành công",
        "data":    detail,
        "error":   nil,
    })
}

// GET /api/restaurants/popular (Những quán ăn phổ biến)
// GET /api/restaurants/popular (Địa điểm quán ăn uy tín)
// Chức năng: Hỗ trợ load khu vực "GOOD SPOTS FOR FOOD" ở Trang chủ.
// Cách hoạt động: Quét trong Database kéo lên những nhà hàng / quán ăn có Rating sao cao nhất, lượng Review cao nhất.
// Dữ liệu trả về: Mảng danh sách thông tin cơ bản của vị trí quán, rating, tag liên quan.
func GetPopularRestaurants(c *gin.Context) {
	// Mặc định lấy 6 quán cho trang chủ, hoặc lấy từ query nếu cần
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "6"))

	ctx := c.Request.Context()
	popularSpots, err := services.GetPopularRestaurants(ctx, limit)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "Không thể tải danh sách quán ăn uy tín",
			"data":    nil,
			"error":   err.Error(),
		})
		return
	}

	// TRẢ VỀ FORMAT CHUẨN
	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Tải danh sách địa điểm uy tín thành công",
		"data": gin.H{
			"restaurants": popularSpots,
		},
		"error": nil,
	})
}

// GET /api/dishes/trending (Món ăn Trending)
// Chức năng: Hỗ trợ load khu vực thẻ cuộn ngang "TOP TRENDINGS" ở Trang chủ (Dashboard).
// Cách hoạt động: Nhặt ra những món ăn đang hot, được check-in nhiều dạo gần đây.
// Dữ liệu trả về: Một mảng danh sách quán ăn nhưng thông tin xoay quanh chủ yếu là nhấn mạnh món ăn cụ thể đó. Bắt buộc có trường hình ảnh đại diện (image_url) và các huy hiệu đánh dấu (badge: "Popular", "Must try").
func GetTrendingDishes(c *gin.Context) {
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "6"))

	ctx := c.Request.Context()
	trendingList, err := services.GetTrendingDishes(ctx, limit)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"message": "Không thể tải danh sách món ăn trending",
			"data":    nil,
			"error":   err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Tải danh sách món ăn trending thành công",
		"data": gin.H{
			"dishes": trendingList,
		},
		"error": nil,
	})
}

type ImageInput struct {
	ImageURL string `json:"image_url" binding:"required"`
}

type ReviewInput struct {
	Rating  float64      `json:"rating" binding:"required,min=1,max=5"`
	Comment string       `json:"comment" binding:"required"`
	Images  []ImageInput `json:"images"` 
}

func CreateComment(c *gin.Context) {
	restaurantIDStr := c.Param("id")
	restaurantID, err := strconv.Atoi(restaurantIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "ID quán ăn không hợp lệ"})
		return
	}

	userIDVal, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"success": false, "message": "Chưa đăng nhập"})
		return
	}
	userID := userIDVal.(int)

	var input ReviewInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "Dữ liệu đánh giá không hợp lệ"})
		return
	}

	// Chuyển đổi mảng ảnh từ input sang model
	var reviewImages []models.UserRatingImage
	for _, img := range input.Images {
		reviewImages = append(reviewImages, models.UserRatingImage{
			ImageURL: img.ImageURL,
		})
	}

	reviewData := models.UserRating{
		RestaurantID: restaurantID,
		UserID:       userID,
		Rating:       input.Rating,
		Comment:      input.Comment,
		Images:       reviewImages, // Đưa mảng ảnh vào service
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	insertedReview, err := services.CreateReview(ctx, reviewData)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"success": false, "message": "Không thể lưu đánh giá"})
		return
	}

	go services.UpdateAvgRating(restaurantID)

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Đánh giá quán ăn thành công!",
		"data":    insertedReview,
	})
}

func GetReviews(c *gin.Context) {
	restaurantID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "ID quán ăn không hợp lệ"})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	reviews, err := services.GetReviewsByRestaurant(ctx, restaurantID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"success": false, "message": "Không thể tải đánh giá"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Lấy danh sách đánh giá thành công",
		"data":    gin.H{"reviews": reviews},
		"error":   nil,
	})
}

func UpdateComment(c *gin.Context) {
	reviewID, err := strconv.Atoi(c.Param("reviewId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "ID đánh giá không hợp lệ"})
		return
	}

	userIDVal, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"success": false, "message": "Chưa đăng nhập"})
		return
	}
	userID := userIDVal.(int)

	var input ReviewInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "Dữ liệu không hợp lệ"})
		return
	}

	// Chuyển đổi danh sách ảnh mới cập nhật sang model
	var reviewImages []models.UserRatingImage
	for _, img := range input.Images {
		reviewImages = append(reviewImages, models.UserRatingImage{
			UserRatingID: reviewID,
			ImageURL:     img.ImageURL,
		})
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	err = services.UpdateReview(ctx, reviewID, userID, models.UserRating{
		Rating:  input.Rating,
		Comment: input.Comment,
		Images:  reviewImages, // Đưa mảng ảnh mới vào để xử lý đồng bộ lại
	})
	if err != nil {
		c.JSON(http.StatusForbidden, gin.H{"success": false, "message": err.Error()})
		return
	}

	restaurantID, _ := strconv.Atoi(c.Param("id"))
	go services.UpdateAvgRating(restaurantID)

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Cập nhật đánh giá thành công",
		"error":   nil,
	})
}

func DeleteComment(c *gin.Context) {
	reviewID, err := strconv.Atoi(c.Param("reviewId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "message": "ID đánh giá không hợp lệ"})
		return
	}

	userIDVal, exists := c.Get("userID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"success": false, "message": "Chưa đăng nhập"})
		return
	}
	userID := userIDVal.(int)

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	err = services.DeleteReview(ctx, reviewID, userID)
	if err != nil {
		c.JSON(http.StatusForbidden, gin.H{"success": false, "message": err.Error()})
		return
	}

	restaurantID, _ := strconv.Atoi(c.Param("id"))
	go services.UpdateAvgRating(restaurantID)

	c.JSON(http.StatusOK, gin.H{
		"success": true,
		"message": "Xóa đánh giá thành công",
		"error":   nil,
	})
}