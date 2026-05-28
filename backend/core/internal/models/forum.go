// forum.go chứa các mô hình dữ liệu liên quan đến diễn đàn (forum) của quán ăn
package models

import (
    "encoding/json"
    "time"
)



type Post struct {
    ID            uint64    `json:"id"`
    AuthorID      uint64    `json:"author_id"`
    AuthorName    string    `json:"author_name"`
    Prefix        string    `json:"prefix"`          
    Title         string    `json:"title"`           
  	Content       json.RawMessage `json:"content"`
    Summary       string    `json:"summary"`         
    ThumbnailURL  string    `json:"thumbnail_url"`   
    Type          string    `json:"type"`            
    Category      string          `json:"category"`
    ViewCount     int       `json:"view_count"`      
    LikeCount     int       `json:"like_count"`     
    ReplyCount    int       `json:"reply_count"`     
    IsLocked      bool      `json:"is_locked"`
    CreatedAt     time.Time `json:"created_at"`
    UpdatedAt     time.Time `json:"updated_at"`

	Comments []Comment `json:"comments,omitempty"`
    Images []PostImage `json:"images,omitempty"`
}

type Comment struct {
    ID        uint64    `json:"id"`
    PostID    uint64    `json:"post_id"`
    AuthorID  uint64    `json:"author_id"`
    AuthorName string    `json:"author_name"`           
	ParentID   *uint64   `json:"parent_id,omitempty"`   
    Content   string    `json:"content"`
    LikeCount int       `json:"like_count"`
    CreatedAt time.Time `json:"created_at"`
    ImageURL  string    `json:"image_url,omitempty"`
    Replies    []Comment `json:"replies,omitempty"`
}

type Attachment struct {
    ID        uint64 `json:"id"`
    PostID    uint64 `json:"post_id"`
    FileURL   string `json:"file_url"`
    FileType  string `json:"file_type"` 
}

type Poll struct {
    ID         uint64   `json:"id"`
    PostID     uint64   `json:"post_id"`
    Question   string   `json:"question"`
    Options    []string `json:"options"`
    TotalVotes int      `json:"total_votes"`
}

type PostImage struct {
    ID         int       `json:"id"`
    PostID     int       `json:"post_id"`
    ImageURL   string    `json:"image_url"`
    OrderIndex int       `json:"order_index"`
    CreatedAt  time.Time `json:"created_at"`
}