package services

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"

	"backend/core/internal/models"
)

// ============================================================
// POST
// ============================================================

func GetPopularPosts(ctx context.Context) ([]models.Post, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT TOP 10
			p.id, p.author_id, u.name, p.prefix, p.title, p.content,
			p.summary, p.thumbnail_url, p.type, p.view_count, p.reply_count,
			p.is_locked, p.created_at, p.updated_at
		FROM Posts p
		INNER JOIN Users u ON p.author_id = u.id
		WHERE p.is_locked = 0
		ORDER BY p.view_count DESC, p.reply_count DESC
	`)
	if err != nil {
		return nil, fmt.Errorf("GetPopularPosts: %w", err)
	}
	defer rows.Close()
	return scanPosts(rows)
}

func GetListPosts(ctx context.Context, page, limit int) ([]models.Post, int, error) {
	offset := (page - 1) * limit

	// Đếm tổng
	var total int
	db.QueryRowContext(ctx, `SELECT COUNT(*) FROM Posts`).Scan(&total)

	rows, err := db.QueryContext(ctx, `
		SELECT
			p.id, p.author_id, u.name, p.prefix, p.title, p.content,
			p.summary, p.thumbnail_url, p.type, p.view_count, p.reply_count,
			p.is_locked, p.created_at, p.updated_at
		FROM Posts p
		INNER JOIN Users u ON p.author_id = u.id
		ORDER BY p.created_at DESC
		OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY
	`,
		sql.Named("offset", offset),
		sql.Named("limit", limit),
	)
	if err != nil {
		return nil, 0, fmt.Errorf("GetListPosts: %w", err)
	}
	defer rows.Close()

	posts, err := scanPosts(rows)
	return posts, total, err
}

func GetPostDetail(ctx context.Context, postID int) (*models.Post, error) {
	// Tăng view_count
	db.ExecContext(ctx, `UPDATE Posts SET view_count = view_count + 1 WHERE id = @id`,
		sql.Named("id", postID))

	row := db.QueryRowContext(ctx, `
		SELECT
			p.id, p.author_id, u.name, p.prefix, p.title, p.content,
			p.summary, p.thumbnail_url, p.type, p.view_count, p.reply_count,
			p.is_locked, p.created_at, p.updated_at
		FROM Posts p
		INNER JOIN Users u ON p.author_id = u.id
		WHERE p.id = @id
	`, sql.Named("id", postID))

	var p models.Post
	var authorName string
	var contentStr string
	err := row.Scan(
		&p.ID, &p.AuthorID, &authorName, &p.Prefix, &p.Title, &contentStr,
		&p.Summary, &p.ThumbnailURL, &p.Type, &p.ViewCount, &p.ReplyCount,
		&p.IsLocked, &p.CreatedAt, &p.UpdatedAt,
	)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("bài viết không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetPostDetail: %w", err)
	}
	p.Content = json.RawMessage(contentStr)

	// Lấy comments
	p.Comments, err = GetCommentsByPost(ctx, int(p.ID))
	if err != nil {
		p.Comments = []models.Comment{}
	}

	return &p, nil
}

func CreatePost(ctx context.Context, userID int, post models.Post) (*models.Post, error) {
	contentStr, _ := post.Content.MarshalJSON()

	row := db.QueryRowContext(ctx, `
		INSERT INTO Posts (author_id, prefix, title, content, summary, thumbnail_url, type, created_at, updated_at)
		OUTPUT INSERTED.id, INSERTED.created_at, INSERTED.updated_at
		VALUES (@authorID, @prefix, @title, @content, @summary, @thumbnail, @type, GETDATE(), GETDATE())
	`,
		sql.Named("authorID", userID),
		sql.Named("prefix", post.Prefix),
		sql.Named("title", post.Title),
		sql.Named("content", string(contentStr)),
		sql.Named("summary", post.Summary),
		sql.Named("thumbnail", post.ThumbnailURL),
		sql.Named("type", post.Type),
	)

	if err := row.Scan(&post.ID, &post.CreatedAt, &post.UpdatedAt); err != nil {
		return nil, fmt.Errorf("CreatePost: %w", err)
	}
	post.AuthorID = uint64(userID)
	return &post, nil
}

// ============================================================
// COMMENT
// ============================================================

func GetCommentsByPost(ctx context.Context, postID int) ([]models.Comment, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT c.id, c.post_id, c.author_id, u.name, c.content, c.like_count, c.created_at
		FROM Comments c
		INNER JOIN Users u ON c.author_id = u.id
		WHERE c.post_id = @postID
		ORDER BY c.created_at ASC
	`, sql.Named("postID", postID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var comments []models.Comment
	for rows.Next() {
		var cm models.Comment
		var authorName string
		rows.Scan(&cm.ID, &cm.PostID, &cm.AuthorID, &authorName, &cm.Content, &cm.LikeCount, &cm.CreatedAt)
		comments = append(comments, cm)
	}
	return comments, nil
}

func AddComment(ctx context.Context, userID, postID int, content string) (*models.Comment, error) {
	var cm models.Comment
	row := db.QueryRowContext(ctx, `
		INSERT INTO Comments (post_id, author_id, content, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@postID, @authorID, @content, GETDATE())
	`,
		sql.Named("postID", postID),
		sql.Named("authorID", userID),
		sql.Named("content", content),
	)
	if err := row.Scan(&cm.ID, &cm.CreatedAt); err != nil {
		return nil, fmt.Errorf("AddComment: %w", err)
	}

	// Tăng reply_count
	db.ExecContext(ctx, `UPDATE Posts SET reply_count = reply_count + 1 WHERE id = @id`,
		sql.Named("id", postID))

	cm.PostID = uint64(postID)
	cm.AuthorID = uint64(userID)
	cm.Content = content
	return &cm, nil
}

// ============================================================
// LIKE
// ============================================================

func LikePost(ctx context.Context, userID, postID int) (bool, error) {
	var count int
	db.QueryRowContext(ctx, `
		SELECT COUNT(*) FROM PostLikes WHERE post_id = @postID AND user_id = @userID
	`,
		sql.Named("postID", postID),
		sql.Named("userID", userID),
	).Scan(&count)

	if count > 0 {
		db.ExecContext(ctx, `DELETE FROM PostLikes WHERE post_id = @postID AND user_id = @userID`,
			sql.Named("postID", postID),
			sql.Named("userID", userID),
		)
		db.ExecContext(ctx, `UPDATE Posts SET likes_count = likes_count - 1 WHERE id = @id`,
			sql.Named("id", postID))
		return false, nil
	}

	_, err := db.ExecContext(ctx, `
		INSERT INTO PostLikes (post_id, user_id, created_at)
		VALUES (@postID, @userID, GETDATE())
	`,
		sql.Named("postID", postID),
		sql.Named("userID", userID),
	)
	if err != nil {
		return false, fmt.Errorf("LikePost: %w", err)
	}
	db.ExecContext(ctx, `UPDATE Posts SET likes_count = likes_count + 1 WHERE id = @id`,
		sql.Named("id", postID))
	return true, nil
}

// ============================================================
// HELPER
// ============================================================

func scanPosts(rows *sql.Rows) ([]models.Post, error) {
	var posts []models.Post
	for rows.Next() {
		var p models.Post
		var authorName string
		var contentStr string
		if err := rows.Scan(
			&p.ID, &p.AuthorID, &authorName, &p.Prefix, &p.Title, &contentStr,
			&p.Summary, &p.ThumbnailURL, &p.Type, &p.ViewCount, &p.ReplyCount,
			&p.IsLocked, &p.CreatedAt, &p.UpdatedAt,
		); err != nil {
			continue
		}
		p.Content = json.RawMessage(contentStr)
		posts = append(posts, p)
	}
	return posts, nil
}