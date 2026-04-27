USE travel_food_db
GO

--QUẬN 6
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Mì Trộn, Bánh Tráng Trộn & Cuốn Trứng Cút Lòng Đào - Ăn Vặt Quận 6', N'444/1 Phạm Văn Chí, P. 8, Quận 6, TP. HCM', 10.742698, 106.64241, 4.5, 40000, '08:00', '22:00', 'snack'),
(N'Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6', N'511A/1 Đường Hậu Giang, P. 11, Quận 6, TP. HCM', 10.747945, 106.636307, 5.0, 50000, '08:00', '22:00', 'snack'),
(N'Cơm Tấm 279', N'279 Hậu Giang, P. 5, Quận 6, TP. HCM', 10.749676, 106.642161, 4.5, 45000, '06:00', '21:00', 'vietnamese'),
(N'Mến - Bún Chả Cá Sứa Nha Trang - Hậu Giang', N'208 Hậu Giang, P. 9, Quận 6, TP. HCM', 10.749844, 106.641953, 4.5, 70000, '07:00', '22:00', 'vietnamese'),
(N'Cơm Tấm 3 Chị Em', N'733 Lò Gốm, P. 9, Quận 6, TP. HCM', 10.750250, 106.639577, 4.5, 55000, '06:00', '22:00', 'vietnamese'),
(N'Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt - Quận 6', N'151 Bãi Sậy, P. 1, Quận 6, TP. HCM', 10.747294, 106.647074, 0.0, 50000, '08:00', '22:00', 'snack'),
(N'Bánh Cuốn & Bánh Ướt Phú Lâm', N'1/1A Tân Hòa Đông, P. 13, Quận 6, TP. HCM', 10.754998, 106.633468, 4.5, 40000, '06:00', '21:00', 'vietnamese'),
(N'Phở Thắng - Phở Bò - Quận 6', N'224 Minh Phụng, P. 6, Quận 6, TP. HCM', 10.753130, 106.643032, 4.5, 65000, '06:00', '22:00', 'vietnamese'),
(N'Ốc Trứng Muối - Chi Nhánh Quận 6', N'188A Mai Xuân Thưởng, P. 2, Quận 6, TP. HCM', 10.748807, 106.647781, 3.5, 80000, '15:00', '23:00', 'seafood'),
(N'Neko Izakaya Bar Nhậu Kiểu Nhật - Quận 6', N'291 Bình Tiên, P. 8, Quận 6, TP. HCM', 10.746326, 106.642672, 4.5, 150000, '16:00', '02:00', 'japanese'),
(N'Ăn Vặt 3 Chị Em - Quận 6', N'240/88 Nguyễn Văn Luông, P. 11, Quận 6, TP. HCM', 10.744295, 106.636131, 4.5, 60000, '08:00', '22:00', 'snack'),
(N'Cháo Ếch Singapore Geylang SD88 - Quận 6', N'D40 Cư Xá Phú Lâm B, P. 13, Quận 6, TP. HCM', 10.752507, 106.628661, 4.5, 80000, '09:00', '23:00', 'singapore'),
(N'Cà Ri Vịt - Bạc Liêu - Quận 6', N'496/34 Hậu Giang, Quận 6, TP. HCM', 10.747625, 106.633455, 0.0, 85000, '08:00', '22:00', 'vietnamese'),
(N'Gà Rán Và Mì Ý - Jollibee EC Hậu Giang Quận 6', N'704 Đường Hậu Giang, P. 12, Quận 6, TP. HCM', 10.747614, 106.632919, 4.5, 60000, '09:00', '22:00', 'fastfood'),
(N'Thắng Lợi Mì Gia - Mì Vịt Tiềm & Dimsum - Quận 6', N'213 Nguyễn Văn Luông, P. 11, Quận 6, TP. HCM', 10.743426, 106.634619, 4.5, 100000, '07:00', '22:00', 'chinese'),
(N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 6', N'79 Kinh Dương Vương, P. 12, Quận 6, TP. HCM', 10.751140, 106.630933, 4.5, 150000, '09:00', '22:00', 'thai'),
(N'Xôi Ghẹ 192 Quận 6 - Phạm Văn Chí', N'200 Phạm Văn Chí, P. 4, Quận 6, TP. HCM', 10.745003, 106.646953, 4.5, 80000, '06:00', '22:00', 'vietnamese'),
(N'Cô Điệp - Nem Nướng Nha Trang - Quận 6', N'D36 Cư Xá Phú Lâm B, P. 13, Quận 6, TP. HCM', 10.753496, 106.629876, 4.5, 70000, '09:00', '22:00', 'vietnamese'),
(N'Cơm Gà Hải Nam Tam Kỳ 142 - Cháo, Gỏi & Miến Gà Trộn - 34 Bình Phú, Quận 6', N'34 Bình Phú, P. 11, Quận 6, TP. HCM', 10.745203, 106.630953, 4.5, 75000, '07:00', '22:00', 'vietnamese');
GO

DECLARE @IdAnVatQ6 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn, Bánh Tráng Trộn & Cuốn Trứng Cút Lòng Đào - Ăn Vặt Quận 6');
DECLARE @IdCaVienQ6 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6');
DECLARE @IdComTam279 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm 279');
DECLARE @IdBunChaCaMen INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mến - Bún Chả Cá Sứa Nha Trang - Hậu Giang');
DECLARE @IdComTam3ChiEm INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm 3 Chị Em');
DECLARE @IdMiTronBaiSay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt - Quận 6');
DECLARE @IdBanhCuonPhuLam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Cuốn & Bánh Ướt Phú Lâm');
DECLARE @IdPhoThang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Thắng - Phở Bò - Quận 6');
DECLARE @IdOcTrungMuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh Quận 6');
DECLARE @IdNekoIzakaya INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Neko Izakaya Bar Nhậu Kiểu Nhật - Quận 6');
DECLARE @IdAnVat3ChiEm INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt 3 Chị Em - Quận 6');
DECLARE @IdChaoEchSD88 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Ếch Singapore Geylang SD88 - Quận 6');
DECLARE @IdCaRiVitBacLieu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cà Ri Vịt - Bạc Liêu - Quận 6');
DECLARE @IdJollibee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Và Mì Ý - Jollibee EC Hậu Giang Quận 6');
DECLARE @IdThangLoiMiGia INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thắng Lợi Mì Gia - Mì Vịt Tiềm & Dimsum - Quận 6');
DECLARE @IdSoiThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 6');
DECLARE @IdXoiGhe192 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Xôi Ghẹ 192 Quận 6 - Phạm Văn Chí');
DECLARE @IdCoDiepNemNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cô Điệp - Nem Nướng Nha Trang - Quận 6');
DECLARE @IdComGa142 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Gà Hải Nam Tam Kỳ 142 - Cháo, Gỏi & Miến Gà Trộn - 34 Bình Phú, Quận 6');

INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdAnVatQ6, N'Bánh tráng phơi sương dẻo Trộn MỠ HÀNH satế', N'Bánh tráng, muối, satế, mỡ hành, tắc, rau răm', 26000, 'snack', 'rice paper,quail egg,scallion,chili'),
(@IdAnVatQ6, N'Bánh Tráng Phơi Sương Trộn Mỡ Hành Trứng Cút', N'', 35000, 'snack', 'rice paper,quail egg,pork fat,scallion'),
(@IdAnVatQ6, N'Bánh tráng phơi sương dẻo trộn satế TỎI PHI', N'Bánh tráng,muối, satế, tỏi phi,rau răm,tắc', 26000, 'snack', 'rice paper,garlic,quail egg,chili'),
(@IdAnVatQ6, N'Bánh Tráng Phơi Sương Dẻo Trộn MỠ HÀNH Thập Cẩm', N'Bánh tráng phơi sương dẻo, 3 trứng cút lòng đào', 50000, 'snack', 'rice paper,beef jerky,dried squid,quail egg'),
(@IdAnVatQ6, N'Bánh Tráng Phơi Sương Trộn Mỡ Hành Khô Bò Giòn', N'', 38000, 'snack', 'rice paper,quail egg,beef jerky,scallion'),

(@IdCaVienQ6, N'Mì Trộn Indomie Thập Cẩm', N'Mì Trộn + 8 viên chiên thập cẩm, rau xanh', 45000, 'snack', 'noodle,fish ball,vegetable'),
(@IdCaVienQ6, N'Mì Trộn Indomie_ 2 xúc xích', N'Mì trộn+ 2 cây xúc xích,rau xanh hành phi mở hành', 45000, 'snack', 'noodle,sausage,vegetable'),
(@IdCaVienQ6, N'Mì Trộn Indomie 1 cây Xúc Xích chiên ( 2gói )', N'Mì Indomie ( 2 gói ), 1 cây xúc xích Đức', 43000, 'snack', 'noodle,sausage,vegetable'),
(@IdCaVienQ6, N'Mì trộn Indomie + 2Trứng ốp la', N'Mì Trộn + 2 trứng ốp la, rau xanh', 35000, 'snack', 'noodle,egg,vegetable'),
(@IdCaVienQ6, N'Mì Trộn Indomie Thập cẩm đặt biệt', N'Mì Trộn, 3 cá viên, 3bò viên,3 viên tôm, 1 xúc xích', 56000, 'snack', 'noodle,fish ball,beef ball,sausage,egg'),

(@IdComTam279, N'Cơm Mắm Chưng', N'', 30000, 'vietnamese', 'rice,fermented fish,pork,egg'),
(@IdComTam279, N'Cơm Khổ Qua Cà Chớn', N'', 30000, 'vietnamese', 'rice,bitter melon,pork'),
(@IdComTam279, N'Cơm Bì Ốp La', N'', 30000, 'vietnamese', 'rice,shredded pork skin,egg'),
(@IdComTam279, N'Cơm Tấm Bì', N'', 30000, 'vietnamese', 'rice,shredded pork skin'),
(@IdComTam279, N'Cơm Sườn', N'Hotline 0931377317', 50000, 'vietnamese', 'rice,pork chop,fish sauce'),

(@IdBunChaCaMen, N'Bún Đầy Đủ', N'Gồm chả +cá+ sứa + sườn non', 70000, 'vietnamese', 'noodle,fish cake,jellyfish,pork rib'),
(@IdBunChaCaMen, N'Bún Bình Thường', N'( Chả + Cá )', 60000, 'vietnamese', 'noodle,fish cake,fish'),
(@IdBunChaCaMen, N'Combo Bún Đầy Đủ (Chả + Sứa + Cá + Sườn Non)', N'', 85000, 'vietnamese', 'noodle,fish cake,jellyfish,pork rib,beverage'),
(@IdBunChaCaMen, N'Combo Bún Đầy Đủ (Có cả thế giới) + Sting', N'', 85000, 'vietnamese', 'noodle,fish cake,jellyfish,pork rib,beverage'),
(@IdBunChaCaMen, N'Combo Bún Chả + Cá + Pepsi', N'', 70000, 'vietnamese', 'noodle,fish cake,fish,beverage'),

(@IdComTam3ChiEm, N'Cơm Tấm Sườn', N'Tất cả các món ăn đều được tặng canh ạ', 45000, 'vietnamese', 'rice,pork chop,fish sauce'),
(@IdComTam3ChiEm, N'Cơm tấm sườn chả', N'Giá đã bao gồm hộp', 55000, 'vietnamese', 'rice,pork chop,egg meatloaf'),
(@IdComTam3ChiEm, N'Cơm tấm sườn ốp la', N'Giá đã bao gồm hộp', 55000, 'vietnamese', 'rice,pork chop,egg'),
(@IdComTam3ChiEm, N'Cơm Tấm sườn bì chả', N'Giá đã bao gồm hộp', 65000, 'vietnamese', 'rice,pork chop,shredded pork skin,egg meatloaf'),
(@IdComTam3ChiEm, N'Cơm Tấm Sườn Chả Ốp La', N'Giá đã bao gồm hộp', 65000, 'vietnamese', 'rice,pork chop,egg meatloaf,egg'),

(@IdMiTronBaiSay, N'COMBO Ngẫu Nhiên 1', N'', 100000, 'snack', 'noodle,fish ball,sausage'),
(@IdMiTronBaiSay, N'COMBO NO NÊ', N'1 Mì Trộn Cá Viên + 1 Nước Uống', 50000, 'snack', 'noodle,fish ball,beverage'),
(@IdMiTronBaiSay, N'COMBO TIẾT KIỆM 2', N'Ngẫu nhiên 5 loại topping + 1 nước uống', 50000, 'snack', 'noodle,mixed topping,beverage'),
(@IdMiTronBaiSay, N'COMBO Ngẫu Nhiên 2', N'', 150000, 'snack', 'noodle,fish ball,beef ball,sausage'),
(@IdMiTronBaiSay, N'COMBO TIẾT KIỆM 1', N'Ngẫu nhiên 3 loại topping + 1 nước uống', 40000, 'snack', 'noodle,mixed topping,beverage'),

(@IdBanhCuonPhuLam, N'1 bánh ướt đặc biệt đầy đủ + 1 7up', N'Nước có thể chọn: Pepsi/Oolong Tea/Sting', 65000, 'vietnamese', 'rice noodle,pork sausage,beverage'),
(@IdBanhCuonPhuLam, N'7Up', N'', 15000, 'vietnamese', 'beverage'),
(@IdBanhCuonPhuLam, N'1 Bánh cuốn trứng lá dứa đầy đủ + 1 7up', N'Nước có thể chọn: Pepsi/Oolong Tea', 65000, 'vietnamese', 'rice noodle,egg,pandan,beverage'),
(@IdBanhCuonPhuLam, N'1 Bánh cuốn trứng hoa đậu biết đầy đủ', N'Nước có thể chọn: Pepsi/Oolong Tea', 65000, 'vietnamese', 'rice noodle,egg,butterfly pea,beverage'),
(@IdBanhCuonPhuLam, N'Bánh dày kẹp chả chiên chả lụa', N'', 20000, 'vietnamese', 'sticky rice,pork sausage'),

(@IdPhoThang, N'Phở Đặc Biệt', N'Tái + nạm + gân + viên', 72000, 'vietnamese', 'rice noodle,beef,beef tendon,beef ball'),
(@IdPhoThang, N'Phở Tái', N'Phothang.com', 62000, 'vietnamese', 'rice noodle,rare beef'),
(@IdPhoThang, N'Phở Tái Viên', N'Phothang.vn', 62000, 'vietnamese', 'rice noodle,rare beef,beef ball'),
(@IdPhoThang, N'Phở Thập cẩm', N'Tái + gân + viên', 62000, 'vietnamese', 'rice noodle,beef,beef tendon,beef ball'),
(@IdPhoThang, N'Phở Tái Nạm', N'Phothang.vn', 62000, 'vietnamese', 'rice noodle,rare beef,beef flank'),

(@IdOcTrungMuoi, N'Trứng gà non sốt mắm tắc', N'', 89000, 'seafood', 'young chicken egg,kumquat,fish sauce'),
(@IdOcTrungMuoi, N'Trứng gà non cháy tỏi tóp mỡ', N'', 89000, 'seafood', 'young chicken egg,garlic,pork fat'),
(@IdOcTrungMuoi, N'Trứng gà non xào rau muống', N'', 89000, 'seafood', 'young chicken egg,water spinach,garlic'),
(@IdOcTrungMuoi, N'Răng mực cháy tỏi tóp mỡ', N'', 79000, 'seafood', 'squid teeth,garlic,pork fat'),
(@IdOcTrungMuoi, N'Răng mực sốt tiêu đen', N'', 79000, 'seafood', 'squid teeth,black pepper'),

(@IdNekoIzakaya, N'Hành paro nướng', N'Xiên nướng lúc order sẽ đợi nướng hơi lâu', 12273, 'japanese', 'leek,sauce'),
(@IdNekoIzakaya, N'Cua cà mau sốt phô mai Neko', N'Thịt cua nướnh cùng sốt phô mai nấm', 133650, 'japanese', 'crab,cheese,mushroom'),
(@IdNekoIzakaya, N'Cá Mắt Kính', N'Nướng muôid hoặc muối ớt', 79200, 'japanese', 'fish,salt,chili'),
(@IdNekoIzakaya, N'Cá bò da sizeM nướng muối / muối ớt', N'Giá sẽ có thay đổi thep mùa', 323400, 'japanese', 'leatherjacket fish,salt,chili'),
(@IdNekoIzakaya, N'Cá Bò size S nướng muối / muối ớt', N'Giá có thể thay đổi theo mùa', 257400, 'japanese', 'leatherjacket fish,salt,chili'),

(@IdAnVat3ChiEm, N'Chân Gà Chiên Rút Xương', N'Chân gà (rau răm, dưa leo, cải chua, muối ớt xanh)', 90000, 'snack', 'chicken feet,cucumber,chili salt'),
(@IdAnVat3ChiEm, N'Khoai Tây Lắc Phô Mai', N'', 38000, 'snack', 'potato,cheese'),
(@IdAnVat3ChiEm, N'Mẹt Chiên Cá Viên (size S)', N'Cá Viên, Tôm Viên, Bò Viên, Xúc Xích', 53000, 'snack', 'fish ball,beef ball,shrimp ball,sausage'),
(@IdAnVat3ChiEm, N'Mẹt Chiên Cá Viên (size M)', N'Đậu hủ phô mai, Bánh bao cá hồi, Sò điệp vàng', 90000, 'snack', 'fish ball,beef ball,cheese tofu,sausage'),
(@IdAnVat3ChiEm, N'Gà Viên Lắc Phô Mai', N'', 38000, 'snack', 'chicken,cheese,flour'),

(@IdChaoEchSD88, N'Kho quẹt + rau củ + bánh mì', N'', 72000, 'singapore', 'caramelized fish sauce,pork fat,vegetable,bread'),
(@IdChaoEchSD88, N'Kho quẹt + rau củ phần nhỏ', N'', 49500, 'singapore', 'caramelized fish sauce,pork fat,vegetable'),
(@IdChaoEchSD88, N'1 trứng Muối', N'', 13500, 'singapore', 'salted egg'),
(@IdChaoEchSD88, N'Cháo Trắng Trứng Muối 2 trứng', N'', 35100, 'singapore', 'porridge,salted egg'),
(@IdChaoEchSD88, N'Ếch ú nu 2 con + 1 cháo nóng hổi', N'ếch ú nu kho sốt singapore ngon bá cháy', 116100, 'singapore', 'frog,porridge,singapore sauce'),

(@IdCaRiVitBacLieu, N'Cà ri vịt Bạc Liêu-Đùi+cánh', N'Hủ tiếu, đùi vịt, cánh vịt, nước sốt đậm đà', 89000, 'vietnamese', 'noodle,duck leg,duck wing,curry'),
(@IdCaRiVitBacLieu, N'Cà ri vịt Bạc Liêu-Đùi+thịt', N'Hủ tiếu, đùi vịt, thịt vịt, nước sốt đậm đà', 89000, 'vietnamese', 'noodle,duck leg,duck meat,curry'),
(@IdCaRiVitBacLieu, N'Cà ri vịt Bạc Liêu-Thịt', N'Hủ tiếu, thịt nạt mềm, nước sốt đậm đà', 79000, 'vietnamese', 'noodle,duck meat,curry'),
(@IdCaRiVitBacLieu, N'Cà ri vịt Bạc Liêu-Đùi+gan', N'Hủ tiếu, đùi vịt, gan vịt, nước sốt đậm đà', 89000, 'vietnamese', 'noodle,duck leg,duck liver,curry'),
(@IdCaRiVitBacLieu, N'Cà ri vịt Bạc Liêu-Đùi', N'Hủ tiếu, đùi vịt, nước sốt đậm đà', 89000, 'vietnamese', 'noodle,duck leg,curry'),

(@IdJollibee, N'1 Mì ý sốt cay vừa + 1 miếng Gà', N'1 Mì ý sốt cay vừa + 1 miếng Gà Giòn', 78000, 'fastfood', 'spaghetti,fried chicken,beverage'),
(@IdJollibee, N'Mỳ Ý sốt cay vừa + 1 Pepsi vừa', N'Food', 45000, 'fastfood', 'spaghetti,beverage'),
(@IdJollibee, N'Mỳ Ý sốt cay vừa', N'Food', 40000, 'fastfood', 'spaghetti,tomato sauce'),
(@IdJollibee, N'Mỳ Ý sốt cay lớn', N'Food', 50000, 'fastfood', 'spaghetti,tomato sauce'),
(@IdJollibee, N'Trà chanh hạt chia', N'1 Trà chanh hạt chia [MỚI]', 20000, 'beverage', 'tea,lemon,chia seed'),

(@IdThangLoiMiGia, N'Bánh bao xá xíu', N'2 cái', 62667, 'chinese', 'flour,bbq pork'),
(@IdThangLoiMiGia, N'Mì vịt tiềm 1/4', N'2 vắt+1/4 vit tiềm', 136000, 'chinese', 'egg noodle,duck,herb broth'),
(@IdThangLoiMiGia, N'Mì vịt tiềm thịt', N'2 vắt mì + thit vit Tiềm', 99000, 'chinese', 'egg noodle,duck,herb broth'),
(@IdThangLoiMiGia, N'Mì hoành thánh xá xíu', N'2 vắt mì+ xá xíu', 99000, 'chinese', 'egg noodle,wonton,bbq pork'),
(@IdThangLoiMiGia, N'Mì thập cẩm', N'2 vắt mì + tôm + xá xíu + cá vien + mực khô', 99000, 'chinese', 'egg noodle,shrimp,bbq pork,fish ball'),

(@IdSoiThai, N'Combo Gác Lại Âu Lo', N'Mua 3 Được 4 - Pad Thái Bò - Xôi Xiên Ba Rọi', 220000, 'thai', 'pad thai,beef,sticky rice,pork,milk tea'),
(@IdSoiThai, N'Combo Thịnh Vượng', N'- Pad Thái Tôm - Xôi Xiêm Ba Rọi Thái', 198000, 'thai', 'pad thai,shrimp,sticky rice,pork'),
(@IdSoiThai, N'Combo Mai An Tiêm', N'- Cơm Chiên Cua Thái - Xôi Xoài Thái', 195000, 'thai', 'fried rice,crab,sticky rice,mango,milk tea'),
(@IdSoiThai, N'Combo Hương Lộc', N'Mua 2 Được 3 - Cơm chiên cua - Chè Thái', 143000, 'thai', 'fried rice,crab,thai sweet soup,tea'),
(@IdSoiThai, N'Combo Ngày Mới', N'- Tomyum Thái - Gỏi Miến Hải Sản', 189000, 'thai', 'tomyum,shrimp,glass noodle,seafood'),

(@IdXoiGhe192, N'Combo Xôi Ghẹ đặc biệt', N'Topping : ghe + cha bong , hanh phi , rong bien', 125000, 'vietnamese', 'sticky rice,crab,pork floss,cheese'),
(@IdXoiGhe192, N'Combo Xôi Ghẹ - Hải Sản + Mai Cua', N'Topping: Hải sản tươi ngon, ghẹ, tôm, mực', 145000, 'vietnamese', 'sticky rice,crab,shrimp,squid,cheese'),
(@IdXoiGhe192, N'Xôi Ghẹ - Hải Sản Vỏ Giòn', N'Topping Ghẹ, Cá Cơm Rim, Tôm, Mực, Rong Biển', 75000, 'vietnamese', 'sticky rice,crab,shrimp,squid,pork floss'),
(@IdXoiGhe192, N'Xôi Ghẹ - Hải Sản Vỏ Giòn Đặc Biệt', N'Topping: Hải sản tươi ngon, ghẹ, tôm, mực', 95000, 'vietnamese', 'sticky rice,crab,shrimp,squid,seaweed'),
(@IdXoiGhe192, N'Hải Sản Thêm', N'Tôm, mực, Cá Cơm Rim', 30000, 'vietnamese', 'shrimp,squid,dried fish'),

(@IdCoDiepNemNuong, N'Nem Nướng 1 / phần 1 người', N'Có Kèm Bún, 1p có 3 cây Nem cắt đôi', 84000, 'vietnamese', 'grilled pork sausage,rice noodle,vegetable,rice paper'),
(@IdCoDiepNemNuong, N'Nem nướng 2 / phần 2 người', N'Đầy đủ topping 2 phần và Gói Chung', 186000, 'vietnamese', 'grilled pork sausage,rice noodle,vegetable'),
(@IdCoDiepNemNuong, N'Bánh Ướt Thịt Nướng', N'', 60000, 'vietnamese', 'rice noodle,grilled pork,fish sauce'),
(@IdCoDiepNemNuong, N'Bánh Thập Cẩm', N'', 55000, 'vietnamese', 'rice noodle,shrimp,pork'),
(@IdCoDiepNemNuong, N'Bánh Bèo(6chén)', N'', 50000, 'vietnamese', 'rice flour,shrimp,pork fat'),

(@IdComGa142, N'Miến Trộn Ức Gà Bằm', N'', 45000, 'vietnamese', 'glass noodle,chicken breast,vegetable'),
(@IdComGa142, N'Cơm Gà Xé Gỏi + Canh Xà Lách Xoong', N'Gà ta xé tay mềm ngọt, cơm vàng dẻo', 69000, 'vietnamese', 'rice,shredded chicken,vegetable,watercress'),
(@IdComGa142, N'Cơm & Dĩa Gỏi Gà (1 người)', N'Gà ta xé trộn gỏi chua ngọt với rau càng cua', 77000, 'vietnamese', 'rice,shredded chicken,banana blossom,vegetable'),
(@IdComGa142, N'Cơm Gà Xé Gỏi + Canh Rong Biển', N'Gà ta xé tay mềm thơm, cơm vàng dẻo ăn kèm', 69000, 'vietnamese', 'rice,shredded chicken,seaweed'),
(@IdComGa142, N'Cơm Gà Đặc Biệt (Gà + Lòng Gà)', N'Đậm vị gà ta đầy đủ lòng gà béo giòn', 73000, 'vietnamese', 'rice,shredded chicken,chicken offal');
GO


--QUẬN 5

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Cơm Tấm Sườn Nướng, Trà Sữa & Ăn Vặt Quận 5 - Phùng Hưng', N'89/12 Phùng Hưng, P. 13, Quận 5, TP. HCM', 10.749751, 106.657012, 4.0, 45000, '06:00', '22:00', 'vietnamese'),
(N'Lẩu Bò Hân Quận 5 - Nguyễn Biểu', N'88 Nguyễn Biểu, P. 1, Quận 5, TP. HCM', 10.755316, 106.684000, 4.5, 150000, '10:00', '23:00', 'hotpot'),
(N'Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5', N'813 Trần Hưng Đạo, P. 1, Quận 5, TP. HCM', 10.755144, 106.680825, 3.5, 60000, '08:00', '22:00', 'bakery'),
(N'Bánh Sầu Riêng 9 Sạch - Quận 5', N'Số 04B Chung Cư 109 Nguyễn Biểu, P. 1, Quận 5, TP. HCM', 10.754819, 106.683594, 4.5, 175000, '09:00', '22:00', 'bakery'),
(N'Ốc Trứng Muối - Chi Nhánh 5 Quận 5', N'55 Nguyễn Chí Thanh, P. 9, Quận 5, TP. HCM', 10.760305, 106.671534, 4.5, 80000, '15:00', '23:30', 'seafood'),
(N'Domoto Saigon Quận 5 - Quán Cơm Nhật Bình Dân - Trần Hưng Đạo', N'835/32 Trần Hưng Đạo, P. 1, Quận 5, TP. HCM', 10.754335, 106.680585, 4.5, 100000, '10:30', '22:00', 'japanese'),
(N'Ốc Trứng Muối - Chi Nhánh Quận 5', N'244 Đường Trần Phú, P. 9, Quận 5, TP. HCM', 10.757988, 106.674203, 0.0, 80000, '15:00', '23:30', 'seafood'),
(N'Truyền Thuyết Champong - Nguyễn Trãi Quận 5', N'197 Nguyễn Trãi, P. 2, Quận 5, TP. HCM', 10.756797, 106.677606, 4.5, 180000, '10:00', '22:00', 'korean'),
(N'An Lạc - Ăn Chay - Quận 5', N'129/17 Nguyễn Trãi, P. 2, Quận 5, TP. HCM', 10.757449, 106.679902, 4.5, 30000, '07:00', '21:00', 'vegetarian'),
(N'Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải', N'159 Trần Tuấn Khải, P. 5, Quận 5, TP. HCM', 10.752392, 106.673820, 5.0, 30000, '08:00', '22:00', 'dessert');
GO

DECLARE @IdComTamPhungHung INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Sườn Nướng, Trà Sữa & Ăn Vặt Quận 5 - Phùng Hưng');
DECLARE @IdLauBoHan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Bò Hân Quận 5 - Nguyễn Biểu');
DECLARE @IdBanhKem1819 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5');
DECLARE @IdSauRieng9Sach INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Sầu Riêng 9 Sạch - Quận 5');
DECLARE @IdOcTrungMuoiCN5 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 5 Quận 5');
DECLARE @IdDomotoSaigon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Domoto Saigon Quận 5 - Quán Cơm Nhật Bình Dân - Trần Hưng Đạo');
DECLARE @IdOcTrungMuoiQ5 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh Quận 5');
DECLARE @IdChampong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Truyền Thuyết Champong - Nguyễn Trãi Quận 5');
DECLARE @IdAnLacChay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'An Lạc - Ăn Chay - Quận 5');
DECLARE @IdTauHuCovang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải');

INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdComTamPhungHung, N'CƠM THỊT BA ROI XÀO RUỐC', N'Ăn kèm đồ chua dưa leo', 36000, 'vietnamese', 'rice,pork belly,shrimp paste,cucumber'),
(@IdComTamPhungHung, N'BÁNH TRÁNG CUỐN', N'', 30000, 'snack', 'rice paper,quail egg,dried shrimp,mango'),
(@IdComTamPhungHung, N'BÁNH TRÁNG TRỘN', N'Trứng. Ruốc . Sốt bơ. Khô bò đậu phộng xoài rau răm', 30000, 'snack', 'rice paper,quail egg,beef jerky,peanut,mango'),
(@IdComTamPhungHung, N'3 CUỐN CHẢ GIÒ HẢI SẢN', N'Ăn kèm sốt trộn mayonail', 35000, 'snack', 'spring roll,seafood,mayonnaise'),
(@IdComTamPhungHung, N'CƠM TẤM SƯỜN TRỨNG', N'Ăn kèm dưa leo nước mắm', 55000, 'vietnamese', 'rice,pork chop,egg,cucumber'),

(@IdLauBoHan, N'Bắp bò hấp', N'', 129000, 'hotpot', 'beef shank,ginger,onion'),
(@IdLauBoHan, N'Đuôi bò hấp', N'', 179000, 'hotpot', 'beef tail,ginger,herbs'),
(@IdLauBoHan, N'Óc bò hấp', N'', 129000, 'hotpot', 'beef brain,ginger,peppercorn'),
(@IdLauBoHan, N'Lòng hấp', N'', 129000, 'hotpot', 'beef offal,ginger,chili'),
(@IdLauBoHan, N'Gù Bò Hấp', N'', 179000, 'hotpot', 'beef hump,ginger,fish sauce'),

(@IdBanhKem1819, N'Su kem', N'', 55000, 'bakery', 'flour,cream,egg,butter'),
(@IdBanhKem1819, N'Bánh kem bắp', N'', 320000, 'bakery', 'flour,sweet corn,cream,sugar'),
(@IdBanhKem1819, N'Bánh Phú Sĩ', N'', 50000, 'bakery', 'flour,pandan,cream,coconut'),
(@IdBanhKem1819, N'Bông lan 4 vị', N'', 75000, 'bakery', 'flour,egg,sugar,butter'),
(@IdBanhKem1819, N'Bông lan cuộn mứt dâu', N'', 43000, 'bakery', 'flour,egg,strawberry jam'),

(@IdSauRieng9Sach, N'BÁNH SẦU RIÊNG MIX 3 VỊ 12CM FULL SẦU TƯƠI RI6', N'Một chiếc bánh, trải nghiệm đủ 3 vị: Vani - Lá dứa - Khoai môn', 185000, 'bakery', 'durian,flour,vanilla,pandan,taro'),
(@IdSauRieng9Sach, N'BÁNH SẦU RIÊNG CHOCO HẠNH NHÂN 12CM', N'Kết hợp từ socola đắng nhẹ hoà quyện cùng sầu riêng ri6', 175000, 'bakery', 'durian,flour,chocolate,almond'),
(@IdSauRieng9Sach, N'BÁNH SẦU RIÊNG NGÀN LỚP 12CM SIÊU SẦU', N'Bánh nguyên vị sầu riêng tươi ri 6, không pha sên', 175000, 'bakery', 'durian,flour,cream,butter'),
(@IdSauRieng9Sach, N'BÁNH SẦU RIÊNG PHÔ MAI THAN TRE 12CM', N'Kết hợp cùng bột than tre tốt cho sức khoẻ, kem cheese foam', 175000, 'bakery', 'durian,flour,charcoal powder,cheese'),
(@IdSauRieng9Sach, N'BÁNH SẦU RIÊNG NGÀN LỚP 12CM VỊ LÁ DỨA', N'Vỏ bánh được làm từ lá dứa, thơm dịu hoà quyện', 175000, 'bakery', 'durian,flour,pandan,cream'),

(@IdOcTrungMuoiCN5, N'Ốc Bươu nướng tiêu', N'Cay cay tiêu xanh nước sốt nướng tạo lẻm đặc biệt', 59000, 'seafood', 'apple snail,green pepper,sauce'),
(@IdOcTrungMuoiCN5, N'Ốc Bưu Sốt Tiêu Đen', N'', 59000, 'seafood', 'apple snail,black pepper,garlic'),
(@IdOcTrungMuoiCN5, N'Ốc Bươu hấp sả', N'Vị thơm sả chanh kết hợp ốc tươi ngon', 59000, 'seafood', 'apple snail,lemongrass,lime'),
(@IdOcTrungMuoiCN5, N'Ốc Bươu hấp Thái', N'Ốc tươi ngon hấp nước thái chua chua ngọt ngọt', 59000, 'seafood', 'apple snail,lemongrass,chili,tomyum paste'),
(@IdOcTrungMuoiCN5, N'Tôm càng xanh nướng phô mai khè', N'', 149000, 'seafood', 'prawn,cheese,butter'),

(@IdDomotoSaigon, N'Cơm Lươn', N'Lươn, trứng cuộn, rong biển, gừng đỏ', 189000, 'japanese', 'rice,eel,egg,seaweed,ginger'),
(@IdDomotoSaigon, N'Cơm Tôm Chiên', N'Tôm chiên, trứng cuộn, rong Biển, gừng đỏ', 108000, 'japanese', 'rice,fried shrimp,egg,seaweed'),
(@IdDomotoSaigon, N'Cơm bò Hamburger trứng cuộn', N'Cơm bò Hamburger rưới sốt Ham ăn cùng trứng cuộn', 94500, 'japanese', 'rice,beef patty,egg,demi-glace sauce'),
(@IdDomotoSaigon, N'Cơm cà ri bò Hamburger', N'Có thêm cà ri Nhật bao mlem', 117000, 'japanese', 'rice,beef patty,japanese curry'),
(@IdDomotoSaigon, N'Cơm bò Hamburger phô mai', N'Thêm phô mai mozzarella cho thêm phần mlem', 108000, 'japanese', 'rice,beef patty,mozzarella cheese'),

(@IdOcTrungMuoiQ5, N'Combo Hàu Hấp Xả 2kg', N'Hàu được hấp chung với xả và chấm với muối tiêu', 99000, 'seafood', 'oyster,lemongrass,pepper salt'),
(@IdOcTrungMuoiQ5, N'Combo Hàu Sữa hấp xả 1kg', N'Hàu sữa sẽ được hấp với xả, chấm với muối tiêu', 59000, 'seafood', 'oyster,lemongrass,pepper salt'),
(@IdOcTrungMuoiQ5, N'Trà tắc', N'', 20000, 'beverage', 'tea,kumquat,sugar'),
(@IdOcTrungMuoiQ5, N'Trà ổi', N'Trà ổi đó nha ...là trà ổi đó', 20000, 'beverage', 'tea,guava,sugar'),
(@IdOcTrungMuoiQ5, N'Nước ngọt', N'Pepsi, coca, 7up', 20000, 'beverage', 'soda'),

(@IdChampong, N'Tteobokki', N'Mang về tự nấu', 168000, 'korean', 'rice cake,fish cake,gochujang,scallion'),
(@IdChampong, N'Lẩu Chả Cá', N'Mang về tự nấu', 192000, 'korean', 'fish cake,anchovy broth,radish'),
(@IdChampong, N'Tteobokki - Lẩu Chả Cá', N'Mang về tự nấu', 348000, 'korean', 'rice cake,fish cake,gochujang,broth'),
(@IdChampong, N'Mì tương đen- 짜장면', N'', 144000, 'korean', 'noodle,chunjang,pork,onion'),
(@IdChampong, N'Thịt heo chua ngọt Size Mini-찹쌀탕수육미니', N'', 216000, 'korean', 'pork,sweet and sour sauce,flour'),

(@IdAnLacChay, N'Cơm chiên thập cẩm', N'Ruốc nấm, cà rốt xúc xích chay chả nấm chay dưa leo', 28000, 'vegetarian', 'rice,mushroom floss,vegan sausage,carrot'),
(@IdAnLacChay, N'Bánh Mì Chả Nấm An Lạc', N'Bánh mì nóng zòn kèm pate nấm dinh dưỡng dưa leo', 25000, 'vegetarian', 'bread,mushroom patty,vegan pate,cucumber'),
(@IdAnLacChay, N'Bánh Mì Chả Cá Chay', N'Bánh mì giòn rụm kết hợp với chả chay chiên giòn', 18000, 'vegetarian', 'bread,vegan fish cake,cucumber,coriander'),
(@IdAnLacChay, N'Bánh Mì Nấm (Best Seller)', N'Bánh mì + sốt + nấm + cà chua + dưa leo', 20000, 'vegetarian', 'bread,mushroom,tomato,cucumber'),
(@IdAnLacChay, N'Bánh Mì Xúc Xích Chay (Best Seller)', N'Bánh mì giòn rụm kết hợp với xúc xích chiên giòn', 18000, 'vegetarian', 'bread,vegan sausage,cucumber,chili'),

(@IdTauHuCovang, N'Sương sáo gói sữa béo', N'Kèm sữa béo ăn là ghiền. Ăn giải nhiệt.', 20000, 'dessert', 'grass jelly,milk,sugar'),
(@IdTauHuCovang, N'Tàu hũ tươi Co Vang', N'Vị truyền thống', 20000, 'dessert', 'soybean,water,sugar'),
(@IdTauHuCovang, N'Set 10 tàu hũ tươi Co Vang', N'100% sữa đậu nành tươi nhập khẩu, gừng tươi, lá dứa', 200000, 'dessert', 'soybean,ginger,pandan,cane sugar'),
(@IdTauHuCovang, N'Set 5 Tàu hũ tươi Co Vang', N'Sản phẩm giàu canxi, phù hợp ăn chay, người tiểu đường', 100000, 'dessert', 'soybean,ginger,pandan,cane sugar'),
(@IdTauHuCovang, N'Set 20 tàu hũ Covang', N'Vị ngọt vừa ăn, thơm mùi lá dứa.', 400000, 'dessert', 'soybean,pandan,sugar');
GO

--QUẬN 10
-- 1. Thêm dữ liệu vào bảng Restaurants
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Nem Nướng Nha Trang - Since 1982 - Quận 10', N'451/29/26 Tô Hiến Thành, P. 14, Quận 10, TP. HCM', 10.772942, 106.663877, 3.5, 45000, '08:00', '22:00', 'vietnamese'),
(N'Bo Food - Gà Quay, Sườn Quay & Cơm Lam Bánh Bao Quận 10 - Bà Hạt', N'Số 484 Bà Hạt, P. 8, Quận 10, TP. HCM', 10.765236, 106.665438, 4.5, 250000, '09:00', '22:00', 'vietnamese'),
(N'CHÂN GÀ GOOD - QUẬN 10', N'63-65 Ngô Quyền, P. 6, Quận 10, TP. HCM', 10.761618, 106.664970, 4.5, 90000, '10:00', '23:00', 'snack'),
(N'Mì Trộn Phủ Trứng - Quận 10', N'104/42 Thành Thái, P. 14, Quận 10, TP. HCM', 10.774393, 106.665241, 4.5, 69000, '08:00', '22:00', 'noodle'),
(N'Gà Rán YumIco - Quận 10', N'031 Lô U Chung Cư Ngô Gia Tự, P. 12, Quận 10, TP. HCM', 10.763574, 106.673826, 4.5, 80000, '09:00', '22:00', 'fastfood'),
(N'Bánh Tráng Muối Tỏi & Dừa Tắc Quận 10 - Hòa Hưng', N'83/14E Hòa Hưng, P. 12, Quận 10, TP. HCM', 10.778425, 106.675366, 4.5, 25000, '08:00', '22:00', 'beverage'),
(N'Ốc Trứng Muối - Chi Nhánh 4 Quận 10', N'G1A Trường Sơn, P. 15, Quận 10, TP. HCM', 10.781109, 106.661759, 4.0, 80000, '15:00', '23:30', 'seafood'),
(N'Chiang Thai Delivery - Quận 10', N'104/59 Thành Thái, P. 12, Quận 10, TP. HCM', 10.774527, 106.665543, 4.5, 75000, '10:00', '22:00', 'thai'),
(N'Truyền Thuyết Champong - Quận 10', N'CC8 - CC9 - CC10 Trường Sơn, P. 15, Quận 10, TP. HCM', 10.781764, 106.663217, 4.5, 140000, '10:00', '22:00', 'korean'),
(N'Bò Né 3 Anh Em Quận 10', N'013-014 Lô K Chung Cư Ngô Gia Tự, Đường Sư Vạn Hạnh, P. 2, Quận 10, TP. HCM', 10.769632, 106.676971, 4.5, 75000, '06:00', '22:00', 'vietnamese');
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
GO

--QUẬN 11
-- 1. CHÈN DỮ LIỆU VÀO BẢNG RESTAURANTS (20 QUÁN QUẬN 11)
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Kênh Bà Châu - Cá Hồi Ngâm Tương Thạng Hạng', N'6/8C Tân Hoá, P. 1, Quận 11, TP. HCM', 10.755293, 106.638042, 4.5, 150000, '10:00', '21:00', 'japanese'),
(N'Phở Trường Sơn - Quận 11', N'273 Lạc Long Quân, P. 3, Quận 11, TP. HCM', 10.764995, 106.642187, 4.5, 60000, '06:00', '22:00', 'vietnamese'),
(N'Bánh Mì Tuấn Mập - Bánh Mì Chảo & Bò Bít Tết - Lãnh Binh Thăng', N'116 Lãnh Binh Thăng, Quận 11, TP. HCM', 10.762489, 106.654248, 4.5, 55000, '06:00', '21:00', 'vietnamese'),
(N'Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới', N'25 Đường Số 6, P. 8, Quận 11, TP. HCM', 10.761426, 106.649229, 4.5, 65000, '00:00', '23:59', 'vietnamese'),
(N'Hủ Tiếu Chay - Tôn Thất Hiệp', N'11A Tôn Thất Hiệp, P. 13, Quận 11, TP. HCM', 10.763426, 106.654229, 4.5, 35000, '07:00', '20:00', 'vegetarian'),
(N'Cơm Truyền Ký - Quận 11', N'39/20 Lý Thường Kiệt, Quận 11, TP. HCM', 10.759192, 106.660903, 4.5, 100000, '10:00', '21:00', 'chinese'),
(N'Sủi Cảo Ngọc Ý - Hà Tôn Quyền', N'187 - 189 Hà Tôn Quyền, P. 7, Quận 11, TP. HCM', 10.757886, 106.652599, 4.5, 70000, '11:00', '23:00', 'chinese'),
(N'Sủi Cảo Thiên Thiên - Hà Tôn Quyền', N'195 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.758131, 106.652656, 4.5, 70000, '13:00', '23:30', 'chinese'),
(N'Sủi Cảo 193 - Hà Tôn Quyền', N'193 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.758067, 106.652658, 4.5, 70000, '11:00', '23:00', 'chinese'),
(N'Sủi Cảo 162 - Hà Tôn Quyền', N'162 Hà Tôn Quyền, P. 4, Quận 11, TP. HCM', 10.757880, 106.652530, 4.5, 70000, '11:00', '23:00', 'chinese'),
(N'Bò Né 3 Anh Em - Quận 11', N'221 Hòa Bình, P. Hiệp Tân, Quận 11, TP. HCM', 10.761061, 106.652533, 4.5, 75000, '07:00', '22:00', 'vietnamese'),
(N'Tàu Hũ tươi Covang Quận 11 - Bình Thới', N'166 Bình Thới, P. 14, Quận 11, TP. HCM', 10.765691, 106.645532, 5.0, 30000, '08:00', '22:00', 'dessert'),
(N'Bánh Cuốn & Bánh Ướt Phú Lâm - Quận 11', N'221/11 Lãnh Binh Thăng, P. 12, Quận 11, TP. HCM', 10.764510, 106.651420, 4.5, 40000, '06:00', '21:00', 'vietnamese'),
(N'Bánh Sầu Riêng 9 Sạch - Quận 11', N'138 Lạc Long Quân, P. 10, Quận 11, TP. HCM', 10.764820, 106.643210, 4.5, 175000, '09:00', '21:00', 'bakery'),
(N'Ăn Vặt 3 Chị Em - Quận 11', N'110/33/2 Ông Ích Khiêm, P. 5, Quận 11, TP. HCM', 10.768120, 106.640100, 4.5, 60000, '09:00', '22:00', 'snack'),
(N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11', N'120 Bình Thới, P. 14, Quận 11, TP. HCM', 10.765400, 106.646100, 4.5, 120000, '10:00', '22:00', 'thai'),
(N'Mì Trộn & Xiên Que Cá Con - Quận 11', N'45 Đường Số 2, Cư Xá Bình Thới, Quận 11, TP. HCM', 10.766120, 106.647200, 4.0, 50000, '08:00', '21:00', 'snack'),
(N'Gà Rán YumIco - Quận 11', N'25 Đường Số 16, Cư Xá Lữ Gia, Quận 11, TP. HCM', 10.772100, 106.655300, 4.5, 80000, '09:00', '22:00', 'fastfood'),
(N'Mì Trộn Phủ Trứng - Quận 11', N'341/14D Lạc Long Quân, P. 5, Quận 11, TP. HCM', 10.768410, 106.641500, 4.5, 65000, '08:00', '21:00', 'noodle'),
(N'An Lạc - Ăn Chay - Quận 11', N'221/11 Lãnh Binh Thăng, P. 12, Quận 11, TP. HCM', 10.764510, 106.651420, 4.5, 30000, '07:00', '21:00', 'vegetarian');
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
GO