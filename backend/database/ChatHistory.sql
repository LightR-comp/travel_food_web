use travel_food_db
go

CREATE TABLE ChatHistory (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    user_message NVARCHAR(MAX),
    bot_reply NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- Bảng ChatSuggestionLog: Lưu chi tiết các nhà hàng được gợi ý trong một tin nhắn chat
-- Thiết kế này giúp truy vấn và phân tích dữ liệu gợi ý dễ dàng hơn nhiều so với việc lưu JSON.
CREATE TABLE ChatSuggestionLog (
    id INT IDENTITY(1,1) PRIMARY KEY,
    chat_history_id INT NOT NULL FOREIGN KEY REFERENCES ChatHistory(id) ON DELETE CASCADE,
    restaurant_id INT NOT NULL,
    restaurant_name NVARCHAR(255), -- Denormalized for easier analysis
    score FLOAT NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
GO
