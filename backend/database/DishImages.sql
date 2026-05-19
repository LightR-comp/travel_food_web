use travel_food_db
go
CREATE TABLE DishImages (
    id INT IDENTITY(1,1) PRIMARY KEY,
    menu_item_id INT NOT NULL FOREIGN KEY REFERENCES MenuItems(id) ON DELETE CASCADE,
    image_url NVARCHAR(500) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
)
GO
