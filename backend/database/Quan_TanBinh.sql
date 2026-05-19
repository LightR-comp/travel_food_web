USE travel_food_db
GO

-- ==========================================
-- TÂN BÌNH VÀ CÁC QUẬN LÂN CẬN
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Lê Na Food - Lẩu Thái, Lẩu Hải Sản & Lẩu Bò - CN Tân Bình', N'43 Vân Côi, P. 7, Tân Bình, TP. HCM', 10.786009, 106.656735, 4.2, 250000, '09:00', '23:00', N'vietnamese, nhậu'),
(N'Quán Bé Ú - Mì Trộn Indome & Drink Mix - Bình Tân', N'637/1/6 Đường An Dương Vương, P. Bình Trị Đông, Bình Tân, TP. HCM', 10.756484, 106.624572, 4.7, 50000, '08:00', '22:00', N'asian, bình dân'),
(N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - CMT8 Tân Bình', N'993 Cách Mạng Tháng Tám, P. Tân Sơn Nhất, Tân Bình, TP. HCM', 10.790482, 106.657586, 4.8, 60000, '09:00', '22:30', N'fastfood, bình dân'),
(N'Ăn Vặt Mợ Ba - Shop Online - Tân Bình Tân Hoà', N'137 Chấn Hưng, P. 6, Tân Bình, TP. HCM', 10.785252, 106.662502, 4.7, 100000, '09:00', '22:00', N'asian, bình dân'),
(N'Ăn Vặt Ma Bư Food - Mì Trộn & Gà Rán Tân Bình', N'175 Võ Thành Trang, P. 11, Tân Bình, TP. HCM', 10.790555, 106.648922, 4.1, 80000, '09:00', '23:00', N'asian, bình dân'),
(N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 175 Nguyễn Thị Nhỏ Tân Bình', N'175 Nguyễn Thị Nhỏ, P. 9, Tân Bình, TP. HCM', 10.772522, 106.652797, 4.6, 60000, '09:00', '22:30', N'fastfood, bình dân'),
(N'Amy Food - Bánh Mì & Cơm Cháy Chà Bông - Tân Bình', N'1444/7 Trường Sa, P. 3, Tân Bình, TP. HCM', 10.792762, 106.660793, 4.2, 100000, '08:00', '22:00', N'vietnamese, bình dân'),
(N'Bà Na Food - Lẩu Thái Hải Sản, Lẩu Bò & Mì Trộn Cá Viên Chiên - CN Tân Bình', N'43A Vân Côi, P. 7, Tân Bình, TP. HCM', 10.786009, 106.656735, 4.8, 150000, '10:00', '23:00', N'vietnamese, nhậu'),
(N'RỐI COFFEE - Matcha Latte & Cacao Latte - Tân Bình', N'374 Trường Chinh, P. 13, Tân Bình, TP. HCM', 10.799811, 106.640757, 4.1, 45000, '07:00', '22:00', N'cafe, bình dân'),
(N'Mì Cay Đại Hàn - Gò Xoài, Bình Tân', N'228/21A Gò Xoài, P. Bình Hưng Hòa A, Bình Tân, TP. HCM', 10.787555, 106.005868, 4.4, 70000, '09:00', '23:59', N'korean, bình dân'),
(N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 118 Đồng Đen Tân Bình', N'118 Đồng Đen, P. 14, Tân Bình, TP. HCM', 10.792180, 106.644077, 4.7, 60000, '09:00', '22:30', N'fastfood, bình dân'),
(N'Cơm Niêu TodoFood - Bình Tân - Cơm Ngon 3 Miền', N'Số 17 Đường 1D, P. An Lạc A, Bình Tân, TP. HCM', 10.747149, 106.619397, 4.3, 80000, '10:00', '21:30', N'vietnamese, bình dân'),
(N'Ăn Vặt, Chân Gà Sốt Thái & Vịt Cay Gia Truyền - Bình Tân', N'Số 203 Mã Lò, P. Bình Hưng Hòa A, Bình Tân, TP. HCM', 10.786429, 106.597950, 4.2, 70000, '15:00', '23:30', N'asian, bình dân'),
(N'Gỏi Cuốn, Bò Bía & Bún Mắm Nêm - Chị Hạnh Tân Bình', N'123/42 Nghĩa Phát, P. 6, Tân Bình, TP. HCM', 10.785460, 106.658401, 4.6, 40000, '10:00', '21:00', N'vietnamese, bình dân'),
(N'Tiệm Ân - Bánh Bao Phô Mai, Pizza & Bánh Tart Trứng - Bình Tân', N'53/11 Đường 8B, P. Bình Hưng Hoà A, Bình Tân, TP. HCM', 10.782256, 106.614650, 4.8, 50000, '07:00', '22:00', N'bakery, bình dân'),
(N'Nước Mía Henry - Rau Má, Cà Phê Sữa Tươi & Trà Tắc - Bình Tân', N'44 Đường Số 22, P. Bình Hưng Hòa A, Bình Tân, TP. HCM', 10.778460, 106.604510, 4.4, 25000, '07:00', '23:00', N'cafe, bình dân'),
(N'Ông Trấn - Bánh Mì Bình Định - Tân Sơn Nhì', N'93 Tân Sơn Nhì, P. Tân Sơn Nhì, Tân Phú, TP. HCM', 10.801992, 106.634016, 4.3, 30000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'1705 Matcha - Trà Matcha Nguyên Chất Nhật Bản - Tân Bình', N'Block A Chung Cư Harmona, 21 Trương Công Định, P. 14, Tân Bình, TP. HCM', 10.796135, 106.641054, 4.7, 60000, '08:00', '22:30', N'cafe, bình dân'),
(N'Nuri Juices - Sinh Tố, Nước Ép & Trái Cây Tô - Bình Tân', N'117 Đường Số 14, Bình Tân, TP. HCM', 10.781258, 106.612202, 4.2, 40000, '08:00', '22:30', N'cafe, bình dân'),
(N'Quán Phở Ngọc Bình Tân - Lê Văn Qưới', N'116 Lê Văn Qưới, P. Bình Hưng Hoà, Bình Tân, TP. HCM', 10.776527, 106.601961, 4.8, 55000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Happi Coffee & Tea - Bình Tân', N'24 Liên Khu 2-5, P. Bình Trị Đông, Bình Tân, TP. HCM', 10.767647, 106.616829, 4.5, 40000, '07:00', '22:30', N'cafe, bình dân'),
(N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Tân Bình', N'39 Thân Nhân Trung, P. 13, Tân Bình, TP. HCM', 10.803446, 106.642388, 4.6, 250000, '10:00', '22:00', N'korean, gia đình'),
(N'Ốc Trứng Muối - Chi Nhánh 2 Tân Bình', N'11 Đường B6, P. 12, Tân Bình, TP. HCM', 10.798214, 106.650180, 4.1, 80000, '15:00', '23:30', N'seafood, nhậu'),
(N'Ram Nhà Nẫu - Ram Bắp & Ram Cá - Tân Bình', N'127/44/32 Ni Sư Huỳnh Liên, Tân Bình, TP. HCM', 10.782541, 106.646550, 4.7, 55000, '09:00', '21:30', N'vietnamese, bình dân');
GO

DECLARE @IdLeNa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lê Na Food - Lẩu Thái, Lẩu Hải Sản & Lẩu Bò - CN Tân Bình');
DECLARE @IdQuanBeU INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Bé Ú - Mì Trộn Indome & Drink Mix - Bình Tân');
DECLARE @IdJimamaCMT8 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - CMT8 Tân Bình');
DECLARE @IdMoBa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Mợ Ba - Shop Online - Tân Bình Tân Hoà');
DECLARE @IdMaBu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Ma Bư Food - Mì Trộn & Gà Rán Tân Bình');
DECLARE @IdJimamaNTN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 175 Nguyễn Thị Nhỏ Tân Bình');
DECLARE @IdAmyFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Amy Food - Bánh Mì & Cơm Cháy Chà Bông - Tân Bình');
DECLARE @IdBaNaFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bà Na Food - Lẩu Thái Hải Sản, Lẩu Bò & Mì Trộn Cá Viên Chiên - CN Tân Bình');
DECLARE @IdRoiCoffee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'RỐI COFFEE - Matcha Latte & Cacao Latte - Tân Bình');
DECLARE @IdMiCayGoXoai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Đại Hàn - Gò Xoài, Bình Tân');
DECLARE @IdJimamaDD INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 118 Đồng Đen Tân Bình');
DECLARE @IdTodoFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Niêu TodoFood - Bình Tân - Cơm Ngon 3 Miền');
DECLARE @IdChanGaBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt, Chân Gà Sốt Thái & Vịt Cay Gia Truyền - Bình Tân');
DECLARE @IdGoiCuonHanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gỏi Cuốn, Bò Bía & Bún Mắm Nêm - Chị Hạnh Tân Bình');
DECLARE @IdTiemAn INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Ân - Bánh Bao Phô Mai, Pizza & Bánh Tart Trứng - Bình Tân');
DECLARE @IdHenry INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nước Mía Henry - Rau Má, Cà Phê Sữa Tươi & Trà Tắc - Bình Tân');
DECLARE @IdOngTran INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ông Trấn - Bánh Mì Bình Định - Tân Sơn Nhì');
DECLARE @IdMatcha1705 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'1705 Matcha - Trà Matcha Nguyên Chất Nhật Bản - Tân Bình');
DECLARE @IdNuriJuices INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nuri Juices - Sinh Tố, Nước Ép & Trái Cây Tô - Bình Tân');
DECLARE @IdPhoNgoc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Phở Ngọc Bình Tân - Lê Văn Qưới');
DECLARE @IdHappi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Happi Coffee & Tea - Bình Tân');
DECLARE @IdCoThao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Tân Bình');
DECLARE @IdOcTrungMuoi2 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 2 Tân Bình');
DECLARE @IdRamNhaNau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ram Nhà Nẫu - Ram Bắp & Ram Cá - Tân Bình');

-- ==========================================
-- CHÈN MENU (4 món ngẫu nhiên mỗi quán)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdLeNa, N'Lẩu Thái hải sản thập cẩm VỪA (2-3 người dùng)', N'Set Lẩu Thái (2-3 người): tôm, bạch tuộc, nghêu, cá basa, ba chỉ bò Mỹ', 294000, 'hotpot', 'hotpot broth, seafood, beef'),
(@IdLeNa, N'Lẩu cá Basa chua cay chuẩn Thái (2 người dùng)', N'Topping: cá basa loại ngon, bún tươi, mì gói, nghêu', 225400, 'hotpot', 'hotpot broth, basa fish, clam, rice noodles'),
(@IdLeNa, N'Lẩu Đầu Cá Hồi Nauy (2 người) - Ngon & Bổ Dưỡng', N'Đầu cá hồi béo mềm tan trong miệng.', 245000, 'hotpot', 'hotpot broth, salmon head'),
(@IdLeNa, N'Lẩu Thái Ba chỉ bò Mỹ 500GRAM (2-3 người dùng)', N'500g ba chỉ bò cuộn Mỹ mềm tan', 392000, 'hotpot', 'hotpot broth, beef'),

(@IdQuanBeU, N'Mì BÁT BẢO ( có trứng )', N'', 44000, 'asian', 'noodles, mixed toppings, egg'),
(@IdQuanBeU, N'Mì trộn HẢI SẢN MINI ( có trứng )', N'', 43000, 'asian', 'noodles, seafood, egg'),
(@IdQuanBeU, N'Mì Trộn Rộn Ràng ( Kèm 1 Ly SoDa )', N'Mì Rau Thanh Cua - hoành thánh - viên thả lẩu', 61000, 'asian', 'noodles, crab stick, wonton, sausage'),
(@IdQuanBeU, N'1 Mì thập cẩm + 1 trà đào', N'', 65000, 'asian', 'noodles, mixed toppings, peach tea'),

(@IdJimamaCMT8, N'Combo Gà Sốt 2 Vị', N'Combo gà sốt với 2 hương vị tự chọn', 119800, 'korean', 'fried chicken, sauce'),
(@IdJimamaCMT8, N'Gà Sốt Cay Ngọt Hàn Quốc', N'Gà giòn rụm, sốt đậm đà.', 42800, 'korean', 'fried chicken, spicy sweet sauce'),
(@IdJimamaCMT8, N'Combo Mỳ Ý Đùi Gà Giòn (Pep)', N'', 78000, 'italian', 'spaghetti, fried chicken, pepsi'),
(@IdJimamaCMT8, N'Cơm Đùi Gà Sốt', N'Cơm nóng, gà giòn, sốt đậm đà', 52800, 'fastfood', 'rice, fried chicken, sauce'),

(@IdMoBa, N'Khô vụn gói', N'Cơm nếp cao cấp mix sốt đậm đà', 1000, 'snack', 'scorched rice'),
(@IdMoBa, N'Tóp Mỡ Mắm Da Giòn ( Hủ 200gr )', N'Tóp mỡ giòn đậm vị.', 110000, 'snack', 'pork crackling, fish sauce'),
(@IdMoBa, N'Da Cá Trứng Muối ( Hủ 250gr )', N'Béo của trứng - giòn của da.', 125000, 'snack', 'fish skin, salted egg'),
(@IdMoBa, N'Đậu Phộng Cháy Tỏi ( Hủ 300gr )', N'Đậu giòn béo kết hợp vị mặn ngọt cháy tỏi', 85000, 'snack', 'peanut, garlic'),

(@IdMaBu, N'Mì Trộn Đặc Biệt + Trà Đào Bư', N'Mì trộn đặc biệt thơm ngon, kèm trà đào tươi mát', 92000, 'snack', 'noodles, peach tea'),
(@IdMaBu, N'Mì Bò Viên + Lục Trà Dâu Tươi', N'Mì bò viên dai mềm, kết hợp cùng trà dâu', 85000, 'snack', 'noodles, beef balls, strawberry tea'),
(@IdMaBu, N'Gà Mix 3 Vị + Lục Trà Dâu Tươi', N'Cay hàn, phô mai, kem béo', 120000, 'snack', 'fried chicken, mixed sauces, strawberry tea'),
(@IdMaBu, N'Mì Trộn Xúc Xích Tóp Mỡ + Lục Trà Xoài Chanh Dây', N'Mì trộn xúc xích tóp mỡ đậm đà', 75000, 'snack', 'noodles, sausage, pork crackling, fruit tea'),

(@IdJimamaNTN, N'Combo Gà Rán (Pep)', N'1 đùi gà + 1 cánh gà + 1 khoai + 1 nước', 110000, 'fastfood', 'fried chicken, french fries, pepsi'),
(@IdJimamaNTN, N'Combo Mỳ Ý Đùi Gà Giòn (Pep)', N'', 78000, 'italian', 'spaghetti, fried chicken, pepsi'),
(@IdJimamaNTN, N'Gà Sốt Mật Ong Brasil', N'Gà giòn rụm, sốt đậm đà.', 42800, 'fastfood', 'fried chicken, honey sauce'),
(@IdJimamaNTN, N'Combo Gà Phủ Phô Mai - 1 người', N'2 miếng gà phủ phô mai + 1 khoai tây phô mai', 85000, 'fastfood', 'fried chicken, cheese, french fries'),

(@IdAmyFood, N'KHÔ HEO tỏi ớt (túi zip) 250g', N'Làm từ thịt heo 100% ko trộn thịt gà', 149000, 'snack', 'dried pork, garlic, chili'),
(@IdAmyFood, N'KHÔ BÒ tỏi ớt thượng hạng 200g', N'Khô bò thượng hạng, cay, mềm ngon', 149000, 'snack', 'dried beef, garlic, chili'),
(@IdAmyFood, N'Cơm cháy chà bông truyền thống 250g', N'Gói 250g', 85000, 'snack', 'scorched rice, pork floss'),
(@IdAmyFood, N'Cơm cháy chà bông trứng muối 250g', N'Gói 250g', 95000, 'snack', 'scorched rice, pork floss, salted egg'),

(@IdBaNaFood, N'Lẩu Thái hải sản NHỎ (1-2 người)', N'Set Lẩu Thái (1-2 người): tôm, bạch tuộc, nghêu', 227700, 'hotpot', 'hotpot broth, seafood, beef'),
(@IdBaNaFood, N'Cá viên chiên nước mắm MIX NHỎ', N'Món ăn tiện lợi, cực cuốn!', 83150, 'snack', 'mixed fried balls, fish sauce'),
(@IdBaNaFood, N'Mì trộn cá viên chiên mắm tỏi MIX 1', N'Món ngon gây nghiện! Mì trộn sốt mắm tỏi đặc biệt', 59400, 'snack', 'noodles, mixed fried balls, fish sauce'),
(@IdBaNaFood, N'Mì Trộn Ba Chỉ Bò Mỹ Cháy Bơ Tỏi - Kèm Trứng Ốp La', N'Mì trộn sốt mắm tỏi độc quyền, ba chỉ bò Mỹ', 84150, 'snack', 'noodles, beef, garlic butter, egg'),

(@IdRoiCoffee, N'MATCHA LATTE LY 1 LÍT 3', N'', 50000, 'cafe', 'matcha, milk'),
(@IdRoiCoffee, N'CA CAO LATTE LY 1 LÍT 3', N'', 50000, 'cafe', 'cacao, milk'),
(@IdRoiCoffee, N'MATCHA SỮA DỪA-700ml', N'', 40000, 'cafe', 'matcha, coconut milk'),
(@IdRoiCoffee, N'CÀ PHÊ SỮA ĐÁ', N'Ly 500ml', 22000, 'cafe', 'coffee, milk'),

(@IdMiCayGoXoai, N'Mì kim chi - Hải Sản đặc biệt', N'Khẩu phần: 2 tôm, 2 mực nang, 5 cá viên, 1 thanh cua', 65550, 'korean', 'spicy noodles, seafood, kimchi'),
(@IdMiCayGoXoai, N'Combo 2 mì cay bò xúc xích cá viên + 2 pepsi 360ml', N'', 125000, 'korean', 'spicy noodles, beef, sausage, fish balls, pepsi'),
(@IdMiCayGoXoai, N'Mì Kim Chi - Thập Cẩm Đặc Biệt', N'1 Tôm, 1 mực nang, 50gram bò, 1 thanh cua', 79000, 'korean', 'spicy noodles, mixed toppings, kimchi'),
(@IdMiCayGoXoai, N'Mì Kim Chi - Rau Nấm ( ăn chay được )', N'', 37050, 'korean', 'spicy noodles, vegetables, mushroom, kimchi'),

(@IdJimamaDD, N'Combo Gà Sốt (2 miếng) (Pep)', N'Gà xốt (2 miếng) + 1 khoai + 1 pep', 115000, 'fastfood', 'fried chicken, french fries, pepsi'),
(@IdJimamaDD, N'Cơm Đùi Gà Giòn', N'Cơm nóng gà giòn, tròn vị Jimama!', 45800, 'fastfood', 'rice, fried chicken'),
(@IdJimamaDD, N'Mỳ Ý Lạp Xưởng', N'Mỳ ý mềm dai, sốt cà đậm đà, lạp xưởng đặc biệt', 42800, 'italian', 'spaghetti, sausage'),
(@IdJimamaDD, N'Mỳ Ý Tôm Viên Tươi', N'Mỳ ý kết hợp tôm viên chiên', 52800, 'italian', 'spaghetti, shrimp balls'),

(@IdTodoFood, N'cơm trắng (gạo ngon)', N'', 11250, 'vietnamese', 'rice'),
(@IdTodoFood, N'Cơm Niêu Cháy', N'Cơm Niêu được làm cháy 1 mặt thơm lừng giòn rụm', 15000, 'vietnamese', 'crispy rice'),
(@IdTodoFood, N'Cơm Niêu + Ba Rọi Kho Tiêu + Canh', N'', 82000, 'vietnamese', 'rice, braised pork belly'),
(@IdTodoFood, N'Cơm Niêu + Cá Hú Kho Tộ + Canh', N'', 82000, 'vietnamese', 'rice, braised catfish'),

(@IdChanGaBT, N'Gỏi đu đủ tôm', N'', 30000, 'snack', 'papaya, shrimp'),
(@IdChanGaBT, N'Bún thập cẩm tôm thịt tai heo', N'', 50000, 'vietnamese', 'rice noodles, shrimp, pork, pig ear'),
(@IdChanGaBT, N'Chân gà sốt thái mix trứng non phần nhỏ', N'', 89000, 'snack', 'chicken feet, thai sauce, young egg'),
(@IdChanGaBT, N'Chân gà mixx thập cẩm sốt thái phần lớn', N'Chân gà - trứng non- râu tuột - mề gà -gân bò', 138000, 'snack', 'mixed chicken feet, thai sauce'),

(@IdGoiCuonHanh, N'Gỏi cuốn, tôm, thịt heo', N'Bún, rau , tôm, thịt, nước chấm', 19000, 'vietnamese', 'spring rolls, shrimp, pork'),
(@IdGoiCuonHanh, N'Gỏi cuốn tai heo tôm', N'Bún, rau, lỗ tai, tôm', 24000, 'vietnamese', 'spring rolls, pig ear, shrimp'),
(@IdGoiCuonHanh, N'Combo 5 cuốn bò bía', N'Củ sắn, lạc xưởng, con ruốc, trứng, rau', 85000, 'vietnamese', 'bo bia, sausage, dried shrimp'),
(@IdGoiCuonHanh, N'Bún mắm nêm thập cẩm đặc biệt', N'Bún, rau, thịt heo, tai heo, tôm', 130000, 'vietnamese', 'rice noodles, mixed toppings, fermented fish sauce'),

(@IdTiemAn, N'Combo No Nhanh', N'1 Pizza Tam Giác, 1 Bánh Nướng, 1 Thức uống', 99000, 'bakery', 'pizza, pastry, drink'),
(@IdTiemAn, N'Bánh Bao Xá Xíu Hồng Kông Nhỏ', N'Bánh bao xá xíu theo kiểu Hong Kong', 25000, 'bakery', 'bao bun, char siu'),
(@IdTiemAn, N'Bánh Bao Nguyên Cám Gà Nấm Phô Mai', N'Bánh bao vỏ nguyên cám, gà, nấm đông cô, phô mai', 43500, 'bakery', 'whole wheat bao bun, chicken, mushroom, cheese'),
(@IdTiemAn, N'Bánh Bao Kim Sa Trứng Muối Chảy', N'Bánh bao kim sa trứng muối mềm mại', 18250, 'bakery', 'bao bun, salted egg'),

(@IdHenry, N'Nước Mía Tắc Ly Khổng Lồ 800ml', N'Ép Truyền Thống + Tắc + Ly Khổng Lồ 800ml', 15950, 'beverage', 'sugarcane juice, kumquat'),
(@IdHenry, N'Nước Mía Dâu Ly Khổng Lồ 800ml', N'Cốt Mứt Dâu Tây Tươi Nhà Làm', 23950, 'beverage', 'sugarcane juice, strawberry'),
(@IdHenry, N'Rau Má Đậu Xanh Ly Khổng Lồ 800ml', N'Ly Khổng Lồ 800ml', 19900, 'beverage', 'pennywort juice, mung bean'),
(@IdHenry, N'Sữa Dừa Đậu Xanh Ly Khổng Lồ 800ml', N'Đậu Xanh Đánh + Sữa Dừa + Ly Khổng Lồ 800ml', 23950, 'beverage', 'coconut milk, mung bean'),

(@IdOngTran, N'Bánh mì đặc biệt', N'Nước sốt ông trấn + Nhiều Chả + trứng luộc', 32000, 'vietnamese', 'bread, mixed pork sausage, roast pork, egg'),
(@IdOngTran, N'Bánh cuốn Bình Định', N'VD : Chả + Trứng Luộc + Nem chua + bánh giòn', 28000, 'vietnamese', 'rice paper roll, pork sausage, egg'),
(@IdOngTran, N'Bánh mì thập cẩm', N'Nước sốt Ông Trấn + Chả + trứng luộc + heo quay', 30000, 'vietnamese', 'bread, mixed toppings'),
(@IdOngTran, N'Bánh mì heo quay', N'Nước sốt ông trấn + chả giòn + heo quay', 30000, 'vietnamese', 'bread, roast pork'),

(@IdMatcha1705, N'Matcha Latte Sữa Mix', N'Trà xanh Matcha Nhật Bản nguyên chất kết hợp', 58000, 'cafe', 'matcha, milk'),
(@IdMatcha1705, N'Matcha Latte Mứt Yuzu', N'Matcha latte kết hợp mứt yuzu Nhật', 64000, 'cafe', 'matcha, milk, yuzu jam'),
(@IdMatcha1705, N'Coconut Matcha - Matcha Dừa Tươi', N'Trà xanh Matcha Nhật Bản nguyên chất kết hợp nước dừa', 58000, 'cafe', 'matcha, coconut water'),
(@IdMatcha1705, N'Matcha Yuzu Soda', N'Nước soda matcha mát lạnh hòa quyện cùng mứt yuzu Nhật', 64000, 'cafe', 'matcha, soda, yuzu jam'),

(@IdNuriJuices, N'Trà Trái Cây Nhiệt Đới (Ly 700ml)', N'', 35000, 'beverage', 'tropical fruit tea'),
(@IdNuriJuices, N'Trà Đào Dầm Mix Trân Châu Olong (Ly 700ml)', N'Giá Đã Bao Gồm 1 Phần Trân Châu Olong', 36000, 'beverage', 'peach tea, oolong boba'),
(@IdNuriJuices, N'Trái Cây Tô', N'( Bao gồm Trái Cây Theo Mùa Ăn Kèm Sữa Đặc', 48000, 'dessert', 'mixed fruits, condensed milk'),
(@IdNuriJuices, N'Sữa Chua Lắc Việt Quất (Ly 700ml)', N'', 42000, 'beverage', 'yogurt, blueberry'),

(@IdPhoNgoc, N'Phở Tái Nạm', N'', 55000, 'vietnamese', 'pho noodles, rare beef, beef flank'),
(@IdPhoNgoc, N'Phở Tái Viên', N'', 55000, 'vietnamese', 'pho noodles, rare beef, beef balls'),
(@IdPhoNgoc, N'Phở Thập Cẩm', N'', 65000, 'vietnamese', 'pho noodles, mixed beef'),
(@IdPhoNgoc, N'Bún Bò', N'', 55000, 'vietnamese', 'rice noodles, beef'),

(@IdHappi, N'MATCHA CARAMEL KEM DẺO', N'', 52000, 'cafe', 'matcha, caramel'),
(@IdHappi, N'BẠC XỈU', N'', 30000, 'cafe', 'coffee, milk'),
(@IdHappi, N'TRÀ SỮA LÀI', N'', 29000, 'beverage', 'jasmine milk tea'),
(@IdHappi, N'TRÀ SỮA KHOAI MÔN', N'', 36000, 'beverage', 'taro milk tea'),

(@IdCoThao, N'Combo chuẩn Hàn 1 - Cá hồi, cua gạch', N'Cá hồi ngâm tương (M-240g), Cua gạch ngâm tương', 798000, 'korean', 'soy-marinated salmon, soy-marinated crab, rice'),
(@IdCoThao, N'Set 2 - Cơm cá hồi, trứng ngâm tương', N'Món gồm: 70g cá hồi, 1 trứng, kim chi', 144000, 'korean', 'rice, soy-marinated salmon, egg'),
(@IdCoThao, N'Tôm ngâm tương M - 300g', N'11-12 pcs tôm ngâm tương. Dùng kèm: kim chi', 279000, 'korean', 'soy-marinated shrimp'),
(@IdCoThao, N'Trứng ngâm tương S - 5 trứng', N'', 80000, 'korean', 'soy-marinated egg'),

(@IdOcTrungMuoi2, N'Tôm nướng muối ớt', N'Cay cay muối ớt', 69000, 'seafood', 'shrimp, chili salt'),
(@IdOcTrungMuoi2, N'Sò Huyết xào me', N'Nước sốt me đặc biệt quán hoà quện sò', 59000, 'seafood', 'blood cockle, tamarind sauce'),
(@IdOcTrungMuoi2, N'Hàu né phô mai', N'Vị béo hào kết hợp phomai tan chảy', 99000, 'seafood', 'oyster, cheese'),
(@IdOcTrungMuoi2, N'Tôm càng xanh sốt trứng muối', N'', 149000, 'seafood', 'shrimp, salted egg sauce'),

(@IdRamNhaNau, N'Combo Ram Bắp + Ram Cá', N'5 Ram Bắp + 5 Ram Cá', 55000, 'vietnamese', 'corn spring roll, fish spring roll'),
(@IdRamNhaNau, N'Combo Ram Bắp + Trà tắc', N'10 Ram Bắp + 1 Trà Tắc', 60000, 'vietnamese', 'corn spring roll, kumquat tea'),
(@IdRamNhaNau, N'Ram Bắp (10 cuốn)', N'Ăn chay được', 50000, 'vietnamese', 'corn spring roll'),
(@IdRamNhaNau, N'Ram chả cá (10 cuốn)', N'', 55000, 'vietnamese', 'fish spring roll');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdLeNa, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml4s7gnsqln2dd', 1),
(@IdQuanBeU, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtby67mw2roaf', 1),
(@IdJimamaCMT8, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhluptqkyp6t06', 1),
(@IdMoBa, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1dw4rffitdbd', 1),
(@IdMaBu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjpbo42s1dxde', 1),
(@IdJimamaNTN, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtk7jsed4w402', 1),
(@IdAmyFood, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m79gvrvtg4dv76', 1),
(@IdBaNaFood, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meq16qm4r283ef', 1),
(@IdRoiCoffee, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhjuquiyujgg15', 1),
(@IdMiCayGoXoai, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmpjcbt6thjc1d', 1),
(@IdJimamaDD, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml65lqaq4q9w7c', 1),
(@IdTodoFood, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m296u7xxsbzo72', 1),
(@IdChanGaBT, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnyny5sjoava83', 1),
(@IdGoiCuonHanh, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfrz4i1crp577b', 1),
(@IdTiemAn, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlrhjz8hinep92', 1),
(@IdHenry, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-ma9ls7b0zuyrea', 1),
(@IdOngTran, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73vl434wih16', 1),
(@IdMatcha1705, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mby1suj60bda2c', 1),
(@IdNuriJuices, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjolx1c0pagaa', 1),
(@IdPhoNgoc, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lssfzlogyf15fe', 1),
(@IdHappi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn4asqrqf2f632', 1),
(@IdCoThao, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m80jokbhpd361d', 1),
(@IdOcTrungMuoi2, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcgdg84j8gf6fb', 1),
(@IdRamNhaNau, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh0jrj775wr338', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Lê Na Food
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml4s7gnsqln2dd' FROM MenuItems WHERE restaurant_id = @IdLeNa AND name = N'Lẩu Thái hải sản thập cẩm VỪA (2-3 người dùng)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml9lvxpzo5c3ce' FROM MenuItems WHERE restaurant_id = @IdLeNa AND name = N'Lẩu cá Basa chua cay chuẩn Thái (2 người dùng)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlagb7s9o6ipde' FROM MenuItems WHERE restaurant_id = @IdLeNa AND name = N'Lẩu Đầu Cá Hồi Nauy (2 người) - Ngon & Bổ Dưỡng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml66nngih72be8' FROM MenuItems WHERE restaurant_id = @IdLeNa AND name = N'Lẩu Thái Ba chỉ bò Mỹ 500GRAM (2-3 người dùng)' UNION ALL

-- Quán Bé Ú
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtby67mw2roaf' FROM MenuItems WHERE restaurant_id = @IdQuanBeU AND name = N'Mì BÁT BẢO ( có trứng )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtby67myvwk03' FROM MenuItems WHERE restaurant_id = @IdQuanBeU AND name = N'Mì trộn HẢI SẢN MINI ( có trứng )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mezopsdrqaruca' FROM MenuItems WHERE restaurant_id = @IdQuanBeU AND name = N'Mì Trộn Rộn Ràng ( Kèm 1 Ly SoDa )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m9x13w69axz63e' FROM MenuItems WHERE restaurant_id = @IdQuanBeU AND name = N'1 Mì thập cẩm + 1 trà đào' UNION ALL

-- Jimama CMT8
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhluptqkyp6t06' FROM MenuItems WHERE restaurant_id = @IdJimamaCMT8 AND name = N'Combo Gà Sốt 2 Vị' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhluq669lxxd83' FROM MenuItems WHERE restaurant_id = @IdJimamaCMT8 AND name = N'Gà Sốt Cay Ngọt Hàn Quốc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-mahvsy4z3aafa1' FROM MenuItems WHERE restaurant_id = @IdJimamaCMT8 AND name = N'Combo Mỳ Ý Đùi Gà Giòn (Pep)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjb5v3bs68ef07' FROM MenuItems WHERE restaurant_id = @IdJimamaCMT8 AND name = N'Cơm Đùi Gà Sốt' UNION ALL

-- Ăn Vặt Mợ Ba
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1f0xrscq9t0d' FROM MenuItems WHERE restaurant_id = @IdMoBa AND name = N'Khô vụn gói' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1ffikxj37m81' FROM MenuItems WHERE restaurant_id = @IdMoBa AND name = N'Tóp Mỡ Mắm Da Giòn ( Hủ 200gr )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1dl0phqqyt24' FROM MenuItems WHERE restaurant_id = @IdMoBa AND name = N'Da Cá Trứng Muối ( Hủ 250gr )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1f4eoieozkae' FROM MenuItems WHERE restaurant_id = @IdMoBa AND name = N'Đậu Phộng Cháy Tỏi ( Hủ 300gr )' UNION ALL

-- Ma Bư Food
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjpbo42s1dxde' FROM MenuItems WHERE restaurant_id = @IdMaBu AND name = N'Mì Trộn Đặc Biệt + Trà Đào Bư' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjq6t37snb72d' FROM MenuItems WHERE restaurant_id = @IdMaBu AND name = N'Mì Bò Viên + Lục Trà Dâu Tươi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjjlet3wvsz33' FROM MenuItems WHERE restaurant_id = @IdMaBu AND name = N'Gà Mix 3 Vị + Lục Trà Dâu Tươi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjqcwzz99mq67' FROM MenuItems WHERE restaurant_id = @IdMaBu AND name = N'Mì Trộn Xúc Xích Tóp Mỡ + Lục Trà Xoài Chanh Dây' UNION ALL

-- Jimama Nguyễn Thị Nhỏ
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtk7jsed4w402' FROM MenuItems WHERE restaurant_id = @IdJimamaNTN AND name = N'Combo Gà Rán (Pep)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtk7dc4wohz38' FROM MenuItems WHERE restaurant_id = @IdJimamaNTN AND name = N'Combo Mỳ Ý Đùi Gà Giòn (Pep)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtkae7zl91f71' FROM MenuItems WHERE restaurant_id = @IdJimamaNTN AND name = N'Gà Sốt Mật Ong Brasil' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjtkbcsbkm4n13' FROM MenuItems WHERE restaurant_id = @IdJimamaNTN AND name = N'Combo Gà Phủ Phô Mai - 1 người' UNION ALL

-- Amy Food
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m79gvrvtg4dv76' FROM MenuItems WHERE restaurant_id = @IdAmyFood AND name = N'KHÔ HEO tỏi ớt (túi zip) 250g' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m59jtphjwt2u29' FROM MenuItems WHERE restaurant_id = @IdAmyFood AND name = N'KHÔ BÒ tỏi ớt thượng hạng 200g' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxtbx8b30lga4' FROM MenuItems WHERE restaurant_id = @IdAmyFood AND name = N'Cơm cháy chà bông truyền thống 250g' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxtm2rm5ymxde' FROM MenuItems WHERE restaurant_id = @IdAmyFood AND name = N'Cơm cháy chà bông trứng muối 250g' UNION ALL

-- Bà Na Food
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meq16qm4r283ef' FROM MenuItems WHERE restaurant_id = @IdBaNaFood AND name = N'Lẩu Thái hải sản NHỎ (1-2 người)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meq16qm3fax0ee' FROM MenuItems WHERE restaurant_id = @IdBaNaFood AND name = N'Cá viên chiên nước mắm MIX NHỎ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meq16qm3gphg74' FROM MenuItems WHERE restaurant_id = @IdBaNaFood AND name = N'Mì trộn cá viên chiên mắm tỏi MIX 1' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh7ysvem60wb89' FROM MenuItems WHERE restaurant_id = @IdBaNaFood AND name = N'Mì Trộn Ba Chỉ Bò Mỹ Cháy Bơ Tỏi - Kèm Trứng Ốp La' UNION ALL

-- RỐI COFFEE
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhjuquiyujgg15' FROM MenuItems WHERE restaurant_id = @IdRoiCoffee AND name = N'MATCHA LATTE LY 1 LÍT 3' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhjuub6yvrpi54' FROM MenuItems WHERE restaurant_id = @IdRoiCoffee AND name = N'CA CAO LATTE LY 1 LÍT 3' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml7rczrovhtuc2' FROM MenuItems WHERE restaurant_id = @IdRoiCoffee AND name = N'MATCHA SỮA DỪA-700ml' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhjuhtxri1oh6e' FROM MenuItems WHERE restaurant_id = @IdRoiCoffee AND name = N'CÀ PHÊ SỮA ĐÁ' UNION ALL

-- Mì Cay Đại Hàn Gò Xoài
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmpjcbt6thjc1d' FROM MenuItems WHERE restaurant_id = @IdMiCayGoXoai AND name = N'Mì kim chi - Hải Sản đặc biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcnlsicvvxjwd4' FROM MenuItems WHERE restaurant_id = @IdMiCayGoXoai AND name = N'Combo giá hời: 2 mì cay bò xúc xích cá viên' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmpjhio16homcf' FROM MenuItems WHERE restaurant_id = @IdMiCayGoXoai AND name = N'Mì Kim Chi - Thập Cẩm Đặc Biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbnyunwo0pn976' FROM MenuItems WHERE restaurant_id = @IdMiCayGoXoai AND name = N'Mì Kim Chi - Rau Nấm ( ăn chay được )' UNION ALL

-- Jimama Đồng Đen
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml65m0o1kd1c3e' FROM MenuItems WHERE restaurant_id = @IdJimamaDD AND name = N'Combo Gà Sốt (2 miếng) (Pep)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml65v0v4rx1fc2' FROM MenuItems WHERE restaurant_id = @IdJimamaDD AND name = N'Cơm Đùi Gà Giòn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml65uqfyw6q025' FROM MenuItems WHERE restaurant_id = @IdJimamaDD AND name = N'Mỳ Ý Lạp Xưởng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmn1ct73m7t030' FROM MenuItems WHERE restaurant_id = @IdJimamaDD AND name = N'Mỳ Ý Tôm Viên Tươi' UNION ALL

-- Cơm Niêu TodoFood
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m296u7xxsbzo72' FROM MenuItems WHERE restaurant_id = @IdTodoFood AND name = N'cơm trắng (gạo ngon)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgpeo31u4n48a9' FROM MenuItems WHERE restaurant_id = @IdTodoFood AND name = N'Cơm Niêu Cháy' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhbvendi3fntb9' FROM MenuItems WHERE restaurant_id = @IdTodoFood AND name = N'Cơm Niêu + Ba Rọi Kho Tiêu + Canh' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mhbvendi4u8970' FROM MenuItems WHERE restaurant_id = @IdTodoFood AND name = N'Cơm Niêu + Cá Hú Kho Tộ + Canh' UNION ALL

-- Ăn Vặt, Chân Gà Sốt Thái
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnyny5sjppfq6e' FROM MenuItems WHERE restaurant_id = @IdChanGaBT AND name = N'Gỏi đu đủ tôm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnyl6deoc45d8e' FROM MenuItems WHERE restaurant_id = @IdChanGaBT AND name = N'Bún thập cẩm tôm thịt tai heo' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmpypx5fqsxx9a' FROM MenuItems WHERE restaurant_id = @IdChanGaBT AND name = N'Chân gà sốt thái mix trứng non' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdob5h3grovl90' FROM MenuItems WHERE restaurant_id = @IdChanGaBT AND name = N'Chân gà mixx thập cẩm sốt thái phần lớn' UNION ALL

-- Gỏi Cuốn Chị Hạnh
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfrz4i1crp577b' FROM MenuItems WHERE restaurant_id = @IdGoiCuonHanh AND name = N'Gỏi cuốn, tôm, thịt heo' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfrz4i1cxbez0c' FROM MenuItems WHERE restaurant_id = @IdGoiCuonHanh AND name = N'Gỏi cuốn tai heo tôm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfs1fp5qpgy4fa' FROM MenuItems WHERE restaurant_id = @IdGoiCuonHanh AND name = N'Combo 5 cuốn bò bía' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfs2a9xaiz2h97' FROM MenuItems WHERE restaurant_id = @IdGoiCuonHanh AND name = N'Bún mắm nêm thập cẩm đặc biệt' UNION ALL

-- Tiệm Ân
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlrhjz8hinep92' FROM MenuItems WHERE restaurant_id = @IdTiemAn AND name = N'Combo No Nhanh' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn2zbnzk85xd38' FROM MenuItems WHERE restaurant_id = @IdTiemAn AND name = N'Bánh Bao Xá Xíu Hồng Kông Nhỏ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmyt9g5pktmtd0' FROM MenuItems WHERE restaurant_id = @IdTiemAn AND name = N'Bánh Bao Nguyên Cám Gà Nấm Phô Mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn09xgvegz5tbf' FROM MenuItems WHERE restaurant_id = @IdTiemAn AND name = N'Bánh Bao Kim Sa Trứng Muối Chảy' UNION ALL

-- Nước Mía Henry
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-ma6y2qndmflv29' FROM MenuItems WHERE restaurant_id = @IdHenry AND name = N'Nước Mía Tắc Ly Khổng Lồ 800ml' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-ma6y3b6tkcjnf5' FROM MenuItems WHERE restaurant_id = @IdHenry AND name = N'Nước Mía Dâu(Cốt Dâu) Ly Khổng Lồ 800ml' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-ma6y4yp4he9dab' FROM MenuItems WHERE restaurant_id = @IdHenry AND name = N'Rau Má Đậu Xanh Ly Khổng Lồ 800ml' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-ma6y5xiziir518' FROM MenuItems WHERE restaurant_id = @IdHenry AND name = N'Sữa Dừa Đậu Xanh Ly Khổng Lồ 800ml' UNION ALL

-- Ông Trấn
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73vl434wih16' FROM MenuItems WHERE restaurant_id = @IdOngTran AND name = N'Bánh mì đặc biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr0olvyulaxl91' FROM MenuItems WHERE restaurant_id = @IdOngTran AND name = N'Bánh cuốn Bình Định' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73viat93tlbb' FROM MenuItems WHERE restaurant_id = @IdOngTran AND name = N'Bánh mì thập cẩm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr0olu993g04b2' FROM MenuItems WHERE restaurant_id = @IdOngTran AND name = N'Bánh mì heo quay' UNION ALL

-- 1705 Matcha
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-820l4-mfc6wbc8dh55c1' FROM MenuItems WHERE restaurant_id = @IdMatcha1705 AND name = N'Matcha Latte Sữa Mix' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-820l4-mfc6yafz37kee1' FROM MenuItems WHERE restaurant_id = @IdMatcha1705 AND name = N'Matcha Latte Mứt Yuzu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-820l4-mfc6lmadnmry91' FROM MenuItems WHERE restaurant_id = @IdMatcha1705 AND name = N'Coconut Matcha - Matcha Dừa Tươi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-820l4-mfc6zrw7oumnf7' FROM MenuItems WHERE restaurant_id = @IdMatcha1705 AND name = N'Matcha Yuzu Soda' UNION ALL

-- Nuri Juices
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjollodp4htaa' FROM MenuItems WHERE restaurant_id = @IdNuriJuices AND name = N'Trà Trái Cây Nhiệt Đới (Ly 700ml)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjoky8vsg79fe' FROM MenuItems WHERE restaurant_id = @IdNuriJuices AND name = N'Trà Đào Dầm Mix Trân Châu Olong' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo7v52lv3sw130' FROM MenuItems WHERE restaurant_id = @IdNuriJuices AND name = N'Trái Cây Tô' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn77xkcm6znq36' FROM MenuItems WHERE restaurant_id = @IdNuriJuices AND name = N'Sữa Chua Lắc Việt Quất' UNION ALL

-- Quán Phở Ngọc
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lssfzlogyf15fe' FROM MenuItems WHERE restaurant_id = @IdPhoNgoc AND name = N'Phở Tái Nạm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mncyqi85xwjmb0' FROM MenuItems WHERE restaurant_id = @IdPhoNgoc AND name = N'Phở Tái Viên' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lssfwildily193' FROM MenuItems WHERE restaurant_id = @IdPhoNgoc AND name = N'Phở Thập Cẩm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mndrczg144cmc5' FROM MenuItems WHERE restaurant_id = @IdPhoNgoc AND name = N'Bún Bò' UNION ALL

-- Happi Coffee
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn41c8pk5hj5c1' FROM MenuItems WHERE restaurant_id = @IdHappi AND name = N'MATCHA CARAMEL KEM DẺO' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnlkx2o481zc7d' FROM MenuItems WHERE restaurant_id = @IdHappi AND name = N'BẠC XỈU' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn4asqrmo7wme6' FROM MenuItems WHERE restaurant_id = @IdHappi AND name = N'TRÀ SỮA LÀI' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn4naqgn318h99' FROM MenuItems WHERE restaurant_id = @IdHappi AND name = N'TRÀ SỮA KHOAI MÔN' UNION ALL

-- Cô Thảo Tôm Cá
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m80jokbhpd361d' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Combo chuẩn Hàn 1 - Cá hồi, cua gạch' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m80ipuvq2ef60a' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Set 2 - Cơm cá hồi, trứng ngâm tương' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m80izk3d1bwi1f' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Tôm ngâm tương M - 300g' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m80j3fif0juqdb' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Trứng ngâm tương S - 5 trứng' UNION ALL

-- Ốc Trứng Muối
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcgdg84j8gf6fb' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi2 AND name = N'Tôm nướng muối ớt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcgebb65oqaq0f' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi2 AND name = N'Sò Huyết xào me' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcgd7zb3jwkcd0' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi2 AND name = N'Hàu né phô mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcgcpgfhhhnx50' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi2 AND name = N'Tôm càng xanh sốt trứng muối' UNION ALL

-- Ram Nhà Nẫu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh0jrj775wr338' FROM MenuItems WHERE restaurant_id = @IdRamNhaNau AND name = N'Combo Ram Bắp + Ram Cá' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh0jwkydyvbg18' FROM MenuItems WHERE restaurant_id = @IdRamNhaNau AND name = N'Combo Ram Bắp + Trà tắc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh0j8kh9ebri06' FROM MenuItems WHERE restaurant_id = @IdRamNhaNau AND name = N'Ram Bắp (10 cuốn)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh0ja82g56h640' FROM MenuItems WHERE restaurant_id = @IdRamNhaNau AND name = N'Ram chả cá (10 cuốn)';