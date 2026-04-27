CREATE DATABASE travel_food_db
GO

USE travel_food_db
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

SELECT * FROM UserAuth;