USE travel_food_db
GO

INSERT INTO Users (email, name, avatar_url) VALUES 
('lecongminhnhut7@gmail.com', N'Nhựt', NULL),
('kien@gmail.com', N'Kiên', NULL),
('sang@gmail.com', N'Sáng', NULL),
('dang@gmail.com', N'Đăng', NULL),
('minh@gmail.com', N'Minh', NULL);
GO

INSERT INTO UserAuth (user_id, provider, provider_id, password_hash) VALUES 
(1, 'local', 'nhut_local', '$2a$10$X78q45p4l9e6c.8o.U0N/uXyvXfFk2vV6e6l6o.U0N/uXyvXfFk2vV'),
(2, 'google', 'kien_google_id_123', NULL),
(3, 'facebook', 'sang_facebook_id_456', NULL),
(4, 'local', 'dang_local', '$2a$10$X78q45p4l9e6c.8o.U0N/uXyvXfFk2vV6e6l6o.U0N/uXyvXfFk2vV'),
(5, 'google', 'minh_google_id_789', NULL);
GO

INSERT INTO UserPreferences (user_id, budget_per_person, dietary, food_types) VALUES 
(1, 150000, '', 'bbq,vietnamese'),
(2, 60000, 'vegan', 'cafe,dessert'),
(3, 100000, '', 'fastfood,korean'),
(4, 85000, '', 'chinese,dimsum'),
(5, 70000, 'vegetarian', 'vietnamese,noodle');
GO

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Bánh Canh Ghẹ Ngọc Lâm', N'26 Đ. Lê Văn Việt, Hiệp Phú, TP Thủ Đức', 10.847821, 106.775455, 3.9, 65000, '07:00', '22:30', 'vietnamese'),
(N'Busan Korean Food', N'25 Đ. Lê Văn Việt, Hiệp Phú, TP Thủ Đức', 10.848344, 106.775172, 4.0, 120000, '11:00', '22:00', 'korean'),
(N'Hủ Tiếu Nam Vang Kim Khánh', N'110 Đ. Lê Văn Việt, Hiệp Phú, TP Thủ Đức', 10.846560, 106.777395, 4.7, 50000, '06:00', '22:00', 'vietnamese'),
(N'Gà Nướng Đệ Nhất', N'57 Đ. Lê Văn Việt, Hiệp Phú, TP Thủ Đức', 10.847887, 106.775697, 4.7, 195000, '08:30', '22:00', 'bbq'),
(N'Cơm Tấm Phúc Lộc Thọ', N'31-33 Đ. Lê Văn Việt, Hiệp Phú, TP Thủ Đức', 10.848209, 106.775322, 4.1, 55000, '06:00', '22:00', 'vietnamese');
GO

DECLARE @IdNgocLam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Canh Ghẹ Ngọc Lâm');
DECLARE @IdBusan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Busan Korean Food');
DECLARE @IdKimKhanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Nam Vang Kim Khánh');
DECLARE @IdDeNhat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Nướng Đệ Nhất');
DECLARE @IdPhucLocTho INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Phúc Lộc Thọ');

INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdNgocLam, N'Bánh Canh Ghẹ Nguyên Con', N'Bánh canh bột lọc, ghẹ nguyên con tươi ngọt', 85000, 'vietnamese', 'crab,noodle,pork'),
(@IdNgocLam, N'Bánh Canh Ghẹ Tôm', N'Bánh canh kèm thịt ghẹ lột và tôm sú', 65000, 'vietnamese', 'crab,shrimp,noodle'),
(@IdNgocLam, N'Chả Ghẹ Cuốn', N'Chả ghẹ chiên giòn ăn kèm rau sống', 45000, 'appetizer', 'crab,pork,flour'),

(@IdBusan, N'Cơm Trộn Bibimbap', N'Cơm trộn thố đá nóng hổi', 75000, 'korean', 'rice,beef,egg,vegetable'),
(@IdBusan, N'Mì Cay Hải Sản', N'Mì cay Hàn Quốc chuẩn vị', 80000, 'korean', 'noodle,shrimp,squid'),
(@IdBusan, N'Gà Rán Sốt Cay Ngọt', N'Gà rán tẩm sốt Hàn', 95000, 'korean', 'chicken,flour,chili'),

(@IdKimKhanh, N'Hủ Tiếu Nam Vang Khô', N'Hủ tiếu trộn sốt đậm đà, kèm chén súp', 55000, 'vietnamese', 'noodle,pork,shrimp,egg'),
(@IdKimKhanh, N'Hủ Tiếu Nam Vang Nước', N'Nước xương hầm thanh ngọt', 50000, 'vietnamese', 'noodle,pork,shrimp'),
(@IdKimKhanh, N'Bún Thái', N'Bún chua cay vị Thái Lan', 55000, 'vietnamese', 'noodle,shrimp,squid,beef'),

(@IdDeNhat, N'Gà Nướng Mắm Nhĩ (Lớn)', N'Gà nướng thơm lừng kèm xôi', 195000, 'bbq', 'chicken,fish sauce,sticky rice'),
(@IdDeNhat, N'Gà Nướng Muối Ớt (Lớn)', N'Gà nướng cay nồng kèm bánh bao', 195000, 'bbq', 'chicken,chili,salt'),
(@IdDeNhat, N'Lẩu Gà Ớt Hiểm', N'Lẩu gà cay xé lưỡi, siêu ngon', 245000, 'bbq', 'chicken,chili,vegetable'),

(@IdPhucLocTho, N'Cơm Tấm Sườn Bì Chả', N'Combo truyền thống trứ danh', 65000, 'vietnamese', 'rice,pork,egg'),
(@IdPhucLocTho, N'Cơm Tấm Đùi Gà Nướng', N'Đùi gà nướng góc tư sốt mật ong', 55000, 'vietnamese', 'rice,chicken,honey'),
(@IdPhucLocTho, N'Canh Rong Biển Thịt Bằm', N'Canh thanh mát giải ngấy', 15000, 'vietnamese', 'seaweed,pork');
GO


