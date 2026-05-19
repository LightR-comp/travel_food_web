// forum.go chứa các mô hình dữ liệu liên quan đến diễn đàn (forum) của quán ăn
package models

import (
    "encoding/json"
    "time"
)

/*type User struct {
    ID          uint64 `json:"id"`
    Username    string `json:"username"`
    DisplayName string `json:"display_name"`
    AvatarURL   string `json:"avatar_url"`
    CreatedAt   time.Time `json:"created_at"`
}*/

type Post struct {
    ID            uint64    `json:"id"`
    AuthorID      uint64    `json:"author_id"`
    AuthorName    string    `json:"author_name"`
    Prefix        string    `json:"prefix"`          // Ví dụ: (No prefix)
    Title         string    `json:"title"`           // "Review bánh mì Huỳnh Hoa..."
  	Content       json.RawMessage `json:"content"`
    Summary       string    `json:"summary"`         // Đoạn mô tả ngắn hiện ở trang chủ
    ThumbnailURL  string    `json:"thumbnail_url"`   // Ảnh minh họa cho bài viết
    Type          string    `json:"type"`            // "discussion" hoặc "poll"
    ViewCount     int       `json:"view_count"`      // Lượt xem
    ReplyCount    int       `json:"reply_count"`     // Lượt trả lời
    IsLocked      bool      `json:"is_locked"`
    CreatedAt     time.Time `json:"created_at"`
    UpdatedAt     time.Time `json:"updated_at"`

	Comments []Comment `json:"comments,omitempty"`
}

type Comment struct {
    ID        uint64    `json:"id"`
    PostID    uint64    `json:"post_id"`
    AuthorID  uint64    `json:"author_id"`
    Content   string    `json:"content"`
    LikeCount int       `json:"like_count"`
    CreatedAt time.Time `json:"created_at"`
}

type Attachment struct {
    ID        uint64 `json:"id"`
    PostID    uint64 `json:"post_id"`
    FileURL   string `json:"file_url"`
    FileType  string `json:"file_type"` // image, pdf, v.v.
}

type Poll struct {
    ID         uint64   `json:"id"`
    PostID     uint64   `json:"post_id"`
    Question   string   `json:"question"`
    Options    []string `json:"options"`
    TotalVotes int      `json:"total_votes"`
}