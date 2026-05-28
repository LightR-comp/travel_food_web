USE master; -- Chuyển sang database hệ thống trước
GO

ALTER DATABASE travel_food_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE IF EXISTS travel_food_db;
GO

CREATE DATABASE travel_food_db;
GO

USE travel_food_db;
GO


CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email NVARCHAR(255) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    avatar_url NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE UserAuth (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    provider NVARCHAR(50) NOT NULL, -- 'google', 'local', v.v.
    provider_id NVARCHAR(255) NOT NULL,
    password_hash NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE UserPreferences (
    user_id INT PRIMARY KEY FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    budget_per_person FLOAT DEFAULT 0,
    dietary NVARCHAR(MAX),     
    food_types NVARCHAR(MAX),  
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

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

CREATE TABLE MenuItems (
    id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT NOT NULL FOREIGN KEY REFERENCES Restaurants(id) ON DELETE CASCADE,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    price FLOAT NOT NULL,
    food_type NVARCHAR(100),
    ingredients NVARCHAR(MAX), 
    story NVARCHAR(MAX),       
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE UserRatings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    restaurant_id INT NOT NULL FOREIGN KEY REFERENCES Restaurants(id) ON DELETE CASCADE,
    rating FLOAT NOT NULL,
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE UserRatingImages (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_rating_id INT NOT NULL,
    image_url NVARCHAR(500) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_UserRatingImages_UserRatings FOREIGN KEY (user_rating_id) 
        REFERENCES UserRatings(id) ON DELETE CASCADE
);

CREATE TABLE ChatHistory (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    user_message NVARCHAR(MAX),
    bot_reply NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE ChatSuggestionLog (
    id INT IDENTITY(1,1) PRIMARY KEY,
    chat_history_id INT NOT NULL FOREIGN KEY REFERENCES ChatHistory(id) ON DELETE CASCADE,
    restaurant_id INT NOT NULL,
    restaurant_name NVARCHAR(255), 
    score FLOAT NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
GO


ALTER TABLE UserAuth 
ADD reset_token     NVARCHAR(255) NULL,
    reset_token_exp DATETIME      NULL;
GO

CREATE TABLE Posts (
    id            BIGINT IDENTITY(1,1) PRIMARY KEY,
    author_id     INT NOT NULL FOREIGN KEY REFERENCES Users(id) ON DELETE CASCADE,
    prefix        NVARCHAR(100) NULL,
    title         NVARCHAR(255) NOT NULL,
    category      NVARCHAR(100) NULL,
    content       NVARCHAR(MAX) NOT NULL,
    summary       NVARCHAR(500) NULL,
    thumbnail_url NVARCHAR(500) NULL,
    type          NVARCHAR(50) DEFAULT 'discussion',
    view_count    INT DEFAULT 0,
    like_count    INT DEFAULT 0,
    reply_count   INT DEFAULT 0,
    is_locked     BIT DEFAULT 0,
    created_at    DATETIME DEFAULT GETDATE(),
    updated_at    DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE Comments (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id    BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    author_id  INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    parent_id  BIGINT NULL FOREIGN KEY REFERENCES Comments(id),
    content    NVARCHAR(MAX) NOT NULL,
    like_count INT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE PostLikes (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id    BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    user_id    INT NOT NULL FOREIGN KEY REFERENCES Users(id),
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_PostLike UNIQUE(post_id, user_id)
)
GO

CREATE TABLE Attachments (
    id        BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id   BIGINT NOT NULL FOREIGN KEY REFERENCES Posts(id) ON DELETE CASCADE,
    file_url  NVARCHAR(500) NOT NULL,
    file_type NVARCHAR(50) NOT NULL
)
GO

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

CREATE TABLE PostImages (
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    post_id     BIGINT NOT NULL REFERENCES Posts(id) ON DELETE CASCADE,
    image_url   NVARCHAR(500) NOT NULL,
    order_index INT DEFAULT 0,
    created_at  DATETIME DEFAULT GETDATE()
);

CREATE TABLE CommentLikes (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    comment_id BIGINT NOT NULL REFERENCES Comments(id) ON DELETE CASCADE,
    user_id    INT NOT NULL REFERENCES Users(id),
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_CommentLike UNIQUE (comment_id, user_id)
);

ALTER TABLE Comments
    ADD image_url NVARCHAR(500) NULL;
CREATE TABLE DishImages (
    id INT IDENTITY(1,1) PRIMARY KEY,
    menu_item_id INT NOT NULL,
    image_url NVARCHAR(MAX) NOT NULL,
    caption NVARCHAR(500) NULL,
    is_thumbnail BIT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT FK_DishImages_MenuItems FOREIGN KEY (menu_item_id) 
        REFERENCES MenuItems(id) ON DELETE CASCADE
);
GO

CREATE INDEX IX_DishImages_MenuItemID ON DishImages(menu_item_id);
GO

CREATE TABLE RestaurantStories (
    restaurant_id INT PRIMARY KEY,
    story NVARCHAR(MAX) NULL, 
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(id) ON DELETE CASCADE
);
GO
