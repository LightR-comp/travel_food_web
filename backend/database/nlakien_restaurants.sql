/* PROJECT: TRAVEL SMART
   FILE: nlakien_restaurants.sql
   DESCRIPTION: Chỉ chèn dữ liệu mẫu cho 50 quán và menu (Q7, Q8, Nhà Bè, Bình Chánh)
   Cấu trúc tuân thủ bảng Restaurants và MenuItems hiện có.
*/

USE travel_food_db;
GO

-- 1. XOÁ DỮ LIỆU CŨ TRƯỚC KHI INSERT (Để tránh lỗi trùng lặp khi chạy lại file)
DELETE FROM MenuItems;
DELETE FROM Restaurants;
GO

-- 2. INSERT 50 QUÁN ĂN (Restaurants)
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES
-- Quận 7
(N'El Gaucho Steakhouse', N'74 Nguyễn Lương Bằng, Quận 7', 10.7291, 106.7214, 4.8, 3, '11:00', '23:30', N'Steakhouse'),
(N'D''Maris Buffet', N'Lotte Mart, Quận 7', 10.7436, 106.7011, 4.6, 3, '11:30', '22:00', N'Buffet'),
(N'Pizza 4P''s PMH', N'801 Nguyễn Văn Linh, Quận 7', 10.7289, 106.7082, 4.7, 2, '11:00', '22:30', N'Pizza'),
(N'Lẩu dê 404', N'436 Nguyễn Thị Thập, Quận 7', 10.7410, 106.7060, 4.1, 2, '10:00', '23:00', N'Nhà hàng'),
(N'Wrap & Roll Vivo', N'SC VivoCity, Quận 7', 10.7315, 106.7020, 4.2, 2, '10:30', '21:30', N'Đặc sản Việt'),
(N'Sushi 88', N'43 Đường số 15, Quận 7', 10.7450, 106.7120, 4.4, 2, '16:00', '22:00', N'Nhật Bản'),
(N'Cơm tấm Thuận Kiều', N'54 Nguyễn Sơn, Quận 7', 10.7405, 106.7150, 4.0, 1, '06:00', '20:00', N'Cơm tấm'),
(N'Morico Cafe', N'Crescent Mall, Quận 7', 10.7285, 106.7190, 4.5, 3, '10:00', '22:00', N'Cafe & Dessert'),
(N'Bún đậu Cầu Diễn', N'45 Lê Văn Lương, Quận 7', 10.7380, 106.7015, 4.3, 1, '10:00', '21:00', N'Ăn vặt'),
(N'King BBQ Vivo', N'SC VivoCity, Quận 7', 10.7310, 106.7025, 4.2, 3, '10:30', '22:00', N'BBQ'),
(N'Kichi Kichi Lotte', N'Lotte Mart, Quận 7', 10.7430, 106.7005, 4.4, 2, '11:00', '22:00', N'Lẩu băng chuyền'),
(N'Gogi House PMH', N'Phú Mỹ Hưng, Quận 7', 10.7295, 106.7100, 4.5, 3, '10:00', '22:00', N'BBQ Hàn Quốc'),
(N'Bánh canh cua 14', N'Trần Xuân Soạn, Quận 7', 10.7480, 106.7110, 4.2, 1, '07:00', '21:00', N'Bình dân'),

-- Quận 8
(N'Ốc Tuyết Q8', N'256 Dương Bá Trạc, Quận 8', 10.7455, 106.6915, 4.2, 1, '16:00', '23:00', N'Hải sản'),
(N'Bánh xèo 85', N'85 Cầu Xóm Củi, Quận 8', 10.7402, 106.6780, 4.3, 1, '14:00', '21:00', N'Đặc sản'),
(N'Bún bò Kim Hương', N'152 Cao Lỗ, Quận 8', 10.7385, 106.6820, 4.4, 1, '06:00', '22:00', N'Bún bò'),
(N'Quán ăn gia đình 368', N'Tạ Quang Bửu, Quận 8', 10.7350, 106.6750, 4.0, 2, '10:00', '23:00', N'Gia đình'),
(N'Lẩu gà lá é Q8', N'Phạm Thế Hiển, Quận 8', 10.7320, 106.6650, 4.5, 2, '15:00', '22:30', N'Lẩu'),
(N'Cơm gà Lão Hương Thân', N'Dương Bá Trạc, Quận 8', 10.7460, 106.6910, 4.1, 1, '10:00', '21:00', N'Cơm gà'),
(N'Mì cay Sasin Q8', N'Hưng Phú, Quận 8', 10.7510, 106.6850, 4.2, 2, '09:00', '22:00', N'Mì cay'),
(N'Phê La Q8', N'Tạ Quang Bửu, Quận 8', 10.7355, 106.6760, 4.6, 2, '08:00', '22:30', N'Cafe'),
(N'Bò né Ba Ngon', N'Tùng Thiện Vương, Quận 8', 10.7490, 106.6700, 4.0, 1, '06:00', '21:00', N'Bình dân'),
(N'Nem nướng Ninh Hòa', N'Phạm Thế Hiển, Quận 8', 10.7315, 106.6640, 4.3, 2, '10:00', '21:30', N'Đặc sản'),
(N'Phở Hùng Q8', N'Liên Tỉnh 5, Quận 8', 10.7280, 106.6580, 4.2, 2, '06:00', '23:00', N'Phở'),
(N'Bánh mì PewPew Q8', N'Dương Bá Trạc, Quận 8', 10.7465, 106.6925, 3.9, 1, '06:00', '22:00', N'Fastfood'),

-- Nhà Bè
(N'Bánh cuốn Bà Năm', N'Thị trấn Nhà Bè', 10.6880, 106.7320, 4.0, 1, '06:00', '10:30', N'Ăn sáng'),
(N'Lẩu mắm Sáu Căn', N'Lê Văn Lương, Nhà Bè', 10.6820, 106.7050, 4.5, 2, '10:00', '22:00', N'Đặc sản'),
(N'Phở bò gia truyền NB', N'Huỳnh Tấn Phát, Nhà Bè', 10.6920, 106.7350, 4.1, 1, '06:00', '20:00', N'Phở'),
(N'Gà nướng Huỳnh', N'Nguyễn Văn Tạo, Nhà Bè', 10.6500, 106.7200, 4.3, 2, '15:00', '21:00', N'Đồ nướng'),
(N'Cafe Orchid', N'Phước Kiển, Nhà Bè', 10.7010, 106.7080, 4.4, 2, '07:00', '22:00', N'Cafe'),
(N'Cơm tấm đêm NB', N'Cầu Phú Xuân, Nhà Bè', 10.6950, 106.7330, 4.2, 1, '17:00', '02:00', N'Cơm tấm'),
(N'Hải sản Biển Đông NB', N'Nguyễn Hữu Thọ, Nhà Bè', 10.6855, 106.7065, 4.6, 3, '10:00', '23:00', N'Hải sản'),
(N'Quán nướng Nhà Bè', N'Lê Văn Lương, Nhà Bè', 10.6815, 106.7045, 4.0, 2, '16:00', '22:30', N'Đồ nướng'),
(N'Chè Thái Ý Phương', N'Huỳnh Tấn Phát, Nhà Bè', 10.6915, 106.7345, 4.3, 1, '10:00', '22:00', N'Tráng miệng'),
(N'Pizza Hut NB', N'Phước Kiển, Nhà Bè', 10.7020, 106.7090, 4.1, 2, '10:00', '22:00', N'Pizza'),
(N'Mì Quảng 3 Anh Em', N'Lê Văn Lương, Nhà Bè', 10.6800, 106.7030, 4.4, 1, '06:30', '21:30', N'Đặc sản'),
(N'Highlands Coffee NB', N'Hưng Phát, Nhà Bè', 10.7050, 106.7075, 4.2, 2, '07:00', '22:00', N'Cafe'),
(N'Jollibee Nhà Bè', N'Co.op Mart Nhà Bè', 10.6905, 106.7325, 4.0, 1, '09:00', '21:30', N'Fastfood'),

-- Bình Chánh
(N'Bình Quới 3', N'Bình Hưng, Bình Chánh', 10.7210, 106.6620, 4.2, 3, '09:00', '22:00', N'Gia đình'),
(N'Cánh Đồng Hoa', N'Phong Phú, Bình Chánh', 10.7105, 106.6505, 4.5, 2, '07:30', '22:00', N'Cafe'),
(N'Hủ tiếu Chú Tèo', N'Quách Điêu, Bình Chánh', 10.8105, 106.5805, 4.1, 1, '06:00', '13:00', N'Bình dân'),
(N'Bò tơ Năm Sánh', N'Quốc lộ 50, Bình Chánh', 10.6825, 106.6650, 4.4, 2, '10:00', '23:00', N'Đặc sản'),
(N'Lẩu bò Nghĩa Địa', N'Nguyễn Văn Linh, Bình Chánh', 10.7050, 106.6400, 4.3, 1, '16:00', '22:00', N'Lẩu'),
(N'The Coffee House BC', N'Trung Sơn, Bình Chánh', 10.7380, 106.6910, 4.5, 2, '07:00', '22:30', N'Cafe'),
(N'Sushi Kei BC', N'Trung Sơn, Bình Chánh', 10.7375, 106.6905, 4.4, 3, '11:00', '22:00', N'Nhật Bản'),
(N'Dê tươi Vĩnh Lộc', N'Vĩnh Lộc B, Bình Chánh', 10.8200, 106.5700, 4.2, 2, '10:00', '23:00', N'Nhà hàng'),
(N'Cơm Niêu Trung Sơn', N'Trung Sơn, Bình Chánh', 10.7390, 106.6920, 4.3, 3, '10:00', '21:00', N'Gia đình'),
(N'Lotteria BC', N'Phạm Hùng, Bình Chánh', 10.7250, 106.6750, 4.0, 2, '09:00', '21:30', N'Fastfood'),
(N'Bún đậu A Chanh', N'Trung Sơn, Bình Chánh', 10.7360, 106.6900, 4.2, 1, '10:00', '22:00', N'Ăn vặt'),
(N'Phúc Long BC', N'Trung Sơn, Bình Chánh', 10.7385, 106.6915, 4.6, 2, '07:00', '22:30', N'Cafe');
GO

-- 3. INSERT TỰ ĐỘNG MENU ITEMS (Gán ngẫu nhiên 5 món cho mỗi quán vừa tạo)
DECLARE @res_id INT, @res_type NVARCHAR(100);
DECLARE res_cursor CURSOR FOR SELECT id, type FROM Restaurants;
OPEN res_cursor;
FETCH NEXT FROM res_cursor INTO @res_id, @res_type;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @res_type LIKE N'%Cafe%' OR @res_type LIKE N'%Dessert%' OR @res_type LIKE N'%Tráng miệng%'
    BEGIN
        INSERT INTO MenuItems (restaurant_id, name, price, food_type, description, ingredients, story) VALUES
        (@res_id, N'Cà phê sữa đá', 35000, N'Drink', N'Phin truyền thống', N'Robusta, Sữa đặc', N'Hương vị Sài Gòn xưa.'),
        (@res_id, N'Trà đào cam sả', 45000, N'Drink', N'Best-seller', N'Trà đen, Đào, Cam, Sả', N'Thanh lọc cơ thể.'),
        (@res_id, N'Bánh sừng bò', 30000, N'Pastry', N'Thơm bơ Pháp', N'Bột mì, Bơ', N'Nướng mới mỗi sáng.'),
        (@res_id, N'Tiramisu', 55000, N'Dessert', N'Mềm mịn', N'Mascarpone, Coffee', N'Ngọt ngào kiểu Ý.'),
        (@res_id, N'Bạc xỉu', 35000, N'Drink', N'Dành cho người ít uống cafe', N'Sữa tươi, Cafe', N'Thức uống quốc dân.');
    END
    ELSE IF @res_type LIKE N'%Hải sản%' OR @res_type LIKE N'%Ốc%'
    BEGIN
        INSERT INTO MenuItems (restaurant_id, name, price, food_type, description, ingredients, story) VALUES
        (@res_id, N'Ốc hương trứng muối', 85000, N'Seafood', N'Vị béo ngậy', N'Ốc hương, Trứng muối', N'Món ăn gây nghiện nhất.'),
        (@res_id, N'Lẩu hải sản', 250000, N'Hotpot', N'Tươi sống', N'Tôm, Mực, Ngao', N'Nguyên liệu nhập trong ngày.'),
        (@res_id, N'Càng ghẹ rang muối', 120000, N'Seafood', N'Cay nồng', N'Càng ghẹ, Muối ớt', N'Bắt mồi cực kỳ.'),
        (@res_id, N'Sò lông mỡ hành', 65000, N'Appetizer', N'Thơm hành phi', N'Sò lông, Đậu phộng', N'Món nhậu bình dân.'),
        (@res_id, N'Mực trứng nướng', 150000, N'Seafood', N'Mực sữa', N'Mực, Muối tiêu', N'Đặc sản miền Trung.');
    END
    ELSE IF @res_type LIKE N'%Pizza%' OR @res_type LIKE N'%Fastfood%'
    BEGIN
        INSERT INTO MenuItems (restaurant_id, name, price, food_type, description, ingredients, story) VALUES
        (@res_id, N'Pizza đặc biệt', 165000, N'Main', N'Đầy đủ topping', N'Phô mai, Pepperoni', N'Nướng lò củi.'),
        (@res_id, N'Khoai tây chiên', 35000, N'Side', N'Giòn rụm', N'Khoai tây, Bơ', N'Khai vị hoàn hảo.'),
        (@res_id, N'Mì Ý bò bằm', 85000, N'Main', N'Sốt cà chua', N'Bò bằm, Pasta', N'Công thức chuẩn Âu.'),
        (@res_id, N'Gà rán 2 miếng', 75000, N'Main', N'Giòn tan', N'Gà tươi, Bột chiên', N'Công thức bí mật.'),
        (@res_id, N'Coca Cola', 20000, N'Drink', N'Lon 330ml', N'Nước giải khát', N'Sảng khoái.');
    END
    ELSE -- Phở, Cơm, BBQ, Đặc sản...
    BEGIN
        INSERT INTO MenuItems (restaurant_id, name, price, food_type, description, ingredients, story) VALUES
        (@res_id, N'Phần ăn đặc trưng', 65000, N'Main', N'Món chính của quán', N'Đặc sản riêng', N'Giữ vững hương vị 10 năm.'),
        (@res_id, N'Phần ăn nhỏ', 45000, N'Main', N'Tiết kiệm', N'Nguyên liệu cơ bản', N'Dành cho bữa trưa nhanh.'),
        (@res_id, N'Đĩa rau thêm', 15000, N'Side', N'Rau tươi xanh', N'Rau theo mùa', N'Ăn kèm cho đủ chất.'),
        (@res_id, N'Trà đá', 5000, N'Drink', N'Mát lạnh', N'Trà sâm dứa', N'Giải khát tức thì.'),
        (@res_id, N'Tráng miệng ngày', 20000, N'Dessert', N'Thay đổi theo ngày', N'Trái cây/Chè', N'Kết thúc bữa ăn hoàn hảo.');
    END
    FETCH NEXT FROM res_cursor INTO @res_id, @res_type;
END
CLOSE res_cursor; DEALLOCATE res_cursor;
GO

-- 4. KIỂM TRA LẠI SỐ LƯỢNG
SELECT 'Check Count' AS Status, (SELECT COUNT(*) FROM Restaurants) AS Total_Restaurants, (SELECT COUNT(*) FROM MenuItems) AS Total_MenuItems;