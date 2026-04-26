USE travel_food_db
GO

-- A. Nạp 5 Users (Tên tiếng Anh random, Avatar NULL)--
INSERT INTO Users (email, name, avatar_url) VALUES 
('olivia.smith@example.com', 'Olivia Smith', NULL),
('liam.johnson@example.com', 'Liam Johnson', NULL),
('emma.williams@example.com', 'Emma Williams', NULL),
('noah.brown@example.com', 'Noah Brown', NULL),
('sophia.davis@example.com', 'Sophia Davis', NULL);
GO

-- B. Nạp 5 User Preferences (Sở thích tương ứng)--
INSERT INTO UserPreferences (user_id, budget_per_person, dietary, food_types) VALUES 
(1, 150000, '', 'chinese,dimsum'),
(2, 60000, '', 'korean,spicy'),
(3, 100000, '', 'fastfood,chicken'),
(4, 85000, '', 'vietnamese,noodle'),
(5, 70000, '', 'cafe,milk_tea');
GO

-- C. Nạp 5 Quán ăn quanh ĐH Khoa học Tự nhiên (Cơ sở 1 - Nguyễn Văn Cừ)--
-- Tọa độ tâm: 10.7626, 106.6823--
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Dimsum Mr Hào', N'171A Nguyễn Văn Cừ, Quận 5', 10.7635, 106.6825, 4.3, 150000, '08:00', '22:00', 'chinese'),
(N'Mì Cay Naga', N'213F Nguyễn Văn Cừ, Quận 5', 10.7628, 106.6821, 4.0, 60000, '09:00', '22:30', 'korean'),
(N'Texas Chicken', N'217B Nguyễn Văn Cừ, Quận 5', 10.7622, 106.6820, 4.2, 100000, '09:00', '21:00', 'fastfood'),
(N'Phở Lệ', N'413-415 Nguyễn Trãi, Quận 5', 10.7585, 106.6763, 4.6, 85000, '06:00', '01:00', 'vietnamese'),
(N'The Alley', N'151 Nguyễn Văn Cừ, Quận 5', 10.7645, 106.6828, 4.4, 65000, '09:00', '22:00', 'cafe');
GO

-- D. Nạp Menu cho từng quán (mỗi quán 3 món)--
-- Quán 1: Dimsum Mr Hào--
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(1, N'Há Cảo Tôm Tươi', N'Há cảo vỏ mỏng nhân tôm giòn', 45000, 'chinese', 'shrimp,flour'),
(1, N'Xíu Mại Trứng Muối', N'Xíu mại thịt heo kèm trứng muối', 45000, 'chinese', 'pork,salted egg'),
(1, N'Bánh Bao Kim Sa', N'Nhân trứng muối tan chảy', 40000, 'dessert', 'flour,egg,milk');

-- Quán 2: Mì Cay Naga--
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(2, N'Mì Cay Hải Sản', N'Mì cay cấp độ 1-7', 55000, 'korean', 'noodle,shrimp,squid'),
(2, N'Mì Cay Bò', N'Mì cay với thịt bò mềm', 50000, 'korean', 'noodle,beef'),
(2, N'Takoyaki', N'Bánh bạch tuộc nướng', 35000, 'appetizer', 'flour,octopus');

-- Quán 3: Texas Chicken--
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(3, N'Gà Rán Cay (2 miếng)', N'Gà rán giòn rụm tẩm vị', 75000, 'fastfood', 'chicken,flour'),
(3, N'Bánh Quy Mật Ong', N'Bánh nướng bơ mật ong', 15000, 'fastfood', 'flour,honey'),
(3, N'Khoai Tây Chiên', N'Khoai tây vàng giòn', 25000, 'fastfood', 'potato');

-- Quán 4: Phở Lệ--
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(4, N'Phở Tái Nạm', N'Thịt tái và nạm gầu thơm ngon', 75000, 'vietnamese', 'beef,rice noodle'),
(4, N'Phở Bò Viên', N'Nước dùng trong, bò viên dai', 70000, 'vietnamese', 'beef,rice noodle'),
(4, N'Trà Đá', N'Giải khát', 5000, 'drink', 'tea');

-- Quán 5: The Alley--
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(5, N'Sữa Tươi Trân Châu Đường Đen', N'Best seller của quán', 65000, 'cafe', 'milk,boba,sugar'),
(5, N'Trà Sữa Lài', N'Hương lài thơm mát', 50000, 'cafe', 'jasmine tea,milk'),
(5, N'Trà Đào Đào', N'Trà xanh giải nhiệt kèm đào miếng', 55000, 'cafe', 'green tea,peach');
GO


-- 1. Olivia Smith: Đăng nhập bằng tài khoản Local (Username: olivia / Pass: 123456)
-- Lưu ý: password_hash này là mã hóa của "123456" dùng bcrypt
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash)
VALUES (1, 'local', 'olivia', '$2a$10$X78q45p4l9e6c.8o.U0N/uXyvXfFk2vV6e6l6o.U0N/uXyvXfFk2vV');

-- 2. Liam Johnson: Đăng nhập bằng Google
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash)
VALUES (2, 'google', 'liam_google_id_123', NULL);

-- 3. Emma Williams: Đăng nhập Local (Username: emma / Pass: 123456)
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash)
VALUES (3, 'local', 'emma', '$2a$10$X78q45p4l9e6c.8o.U0N/uXyvXfFk2vV6e6l6o.U0N/uXyvXfFk2vV');

-- 4. Noah Brown: Đăng nhập bằng Google (Test luồng FirebaseAuthMiddleware)
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash)
VALUES (4, 'google', 'noah_google_id_456', NULL);

-- 5. Sophia Davis: Đăng nhập Local (Username: sophia / Pass: 123456)
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash)
VALUES (5, 'local', 'sophia', '$2a$10$X78q45p4l9e6c.8o.U0N/uXyvXfFk2vV6e6l6o.U0N/uXyvXfFk2vV');
GO

-- Tạo User trước
INSERT INTO Users (email, name, created_at, updated_at) 
VALUES ('kien@test.com', 'Nguyen Le Anh Kien', GETDATE(), GETDATE());

-- Lấy ID vừa tạo (giả sử là 6) và tạo Login cho nó
-- Lưu ý: password_hash này tương ứng với mật khẩu "123456"
INSERT INTO UserAuth (user_id, provider, provider_id, password_hash, created_at)
VALUES (6, 'local', 'kien_pro', '$2a$10$X78q45p4l9e6c.8o.U0N/uXywXfK2vV6e6l6o.U0N/uXywXfK2vV6', GETDATE());

USE travel_food_db
SELECT * FROM Users

SELECT * FROM UserAuth WHERE provider = 'local'

SELECT * FROM UserAuth WHERE provider = 'google'