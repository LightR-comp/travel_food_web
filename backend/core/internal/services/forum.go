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
			p.summary, p.thumbnail_url, p.type, p.view_count, p.like_count, p.reply_count,
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

	var total int
	db.QueryRowContext(ctx, `SELECT COUNT(*) FROM Posts`).Scan(&total)

	rows, err := db.QueryContext(ctx, `
		SELECT
			p.id, p.author_id, u.name, p.prefix, p.title, p.content,
			p.summary, p.thumbnail_url, p.type, p.view_count, p.like_count, p.reply_count,
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
    db.ExecContext(ctx, `UPDATE Posts SET view_count = view_count + 1 WHERE id = @id`,
        sql.Named("id", postID))

    row := db.QueryRowContext(ctx, `
        SELECT
            p.id, p.author_id, u.name, p.prefix, p.title, p.content,
            p.summary, p.thumbnail_url, p.type, p.view_count, p.like_count, p.reply_count,
            p.is_locked, p.created_at, p.updated_at
        FROM Posts p
        INNER JOIN Users u ON p.author_id = u.id
        WHERE p.id = @id
    `, sql.Named("id", postID))

    var p models.Post
    var authorName, contentStr string
    err := row.Scan(
        &p.ID, &p.AuthorID, &authorName, &p.Prefix, &p.Title, &contentStr,
        &p.Summary, &p.ThumbnailURL, &p.Type, &p.ViewCount, &p.LikeCount, &p.ReplyCount,
        &p.IsLocked, &p.CreatedAt, &p.UpdatedAt,
    )
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("bài viết không tồn tại")
	}
	if err != nil {
		return nil, fmt.Errorf("GetPostDetail: %w", err)
	}
	p.Content = json.RawMessage(contentStr)
	p.AuthorName = authorName

	p.Comments, _ = GetCommentsByPost(ctx, int(p.ID))
	p.Images, _ = GetPostImages(ctx, int(p.ID))

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
    fmt.Printf("[CreatePost] lỗi: %v\n", err)
    return nil, fmt.Errorf("CreatePost: %w", err)
	}
	post.AuthorID = uint64(userID)
	return &post, nil
}

// ============================================================
// POST IMAGES
// ============================================================

func AddPostImages(ctx context.Context, postID int, imageURLs []string) error {
	for i, url := range imageURLs {
		_, err := db.ExecContext(ctx, `
			INSERT INTO PostImages (post_id, image_url, order_index, created_at)
			VALUES (@postID, @url, @order, GETDATE())
		`,
			sql.Named("postID", postID),
			sql.Named("url", url),
			sql.Named("order", i),
		)
		if err != nil {
			fmt.Printf("[AddPostImages] lỗi insert ảnh %d: %v\n", i, err)
			return fmt.Errorf("AddPostImages[%d]: %w", i, err)
		}
		fmt.Printf("[AddPostImages] insert ảnh %d thành công: %s\n", i, url)
	}
	return nil
}

func GetPostImages(ctx context.Context, postID int) ([]models.PostImage, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT id, post_id, image_url, order_index, created_at
		FROM PostImages
		WHERE post_id = @postID
		ORDER BY order_index ASC
	`, sql.Named("postID", postID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var images []models.PostImage
	for rows.Next() {
		var img models.PostImage
		rows.Scan(&img.ID, &img.PostID, &img.ImageURL, &img.OrderIndex, &img.CreatedAt)
		images = append(images, img)
	}
	return images, nil
}

// ============================================================
// COMMENT
// ============================================================

func GetCommentsByPost(ctx context.Context, postID int) ([]models.Comment, error) {
	rows, err := db.QueryContext(ctx, `
		SELECT c.id, c.post_id, c.author_id, u.name,
		       c.parent_id, c.content, c.image_url, c.like_count, c.created_at
		FROM Comments c
		INNER JOIN Users u ON c.author_id = u.id
		WHERE c.post_id = @postID
		ORDER BY c.created_at ASC
	`, sql.Named("postID", postID))
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var allComments []models.Comment // Chứa toàn bộ comment (cả gốc lẫn con)
	for rows.Next() {
		var cm models.Comment
		var authorName string
		var imageURL sql.NullString
		var parentID sql.NullInt64

		if err := rows.Scan(
			&cm.ID, &cm.PostID, &cm.AuthorID, &authorName,
			&parentID, &cm.Content, &imageURL, &cm.LikeCount, &cm.CreatedAt,
		); err != nil {
			return nil, err
		}
		
		cm.AuthorName = authorName
		if imageURL.Valid {
			cm.ImageURL = imageURL.String
		}
		if parentID.Valid {
			pid := uint64(parentID.Int64)
			cm.ParentID = &pid
		}
		// Đảm bảo khởi tạo mảng rỗng để không bị null JSON
		cm.Replies = []models.Comment{} 

		allComments = append(allComments, cm)
	}

	// 💡 TRẢ VỀ TOÀN BỘ MẢNG PHẲNG CHỨA CẢ CHA LẪN CON
	return allComments, nil
}

func AddComment(ctx context.Context, userID, postID int, content, imageURL string, parentID *int) (*models.Comment, error) {
	var cm models.Comment
 
	var imgParam interface{}
	if imageURL != "" {
		imgParam = imageURL
	} else {
		imgParam = nil
	}
 
	// parentID có thể nil (comment gốc) hoặc có giá trị (reply)
	var parentParam interface{}
	if parentID != nil {
		// Kiểm tra parent tồn tại và thuộc đúng bài viết
		var exists int
		db.QueryRowContext(ctx, `
			SELECT COUNT(*) FROM Comments WHERE id = @id AND post_id = @postID
		`, sql.Named("id", *parentID), sql.Named("postID", postID)).Scan(&exists)
		if exists == 0 {
			return nil, fmt.Errorf("comment cha không tồn tại hoặc không thuộc bài viết này")
		}
		parentParam = *parentID
	} else {
		parentParam = nil
	}
 
	row := db.QueryRowContext(ctx, `
		INSERT INTO Comments (post_id, author_id, parent_id, content, image_url, created_at)
		OUTPUT INSERTED.id, INSERTED.created_at
		VALUES (@postID, @authorID, @parentID, @content, @imageURL, GETDATE())
	`,
		sql.Named("postID", postID),
		sql.Named("authorID", userID),
		sql.Named("parentID", parentParam),
		sql.Named("content", content),
		sql.Named("imageURL", imgParam),
	)
	if err := row.Scan(&cm.ID, &cm.CreatedAt); err != nil {
		fmt.Printf("[AddComment] lỗi: %v\n", err)
		return nil, fmt.Errorf("AddComment: %w", err)
	}
 
	// Chỉ tăng reply_count cho bài viết khi là comment gốc
	if parentID == nil {
		db.ExecContext(ctx, `UPDATE Posts SET reply_count = reply_count + 1 WHERE id = @id`,
			sql.Named("id", postID))
	}
 
	cm.PostID = uint64(postID)
	cm.AuthorID = uint64(userID)
	cm.Content = content
	cm.ImageURL = imageURL
	if parentID != nil {
		pid := uint64(*parentID)
		cm.ParentID = &pid
	}
	cm.Replies = []models.Comment{}
	return &cm, nil
}

// ============================================================
// LIKE
// ============================================================

func LikePost(ctx context.Context, userID, postID int) (bool, int, error) {
    var count int
    db.QueryRowContext(ctx, `
        SELECT COUNT(*) FROM PostLikes WHERE post_id = @postID AND user_id = @userID
    `, sql.Named("postID", postID), sql.Named("userID", userID)).Scan(&count)

    if count > 0 {
        db.ExecContext(ctx, `DELETE FROM PostLikes WHERE post_id = @postID AND user_id = @userID`,
            sql.Named("postID", postID), sql.Named("userID", userID))
        db.ExecContext(ctx, `UPDATE Posts SET like_count = like_count - 1 WHERE id = @id`,
            sql.Named("id", postID))

        var likeCount int
        db.QueryRowContext(ctx, `SELECT like_count FROM Posts WHERE id = @id`,
            sql.Named("id", postID)).Scan(&likeCount)
        return false, likeCount, nil
    }

    _, err := db.ExecContext(ctx, `INSERT INTO PostLikes (post_id, user_id, created_at) VALUES (@postID, @userID, GETDATE())`,
        sql.Named("postID", postID), sql.Named("userID", userID))
    if err != nil {
        return false, 0, fmt.Errorf("LikePost: %w", err)
    }
    db.ExecContext(ctx, `UPDATE Posts SET like_count = like_count + 1 WHERE id = @id`,
        sql.Named("id", postID))

    var likeCount int
    db.QueryRowContext(ctx, `SELECT like_count FROM Posts WHERE id = @id`,
        sql.Named("id", postID)).Scan(&likeCount)
    return true, likeCount, nil
}

func LikeComment(ctx context.Context, userID, commentID int) (bool, error) {
	var count int
	db.QueryRowContext(ctx, `
		SELECT COUNT(*) FROM CommentLikes WHERE comment_id = @commentID AND user_id = @userID
	`,
		sql.Named("commentID", commentID),
		sql.Named("userID", userID),
	).Scan(&count)

	if count > 0 {
		db.ExecContext(ctx, `DELETE FROM CommentLikes WHERE comment_id = @commentID AND user_id = @userID`,
			sql.Named("commentID", commentID), sql.Named("userID", userID))
		db.ExecContext(ctx, `UPDATE Comments SET like_count = like_count - 1 WHERE id = @id`,
			sql.Named("id", commentID))
		return false, nil
	}

	_, err := db.ExecContext(ctx, `
		INSERT INTO CommentLikes (comment_id, user_id, created_at)
		VALUES (@commentID, @userID, GETDATE())
	`,
		sql.Named("commentID", commentID),
		sql.Named("userID", userID),
	)
	if err != nil {
		fmt.Printf("[LikeComment] lỗi insert: %v\n", err)
		return false, fmt.Errorf("LikeComment: %w", err)
	}
	db.ExecContext(ctx, `UPDATE Comments SET like_count = like_count + 1 WHERE id = @id`,
		sql.Named("id", commentID))
	return true, nil
}

// ============================================================
// HELPER
// ============================================================

func scanPosts(rows *sql.Rows) ([]models.Post, error) {
    var posts []models.Post
    for rows.Next() {
        var p models.Post
        var authorName, contentStr string
        if err := rows.Scan(
            &p.ID, &p.AuthorID, &authorName, &p.Prefix, &p.Title, &contentStr,
            &p.Summary, &p.ThumbnailURL, &p.Type, &p.ViewCount, &p.LikeCount, &p.ReplyCount,
            &p.IsLocked, &p.CreatedAt, &p.UpdatedAt,
        ); err != nil {
            continue
        }
        p.Content = json.RawMessage(contentStr)
        p.AuthorName = authorName
        posts = append(posts, p)
    }
    return posts, nil
}
