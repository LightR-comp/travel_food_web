USE travel_food_db
GO

-- ==========================================
-- TÂN PHÚ VÀ LÂN CẬN
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'CHÁO SƯỜN VƯƠNG - TÂN PHÚ', N'173 Gò Dầu, Tân Phú, TP. HCM', 10.795785, 106.618913, 4.3, 40000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Cháo Ếch Singapore Geylang - A Bảo Tân Phú', N'215 Tây Thạnh, P. Tây Thạnh, Tân Phú, TP. HCM', 10.813284, 106.622905, 4.7, 75000, '16:00', '23:30', N'asian, bình dân'),
(N'Nem Nướng Nha Trang - Since 1982 - Tân Phú', N'434A Nguyễn Sơn, P. Phú Thọ Hoà, Tân Phú, TP. HCM', 10.784857, 106.620249, 4.1, 55000, '09:00', '22:00', N'vietnamese, bình dân'),
(N'Trái Cây Tươi Tân Phú - Trái Cây Tô, Nước Ép & Sinh Tố', N'76/3A Nguyễn Sơn, P. Phú Thọ Hòa, Tân Phú, TP. HCM', 10.782182, 106.631557, 4.6, 35000, '08:00', '22:30', N'dessert, bình dân'),
(N'Ốc Đêm Tây Thạnh - Tân Phú', N'Số 8 Lưu Chí Hiếu, P. Tây Thạnh, Tân Phú, TP. HCM', 10.816421, 106.615234, 4.2, 80000, '15:00', '23:30', N'seafood, nhậu'),
(N'Bánh Mì Bò Kho PHÚ QUÝ - 34 Tân Hòa Đông', N'Số 34 Tân Hòa Đông, P. 13, Quận 6, TP. HCM', 10.755756, 106.633235, 4.8, 45000, '06:00', '13:00', N'vietnamese, bình dân'),
(N'Cafe Mr Lee - Tân Phú', N'1E Đường DC9, P. Tây Thạnh, Tân Phú, TP. HCM', 10.809421, 106.608813, 4.4, 30000, '07:00', '22:00', N'cafe, bình dân'),
(N'Chân Gà Rút Xương 100% - Tân Phước', N'438 Tân Phước, P. 6, Quận 11, TP. HCM', 10.760425, 106.657814, 4.1, 65000, '14:00', '23:00', N'asian, nhậu'),
(N'Mì Trộn Tóp Mỡ Trứng Lòng Đào - Tân Phú', N'45 Bùi Xuân Phái, P. Tây Thạnh, Tân Phú, TP. HCM', 10.808068, 106.628325, 4.9, 40000, '08:00', '21:30', N'vietnamese, bình dân'),
(N'Nakajima Susian Sushi - Aeon Mall Tân Phú', N'30 Tân Thắng, Celadon City, P. Sơn Kỳ, Tân Phú, TP. HCM', 10.803195, 106.618155, 4.6, 150000, '09:00', '22:00', N'japanese, gia đình'),
(N'HUYỀN FOOD LAB - Ăn Vặt, Bánh Tráng & Chân Gà - Tân Phú', N'72G/11 Nguyễn Văn Yến, P. Tân Thới Hòa, Tân Phú, TP. HCM', 10.766324, 106.621456, 4.3, 35000, '09:00', '22:00', N'asian, bình dân'),
(N'Bún Đậu Mắm Tôm A Chảnh - Tân Phú', N'123 Trương Vĩnh Ký, Tân Phú, TP. HCM', 10.793214, 106.628412, 4.7, 55000, '10:00', '22:00', N'vietnamese, bình dân'),
(N'Trà Sữa MayCha - Tân Phú', N'456 Lũy Bán Bích, Tân Phú, TP. HCM', 10.784512, 106.631245, 4.2, 30000, '08:00', '23:00', N'cafe, bình dân'),
(N'Lẩu Gà Lá É 109 - Tân Phú', N'89 Tân Sơn Nhì, Tân Phú, TP. HCM', 10.801234, 106.633456, 4.6, 150000, '10:00', '23:00', N'vietnamese, gia đình'),
(N'Bánh Tráng Trộn Cô Út - Tân Phú', N'12 Nguyễn Sơn, Tân Phú, TP. HCM', 10.781234, 106.625678, 4.4, 25000, '14:00', '22:00', N'asian, bình dân');
GO

DECLARE @IdChaoSuon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'CHÁO SƯỜN VƯƠNG - TÂN PHÚ');
DECLARE @IdChaoEch INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Ếch Singapore Geylang - A Bảo Tân Phú');
DECLARE @IdNemNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Tân Phú');
DECLARE @IdTraiCay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trái Cây Tươi Tân Phú - Trái Cây Tô, Nước Ép & Sinh Tố');
DECLARE @IdOcDem INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Đêm Tây Thạnh - Tân Phú');
DECLARE @IdBoKho INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Bò Kho PHÚ QUÝ - 34 Tân Hòa Đông');
DECLARE @IdCafeMrLee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cafe Mr Lee - Tân Phú');
DECLARE @IdChanGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chân Gà Rút Xương 100% - Tân Phước');
DECLARE @IdMiTron INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn Tóp Mỡ Trứng Lòng Đào - Tân Phú');
DECLARE @IdSushi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nakajima Susian Sushi - Aeon Mall Tân Phú');
DECLARE @IdHuyenFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'HUYỀN FOOD LAB - Ăn Vặt, Bánh Tráng & Chân Gà - Tân Phú');
DECLARE @IdBunDau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Đậu Mắm Tôm A Chảnh - Tân Phú');
DECLARE @IdMayCha INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa MayCha - Tân Phú');
DECLARE @IdLauGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Gà Lá É 109 - Tân Phú');
DECLARE @IdBanhTrang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Trộn Cô Út - Tân Phú');

-- ==========================================
-- CHÈN MENU (4 món ngẫu nhiên mỗi quán)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdChaoSuon, N'Cháo Thịt Bằm Bò Viên', N'Cháo nước hầm xương thơm ngon , thịt bằm nhuyễn cũng bò viên dai ngon', 36000, 'vietnamese', 'porridge, minced pork, beef balls'),
(@IdChaoSuon, N'Cháo Bò Viên Thịt Bằm', N'Cháo nước hầm xương thơm ngọt , bò viên dai ngon , thịt bằm nhuyễn mềm', 36000, 'vietnamese', 'porridge, beef balls, minced pork'),
(@IdChaoSuon, N'Móng Giò', N'', 70000, 'vietnamese', 'pork trotter'),
(@IdChaoSuon, N'Sâm Lạnh Bông Cúc', N'', 20000, 'beverage', 'chrysanthemum tea'),

(@IdChaoEch, N'Cháo Ếch 1 Con', N'Cháo trắng lá dứa và 1 thố ếch', 45000, 'asian', 'frog, porridge, pandan leaves'),
(@IdChaoEch, N'Cháo Ếch 2 Con', N'Cháo trắng lá dứa và 1 thố 2 con ếch', 80000, 'asian', 'frog, porridge, pandan leaves'),
(@IdChaoEch, N'Ếch Sapo', N'Ếch kho tộ đậm đà', 40000, 'asian', 'frog, soy sauce, black pepper'),
(@IdChaoEch, N'Trà Tắc', N'', 15000, 'beverage', 'kumquat tea'),

(@IdNemNuong, N'Phần Nem Nướng', N'Nem nướng, rau sống, bánh tráng, nước chấm', 50000, 'vietnamese', 'grilled pork sausage, rice paper, vegetables'),
(@IdNemNuong, N'Nem Chua Nướng', N'', 15000, 'vietnamese', 'grilled fermented pork roll'),
(@IdNemNuong, N'Bún Nem Nướng', N'', 40000, 'vietnamese', 'rice noodles, grilled pork sausage, vegetables'),
(@IdNemNuong, N'Nước Xâm', N'', 15000, 'beverage', 'herbal drink'),

(@IdTraiCay, N'Trái Cây Tô Đặc Biệt', N'Trái cây tươi mix sữa chua', 35000, 'dessert', 'mixed fruits, yogurt'),
(@IdTraiCay, N'Nước Ép Dưa Hấu', N'', 25000, 'beverage', 'watermelon juice'),
(@IdTraiCay, N'Sinh Tố Bơ', N'', 35000, 'beverage', 'avocado smoothie'),
(@IdTraiCay, N'Nước Ép Cam Cà Rốt', N'', 30000, 'beverage', 'orange juice, carrot juice'),

(@IdOcDem, N'Ốc Hương Rang Muối Ớt', N'', 75000, 'seafood', 'sweet snail, chili salt'),
(@IdOcDem, N'Sò Lông Nướng Mỡ Hành', N'', 55000, 'seafood', 'hairy cockle, scallion oil'),
(@IdOcDem, N'Mì Xào Ốc Giác', N'', 65000, 'seafood', 'fried noodles, snail'),
(@IdOcDem, N'Nghêu Hấp Thái', N'', 50000, 'seafood', 'clam, thai sauce'),

(@IdBoKho, N'Bánh Mì Bò Kho', N'Bò kho mềm, bánh mì nóng giòn', 45000, 'vietnamese', 'beef stew, bread'),
(@IdBoKho, N'Hủ Tiếu Bò Kho', N'', 50000, 'vietnamese', 'hu tieu noodles, beef stew'),
(@IdBoKho, N'Mì Gói Bò Kho', N'', 45000, 'vietnamese', 'instant noodles, beef stew'),
(@IdBoKho, N'Bò Kho Chén', N'', 40000, 'vietnamese', 'beef stew'),

(@IdCafeMrLee, N'Cà Phê Sữa Đá', N'', 25000, 'cafe', 'coffee, condensed milk'),
(@IdCafeMrLee, N'Bạc Xỉu', N'', 30000, 'cafe', 'coffee, fresh milk, condensed milk'),
(@IdCafeMrLee, N'Trà Đào Cam Sả', N'', 35000, 'beverage', 'peach tea, orange, lemongrass'),
(@IdCafeMrLee, N'Matcha Đá Xay', N'', 45000, 'cafe', 'matcha, ice blended'),

(@IdChanGa, N'Chân Gà Sốt Thái', N'Chân gà rút xương sốt chua cay', 65000, 'snack', 'boneless chicken feet, thai sauce'),
(@IdChanGa, N'Chân Gà Ngâm Sả Tắc', N'', 60000, 'snack', 'chicken feet, lemongrass, kumquat'),
(@IdChanGa, N'Tai Heo Ngâm Sả Tắc', N'', 65000, 'snack', 'pig ear, lemongrass, kumquat'),
(@IdChanGa, N'Gỏi Chân Gà Rút Xương', N'', 70000, 'snack', 'boneless chicken feet salad'),

(@IdMiTron, N'Mì Trộn Tóp Mỡ Trứng Lòng Đào', N'Mì trộn đậm đà, tóp mỡ giòn, trứng lòng đào béo ngậy', 40000, 'vietnamese', 'noodles, pork crackling, soft-boiled egg'),
(@IdMiTron, N'Mì Trộn Bò Viên', N'', 45000, 'vietnamese', 'noodles, beef balls'),
(@IdMiTron, N'Mì Trộn Xúc Xích', N'', 35000, 'vietnamese', 'noodles, sausage'),
(@IdMiTron, N'Trà Chanh', N'', 15000, 'beverage', 'lemon tea'),

(@IdSushi, N'Sushi Cá Hồi', N'2 miếng sushi cá hồi tươi', 35000, 'japanese', 'sushi rice, salmon'),
(@IdSushi, N'Sashimi Cá Hồi', N'5 miếng sashimi', 95000, 'japanese', 'salmon sashimi'),
(@IdSushi, N'Cơm Cuộn California', N'', 65000, 'japanese', 'sushi roll, crab stick, avocado, cucumber'),
(@IdSushi, N'Mì Udon Hải Sản', N'', 85000, 'japanese', 'udon noodles, seafood'),

(@IdHuyenFood, N'Bánh Tráng Trộn Thập Cẩm', N'', 25000, 'snack', 'rice paper, beef jerky, quail egg, mango'),
(@IdHuyenFood, N'Bánh Tráng Cuốn Bơ', N'', 20000, 'snack', 'rice paper roll, butter, dried shrimp'),
(@IdHuyenFood, N'Cá Viên Chiên', N'Phần 10 xiên', 50000, 'snack', 'fried fish balls'),
(@IdHuyenFood, N'Trà Dâu Trân Châu', N'', 25000, 'beverage', 'strawberry tea, boba'),

(@IdBunDau, N'Bún Đậu Thập Cẩm', N'Bún, đậu, thịt luộc, chả cốm, nem chua rán', 55000, 'vietnamese', 'rice noodles, tofu, boiled pork, green rice pork sausage, fermented pork roll'),
(@IdBunDau, N'Bún Đậu Thịt Luộc', N'', 45000, 'vietnamese', 'rice noodles, tofu, boiled pork'),
(@IdBunDau, N'Nem Chua Rán', N'', 35000, 'vietnamese', 'fried fermented pork roll'),
(@IdBunDau, N'Nước Sấu', N'', 15000, 'beverage', 'dracontomelon drink'),

(@IdMayCha, N'Trà Sữa Truyền Thống', N'', 25000, 'beverage', 'milk tea, boba'),
(@IdMayCha, N'Trà Olong Macchiato', N'', 35000, 'beverage', 'oolong tea, cream cheese'),
(@IdMayCha, N'Trà Sữa Thái Xanh', N'', 25000, 'beverage', 'thai green milk tea'),
(@IdMayCha, N'Hồng Trà Trân Châu Trắng', N'', 30000, 'beverage', 'black tea, white boba'),

(@IdLauGa, N'Lẩu Gà Lá É (Nhỏ)', N'Gà ta thả vườn, lá é tươi, măng', 150000, 'hotpot', 'chicken, hotpot broth, basil leaves, bamboo shoots'),
(@IdLauGa, N'Lẩu Gà Lá É (Lớn)', N'', 250000, 'hotpot', 'chicken, hotpot broth, basil leaves, bamboo shoots'),
(@IdLauGa, N'Gà Nướng Muối Ớt', N'', 180000, 'vietnamese', 'grilled chicken, chili salt'),
(@IdLauGa, N'Lòng Gà Xào Mướp', N'', 70000, 'vietnamese', 'chicken giblets, sponge gourd'),

(@IdBanhTrang, N'Bánh Tráng Trộn Cô Út', N'Đầy đủ topping', 25000, 'snack', 'rice paper, quail egg, dried beef, mango, peanuts'),
(@IdBanhTrang, N'Bánh Tráng Chấm Nước Me', N'', 20000, 'snack', 'rice paper, tamarind sauce'),
(@IdBanhTrang, N'Bánh Tráng Bơ', N'', 20000, 'snack', 'rice paper, butter'),
(@IdBanhTrang, N'Trà Tắc Xí Muội', N'', 15000, 'beverage', 'kumquat tea, salted plum');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
-- Tự động lấy URL ảnh món ăn đầu tiên để làm ảnh đại diện cho nhà hàng
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdChaoSuon, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mitootm9enlue0', 1),
(@IdChaoEch, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-ml3pro2hp0jpdd', 1),
(@IdNemNuong, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mknqx0r7e5tt3e', 1),
(@IdTraiCay, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mknqvacindvo51', 1),
(@IdOcDem, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mkf6b0ptuwawf6', 1),
(@IdBoKho, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mittoouzlg5c3d', 1),
(@IdCafeMrLee, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mjtby67mw2roaf', 1),
(@IdChanGa, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnyny5sjoava83', 1),
(@IdMiTron, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo4c2jn41hqc3a', 1),
(@IdSushi, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mg4on29makgb44', 1),
(@IdHuyenFood, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnod197ppatcb5', 1),
(@IdBunDau, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-m3y9k0dk9yxtca', 1),
(@IdMayCha, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mjnig2xoynlv0d', 1),
(@IdLauGa, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-meeitws1iio36f', 1),
(@IdBanhTrang, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmw7m18wa51e0b', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Cháo Sườn Vương
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mitootm9enlue0' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Cháo Thịt Bằm Bò Viên' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mittoouzlg5c3d' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Cháo Bò Viên Thịt Bằm' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-ml3pro2hp0jpdd' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Móng Giò' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mknqx0r7e5tt3e' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Sâm Lạnh Bông Cúc' UNION ALL

-- Cháo Ếch Geylang
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnfnkd8zwdmt1e' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cháo Ếch 1 Con' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnfnxgh1bls30d' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cháo Ếch 2 Con' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnfns21d02ys9e' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Ếch Sapo' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mkf6b0ptuwawf6' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Trà Tắc' UNION ALL

-- Nem Nướng Nha Trang
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mjv5rja35am922' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Phần Nem Nướng' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7r98o-lr2r3wdfu6ro2c' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem Chua Nướng' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mjv5vt9e19fma4' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Bún Nem Nướng' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mknqvacindvo51' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nước Xâm' UNION ALL

-- Trái Cây Tươi Tân Phú
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo3xm29tsnpcbb' FROM MenuItems WHERE restaurant_id = @IdTraiCay AND name = N'Trái Cây Tô Đặc Biệt' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo3zldfsvwucdd' FROM MenuItems WHERE restaurant_id = @IdTraiCay AND name = N'Nước Ép Dưa Hấu' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo3zp1g20ao622' FROM MenuItems WHERE restaurant_id = @IdTraiCay AND name = N'Sinh Tố Bơ' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo3yeutujx1h35' FROM MenuItems WHERE restaurant_id = @IdTraiCay AND name = N'Nước Ép Cam Cà Rốt' UNION ALL

-- Ốc Đêm
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcDem AND name = N'Ốc Hương Rang Muối Ớt' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-mcgebb65oqaq0f' FROM MenuItems WHERE restaurant_id = @IdOcDem AND name = N'Sò Lông Nướng Mỡ Hành' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-mcgd7zb3jwkcd0' FROM MenuItems WHERE restaurant_id = @IdOcDem AND name = N'Mì Xào Ốc Giác' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-mcgcpgfhhhnx50' FROM MenuItems WHERE restaurant_id = @IdOcDem AND name = N'Nghêu Hấp Thái' UNION ALL

-- Bò Kho Phú Quý
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7r98o-lr6tsm3n4jwk64' FROM MenuItems WHERE restaurant_id = @IdBoKho AND name = N'Bánh Mì Bò Kho' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7r98o-lr6udfb4r1l02d' FROM MenuItems WHERE restaurant_id = @IdBoKho AND name = N'Hủ Tiếu Bò Kho' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7r98o-lr6u4rnatwp08b' FROM MenuItems WHERE restaurant_id = @IdBoKho AND name = N'Mì Gói Bò Kho' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7r98o-lr6uddapp0nt09' FROM MenuItems WHERE restaurant_id = @IdBoKho AND name = N'Bò Kho Chén' UNION ALL

-- Cafe Mr Lee
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mhjuquiyujgg15' FROM MenuItems WHERE restaurant_id = @IdCafeMrLee AND name = N'Cà Phê Sữa Đá' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mhjuub6yvrpi54' FROM MenuItems WHERE restaurant_id = @IdCafeMrLee AND name = N'Bạc Xỉu' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-ml7rczrovhtuc2' FROM MenuItems WHERE restaurant_id = @IdCafeMrLee AND name = N'Trà Đào Cam Sả' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mhjuhtxri1oh6e' FROM MenuItems WHERE restaurant_id = @IdCafeMrLee AND name = N'Matcha Đá Xay' UNION ALL

-- Chân Gà
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnyny5sjppfq6e' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Chân Gà Sốt Thái' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnyl6deoc45d8e' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Chân Gà Ngâm Sả Tắc' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmpypx5fqsxx9a' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Tai Heo Ngâm Sả Tắc' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-mdob5h3grovl90' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Gỏi Chân Gà Rút Xương' UNION ALL

-- Mì Trộn
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo4c2jn41hqc3a' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì Trộn Tóp Mỡ Trứng Lòng Đào' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo8kghqff8jp50' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì Trộn Bò Viên' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo48mjoa6j291f' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì Trộn Xúc Xích' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134505-81ztc-mo73tqem641v05' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Trà Chanh' UNION ALL

-- Sushi
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mg4zqjwpwh7167' FROM MenuItems WHERE restaurant_id = @IdSushi AND name = N'Sushi Cá Hồi' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mg4zr45ei8zu2e' FROM MenuItems WHERE restaurant_id = @IdSushi AND name = N'Sashimi Cá Hồi' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mg4ztlflaqz0f0' FROM MenuItems WHERE restaurant_id = @IdSushi AND name = N'Cơm Cuộn California' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mg4zrqeqiosob8' FROM MenuItems WHERE restaurant_id = @IdSushi AND name = N'Mì Udon Hải Sản' UNION ALL

-- Huyền Food
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo1f0xrscq9t0d' FROM MenuItems WHERE restaurant_id = @IdHuyenFood AND name = N'Bánh Tráng Trộn Thập Cẩm' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo1ffikxj37m81' FROM MenuItems WHERE restaurant_id = @IdHuyenFood AND name = N'Bánh Tráng Cuốn Bơ' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo1dl0phqqyt24' FROM MenuItems WHERE restaurant_id = @IdHuyenFood AND name = N'Cá Viên Chiên' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo1f4eoieozkae' FROM MenuItems WHERE restaurant_id = @IdHuyenFood AND name = N'Trà Dâu Trân Châu' UNION ALL

-- Bún Đậu
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-m3y9k0dk9yxtca' FROM MenuItems WHERE restaurant_id = @IdBunDau AND name = N'Bún Đậu Thập Cẩm' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ras8-m3y9kmttf6sh08' FROM MenuItems WHERE restaurant_id = @IdBunDau AND name = N'Bún Đậu Thịt Luộc' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ra0g-m8zoy1431g0402' FROM MenuItems WHERE restaurant_id = @IdBunDau AND name = N'Nem Chua Rán' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-7ra0g-m8zoy5lkh4qs03' FROM MenuItems WHERE restaurant_id = @IdBunDau AND name = N'Nước Sấu' UNION ALL

-- MayCha
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-mjnig2xoynlv0d' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Trà Sữa Truyền Thống' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnp1nimwyzgl4c' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Trà Olong Macchiato' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mnp1nimwkzcwc6' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Trà Sữa Thái Xanh' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mo0em9idjzlu38' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Hồng Trà Trân Châu Trắng' UNION ALL

-- Lẩu Gà
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-meeitws1iio36f' FROM MenuItems WHERE restaurant_id = @IdLauGa AND name = N'Lẩu Gà Lá É (Nhỏ)' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-memeansoe4uad5' FROM MenuItems WHERE restaurant_id = @IdLauGa AND name = N'Lẩu Gà Lá É (Lớn)' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-memec3aobocg70' FROM MenuItems WHERE restaurant_id = @IdLauGa AND name = N'Gà Nướng Muối Ớt' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-820l4-meei0452oa9z63' FROM MenuItems WHERE restaurant_id = @IdLauGa AND name = N'Lòng Gà Xào Mướp' UNION ALL

-- Bánh Tráng
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmw7m18wa51e0b' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Bánh Tráng Trộn Cô Út' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmw77xr1r3lwd6' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Bánh Tráng Chấm Nước Me' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmw73pxvwf7s99' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Bánh Tráng Bơ' UNION ALL
SELECT id, 'https://down-tx-vn.img.susercontent.com/vn-11134517-81ztc-mmw743omexom20' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Tắc Xí Muội';