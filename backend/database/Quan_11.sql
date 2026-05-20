use travel_food_db
go 
--QUẬN 11
-- 1. CHÈN DỮ LIỆU VÀO BẢNG RESTAURANTS (20 QUÁN QUẬN 11)
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Kênh Bà Châu - Cá Hồi Ngâm Tương Thạng Hạng', N'6/8C Tân Hoá, P. 1, Quận 11, TP. HCM', 10.755293, 106.638042, 4.5, 150000, '10:00', '21:00', N'japanese, hẹn hò'),
(N'Phở Trường Sơn - Quận 11', N'273 Lạc Long Quân, P. 3, Quận 11, TP. HCM', 10.764995, 106.642187, 4.5, 60000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Bánh Mì Tuấn Mập - Bánh Mì Chảo & Bò Bít Tết - Lãnh Binh Thăng', N'116 Lãnh Binh Thăng, Quận 11, TP. HCM', 10.762489, 106.654248, 4.5, 55000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới', N'25 Đường Số 6, P. 8, Quận 11, TP. HCM', 10.761426, 106.649229, 4.5, 65000, '00:00', '23:59', N'vietnamese, bình dân'),
(N'Hủ Tiếu Chay - Tôn Thất Hiệp', N'11A Tôn Thất Hiệp, P. 13, Quận 11, TP. HCM', 10.763426, 106.654229, 4.5, 35000, '07:00', '20:00', N'vietnamese, ăn chay'),
(N'Cơm Truyền Ký - Quận 11', N'39/20 Lý Thường Kiệt, Quận 11, TP. HCM', 10.759192, 106.660903, 4.5, 100000, '10:00', '21:00', N'chinese, gia đình'),
(N'Sủi Cảo Ngọc Ý - Hà Tôn Quyền', N'187 - 189 Hà Tôn Quyền, P. 7, Quận 11, TP. HCM', 10.757886, 106.652599, 4.5, 70000, '11:00', '23:00', N'chinese, bình dân'),
(N'Sủi Cảo Thiên Thiên - Hà Tôn Quyền', N'195 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.758131, 106.652656, 4.5, 70000, '13:00', '23:30', N'chinese, bình dân'),
(N'Sủi Cảo 193 - Hà Tôn Quyền', N'193 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.758067, 106.652658, 4.5, 70000, '11:00', '23:00', N'chinese, bình dân'),
(N'Sủi Cảo 162 - Hà Tôn Quyền', N'162 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.757880, 106.652530, 4.5, 70000, '11:00', '23:00', N'chinese, bình dân'),
(N'Bò Né 3 Anh Em - Quận 11', N'221 Hòa Bình, P. Hiệp Tân, Quận 11, TP. HCM', 10.761061, 106.652533, 4.5, 75000, '07:00', '22:00', N'vietnamese, bình dân'),
(N'Tàu Hũ tươi Covang Quận 11 - Bình Thới', N'166 Bình Thới, P. 14, Quận 11, TP. HCM', 10.765691, 106.645532, 5.0, 30000, '08:00', '22:00', N'dessert, bình dân'),
(N'Bánh Cuốn & Bánh Ướt Phú Lâm - Quận 11', N'221/11 Lãnh Binh Thăng, P. 12, Quận 11, TP. HCM', 10.764510, 106.651420, 4.5, 40000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Bánh Sầu Riêng 9 Sạch - Quận 11', N'138 Lạc Long Quân, P. 10, Quận 11, TP. HCM', 10.764820, 106.643210, 4.5, 175000, '09:00', '21:00', N'bakery, quà tặng'),
(N'Ăn Vặt 3 Chị Em - Quận 11', N'110/33/2 Ông Ích Khiêm, P. 5, Quận 11, TP. HCM', 10.768120, 106.640100, 4.5, 60000, '09:00', '22:00', N'asian, bình dân'),
(N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11', N'120 Bình Thới, P. 14, Quận 11, TP. HCM', 10.765400, 106.646100, 4.5, 120000, '10:00', '22:00', N'thai, gia đình'),
(N'Mì Trộn & Xiên Que Cá Con - Quận 11', N'45 Đường Số 2, Cư Xá Bình Thới, Quận 11, TP. HCM', 10.766120, 106.647200, 4.0, 50000, '08:00', '21:00', N'asian, bình dân'),
(N'Gà Rán YumIco - Quận 11', N'25 Đường Số 16, Cư Xá Lữ Gia, Quận 11, TP. HCM', 10.772100, 106.655300, 4.5, 80000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Mì Trộn Phủ Trứng - Quận 11', N'341/14D Lạc Long Quân, P. 5, Quận 11, TP. HCM', 10.768410, 106.641500, 4.5, 65000, '08:00', '21:00', N'asian, bình dân'),
(N'An Lạc - Ăn Chay - Quận 11', N'221/11 Lãnh Binh Thăng, P. 12, Quận 11, TP. HCM', 10.764510, 106.651420, 4.5, 30000, '07:00', '21:00', N'vietnamese, ăn chay');
GO

-- 2. KHAI BÁO BIẾN ID
DECLARE @IdKenhBaChau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Kênh Bà Châu - Cá Hồi Ngâm Tương Thạng Hạng');
DECLARE @IdPhoTruongSon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Trường Sơn - Quận 11');
DECLARE @IdBanhMiTuanMap INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Tuấn Mập - Bánh Mì Chảo & Bò Bít Tết - Lãnh Binh Thăng');
DECLARE @IdComBo24H INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới');
DECLARE @IdHuTieuChay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Chay - Tôn Thất Hiệp');
DECLARE @IdComTruyenKy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Truyền Ký - Quận 11');
DECLARE @IdSuiCaoNgocY INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sủi Cảo Ngọc Ý - Hà Tôn Quyền');
DECLARE @IdSuiCaoThienThien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sủi Cảo Thiên Thiên - Hà Tôn Quyền');
DECLARE @IdSuiCao193 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sủi Cảo 193 - Hà Tôn Quyền');
DECLARE @IdSuiCao162 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sủi Cảo 162 - Hà Tôn Quyền');
DECLARE @IdBoNe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bò Né 3 Anh Em - Quận 11');
DECLARE @IdTauHu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tàu Hũ tươi Covang Quận 11 - Bình Thới');
DECLARE @IdBanhCuon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Cuốn & Bánh Ướt Phú Lâm - Quận 11');
DECLARE @IdSauRieng INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Sầu Riêng 9 Sạch - Quận 11');
DECLARE @IdAnVat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt 3 Chị Em - Quận 11');
DECLARE @IdSoiThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11');
DECLARE @IdCaCon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn & Xiên Que Cá Con - Quận 11');
DECLARE @IdYumIco INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán YumIco - Quận 11');
DECLARE @IdMiTron INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn Phủ Trứng - Quận 11');
DECLARE @IdAnLac INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'An Lạc - Ăn Chay - Quận 11');

-- 3. CHÈN DỮ LIỆU VÀO BẢNG MENUITEMS (5 MÓN MỖI QUÁN)
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdKenhBaChau, N'Set B - Cơm Cá hồi Nauy, Trứng Ngâm tương', N'45gr Cá + 1 Trứng + Đồ ăn kèm', 139500, 'japanese', 'salmon,egg,rice,kimchi,seaweed'),
(@IdKenhBaChau, N'Set A - Cơm Cá hồi Nauy Ngâm tương', N'45gr Cá + Đồ ăn kèm', 114300, 'japanese', 'salmon,rice,kimchi,seaweed'),
(@IdKenhBaChau, N'Set C - Cơm Cá hồi Nauy, Tôm Ngâm tương', N'45gr Cá + 3 Tôm + Đồ ăn kèm', 157500, 'japanese', 'salmon,shrimp,rice,seaweed'),
(@IdKenhBaChau, N'Cá Hồi Nauy Ngâm Tương (Riêng)', N'100gr Cá hồi + Sốt ngâm', 215100, 'japanese', 'salmon,soy sauce,ginger'),
(@IdKenhBaChau, N'Tôm Thẻ Ngâm Tương (Riêng)', N'10 con Tôm + Sốt ngâm', 161100, 'japanese', 'shrimp,soy sauce,garlic'),

(@IdPhoTruongSon, N'Phở Tái', N'', 55000, 'vietnamese', 'rice noodle,beef,beef broth,herbs'),
(@IdPhoTruongSon, N'Phở Nạm', N'', 55000, 'vietnamese', 'rice noodle,beef flank,beef broth'),
(@IdPhoTruongSon, N'Phở Gân', N'', 55000, 'vietnamese', 'rice noodle,beef tendon,beef broth'),
(@IdPhoTruongSon, N'Phở Viên', N'', 55000, 'vietnamese', 'rice noodle,beef ball,beef broth'),
(@IdPhoTruongSon, N'Phở Đặc Biệt', N'', 75000, 'vietnamese', 'rice noodle,beef,tendon,beef ball'),

(@IdBanhMiTuanMap, N'Bánh Mì Chảo Đặc Biệt', N'2 trứng, xúc xích, pate, cá mòi', 55000, 'vietnamese', 'egg,sausage,pate,sardine,bread'),
(@IdBanhMiTuanMap, N'Bánh Mì Chảo Thường', N'2 trứng, pate, chả', 35000, 'vietnamese', 'egg,pate,pork roll,bread'),
(@IdBanhMiTuanMap, N'Bò Bít Tết Khoai Tây', N'', 65000, 'vietnamese', 'beef,potato,bread,salad'),
(@IdBanhMiTuanMap, N'Bò Bít Tết Trứng Ốp La', N'', 65000, 'vietnamese', 'beef,egg,bread,salad'),
(@IdBanhMiTuanMap, N'Bánh Mì Thịt Nướng', N'', 25000, 'vietnamese', 'bread,grilled pork,cucumber'),

(@IdComBo24H, N'Cơm Bò Beefsteak Phủ Trứng', N'', 65000, 'vietnamese', 'rice,beef,egg,onion'),
(@IdComBo24H, N'Cơm Tôm Rim Mặn Phủ Trứng', N'', 55000, 'vietnamese', 'rice,shrimp,egg,fish sauce'),
(@IdComBo24H, N'Mì Ý Bò Bằm Phủ Trứng', N'', 55000, 'vietnamese', 'pasta,beef,tomato sauce,egg'),
(@IdComBo24H, N'Nui Xào Bò Phủ Trứng', N'', 55000, 'vietnamese', 'macaroni,beef,egg,vegetable'),
(@IdComBo24H, N'Canh Rong Biển Thịt Bằm', N'', 15000, 'vietnamese', 'seaweed,minced pork,ginger'),

(@IdHuTieuChay, N'Hủ Tiếu Chay Thập Cẩm', N'', 35000, 'vegetarian', 'rice noodle,tofu,mushroom,vegetable'),
(@IdHuTieuChay, N'Hủ Tiếu Nam Vang Chay', N'', 35000, 'vegetarian', 'rice noodle,tofu,mushroom,carrot'),
(@IdHuTieuChay, N'Mì Vàng Chay', N'', 35000, 'vegetarian', 'egg noodle,tofu,mushroom,vegetable'),
(@IdHuTieuChay, N'Bún Huế Chay', N'', 35000, 'vegetarian', 'rice noodle,tofu,lemongrass,chili'),
(@IdHuTieuChay, N'Gỏi Cuốn Chay', N'', 21000, 'vegetarian', 'rice paper,tofu,vermicelli,herbs'),

(@IdComTruyenKy, N'Cơm Gà Hải Nam', N'', 75000, 'chinese', 'rice,chicken,ginger sauce'),
(@IdComTruyenKy, N'Cơm Xá Xíu', N'', 65000, 'chinese', 'rice,bbq pork,soy sauce'),
(@IdComTruyenKy, N'Cơm Heo Quay', N'', 65000, 'chinese', 'rice,roasted pork,soy sauce'),
(@IdComTruyenKy, N'Canh Cải Chua Sườn Non', N'', 45000, 'chinese', 'mustard green,pork rib'),
(@IdComTruyenKy, N'Đậu Hủ Ma Bà', N'', 55000, 'chinese', 'tofu,minced pork,chili paste'),

(@IdSuiCaoNgocY, N'Sủi Cảo Thập Cẩm', N'Sủi cảo, mực, cá viên, tôm', 70000, 'chinese', 'dumpling,shrimp,squid,fish ball'),
(@IdSuiCaoNgocY, N'Sủi Cảo Không', N'', 60000, 'chinese', 'shrimp dumpling,pork broth'),
(@IdSuiCaoNgocY, N'Mì Sủi Cảo', N'', 70000, 'chinese', 'egg noodle,shrimp dumpling'),
(@IdSuiCaoNgocY, N'Sủi Cảo Chiên', N'', 70000, 'chinese', 'shrimp dumpling,oil,sauce'),
(@IdSuiCaoNgocY, N'Hủ Tiếu Sủi Cảo', N'', 70000, 'chinese', 'rice noodle,shrimp dumpling'),

(@IdSuiCaoThienThien, N'Sủi Cảo Tôm Mực', N'', 70000, 'chinese', 'shrimp dumpling,squid,pork broth'),
(@IdSuiCaoThienThien, N'Mì Sủi Cảo Thập Cẩm', N'', 75000, 'chinese', 'egg noodle,shrimp dumpling,fish ball'),
(@IdSuiCaoThienThien, N'Sủi Cảo Chiên Giòn', N'', 70000, 'chinese', 'shrimp dumpling,oil'),
(@IdSuiCaoThienThien, N'Súp Sủi Cảo Viên', N'', 70000, 'chinese', 'shrimp dumpling,fish ball,broth'),
(@IdSuiCaoThienThien, N'Xá Xíu Đĩa', N'', 100000, 'chinese', 'bbq pork,soy sauce,honey'),

(@IdSuiCao193, N'Sủi Cảo Nước', N'', 65000, 'chinese', 'shrimp dumpling,pork broth,vegetable'),
(@IdSuiCao193, N'Mì Sủi Cảo Xá Xíu', N'', 70000, 'chinese', 'egg noodle,shrimp dumpling,bbq pork'),
(@IdSuiCao193, N'Sủi Cảo Thập Cẩm Đặc Biệt', N'', 80000, 'chinese', 'shrimp dumpling,squid,pork,fish ball'),
(@IdSuiCao193, N'Hoành Thánh Nước', N'', 55000, 'chinese', 'wonton,pork,broth'),
(@IdSuiCao193, N'Sủi Cảo Chiên Phần', N'', 70000, 'chinese', 'shrimp dumpling,oil'),

(@IdSuiCao162, N'Sủi Cảo Tôm Tươi', N'', 65000, 'chinese', 'shrimp dumpling,pork broth'),
(@IdSuiCao162, N'Mì Sủi Cảo Thập Cẩm', N'', 75000, 'chinese', 'egg noodle,shrimp dumpling,squid'),
(@IdSuiCao162, N'Sủi Cảo Chiên', N'', 70000, 'chinese', 'shrimp dumpling,flour,oil'),
(@IdSuiCao162, N'Hủ Tiếu Mì Sủi Cảo', N'', 75000, 'chinese', 'rice noodle,egg noodle,dumpling'),
(@IdSuiCao162, N'Đĩa Mực Thêm', N'', 50000, 'chinese', 'squid,pork broth'),

(@IdBoNe, N'Số 1 - Bò Trứng Pate', N'', 59000, 'vietnamese', 'beef,egg,pate,bread'),
(@IdBoNe, N'Số 2 - Nhiều Bò Trứng', N'', 70000, 'vietnamese', 'beef,egg,bread'),
(@IdBoNe, N'Bò né đặc biệt', N'Bò, Trứng, Pate, Xúc xích, Chả', 91000, 'vietnamese', 'beef,egg,pate,sausage,cheese'),
(@IdBoNe, N'Số 3 - Bò Xúc Xích', N'', 69000, 'vietnamese', 'beef,egg,pate,sausage'),
(@IdBoNe, N'Khoai tây chiên', N'', 28000, 'vietnamese', 'potato,oil'),

(@IdTauHu, N'Sương sáo gói sữa béo', N'', 20000, 'dessert', 'grass jelly,milk,sugar'),
(@IdTauHu, N'Tàu hũ tươi Co Vang', N'', 20000, 'dessert', 'soybean,water,sugar'),
(@IdTauHu, N'Set 5 Tàu hũ tươi', N'', 100000, 'dessert', 'soybean,ginger,pandan'),
(@IdTauHu, N'Sữa chua vị truyền thống', N'', 16000, 'dessert', 'milk,yogurt culture'),
(@IdTauHu, N'Panna cotta chanh dây', N'', 17000, 'dessert', 'milk,cream,passion fruit'),

(@IdBanhCuon, N'Bánh ướt đặc biệt', N'', 65000, 'vietnamese', 'rice noodle,pork sausage,herbs'),
(@IdBanhCuon, N'Bánh cuốn trứng lá dứa', N'', 65000, 'vietnamese', 'rice noodle,egg,pandan'),
(@IdBanhCuon, N'Bánh dày kẹp chả', N'', 20000, 'vietnamese', 'sticky rice,pork sausage'),
(@IdBanhCuon, N'Bánh Giò', N'', 20000, 'vietnamese', 'rice flour,minced pork,mushroom'),
(@IdBanhCuon, N'Bánh tôm chiên', N'', 13000, 'vietnamese', 'shrimp,flour,oil'),

(@IdSauRieng, N'Bánh mix 3 vị 12cm', N'', 185000, 'bakery', 'durian,flour,vanilla,pandan,taro'),
(@IdSauRieng, N'Bánh choco hạnh nhân 12cm', N'', 175000, 'bakery', 'durian,flour,chocolate,almond'),
(@IdSauRieng, N'Bánh ngàn lớp truyền thống', N'', 175000, 'bakery', 'durian,flour,cream,butter'),
(@IdSauRieng, N'Bánh phô mai than tre', N'', 175000, 'bakery', 'durian,flour,charcoal,cheese'),
(@IdSauRieng, N'Bánh ngàn lớp lá dứa', N'', 175000, 'bakery', 'durian,flour,pandan,cream'),

(@IdAnVat, N'Chân Gà Chiên Rút Xương', N'', 90000, 'snack', 'chicken feet,cucumber,chili salt'),
(@IdAnVat, N'Khoai Tây Lắc Phô Mai', N'', 38000, 'snack', 'potato,cheese'),
(@IdAnVat, N'Mẹt Chiên size S', N'', 53000, 'snack', 'fish ball,beef ball,sausage'),
(@IdAnVat, N'Gà Viên Lắc Phô Mai', N'', 38000, 'snack', 'chicken,cheese,flour'),
(@IdAnVat, N'Gân Bò Xào', N'', 105000, 'snack', 'beef tendon,cucumber,herbs'),

(@IdSoiThai, N'Pad Thái Tôm', N'', 119000, 'thai', 'rice noodle,shrimp,egg,peanut'),
(@IdSoiThai, N'Mì TomYum Thai', N'', 99000, 'thai', 'noodle,shrimp,lemongrass,chili'),
(@IdSoiThai, N'Cà Ri Gà Thái', N'', 89000, 'thai', 'chicken,coconut milk,curry paste'),
(@IdSoiThai, N'Xôi Xoài Thái', N'', 65000, 'thai', 'sticky rice,mango,coconut milk'),
(@IdSoiThai, N'Trà Sữa Thái Đỏ', N'', 35000, 'thai', 'thai tea,milk,sugar'),

(@IdCaCon, N'Combo No Nê', N'1 Mì Trộn Cá Viên + 1 Nước', 50000, 'snack', 'noodle,fish ball,soda'),
(@IdCaCon, N'Xúc Xích Lốc Xoáy', N'', 30000, 'snack', 'sausage,flour,oil'),
(@IdCaCon, N'Mì Trộn Full Topping', N'', 60000, 'snack', 'noodle,fish ball,beef ball,sausage'),
(@IdCaCon, N'Tôm hùm viên', N'', 25000, 'snack', 'lobster ball,oil'),
(@IdCaCon, N'Mì Trộn Mandu', N'', 45000, 'snack', 'noodle,dumpling,sauce'),

(@IdYumIco, N'Tender Plus', N'6 miếng gà + khoai + pepsi', 68000, 'fastfood', 'chicken tender,potato,soda'),
(@IdYumIco, N'Tender Solo', N'4 miếng gà + khoai + pepsi', 58000, 'fastfood', 'chicken tender,potato,soda'),
(@IdYumIco, N'Tender 10 PCS', N'', 88000, 'fastfood', 'chicken tender,sauce'),
(@IdYumIco, N'Khoai Tây Chiên', N'', 20000, 'fastfood', 'potato,oil,salt'),
(@IdYumIco, N'Jumbo Big', N'30 miếng gà + sốt', 208000, 'fastfood', 'chicken tender,sauce'),

(@IdMiTron, N'Mì trộn tôm thịt bằm', N'', 69000, 'noodle', 'noodle,shrimp,minced pork,egg'),
(@IdMiTron, N'Mì trộn bò lúc lắc', N'', 69000, 'noodle', 'noodle,beef,egg,sauce'),
(@IdMiTron, N'Cơm bò cháy tỏi', N'', 69000, 'noodle', 'rice,beef,garlic,egg'),
(@IdMiTron, N'Canh rong biển thịt bằm', N'', 25000, 'noodle', 'seaweed,minced pork'),
(@IdMiTron, N'Trà tắc xí muội', N'', 25000, 'noodle', 'tea,kumquat,salted plum'),

(@IdAnLac, N'Cơm chiên thập cẩm', N'', 28000, 'vegetarian', 'rice,vegan sausage,carrot,tofu'),
(@IdAnLac, N'Bánh mì chả nấm', N'', 25000, 'vegetarian', 'bread,mushroom patty,pate'),
(@IdAnLac, N'Bánh mì xíu mại chay', N'', 20000, 'vegetarian', 'bread,vegan meatball,sauce'),
(@IdAnLac, N'Mì trộn chay', N'', 35000, 'vegetarian', 'noodle,vegan beef ball,egg,vegetable'),
(@IdAnLac, N'Combo Sinh Viên', N'Bánh mì + Nước', 32000, 'vegetarian', 'bread,vegan topping,soda');

-- ==========================================
-- 1. CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG
-- (Chỉ chèn các quán có dữ liệu ảnh và khớp ID)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdKenhBaChau, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mbakxnytpp6pd3', 1),
(@IdPhoTruongSon, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28t2g62ako9c', 1),
(@IdBanhMiTuanMap, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr3lxxxkxo6189', 1),
(@IdComBo24H, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mi9xxkq909ag20', 1),
(@IdHuTieuChay, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m0efwj4dfkpbe4', 1),
(@IdComTruyenKy, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqxb8vcdlcpl39', 1),
(@IdSuiCaoNgocY, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mifl43iixp8g83', 1),
(@IdSuiCaoThienThien, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2hm1vwn9g10', 1),
(@IdSuiCao193, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvwizpc9ll29', 1),
(@IdSuiCao162, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr4hu5cvjo9l11', 1);

-- ==========================================
-- 2. CHÈN ẢNH CHO TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Kênh Bà Châu
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mbakxnytpp6pd3' FROM MenuItems WHERE restaurant_id = @IdKenhBaChau AND name = N'Set B - Cơm Cá hồi Nauy, Trứng Ngâm tương' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mbakxda9cgqpd0' FROM MenuItems WHERE restaurant_id = @IdKenhBaChau AND name = N'Set A - Cơm Cá hồi Nauy Ngâm tương' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mcbnj5l4i9gjde' FROM MenuItems WHERE restaurant_id = @IdKenhBaChau AND name = N'Set C - Cơm Cá Hồi Nauy, Trứng, Tôm Ngâm tương' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mdx4mef965tvee' FROM MenuItems WHERE restaurant_id = @IdKenhBaChau AND name = N'Set E - Cơm Cá Hồi Nauy Sốt Thái Đỏ ( ít cay, chua ngọt )' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mdx4plqt3klced' FROM MenuItems WHERE restaurant_id = @IdKenhBaChau AND name = N'Canh Kim Chi' UNION ALL

-- Phở Trường Sơn
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28sc2jtiwy2b' FROM MenuItems WHERE restaurant_id = @IdPhoTruongSon AND name = N'Phở Tái' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28t2g62ako9c' FROM MenuItems WHERE restaurant_id = @IdPhoTruongSon AND name = N'Phở Nạm' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28u4hcp2bq20' FROM MenuItems WHERE restaurant_id = @IdPhoTruongSon AND name = N'Phở Gân' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28umzaspvn1a' FROM MenuItems WHERE restaurant_id = @IdPhoTruongSon AND name = N'Phở Viên' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mk28zg9s2mte1c' FROM MenuItems WHERE restaurant_id = @IdPhoTruongSon AND name = N'Phở Đặc Biệt' UNION ALL

-- Bánh Mì Tuấn Mập
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr3lxxxkxo6189' FROM MenuItems WHERE restaurant_id = @IdBanhMiTuanMap AND name = N'Trà Tắc' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr66vybhlm84eb' FROM MenuItems WHERE restaurant_id = @IdBanhMiTuanMap AND name = N'Dừa Tắc ly khổng lồ' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr3lxyfw6vgke8' FROM MenuItems WHERE restaurant_id = @IdBanhMiTuanMap AND name = N'Cam  vắt ly khổng lồ' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr67fzgqahehdb' FROM MenuItems WHERE restaurant_id = @IdBanhMiTuanMap AND name = N'Nước suối chai' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr3maayxoczo78' FROM MenuItems WHERE restaurant_id = @IdBanhMiTuanMap AND name = N'Sting lon' UNION ALL

-- Cơm Bò Beefsteak Phủ Trứng 24H 
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mi9xxkq909ag20' FROM MenuItems WHERE restaurant_id = @IdComBo24H AND name = N'Cơm Bò Phủ Trứng' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mi9xypxssef70a' FROM MenuItems WHERE restaurant_id = @IdComBo24H AND name = N'Cơm Bò Bittet x Phủ Trứng Ngon' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-midsnj1zyadk00' FROM MenuItems WHERE restaurant_id = @IdComBo24H AND name = N'Cơm Bò Lúc Lắc x Phủ Trứng NGON' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mi9xxv68b6yr07' FROM MenuItems WHERE restaurant_id = @IdComBo24H AND name = N'Cơm Tôm Thịt Bằm Phủ Trứng' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mi9xygqhfnyece' FROM MenuItems WHERE restaurant_id = @IdComBo24H AND name = N'Cơm Thịt Bằm Phủ Trứng - CƠM NGON' UNION ALL

-- Hủ Tiếu Chay
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m0efwj4dfkpbe4' FROM MenuItems WHERE restaurant_id = @IdHuTieuChay AND name = N'Hủ tiếu' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m0efsh2p5jm7a0' FROM MenuItems WHERE restaurant_id = @IdHuTieuChay AND name = N'Bún Thái' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ra0g-macn39ut0bsx68' FROM MenuItems WHERE restaurant_id = @IdHuTieuChay AND name = N'Bún Huế' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m0eimvtw17u5df' FROM MenuItems WHERE restaurant_id = @IdHuTieuChay AND name = N'Bún riêu' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m0eft1ark3jh3f' FROM MenuItems WHERE restaurant_id = @IdHuTieuChay AND name = N'Bò kho' UNION ALL

-- Cơm Truyền Ký
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqxb8vcdlcpl39' FROM MenuItems WHERE restaurant_id = @IdComTruyenKy AND name = N'Gà hấp muối 1/2 con' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr5eh76wd4m139' FROM MenuItems WHERE restaurant_id = @IdComTruyenKy AND name = N'Gà hấp muối xé 1 con' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ra0g-m7m1hfkqrm0j66' FROM MenuItems WHERE restaurant_id = @IdComTruyenKy AND name = N'Gà hấp muối nguyên con  không xé' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqxohdq28gplb1' FROM MenuItems WHERE restaurant_id = @IdComTruyenKy AND name = N'Đậu Hủ Đông Giang -Ớt-khổ qua' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqyxz88hqljtd1' FROM MenuItems WHERE restaurant_id = @IdComTruyenKy AND name = N'Ớt - Khổ Qua sốt dầu hào' UNION ALL

-- Sủi Cảo Ngọc Ý
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mifl43iixp8g83' FROM MenuItems WHERE restaurant_id = @IdSuiCaoNgocY AND name = N'Sủi Cảo Khô Sốt Dầu Hào' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mifl5j2hdgxt72' FROM MenuItems WHERE restaurant_id = @IdSuiCaoNgocY AND name = N'Mì Sủi Cảo Thập Cẩm' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-ltgcpcd19wjxc7' FROM MenuItems WHERE restaurant_id = @IdSuiCaoNgocY AND name = N'Sủi Cảo Nhỏ' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-ltgcoyghme4tcd' FROM MenuItems WHERE restaurant_id = @IdSuiCaoNgocY AND name = N'Sủi Cảo Lớn' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mifl6f00svt35c' FROM MenuItems WHERE restaurant_id = @IdSuiCaoNgocY AND name = N'Mì Sủi Cảo Khô Xá Xíu khô' UNION ALL

-- Sủi Cảo Thiên Thiên
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2hm1vwn9g10' FROM MenuItems WHERE restaurant_id = @IdSuiCaoThienThien AND name = N'Sủi cảo thập cẩm' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr2rvyafy47835' FROM MenuItems WHERE restaurant_id = @IdSuiCaoThienThien AND name = N'Sủi cảo chiên' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2qomc0iah71' FROM MenuItems WHERE restaurant_id = @IdSuiCaoThienThien AND name = N'Sủi cảo' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvwuqpkvav871' FROM MenuItems WHERE restaurant_id = @IdSuiCaoThienThien AND name = N'Sủi cảo mì thập cẩm' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2hlg8sbes22' FROM MenuItems WHERE restaurant_id = @IdSuiCaoThienThien AND name = N'Sủi cảo mì' UNION ALL

-- Sủi Cảo 193
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvwizpc9ll29' FROM MenuItems WHERE restaurant_id = @IdSuiCao193 AND name = N'Sủi Cảo' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvybswhwux32' FROM MenuItems WHERE restaurant_id = @IdSuiCao193 AND name = N'Sủi Cảo Hải Sản' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvxc7ale3dfe' FROM MenuItems WHERE restaurant_id = @IdSuiCao193 AND name = N'Sủi Cảo Chiên Giòn' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvwjp8awuc72' FROM MenuItems WHERE restaurant_id = @IdSuiCao193 AND name = N'Mì Sủi Cảo' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqvvwthlz8ux9c' FROM MenuItems WHERE restaurant_id = @IdSuiCao193 AND name = N'Mì Sủi Cảo Hải Sản' UNION ALL

-- Sủi Cảo 162
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr4hu5cvjo9l11' FROM MenuItems WHERE restaurant_id = @IdSuiCao162 AND name = N'SỦI CẢO TÔM' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2bh6l77vdb4' FROM MenuItems WHERE restaurant_id = @IdSuiCao162 AND name = N'SỦI CẢO CHIÊN' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx27goel68460' FROM MenuItems WHERE restaurant_id = @IdSuiCao162 AND name = N'SỦI CẢO NƯỚC' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr60i71roi3d96' FROM MenuItems WHERE restaurant_id = @IdSuiCao162 AND name = N'SỦI CẢO KHÔ SỐT DẦU HÀO' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqx2b76zqmqhc8' FROM MenuItems WHERE restaurant_id = @IdSuiCao162 AND name = N'SỦI CẢO THẬP CẨM';
GO