package handlers

import (
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

	var post models.Post
	if err := c.ShouldBindJSON(&post); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	// Giá trị mặc định
	if post.Type == "" {
		post.Type = "discussion"
	}

	created, err := services.CreatePost(c.Request.Context(), userID, post)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo bài viết"})
		return
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
		Content string `json:"content" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Thiếu nội dung bình luận"})
		return
	}

	comment, err := services.AddComment(c.Request.Context(), userID, postID, req.Content)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo bình luận"})
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

	liked, err := services.LikePost(c.Request.Context(), userID, postID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi xử lý like"})
		return
	}

	msg := "Đã thích bài viết"
	if !liked {
		msg = "Đã bỏ thích bài viết"
	}

	c.JSON(http.StatusOK, gin.H{"message": msg, "liked": liked})
}