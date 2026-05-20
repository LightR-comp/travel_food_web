use travel_food_db 
go
--QUẬN 10
-- 1. Thêm dữ liệu vào bảng Restaurants
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Nem Nướng Nha Trang - Since 1982 - Quận 10', N'451/29/26 Tô Hiến Thành, P. 14, Quận 10, TP. HCM', 10.772942, 106.663877, 3.5, 45000, '08:00', '22:00', N'vietnamese, bình dân'),
(N'Bo Food - Gà Quay, Sườn Quay & Cơm Lam Bánh Bao Quận 10 - Bà Hạt', N'Số 484 Bà Hạt, P. 8, Quận 10, TP. HCM', 10.765236, 106.665438, 4.5, 250000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'CHÂN GÀ GOOD - QUẬN 10', N'63-65 Ngô Quyền, P. 6, Quận 10, TP. HCM', 10.761618, 106.664970, 4.5, 90000, '10:00', '23:00', N'asian, bình dân'),
(N'Mì Trộn Phủ Trứng - Quận 10', N'104/42 Thành Thái, P. 14, Quận 10, TP. HCM', 10.774393, 106.665241, 4.5, 69000, '08:00', '22:00', N'asian, bình dân'),
(N'Gà Rán YumIco - Quận 10', N'031 Lô U Chung Cư Ngô Gia Tự, P. 12, Quận 10, TP. HCM', 10.763574, 106.773826, 4.5, 80000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Bánh Tráng Muối Tỏi & Dừa Tắc Quận 10 - Hòa Hưng', N'83/14E Hòa Hưng, P. 12, Quận 10, TP. HCM', 10.778425, 106.775366, 4.5, 25000, '08:00', '22:00', N'vietnamese, bình dân'),
(N'Ốc Trứng Muối - Chi Nhánh 4 Quận 10', N'G1A Trường Sơn, P. 15, Quận 10, TP. HCM', 10.781109, 106.661759, 4.0, 80000, '15:00', '23:30', N'seafood, bình dân'),
(N'Chiang Thai Delivery - Quận 10', N'104/59 Thành Thái, P. 12, Quận 10, TP. HCM', 10.774527, 106.665543, 4.5, 75000, '10:00', '22:00', N'thai, bình dân'),
(N'Truyền Thuyết Champong - Quận 10', N'CC8 - CC9 - CC10 Trường Sơn, P. 15, Quận 10, TP. HCM', 10.781764, 106.663217, 4.5, 140000, '10:00', '22:00', N'korean, gia đình'),
(N'Bò Né 3 Anh Em Quận 10', N'013-014 Lô K Chung Cư Ngô Gia Tự, Đường Sư Vạn Hạnh, P. 2, Quận 10, TP. HCM', 10.769632, 106.676971, 4.5, 75000, '06:00', '22:00', N'vietnamese, bình dân');
GO

-- Khai báo biến ID
DECLARE @IdNemNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Quận 10');
DECLARE @IdBoFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bo Food - Gà Quay, Sườn Quay & Cơm Lam Bánh Bao Quận 10 - Bà Hạt');
DECLARE @IdChanGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'CHÂN GÀ GOOD - QUẬN 10');
DECLARE @IdMiTron INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn Phủ Trứng - Quận 10');
DECLARE @IdYumIco INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán YumIco - Quận 10');
DECLARE @IdBanhTrang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Muối Tỏi & Dừa Tắc Quận 10 - Hòa Hưng');
DECLARE @IdOcTrungMuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 4 Quận 10');
DECLARE @IdChiangThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chiang Thai Delivery - Quận 10');
DECLARE @IdChampong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Truyền Thuyết Champong - Quận 10');
DECLARE @IdBoNe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bò Né 3 Anh Em Quận 10');

-- 2. Thêm dữ liệu vào bảng MenuItems (Mỗi quán 5 món, tự động điền ingredients)
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdNemNuong, N'Nem Nướng Nha Trang Ngon + Trà Tắc', N'', 45000, 'vietnamese', 'grilled pork sausage,rice paper,vegetable,tea'),
(@IdNemNuong, N'Nem nướng nha trang + trà tắc', N'', 39000, 'vietnamese', 'grilled pork sausage,rice paper,tea'),
(@IdNemNuong, N'Nem nướng nha trang', N'', 39000, 'vietnamese', 'grilled pork sausage,rice paper,vegetable'),
(@IdNemNuong, N'Nem nướng nha trang + coca', N'', 39000, 'vietnamese', 'grilled pork sausage,rice paper,soda'),
(@IdNemNuong, N'Nem Nướng Nha Trang + 15 Cá Viên Chiên + Trà Tắc', N'', 62300, 'vietnamese', 'grilled pork sausage,fish ball,tea'),

(@IdBoFood, N'1/2 Con Vịt Quay Tỳ Bà Da Giòn', N'1/2 con vịt Quay da giòn, 5 cái bánh bao,rau, dưa chua', 209000, 'vietnamese', 'roasted duck,steamed bun,vegetable'),
(@IdBoFood, N'Combo Vịt Quay Tỳ Bà Da Giòn', N'1 Con Vịt Quay da Giòn ,10 cái bánh bao, rau, dưa chua', 389000, 'vietnamese', 'roasted duck,steamed bun,vegetable'),
(@IdBoFood, N'1 Con Vịt Quay Tỳ Bà Da Giòn', N'1 Con Vịt Quay Da Giòn, rau, dưa chua, nước chấm', 369000, 'vietnamese', 'roasted duck,vegetable'),
(@IdBoFood, N'Combo gà quay - sốt thảo dược đậm vị', N'1 gà quay, 4 bánh,1 cơm lam, rau chua, dưa leo', 263000, 'vietnamese', 'roasted chicken,bamboo tube rice,herbs'),
(@IdBoFood, N'Combo gà quay - roast chicken combo', N'1 Gà quay + 4 bánh + 1 cơm lam, rau chua, dưa leo', 263000, 'vietnamese', 'roasted chicken,bamboo tube rice,cucumber'),

(@IdChanGa, N'Mix 5 Món - Khách Chọn Loại Sốt (Hộp L)', N'Hộp có sẵn cóc (xoài), đu đủ, rau răm & sốt chấm tùy chọn', 115000, 'snack', 'chicken feet,mango,papaya,sauce'),
(@IdChanGa, N'Mix 4 Món - Khách Chọn Loại Sốt (Hộp T)', N'Hộp có sẵn cóc (xoài), đu đủ, rau răm & sốt chấm', 95000, 'snack', 'chicken feet,mango,papaya,sauce'),
(@IdChanGa, N'Mix 3 Món - Khách Chọn Loại Sốt (Hộp N)', N'Hộp có sẵn cóc (xoài), đu đủ, rau răm & sốt chấm', 75000, 'snack', 'chicken feet,mango,papaya,sauce'),
(@IdChanGa, N'Chân Gà Rút Xương Sốt Thái (Lớn 650gr) + Trà Vải/Đào', N'Combo Ưu Đãi', 147000, 'snack', 'boneless chicken feet,thai sauce,tea'),
(@IdChanGa, N'Chân Gà Rút Xương Sả Tắc (Lớn 650gr) + Trà Sữa', N'Combo Ưu Đãi', 149000, 'snack', 'boneless chicken feet,lemongrass,kumquat,milk tea'),

(@IdMiTron, N'Mì trộn tôm thịt bằm phủ trứng', N'', 69000, 'noodle', 'noodle,shrimp,minced pork,egg'),
(@IdMiTron, N'Mì trộn bò lúc lắc phủ trứng', N'', 69000, 'noodle', 'noodle,beef,egg,sauce'),
(@IdMiTron, N'Mì trộn bò sốt tiêu xanh', N'Bò mềm, sốt vị tiêu xanh hoà quyện', 69000, 'noodle', 'noodle,beef,green pepper,sauce'),
(@IdMiTron, N'Mì trộn heo chiên giòn phủ trứng', N'', 69000, 'noodle', 'noodle,fried pork,egg'),
(@IdMiTron, N'Mì trộn bò cháy tỏi', N'', 69000, 'noodle', 'noodle,beef,garlic'),

(@IdYumIco, N'TENDER SHARE', N'12 Miếng Tender, 2 Khoai Tây Chiên, 2 Pepsi', 98000, 'fastfood', 'chicken tender,french fries,soda'),
(@IdYumIco, N'TENDER PLUS', N'6 Miếng Tender, 1 Khoai Tây Chiên, 1 Pepsi', 68000, 'fastfood', 'chicken tender,french fries,soda'),
(@IdYumIco, N'TENDER SOLO', N'4 Miếng Tender, 1 Khoai Tây Chiên, 1 Pepsi', 58000, 'fastfood', 'chicken tender,french fries,soda'),
(@IdYumIco, N'TENDER PARTY', N'28 Miếng Tender, 4 Khoai Tây Chiên, 4 Pepsi', 228000, 'fastfood', 'chicken tender,french fries,soda'),
(@IdYumIco, N'KHOAI TÂY CHIÊN', N'1 Khoai Tây Chiên, 1 Sauce YumI', 20000, 'fastfood', 'potato,oil'),

(@IdBanhTrang, N'Trà Chanh Tươi Mật Ông', N'', 22950, 'beverage', 'tea,lemon,honey'),
(@IdBanhTrang, N'Hồng Trà', N'', 18700, 'beverage', 'black tea,sugar'),
(@IdBanhTrang, N'Trà Đào Lắc', N'', 21250, 'beverage', 'tea,peach,sugar'),
(@IdBanhTrang, N'Trà Tắc Xí Muội + Mật Ông', N'', 22100, 'beverage', 'tea,kumquat,salted plum,honey'),
(@IdBanhTrang, N'Trà Dâu Lắc', N'', 21250, 'beverage', 'tea,strawberry,sugar'),

(@IdOcTrungMuoi, N'Sò Huyết xào me', N'Nước sốt me đặc biệt quán hoà quện sò', 59000, 'seafood', 'blood cockle,tamarind sauce'),
(@IdOcTrungMuoi, N'Sò Huyết cháy tỏi Tóp Mỡ', N'Sò tươi kết hợp cháy tỏi tóp mỡ giòn tan', 59000, 'seafood', 'blood cockle,garlic,pork fat'),
(@IdOcTrungMuoi, N'Sò Huyết nướng mọi/Lacoste', N'Khi ốc nướng mọi giữ nguyên vị tươi ốc', 59000, 'seafood', 'blood cockle'),
(@IdOcTrungMuoi, N'Nhum biển nướng trứng cút', N'', 55000, 'seafood', 'sea urchin,quail egg'),
(@IdOcTrungMuoi, N'Nhum biển nướng mỡ hành', N'', 55000, 'seafood', 'sea urchin,scallion,oil'),

(@IdChiangThai, N'Pad Thai Tôm', N'Stir-fried rice-noodle with Shrimps', 68500, 'thai', 'rice noodle,shrimp,egg,peanut'),
(@IdChiangThai, N'Pad Thai Bò', N'Thịt bò, hũ tiếu, giá, hẹ, chanh ớt đậu phộng', 75000, 'thai', 'rice noodle,beef,bean sprout,peanut'),
(@IdChiangThai, N'Hủ tiếu áp chảo với Tôm', N'Hủ tiếu, tôm, trứng, rau cải', 68500, 'thai', 'rice noodle,shrimp,egg'),
(@IdChiangThai, N'Pad Thai Gà', N'Stir-fried rice-noodle with Chicken', 68500, 'thai', 'rice noodle,chicken,egg,peanut'),
(@IdChiangThai, N'Hủ tiếu mềm xào thịt Bò', N'Thịt bò, hũ tiếu, rau cải', 75000, 'thai', 'rice noodle,beef,vegetable'),

(@IdChampong, N'Mì tương đen- 짜장면', N'', 120000, 'korean', 'noodle,chunjang,pork,onion'),
(@IdChampong, N'Thịt heo chua ngọt Size Mini', N'', 180000, 'korean', 'pork,sweet and sour sauce'),
(@IdChampong, N'Há cảo chiên-군만두', N'', 100000, 'korean', 'flour,pork,vegetable'),
(@IdChampong, N'Mỳ lạnh nước', N'', 140000, 'korean', 'cold noodle,broth,egg,cucumber'),
(@IdChampong, N'Mỳ lạnh trộn', N'', 140000, 'korean', 'cold noodle,gochujang,egg,cucumber'),

(@IdBoNe, N'Số 1', N'Bò, Trứng, Pate', 59000, 'vietnamese', 'beef,egg,pate,bread'),
(@IdBoNe, N'Số 2', N'Nhiều bò, trứng', 70000, 'vietnamese', 'beef,egg,bread'),
(@IdBoNe, N'Bò né đặc biệt', N'Bò, Trứng, Pate, Xúc xích, Chả, Nem nướng,thịt nguội, phô mai cục', 91000, 'vietnamese', 'beef,egg,pate,sausage,cheese'),
(@IdBoNe, N'Số 3', N'Bò, Trứng, Pate, Xúc xích, chả', 69000, 'vietnamese', 'beef,egg,pate,sausage'),
(@IdBoNe, N'Số 4', N'Bò, Trứng, Pate, Xúc xích, Chả, Nem, thịt nguội', 75000, 'vietnamese', 'beef,egg,pate,sausage,pork roll');

-- ==========================================
-- 1. CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG
-- (Sử dụng ảnh của món đầu tiên do JSON không có ảnh nhà hàng)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdNemNuong, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhu9euqahurlfb', 1),
(@IdBoFood, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdki9iefzh6tcf', 1),
(@IdChanGa, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m715gzwx26uw00', 1),
(@IdMiTron, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8ys96m8362f0', 1),
(@IdYumIco, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjczic7fduro6a', 1),
(@IdBanhTrang, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lykn43x39jd95f', 1),
(@IdOcTrungMuoi, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcgj773flrq46e', 1),
(@IdChiangThai, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4etf7vjhip3e', 1),
(@IdChampong, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mejk8r4weyvb97', 1),
(@IdBoNe, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdziz3rllurnae', 1);

-- ==========================================
-- 2. CHÈN ẢNH CHO TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Nem Nướng Nha Trang
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhu9euqahurlfb' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem Nướng Nha Trang Ngon + Trà Tắc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbi8h1coxmno88' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem nướng nha trang + trà tắc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbi8exizw613ed' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem nướng nha trang' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbi8g2hzz4v428' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem nướng nha trang + coca' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm012tw8qwoyaa' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem Nướng Nha Trang + 15 Cá Viên Chiên + Trà Tắc' UNION ALL

-- Bo Food
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdki9iefzh6tcf' FROM MenuItems WHERE restaurant_id = @IdBoFood AND name = N'1/2 Con Vịt Quay Tỳ Bà Da Giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdki7d4l2cvle6' FROM MenuItems WHERE restaurant_id = @IdBoFood AND name = N'Combo Vịt Quay Tỳ Bà Da Giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcultsnmbwd87a' FROM MenuItems WHERE restaurant_id = @IdBoFood AND name = N'1 Con Vịt Quay Tỳ Bà Da Giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9n833ymvl1gb6' FROM MenuItems WHERE restaurant_id = @IdBoFood AND name = N'Combo gà quay - sốt thảo dược đậm vị' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9n82ik475he95' FROM MenuItems WHERE restaurant_id = @IdBoFood AND name = N'Combo gà quay - roast chicken combo' UNION ALL

-- Chân Gà Good
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m715gzwx26uw00' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Mix 5 Món - Khách Chọn Loại Sốt (Hộp L)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m715hi5od3qw08' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Mix 4 Món - Khách Chọn Loại Sốt (Hộp T)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m715jwxddyd4e0' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Mix 3 Món - Khách Chọn Loại Sốt (Hộp N)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr4c1uqov2ysb4' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Chân Gà Rút Xương Sốt Thái (Lớn 650gr) + Trà Vải/Đào' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr4c1tn0h58kad' FROM MenuItems WHERE restaurant_id = @IdChanGa AND name = N'Chân Gà Rút Xương Sả Tắc (Lớn 650gr) + Trà Sữa' UNION ALL

-- Mì Trộn Phủ Trứng
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8ys96m8362f0' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn tôm thịt bằm phủ trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8yqdqsg36361' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn bò lúc lắc phủ trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8yssprvax863' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn bò sốt tiêu xanh' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8yrqnc0he386' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn heo chiên giòn phủ trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh8yw3cnugw898' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn bò cháy tỏi' UNION ALL

-- Gà Rán YumIco
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjczic7fduro6a' FROM MenuItems WHERE restaurant_id = @IdYumIco AND name = N'TENDER SHARE' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjczic7fcg78ce' FROM MenuItems WHERE restaurant_id = @IdYumIco AND name = N'TENDER PLUS' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjczic7c11xf30' FROM MenuItems WHERE restaurant_id = @IdYumIco AND name = N'TENDER SOLO' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjd0o55ngxdy23' FROM MenuItems WHERE restaurant_id = @IdYumIco AND name = N'TENDER PARTY' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjd0o55m562t91' FROM MenuItems WHERE restaurant_id = @IdYumIco AND name = N'KHOAI TÂY CHIÊN' UNION ALL

-- Bánh Tráng Muối Tỏi & Dừa Tắc
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lykn43x39jd95f' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Chanh Tươi Mật Ông' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m6qk9ph6n9up55' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Hồng Trà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lyknanwrx50h8d' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Đào Lắc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lykn67iqo4zxe7' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Tắc Xí Muội + Mật Ông' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lykn801o7ej1de' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Dâu Lắc' UNION ALL

-- Ốc Trứng Muối CN4
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcgj773flrq46e' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Sò Huyết xào me' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcghmaa5slcyfa' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Sò Huyết cháy tỏi Tóp Mỡ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcghnaar36si76' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Sò Huyết nướng mọi/Lacoste' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcghjo2zn4bx0e' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Nhum biển nướng trứng cút' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcgjpv12b5sy0b' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Nhum biển nướng mỡ hành' UNION ALL

-- Chiang Thai Delivery
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4etf7vjhip3e' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Pad Thai Tôm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4ev8jnxvw801' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Pad Thai Bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4ewxxo3t885d' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Hủ tiếu áp chảo với Tôm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4exokl4jw8aa' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Pad Thai Gà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma4eulhrobyb80' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Hủ tiếu mềm xào thịt Bò' UNION ALL

-- Truyền Thuyết Champong
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mejk8r4weyvb97' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mì tương đen- 짜장면' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mesbxezk189215' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Thịt heo chua ngọt Size Mini' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mejk8r4s31tx31' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Há cảo chiên-군만두' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgjbxhviby88d5' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mỳ lạnh nước' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgjbxhvt998u37' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mỳ lạnh trộn' UNION ALL

-- Bò Né 3 Anh Em
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdziz3rllurnae' FROM MenuItems WHERE restaurant_id = @IdBoNe AND name = N'Số 1' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6s1h4xog04b9' FROM MenuItems WHERE restaurant_id = @IdBoNe AND name = N'Số 2' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6ovvzso9vp9d' FROM MenuItems WHERE restaurant_id = @IdBoNe AND name = N'Bò né đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6pjvvbkf0l44' FROM MenuItems WHERE restaurant_id = @IdBoNe AND name = N'Số 3' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdzj0ifj8ver0b' FROM MenuItems WHERE restaurant_id = @IdBoNe AND name = N'Số 4';
GO