USE master; -- Chuyển sang database hệ thống trước
GO

-- Ngắt tất cả kết nối đang truy cập vào travel_food_db
ALTER DATABASE travel_food_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Bây giờ mới xóa
DROP DATABASE IF EXISTS travel_food_db;
GO

-- Tạo lại
CREATE DATABASE travel_food_db;
GO

USE travel_food_db;
GO


-- Bảng Users: Chứa thông tin cơ bản
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email NVARCHAR(255) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    avatar_url NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng UserAuth: Chứa thông tin đăng nhập (Local, Google, Firebase)
CREATE TABLE UserAuth (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    provider NVARCHAR(50) NOT NULL, -- 'google', 'local', v.v.
    provider_id NVARCHAR(255) NOT NULL,
    password_hash NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng UserPreferences: Lưu sở thích ăn uống, budget của user
CREATE TABLE UserPreferences (
    user_id INT PRIMARY KEY FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    budget_per_person FLOAT DEFAULT 0,
    dietary NVARCHAR(MAX),     -- VD: "vegan,vegetarian"
    food_types NVARCHAR(MAX),  -- VD: "japanese,bbq"
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng Restaurants: Danh sách quán ăn
CREATE TABLE Restaurants (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(MAX) NOT NULL,
    lat FLOAT NOT NULL,
    lng FLOAT NOT NULL,
    rating FLOAT DEFAULT 0,
    price_range INT DEFAULT 0,
    open_time NVARCHAR(50),
    close_time NVARCHAR(50),
    type NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng MenuItems: Danh sách món ăn thuộc về quán
CREATE TABLE MenuItems (
    id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT NOT NULL FOREIGN KEY REFERENCES Restaurants(id) ON DELETE CASCADE,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    price FLOAT NOT NULL,
    food_type NVARCHAR(100),
    ingredients NVARCHAR(MAX), -- VD: "chicken,garlic"
    story NVARCHAR(MAX),       -- Câu chuyện món ăn
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng UserRatings: Lưu review/đánh giá của user cho quán ăn
CREATE TABLE UserRatings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    restaurant_id INT NOT NULL FOREIGN KEY REFERENCES Restaurants(id) ON DELETE CASCADE,
    rating FLOAT NOT NULL,
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
)
GO



ALTER TABLE UserAuth 
ADD reset_token     NVARCHAR(255) NULL,
    reset_token_exp DATETIME      NULL;
GO

-- Bảng Posts: Bài viết forum
CREATE TABLE Posts (
    id            BIGINT IDENTITY(1,1) PRIMARY KEY,
    author_id     INT NOT NULL FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    prefix        NVARCHAR(100) NULL,
    title         NVARCHAR(255) NOT NULL,
    content       NVARCHAR(MAX) NOT NULL,
    summary       NVARCHAR(500) NULL,
    thumbnail_url NVARCHAR(500) NULL,
    type          NVARCHAR(50) DEFAULT 'discussion',
    view_count    INT DEFAULT 0,
    reply_count   INT DEFAULT 0,
    is_locked     BIT DEFAULT 0,
    created_at    DATETIME DEFAULT GETDATE(),
    updated_at    DATETIME DEFAULT GETDATE()
)
GO

-- Bảng Comments: Bình luận bài viết
CREATE TABLE Comments (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id    BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    author_id  INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    content    NVARCHAR(MAX) NOT NULL,
    like_count INT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE()
)
GO

-- Bảng PostLikes: Like bài viết
CREATE TABLE PostLikes (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id    BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    user_id    INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_PostLike UNIQUE(post_id, user_id)
)
GO

-- Bảng Attachments: File đính kèm
CREATE TABLE Attachments (
    id        BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id   BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    file_url  NVARCHAR(500) NOT NULL,
    file_type NVARCHAR(50) NOT NULL
)
GO

-- Bảng Polls: Bình chọn
CREATE TABLE Polls (
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id     BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    question    NVARCHAR(500) NOT NULL,
    options     NVARCHAR(MAX) NOT NULL,
    total_votes INT DEFAULT 0
)
GO

CREATE TABLE RestaurantImages (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT NOT NULL FOREIGN KEY REFERENCES Restaurants(id) ON DELETE CASCADE,
    image_url     NVARCHAR(500) NOT NULL,
    caption       NVARCHAR(255) NULL,
    is_thumbnail  BIT DEFAULT 0,
    created_at    DATETIME DEFAULT GETDATE()
)
GO