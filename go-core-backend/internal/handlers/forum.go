package handlers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"smart-tourism/internal/models"
	"smart-tourism/internal/services"
)

func CreateReview(c *gin.Context) {
	uid := c.GetString("uid")

	var review models.Review
	if err := c.ShouldBindJSON(&review); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}
	review.UserUID = uid

	created, err := services.CreateReview(c.Request.Context(), review)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo đánh giá"})
		return
	}

	c.JSON(http.StatusCreated, created)
}

func GetReviewsByRestaurant(c *gin.Context) {
	restaurantID, err := strconv.Atoi(c.Param("restaurant_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "restaurant_id không hợp lệ"})
		return
	}

	reviews, err := services.GetReviewsByRestaurant(c.Request.Context(), restaurantID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lấy đánh giá"})
		return
	}

	c.JSON(http.StatusOK, reviews)
}

func UpdateReview(c *gin.Context) {
	uid := c.GetString("uid")
	reviewID, err := strconv.Atoi(c.Param("review_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "review_id không hợp lệ"})
		return
	}

	var update models.Review
	if err := c.ShouldBindJSON(&update); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

	if err := services.UpdateReview(c.Request.Context(), reviewID, uid, update); err != nil {
		c.JSON(http.StatusForbidden, gin.H{"error": "Không có quyền sửa hoặc review không tồn tại"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Cập nhật thành công"})
}

func DeleteReview(c *gin.Context) {
	uid := c.GetString("uid")
	reviewID, err := strconv.Atoi(c.Param("review_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "review_id không hợp lệ"})
		return
	}

	if err := services.DeleteReview(c.Request.Context(), reviewID, uid); err != nil {
		c.JSON(http.StatusForbidden, gin.H{"error": "Không có quyền xóa hoặc review không tồn tại"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Xóa thành công"})
}

func CreateTopic(c *gin.Context) {
	uid := c.GetString("uid")

	var topic models.ForumTopic
	if err := c.ShouldBindJSON(&topic); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}
	topic.UserUID = uid

	created, err := services.CreateTopic(c.Request.Context(), topic)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo topic"})
		return
	}

	c.JSON(http.StatusCreated, created)
}

func GetTopics(c *gin.Context) {
	topics, err := services.GetTopics(c.Request.Context())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi lấy danh sách topic"})
		return
	}

	c.JSON(http.StatusOK, topics)
}

func CreateComment(c *gin.Context) {
	uid := c.GetString("uid")
	topicID, err := strconv.Atoi(c.Param("topic_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "topic_id không hợp lệ"})
		return
	}

	var comment models.ForumComment
	if err := c.ShouldBindJSON(&comment); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}
	comment.UserUID = uid
	comment.TopicID = topicID

	created, err := services.CreateComment(c.Request.Context(), comment)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Lỗi tạo comment"})
		return
	}

	c.JSON(http.StatusCreated, created)
}