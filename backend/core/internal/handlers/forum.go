package handlers

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"backend/core/internal/models"
	"backend/core/internal/services"
)

// ============================================================
// POST
// ============================================================

func GetPopularPosts(c *gin.Context) {
	posts, err := services.GetPopularPosts(c.Request.Context())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lấy bài viết hot"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"data": posts})
}

func GetListPosts(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "10"))

	posts, total, err := services.GetListPosts(c.Request.Context(), page, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lấy danh sách bài viết"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"data":  posts,
		"total": total,
		"page":  page,
		"limit": limit,
	})
}

func GetPostDetail(c *gin.Context) {
	postID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "id không hợp lệ"})
		return
	}

	post, err := services.GetPostDetail(c.Request.Context(), postID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": post})
}

func CreatePost(c *gin.Context) {
	userID := c.GetInt("user_id")

	var req struct {
		models.Post
		ImageURLs []string `json:"image_urls"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	if req.Type == "" {
		req.Type = "discussion"
	}

	created, err := services.CreatePost(c.Request.Context(), userID, req.Post)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo bài viết"})
		return
	}

	if len(req.ImageURLs) > 0 {
		services.AddPostImages(c.Request.Context(), int(created.ID), req.ImageURLs)
		created.Images, _ = services.GetPostImages(c.Request.Context(), int(created.ID))
	}

	c.JSON(http.StatusCreated, gin.H{
		"message": "Tạo bài viết thành công",
		"data":    created,
	})
}

// ============================================================
// COMMENT
// ============================================================

func AddComment(c *gin.Context) {
	userID := c.GetInt("user_id")

	postID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "id không hợp lệ"})
		return
	}

	var req struct {
		Content  string `json:"content"`
		ImageURL string `json:"image_url"` // optional
		ParentID *int   `json:"parent_id"` // nil = comment gốc, có giá trị = reply
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	// Phải có ít nhất content hoặc image_url
	if req.Content == "" && req.ImageURL == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Bình luận phải có nội dung hoặc ảnh"})
		return
	}

	comment, err := services.AddComment(c.Request.Context(), userID, postID, req.Content, req.ImageURL, req.ParentID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, gin.H{
		"message": "Bình luận thành công",
		"data":    comment,
	})
}

// ============================================================
// LIKE
// ============================================================

func LikePost(c *gin.Context) {
    userID := c.GetInt("user_id")
    postID, err := strconv.Atoi(c.Param("id"))
    if err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": "id không hợp lệ"})
        return
    }

    liked, likeCount, err := services.LikePost(c.Request.Context(), userID, postID)
    if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi xử lý like"})
        return
    }

    c.JSON(http.StatusOK, gin.H{
        "liked":      liked,
        "like_count": likeCount,
    })
}

func LikeComment(c *gin.Context) {
	userID := c.GetInt("user_id")

	commentID, err := strconv.ParseUint(c.Param("id"), 10, 64)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "id bình luận không hợp lệ"})
		return
	}

	liked, err := services.LikeComment(c.Request.Context(), userID, commentID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi xử lý like comment"})
		return
	}

	msg := "Đã thích bình luận"
	if !liked {
		msg = "Đã bỏ thích bình luận"
	}
	c.JSON(http.StatusOK, gin.H{"message": msg, "liked": liked})
}

func UploadImage(c *gin.Context) {
    file, _, err := c.Request.FormFile("image")
    if err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": "Không tìm thấy file ảnh"})
        return
    }
    defer file.Close()

    url, err := services.UploadToCloudinary(c.Request.Context(), file, "travel_food")
    if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("Lỗi upload: %v", err)})
        return
    }

    c.JSON(http.StatusOK, gin.H{
        "message": "Upload thành công",
        "url":     url,
    })
}