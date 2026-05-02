use travel_food_db
go

CREATE TABLE ChatHistory (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    user_message NVARCHAR(MAX),
    bot_reply NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);
