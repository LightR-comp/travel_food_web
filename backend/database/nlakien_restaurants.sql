USE travel_food_db
GO

-- =============================================
-- QUẬN 7: CHÈN NHÀ HÀNG (RESTAURANTS)
-- =============================================
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Wala Cà Phê Quận 7', N'124 Đường 79, P. Tân Quy, Quận 7, TP. HCM', 10.740566516, 106.70724531, 4.5, 30000, '07:00', '22:00', 'coffee'),
(N'Quán Chay Liên Hoa - Quận 7', N'Số 8 Đường số 1, P. Tân Phú, Quận 7, TP. HCM', 10.73604817, 106.726185376, 4.5, 23000, '07:00', '21:00', 'vegetarian'),
(N'Tacos Nhà Labubu 149 - Phạm Hữu Lầu', N'Số 149 Phạm Hữu Lầu, P. Phú Mỹ, Quận 7, TP. HCM', 10.7045364, 106.73371, 4.5, 52000, '10:00', '22:00', 'fastfood'),
(N'Tacos Labubu Quận 7 - Đường Số 17', N'145 Đường Số 17, P. Tân Quy, Quận 7, TP. HCM', 10.744893117, 106.711792219, 4.5, 95000, '10:00', '22:00', 'fastfood'),
(N'Tacos Xin Chào - 333 Nguyễn Hữu Thọ', N'333 Nguyễn Hữu Thọ, P. Tân Hưng, Quận 7, TP. HCM', 10.7325786, 106.7001351, 4.5, 60000, '10:00', '22:00', 'fastfood'),
(N'LaSiMi Quận 7 - Đường Số 17', N'147c đường số 17, P. Tân Quy, Quận 7, TP. HCM', 10.744884241, 106.711646511, 4.5, 45000, '08:00', '22:30', 'beverage'),
(N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7', N'269 Phạm Hữu Lầu, P. Phú Mỹ, Quận 7, TP. HCM', 10.704106653, 106.729072377, 4.5, 75000, '06:00', '22:00', 'vietnamese'),
(N'Bún Mọc Nhà Làm - Quận 7', N'33 Đường Số 13, P. Tân Kiểng, Quận 7, TP. HCM', 10.745889508, 106.708909239, 4.5, 57000, '06:30', '21:00', 'vietnamese'),
(N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN', N'Số 1 Đường 12, Khu Dân Cư Nam Long, Quận 7, TP. HCM', 10.7437645, 106.7359543, 4.5, 74000, '07:00', '21:30', 'vietnamese'),
(N'Bánh Mì Pate Hải Phòng Quận 7', N'141 Đường Số 1, P. Tân Phú, Quận 7, TP. HCM', 10.737000935, 106.71714699, 4.5, 40000, '06:00', '21:00', 'vietnamese');
GO

-- =============================================
-- QUẬN 7: KHAI BÁO BIẾN ID
-- =============================================
DECLARE @IdWala INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Wala Cà Phê Quận 7');
DECLARE @IdLienHoa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Chay Liên Hoa - Quận 7');
DECLARE @IdLabubu149 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Nhà Labubu 149 - Phạm Hữu Lầu');
DECLARE @IdLabubu17 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Labubu Quận 7 - Đường Số 17');
DECLARE @IdXinChao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Xin Chào - 333 Nguyễn Hữu Thọ');
DECLARE @IdLaSiMi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'LaSiMi Quận 7 - Đường Số 17');
DECLARE @IdBunRieu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7');
DECLARE @IdBunMoc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Mọc Nhà Làm - Quận 7');
DECLARE @IdIchi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN');
DECLARE @IdPateHP INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Pate Hải Phòng Quận 7');

-- =============================================
-- QUẬN 7: CHÈN THỰC ĐƠN (MENUITEMS)
-- =============================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
-- Wala Cà Phê
(@IdWala, N'Cà Phê Muối L', N'Vị đậm đà kết hợp lớp kem muối béo mặn đặc trưng', 37000, 'drink', 'coffee, milk, salt cream'),
(@IdWala, N'Bạc Xỉu L', N'Sữa tươi béo quyện chút hương cà phê nhẹ nhàng', 31000, 'drink', 'coffee, milk, condensed milk'),
(@IdWala, N'Cà Phê Sữa L', N'Cà phê sữa pha máy truyền thống', 31000, 'drink', 'coffee, condensed milk'),
(@IdWala, N'Sữa Tươi Cà Phê Caramel L', N'Sữa tươi cà phê kết hợp sốt caramel ngọt ngào', 35000, 'drink', 'coffee, milk, caramel'),
(@IdWala, N'Cà Phê Muối M', N'Phiên bản cỡ vừa của cà phê muối đặc sản', 29000, 'drink', 'coffee, milk, salt cream'),

-- Quán Chay Liên Hoa
(@IdLienHoa, N'Cơm cà tím (thập cẩm)', N'Cơm ăn kèm cà tím kho và các món chay thập cẩm', 23000, 'vegetarian', 'rice, eggplant, soy protein'),
(@IdLienHoa, N'Cơm sườn (thập cẩm)', N'Cơm sườn chay nướng thơm ngon', 23000, 'vegetarian', 'rice, vegan rib, vegetable'),
(@IdLienHoa, N'Cơm đậu hũ sả (thập cẩm)', N'Đậu hũ chiên sả ớt cay nhẹ', 23000, 'vegetarian', 'rice, tofu, lemongrass'),
(@IdLienHoa, N'Cơm ba rọi (thập cẩm)', N'Thịt ba rọi chay kho đậm đà', 23000, 'vegetarian', 'rice, vegan pork, fish sauce'),
(@IdLienHoa, N'Cơm chả kho (thập cẩm)', N'Chả lụa chay kho tiêu', 23000, 'vegetarian', 'rice, vegan ham'),

-- Tacos Nhà Labubu 149
(@IdLabubu149, N'MỲ TRỘN FULL TOPPING', N'Mỳ trộn đầy đủ thịt bò, trứng và rau củ', 65000, 'fastfood', 'noodle, beef, egg, vegetable'),
(@IdLabubu149, N'Tacos Bò Mỹ phủ sốt', N'Bánh Tacos kẹp thịt bò Mỹ nướng sốt đặc biệt', 42000, 'fastfood', 'tortilla, beef, sauce'),
(@IdLabubu149, N'MỲ GÀ XÙ BƠ CAY', N'Mỳ trộn gà chiên xù béo ngậy vị bơ', 52000, 'fastfood', 'noodle, fried chicken, butter'),
(@IdLabubu149, N'Tacos Tôm Chiên Xù', N'Tôm sú chiên xù giòn rụm trong vỏ bánh Tacos', 52000, 'fastfood', 'tortilla, fried shrimp'),
(@IdLabubu149, N'Tacos Sườn Nướng BBQ', N'Sườn heo nướng sốt BBQ đậm đà kiểu Mexico', 52000, 'fastfood', 'tortilla, BBQ pork'),

-- Tacos Labubu Quận 7 - Đường Số 17
(@IdLabubu17, N'Khoai tây chiên phủ phô mai', N'Khoai tây giòn tan phủ sốt phô mai béo', 45000, 'snack', 'potato, cheese'),
(@IdLabubu17, N'Cặp đôi hoàn cảnh', N'1 Tacos bò và 1 Tacos gà rút xương', 95000, 'fastfood', 'tortilla, beef, chicken'),
(@IdLabubu17, N'Cặp đôi bò tơ', N'Combo 2 bánh Tacos bò Mỹ nướng', 95000, 'fastfood', 'tortilla, beef'),
(@IdLabubu17, N'Cặp đôi gà giòn mộng mơ', N'Gà chiên xù và gà rút xương Teriyaki', 95000, 'fastfood', 'tortilla, fried chicken'),

-- Tacos Xin Chào - 333 Nguyễn Hữu Thọ
(@IdXinChao, N'Bò Bằm Phô Mai', N'Tacos bò bằm quyện phô mai tan chảy', 58000, 'fastfood', 'tortilla, minced beef, cheese'),
(@IdXinChao, N'Gà Phô Mai MOZZARELLA', N'Gà nướng phô mai kéo sợi', 58000, 'fastfood', 'tortilla, chicken, mozzarella'),
(@IdXinChao, N'Đặc Biệt Thập Cẩm', N'Phiên bản đầy đủ nhất các loại thịt', 79000, 'fastfood', 'tortilla, mixed meat'),
(@IdXinChao, N'Tôm Chiên Giòn Sốt Cay', N'Tôm sú giòn rụm kết hợp sốt cay nồng', 59000, 'fastfood', 'tortilla, shrimp, spicy sauce'),

-- LaSiMi Quận 7
(@IdLaSiMi, N'OLONG SỮA TRÂN CHÂU', N'Trà Olong sữa thơm đậm kết hợp trân châu dai', 45000, 'drink', 'oolong tea, milk, pearl'),
(@IdLaSiMi, N'TRÀ OLONG ĐÀO CAM SẢ', N'Trà trái cây thanh mát giải nhiệt', 45000, 'drink', 'oolong tea, peach, orange, lemongrass'),
(@IdLaSiMi, N'TRÀ OLONG TRÁI CÂY NHIỆT ĐỚI', N'Hỗn hợp trái cây tươi cùng cốt trà Olong', 45000, 'drink', 'oolong tea, mixed fruits'),
(@IdLaSiMi, N'TRÀ OLONG SEN VÀNG KEM PHÔMAI', N'Trà sen thơm nhẹ quyện lớp kem béo ngậy', 45000, 'drink', 'oolong tea, lotus seed, cheese cream'),

-- Bún Riêu Tóp Mỡ Đặc Biệt Quận 7
(@IdBunRieu, N'Bún riêu bát đặc biệt', N'Đầy đủ riêu cua, giò, chả và tóp mỡ giòn', 85000, 'vietnamese', 'rice noodle, crab paste, pork fat'),
(@IdBunRieu, N'Bún riêu bát đầy đủ', N'Bát bún riêu truyền thống thơm ngon', 75000, 'vietnamese', 'rice noodle, crab paste'),
(@IdBunRieu, N'Trà Tắc xí muội', N'Thức uống giải khát thanh mát', 15000, 'drink', 'kumquat, salted plum'),
(@IdBunRieu, N'Bí Đao Hạt Chia', N'Nước bí đao hạt chia bổ dưỡng', 18000, 'drink', 'winter melon, chia seed'),

-- Bún Mọc Nhà Làm
(@IdBunMoc, N'Bún Mọc Thập Cẩm', N'Bún mọc đầy đủ các loại chả và sườn sụn', 67000, 'vietnamese', 'rice noodle, pork ball, pork rib'),
(@IdBunMoc, N'Bún Mọc Sườn', N'Bún nấu cùng sườn non hầm mềm', 57000, 'vietnamese', 'rice noodle, pork ball, pork rib'),
(@IdBunMoc, N'Bún Mọc Chả', N'Bún mọc ăn kèm các loại chả lụa, chả quế', 57000, 'vietnamese', 'rice noodle, pork ball, pork sausage'),
(@IdBunMoc, N'Bánh Canh Mọc Sườn', N'Sợi bánh canh dai kết hợp nước dùng thanh ngọt', 57000, 'vietnamese', 'tapioca noodle, pork ball'),

-- Bún Chả Hà Nội ICHI QUÁN
(@IdIchi, N'Bún Chả Hà Nội Truyền Thống', N'Thịt nướng than hoa ăn kèm nước mắm đu đủ', 74000, 'vietnamese', 'rice noodle, grilled pork, fish sauce'),
(@IdIchi, N'Bún Nem Cua Bể', N'Nem cua bể giòn tan chuẩn vị Hải Phòng', 75000, 'vietnamese', 'rice noodle, crab spring roll'),
(@IdIchi, N'Bún Chả Hà Nội - Thịt Viên Nướng', N'Chả viên nướng thơm lừng ăn kèm rau sống', 64000, 'vietnamese', 'rice noodle, pork meatball'),
(@IdIchi, N'Nem Nem Cua Bể - Hộp 10 cây', N'Phần nem cua bể mang về tiện lợi', 300000, 'vietnamese', 'crab spring roll'),

-- Bánh Mì Pate Hải Phòng
(@IdPateHP, N'Xôi mặn', N'Xôi nếp dẻo ăn kèm pate, chà bông và lạp xưởng', 38000, 'vietnamese', 'sticky rice, pate, pork sausage'),
(@IdPateHP, N'Xôi gà xé', N'Gà xé trộn thấm vị ăn cùng xôi', 45000, 'vietnamese', 'sticky rice, shredded chicken'),
(@IdPateHP, N'Xôi Patê', N'Xôi ăn kèm pate Hải Phòng béo ngậy đặc trưng', 48000, 'vietnamese', 'sticky rice, pate'),
(@IdPateHP, N'Combo 5 x Bánh mì que Pate', N'Combo tiết kiệm cho gia đình', 38000, 'vietnamese', 'bread, pate');
GO

-- =============================================
-- QUẬN 8: CHÈN NHÀ HÀNG (RESTAURANTS)
-- =============================================
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Matcha Khum? Phố Tây Quận 8', N'Căn 01.11 Shophouse Pegasuite 1, 1002 Tạ Quang Bửu, P. 6, Quận 8, TP. HCM', 10.7342516, 106.6533069, 4.5, 45000, '08:00', '22:00', 'beverage'),
(N'Đậu Hũ Co Vang Quận 8', N'198 Đặng Thúc Liêng, P. 4, Quận 8, TP. HCM', 10.741569038, 106.669611445, 5.0, 20000, '08:00', '21:00', 'vietnamese'),
(N'Tứ Quý Trà - Caramel Macchiato Quận 8', N'290 Phạm Thế Hiển, P. 3, Quận 8, TP. HCM', 10.748868788, 106.682729347, 4.5, 35000, '08:00', '22:00', 'beverage'),
(N'Mì Cay Seoul - Quận 8', N'90 Dương Quang Đông, P. 5, Quận 8, TP. HCM', 10.73666167, 106.66719859, 4.5, 75000, '09:00', '22:30', 'korean'),
(N'Chuối Chiên Malaysia - Tạ Quang Bửu', N'Đối Diện 976 Tạ Quang Bửu, Quận 8, TP. HCM', 10.7331355, 106.6524361, 4.5, 15000, '10:00', '18:00', 'snack'),
(N'Ăn Vặt Mỡ Mỡ - Quận 8', N'125/107/54/15 Tám Danh, P. 4, Quận 8, TP. HCM', 10.7407966, 106.6729728, 4.5, 60000, '09:00', '22:00', 'snack'),
(N'Gạo Coffee - Matcha & Cacao - Quận 8', N'658 Hưng Phú, P. 10, Quận 8, TP. HCM', 10.746157197, 106.668184499, 4.5, 30000, '07:00', '21:00', 'coffee'),
(N'Nước Sâm Bưu Điện Quận 8', N'426 Tùng Thiện Vương, P. 12, Quận 8, TP. HCM', 10.7445967, 106.6562713, 4.5, 10000, '08:00', '22:00', 'beverage'),
(N'Tiệm CHAY NÈ ! - Quận 8', N'25 Đặng Chất, P.2, Quận 8, TP. HCM', 10.747253495, 106.68490273, 4.5, 55000, '07:00', '21:00', 'vegetarian'),
(N'Quán Chay Thiện Tiên - Phạm Thế Hiển', N'2692A Phạm Thế Hiển, P. 7, Quận 8, TP. HCM', 10.722032147, 106.634857329, 4.5, 42000, '07:00', '21:00', 'vegetarian');
GO

-- =============================================
-- QUẬN 8: KHAI BÁO BIẾN ID
-- =============================================
DECLARE @IdMatchaKhum INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Matcha Khum? Phố Tây Quận 8');
DECLARE @IdDauHu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Đậu Hũ Co Vang Quận 8');
DECLARE @IdTuQuy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tứ Quý Trà - Caramel Macchiato Quận 8');
DECLARE @IdMiCay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Seoul - Quận 8');
DECLARE @IdChuoiChien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chuối Chiên Malaysia - Tạ Quang Bửu');
DECLARE @IdAnVatMoMo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Mỡ Mỡ - Quận 8');
DECLARE @IdGaoCoffee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gạo Coffee - Matcha & Cacao - Quận 8');
DECLARE @IdNuocSam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nước Sâm Bưu Điện Quận 8');
DECLARE @IdChayNe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm CHAY NÈ ! - Quận 8');
DECLARE @IdThienTien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Chay Thiện Tiên - Phạm Thế Hiển');

-- =============================================
-- QUẬN 8: CHÈN THỰC ĐƠN (MENUITEMS)
-- =============================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
-- Matcha Khum?
(@IdMatchaKhum, N'Matcha latte Haru', N'Matcha thượng hạng kết hợp sữa tươi thanh trùng', 52000, 'drink', 'matcha, fresh milk'),
(@IdMatchaKhum, N'Haru cold-whisk 7.5gram matcha', N'Matcha đánh lạnh giữ nguyên độ đậm trà', 75000, 'drink', 'matcha'),
(@IdMatchaKhum, N'Matcha Coco Cloud', N'Matcha quyện cùng cốt dừa béo ngậy', 48000, 'drink', 'matcha, coconut milk'),
(@IdMatchaKhum, N'Matcha Earl Grey', N'Sự kết hợp độc đáo giữa matcha và trà bá tước', 52000, 'drink', 'matcha, earl grey tea'),
(@IdMatchaKhum, N'Cà phê sữa hạt', N'Cà phê sữa thơm bùi từ các loại hạt', 39600, 'drink', 'coffee, nut milk'),

-- Đậu Hũ Co Vang
(@IdDauHu, N'Đậu Hũ Co Vang - 5 hộp', N'Phần đậu hũ nóng hổi, béo mịn đặc sản', 97000, 'vietnamese', 'soybean, ginger syrup'),
(@IdDauHu, N'Trà Đào Ly Lớn', N'Trà đào miếng thơm mát giải nhiệt', 27000, 'drink', 'tea, peach'),
(@IdDauHu, N'Cam Vắt Ly Lớn', N'Nước cam nguyên chất giàu vitamin', 17000, 'drink', 'orange'),
(@IdDauHu, N'Trà Vải Ly Lớn', N'Trà vải trái mọng ngọt thanh', 27000, 'drink', 'tea, lychee'),
(@IdDauHu, N'Cà Phê Sữa Đá Pha Máy', N'Cà phê pha máy hiện đại đậm vị', 19000, 'drink', 'coffee, condensed milk'),

-- Tứ Quý Trà
(@IdTuQuy, N'Trà Tứ Quý', N'Dòng trà đặc sản thanh tao', 39000, 'drink', 'special tea'),
(@IdTuQuy, N'Trà Caramel Macchiato', N'Trà thơm quyện sốt caramel béo ngậy', 39000, 'drink', 'tea, caramel, milk foam'),
(@IdTuQuy, N'Trà Long Nhãn', N'Trà thảo mộc kết hợp nhãn tươi ngọt lịm', 39000, 'drink', 'tea, longan'),
(@IdTuQuy, N'Matcha Latte', N'Trà xanh sữa đá thơm lừng', 35000, 'drink', 'matcha, milk'),
(@IdTuQuy, N'Hồng Trà Trân Châu', N'Hồng trà truyền thống kèm trân châu dai giòn', 29000, 'drink', 'black tea, pearl'),

-- Mì Cay Seoul
(@IdMiCay, N'Mì Kim Chi Hải Sản', N'Mì cay hải sản tôm mực chua cay', 70000, 'korean', 'noodle, shrimp, squid, kimchi'),
(@IdMiCay, N'Mì Kim Chi Bò Mỹ', N'Thịt bò Mỹ mềm ngọt nhúng nước dùng cay nồng', 70000, 'korean', 'noodle, beef, kimchi'),
(@IdMiCay, N'Mì Kim Chi Thập Cẩm', N'Tô mì đầy đặn đủ các loại topping', 86000, 'korean', 'noodle, beef, seafood, kimchi'),
(@IdMiCay, N'Mì Kim Chi Bạch Tuộc', N'Bạch tuộc tươi giòn sần sật', 73000, 'korean', 'noodle, octopus, kimchi'),
(@IdMiCay, N'Mì Kim Chi Cá Hồi', N'Phiên bản mì cay sang chảnh với cá hồi', 111000, 'korean', 'noodle, salmon, kimchi'),

-- Chuối Chiên Malaysia
(@IdChuoiChien, N'Chuối Chiên 1 Cái', N'Chuối chiên giòn rụm kiểu Malaysia', 10000, 'snack', 'banana, flour, sesame'),
(@IdChuoiChien, N'Khoai Lang Chiên 1 Túi', N'Khoai lang cắt thanh chiên vàng', 20000, 'snack', 'sweet potato, flour'),
(@IdChuoiChien, N'Chuối chiên 3 Cái', N'Combo 3 cái chuối chiên nóng hổi', 30000, 'snack', 'banana, flour'),

-- Ăn Vặt Mỡ Mỡ
(@IdAnVatMoMo, N'Bánh Tráng Muối Béo', N'Bánh tráng trộn muối béo đậm đà', 58667, 'snack', 'rice paper, salt, pork fat'),
(@IdAnVatMoMo, N'Khô Gà Lá Chanh 300g', N'Gà xé cay thơm mùi lá chanh', 94000, 'snack', 'chicken, chili, lime leaf'),
(@IdAnVatMoMo, N'Tóp Mỡ Mắm Tỏi 350g', N'Tóp mỡ giòn tan rim mắm tỏi', 149000, 'snack', 'pork fat, fish sauce, garlic'),
(@IdAnVatMoMo, N'Cơm Cháy Chà Bông 300g', N'Cơm cháy giòn rụm phủ đầy chà bông', 59000, 'snack', 'crispy rice, pork floss'),
(@IdAnVatMoMo, N'Da Cá Trứng Muối 250g', N'Da cá chiên giòn lắc vị trứng muối bùi béo', 99000, 'snack', 'fish skin, salted egg'),

-- Gạo Coffee
(@IdGaoCoffee, N'CÀ PHÊ MUỐI', N'Cà phê kem muối béo mặn Best Seller', 35000, 'drink', 'coffee, salt cream'),
(@IdGaoCoffee, N'Cà phê sữa chuối', N'Sự kết hợp lạ miệng giữa cà phê và chuối', 30667, 'drink', 'coffee, milk, banana syrup'),
(@IdGaoCoffee, N'CÀ PHÊ SỮA TƯƠI (LATTE)', N'Latte sữa tươi thơm béo', 32000, 'drink', 'coffee, fresh milk'),
(@IdGaoCoffee, N'CÀ PHÊ SỮA ĐÁ', N'Cà phê sữa đá pha phin truyền thống', 28000, 'drink', 'coffee, condensed milk'),
(@IdGaoCoffee, N'BẠC SỈU', N'Nhiều sữa ít cà phê kiểu Sài Gòn', 30000, 'drink', 'coffee, milk'),

-- Nước Sâm Bưu Điện
(@IdNuocSam, N'Sâm lạnh', N'Nước sâm thảo mộc thanh mát', 10000, 'drink', 'herbal plants'),
(@IdNuocSam, N'Rong biển', N'Nước rong biển nấu đường phèn', 10000, 'drink', 'seaweed, sugar'),
(@IdNuocSam, N'Bông cúc', N'Trà bông cúc giải nhiệt', 10000, 'drink', 'chrysanthemum'),
(@IdNuocSam, N'Nước tắc xí muội', N'Vị chua mặn hài hòa giải khát nhanh', 10000, 'drink', 'kumquat, salted plum'),
(@IdNuocSam, N'Nước cam vắt', N'Cam tươi vắt trực tiếp', 10000, 'drink', 'orange'),

-- Tiệm CHAY NÈ !
(@IdChayNe, N'Bún tomyum thái', N'Nước dùng tomyum chay béo nhẹ chua cay', 55000, 'vegetarian', 'noodle, mushroom, lemongrass, chili'),
(@IdChayNe, N'Hủ tiếu nam vang Nước/Khô', N'Hủ tiếu nam vang phiên bản chay đầy đủ topping', 55000, 'vegetarian', 'rice noodle, vegetable, tofu'),
(@IdChayNe, N'Mì Tiềm chay', N'Mì tiềm thảo mộc thơm nồng kiểu Hoa', 55000, 'vegetarian', 'noodle, medicinal herbs'),
(@IdChayNe, N'Bún cà ri cốt dừa', N'Cà ri chay béo ngậy nước cốt dừa', 60000, 'vegetarian', 'noodle, potato, coconut milk'),
(@IdChayNe, N'Bánh mì bì chả trứng nướng chay', N'Nhân bì chả thực vật nướng thơm phức', 25000, 'vegetarian', 'bread, vegan pork, vegan egg'),

-- Quán Chay Thiện Tiên
(@IdThienTien, N'Cơm Thập Cẩm Chay', N'Phần cơm đầy đủ các món kho, xào chay trong ngày', 42000, 'vegetarian', 'rice, vegan dishes'),
(@IdThienTien, N'Hủ Tiếu Mì Khô', N'Mì khô trộn sốt đặc trưng của quán', 42000, 'vegetarian', 'noodle, soy sauce, vegetable'),
(@IdThienTien, N'Phở chay', N'Nước dùng phở thanh ngọt từ củ quả', 42000, 'vegetarian', 'rice noodle, vegetable broth'),
(@IdThienTien, N'Mì tươi nước', N'Mì sợi tươi nấu nước dùng thanh đạm', 42000, 'vegetarian', 'fresh noodle, broth');
GO

-- =============================================
-- NHÀ BÈ: CHÈN NHÀ HÀNG (RESTAURANTS)
-- =============================================
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Highlands Coffee - Dragon Hill 1 Nhà Bè', N'15A Nguyễn Hữu Thọ, X. Phước Kiểng, Nhà Bè, TP. HCM', 10.7091593, 106.709535, 4.5, 55000, '07:00', '22:00', 'coffee'),
(N'Tacos Toro - Nhà Bè', N'2129/47 Huỳnh Tấn Phát, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.693359144, 106.742441237, 4.5, 60000, '10:00', '22:00', 'fastfood'),
(N'TIỆM TRÀ SOLI NHÀ BÈ', N'708 Nguyễn Văn Tạo, X. Hiệp Phước, Nhà Bè, TP. HCM', 10.634823165, 106.73516723, 4.5, 48000, '08:00', '22:00', 'beverage'),
(N'Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè', N'236 Huỳnh Tấn Phát, Khu Phố 6, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.6967462, 106.7392899, 4.5, 25000, '05:30', '21:00', 'vietnamese'),
(N'Bún Bò O Mỹ Nhà Bè - Nguyễn Bình', N'17/7 Nguyễn Bình, Ấp 1, X. Phú Xuân, Nhà Bè, TP. HCM', 10.673126711, 106.730894849, 4.5, 58000, '06:00', '21:00', 'vietnamese'),
(N'Thẻ MB Bank Hi ShopeeFood - Nhà Bè', N'Số 2049 Huỳnh Tấn Phát, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.6951077, 106.7401974, 0.0, 77000, '00:00', '23:59', 'other'),
(N'T & T Coffee - NHÀ BÈ', N'1-2 Đường 17, KDC Cotec, Nhà Bè, TP. HCM', 10.6772889, 106.738266, 0.0, 30000, '07:00', '22:00', 'coffee'),
(N'Noara Milk Tea - Trà Sữa - Nhà Bè', N'1886/81 Huỳnh Tấn Phát, Nhà Bè, TP. HCM', 10.694610355, 106.737354718, 4.0, 55000, '09:00', '22:00', 'beverage'),
(N'Bún Cá Quy Nhơn - Nhà Bè', N'Huỳnh Tấn Phát, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.695500, 106.741000, 4.4, 45000, '06:00', '21:00', 'vietnamese'),
(N'Cơm Gà Xối Mỡ - Nguyễn Bình', N'Nguyễn Bình, X. Phú Xuân, Nhà Bè, TP. HCM', 10.675000, 106.731500, 4.3, 50000, '10:00', '21:00', 'vietnamese');
GO

-- =============================================
-- NHÀ BÈ: KHAI BÁO BIẾN ID
-- =============================================
DECLARE @IdHighlandsNB INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Dragon Hill 1 Nhà Bè');
DECLARE @IdTacosToro INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Toro - Nhà Bè');
DECLARE @IdTraSoli INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'TIỆM TRÀ SOLI NHÀ BÈ');
DECLARE @IdBanhMiHN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè');
DECLARE @IdBunBoOMy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò O Mỹ Nhà Bè - Nguyễn Bình');
DECLARE @IdMBBank INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thẻ MB Bank Hi ShopeeFood - Nhà Bè');
DECLARE @IdTTCoffee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'T & T Coffee - NHÀ BÈ');
DECLARE @IdNoara INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Noara Milk Tea - Trà Sữa - Nhà Bè');
DECLARE @IdBunCaQN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Cá Quy Nhơn - Nhà Bè');
DECLARE @IdComGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Gà Xối Mỡ - Nguyễn Bình');

-- =============================================
-- NHÀ BÈ: CHÈN THỰC ĐƠN (MENUITEMS)
-- =============================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
-- Highlands Coffee
(@IdHighlandsNB, N'Trà Sen Vàng (Củ Năng)', N'Trà ô long kết hợp cùng hạt sen và củ năng giòn', 49000, 'drink', 'oolong tea, lotus seed, water chestnut'),
(@IdHighlandsNB, N'Cà Phê Phin Sữa Đá (Coffee)', N'Cà phê phin truyền thống đậm đà vị sữa', 17500, 'drink', 'coffee, condensed milk'),
(@IdHighlandsNB, N'Trà Sữa Trà Xanh', N'Trà xanh thanh mát quyện cùng sữa béo', 65000, 'drink', 'matcha, milk'),
(@IdHighlandsNB, N'Bánh Mì Que Pate Highlands', N'Bánh mì que giòn tan với nhân pate đặc trưng', 19000, 'snack', 'bread, pate'),
(@IdHighlandsNB, N'PhinĐI Kem Sữa - Cà phê', N'Cà phê phin kết hợp lớp kem sữa béo ngậy', 49000, 'drink', 'coffee, milk cream'),

-- Tacos Toro
(@IdTacosToro, N'Tacos BÒ PHÔ MAI', N'Vỏ bánh giòn kẹp thịt bò bằm và phô mai kéo sợi', 53000, 'fastfood', 'tortilla, minced beef, cheese'),
(@IdTacosToro, N'Tacos GÀ PHÔ MAI', N'Gà xé sốt đặc trưng cùng lớp phô mai tan chảy', 53000, 'fastfood', 'tortilla, shredded chicken, cheese'),
(@IdTacosToro, N'Tacos Full Topping', N'Phiên bản đầy đủ nhất các loại nhân và phô mai', 68000, 'fastfood', 'tortilla, beef, chicken, seafood'),
(@IdTacosToro, N'Khoai tây', N'Topping khoai tây chiên giòn', 15000, 'snack', 'potato'),
(@IdTacosToro, N'Bò Bằm', N'Thêm phần bò bằm cho bánh', 17000, 'snack', 'beef'),

-- TIỆM TRÀ SOLI
(@IdTraSoli, N'Olong sữa chai 330ml', N'Trà Olong sữa thơm đậm trong chai tiện lợi', 48000, 'drink', 'oolong tea, milk'),
(@IdTraSoli, N'Olong nhài sữa chai 330ml', N'Sự kết hợp giữa hương nhài và cốt trà Olong sữa', 53000, 'drink', 'oolong tea, jasmine, milk'),
(@IdTraSoli, N'Olong sữa dừa chai 330ml', N'Vị béo ngậy của sữa dừa quyện cùng trà Olong', 53000, 'drink', 'oolong tea, coconut milk'),
(@IdTraSoli, N'Hạnh nhân nguyên lá chai 330ml', N'Trà nguyên lá ủ lạnh cùng vị hạnh nhân', 53000, 'drink', 'tea, almond'),

-- Bánh Mì Hà Nội
(@IdBanhMiHN, N'Hamboger bò', N'Bánh mì hamburger kẹp thịt bò và rau xà lách', 35667, 'fastfood', 'bread, beef, vegetable'),
(@IdBanhMiHN, N'Bánh Mì Cá Hộp', N'Bánh mì kẹp cá hộp sốt cà chua truyền thống', 27000, 'vietnamese', 'bread, canned fish'),
(@IdBanhMiHN, N'Bánh Bao Trứng Muối Vừa', N'Bánh bao nhân thịt bằm và trứng muối đậm đà', 29000, 'vietnamese', 'flour, pork, salted egg'),
(@IdBanhMiHN, N'Bông Lan Trứng Muối Nhỏ', N'Bánh bông lan mềm mịn kèm chà bông trứng muối', 17000, 'bakery', 'flour, egg, salted egg, pork floss'),

-- Bún Bò O Mỹ
(@IdBunBoOMy, N'Bún bò Nạm, Chả tiêu', N'Tô bún bò Huế chuẩn vị với nạm mềm và chả tiêu', 58000, 'vietnamese', 'rice noodle, beef flank, pork paste'),
(@IdBunBoOMy, N'Bún bò Giò heo', N'Giò heo hầm mềm béo ngậy trong nước dùng đậm đà', 69000, 'vietnamese', 'rice noodle, pork leg'),
(@IdBunBoOMy, N'Bún bò Tái', N'Bắp bò tươi tái nhúng trực tiếp vào nước dùng', 58000, 'vietnamese', 'rice noodle, rare beef'),
(@IdBunBoOMy, N'Bún bò Thập cẩm 1', N'Nạm, chả cây, bò viên và giò heo đầy đủ', 84000, 'vietnamese', 'rice noodle, beef, pork leg, meatball'),
(@IdBunBoOMy, N'Bún Gân bò', N'Gân bò hầm giòn sần sật', 58000, 'vietnamese', 'rice noodle, beef tendon'),

-- Thẻ MB Bank (Quà tặng/Combo)
(@IdMBBank, N'Hi ShopeeFood - Phiên bản Cơm Tấm', N'Thẻ MB phiên bản đặc biệt hình Cơm Tấm', 77000, 'other', 'card'),
(@IdMBBank, N'Hi ShopeeFood - Phiên bản Phở', N'Thẻ MB phiên bản đặc biệt hình Phở', 77000, 'other', 'card'),

-- T & T Coffee
(@IdTTCoffee, N'Cà Phê Muối', N'Cà phê kem muối béo mặn hot trend', 30000, 'drink', 'coffee, salt cream'),
(@IdTTCoffee, N'Đá me hạt đác', N'Nước me chua ngọt kết hợp hạt đác dẻo', 35000, 'drink', 'tamarind, palm seed'),
(@IdTTCoffee, N'Bạc Xỉu Kem Muối', N'Nhiều sữa ít cà phê kết hợp lớp kem muối', 30000, 'drink', 'coffee, milk, salt cream'),
(@IdTTCoffee, N'Đá Xay Matcha', N'Trà xanh đá xay mát lạnh cùng lớp kem tươi', 35000, 'drink', 'matcha, cream'),

-- Noara Milk Tea
(@IdNoara, N'Sữa tươi trân châu đường đen', N'Sữa tươi béo ngậy cùng trân châu đường đen dẻo ngọt', 44000, 'drink', 'milk, brown sugar pearl'),
(@IdNoara, N'Dương Chi Cam Lộ', N'Thức uống trái cây phong cách Hong Kong với xoài và bưởi', 55000, 'drink', 'mango, pomelo, milk'),
(@IdNoara, N'Trà xoài chanh dây', N'Sự kết hợp chua ngọt giữa xoài và chanh dây', 55000, 'drink', 'mango, passion fruit, tea'),
(@IdNoara, N'Cold Whisk Matcha', N'Matcha đánh lạnh giữ trọn hương vị trà xanh', 55000, 'drink', 'matcha'),

-- Bún Cá Quy Nhơn (Bổ sung)
(@IdBunCaQN, N'Bún chả cá Quy Nhơn', N'Chả cá chiên giòn đặc sản Bình Định', 45000, 'vietnamese', 'rice noodle, fish cake'),
(@IdBunCaQN, N'Bún cá dằm', N'Thịt cá ngừ/cá thu dằm tươi ngọt', 50000, 'vietnamese', 'rice noodle, fish'),
(@IdBunCaQN, N'Bún sứa Quy Nhơn', N'Sứa tươi giòn sần sật trong nước dùng thanh ngọt', 55000, 'vietnamese', 'rice noodle, jellyfish'),

-- Cơm Gà Xối Mỡ (Bổ sung)
(@IdComGa, N'Cơm gà xối mỡ đùi góc tư', N'Đùi gà chiên giòn cùng cơm chiên áp chảo', 55000, 'vietnamese', 'rice, chicken'),
(@IdComGa, N'Cơm gà xé', N'Cơm gà chiên ăn kèm gà xé phay', 45000, 'vietnamese', 'rice, shredded chicken'),
(@IdComGa, N'Canh rong biển thịt bằm', N'Canh rong biển nấu cùng thịt heo bằm', 15000, 'vietnamese', 'seaweed, pork');
GO

-- =============================================
-- BÌNH CHÁNH: CHÈN NHÀ HÀNG (RESTAURANTS)
-- =============================================
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Highlands Coffee - Số 1 Bình Chánh', N'Số 73 Đường Số 1, Ấp 2, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.728475, 106.6533418, 4.5, 50000, '07:00', '22:00', 'coffee'),
(N'Highlands Coffee - Central Mall Bình Chánh', N'Satra Phạm Hùng, C6/27 Phạm Hùng, Bình Chánh, TP. HCM', 10.733786968, 106.67437011, 4.5, 50000, '07:00', '22:00', 'coffee'),
(N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh', N'C13/36 Đinh Đức Thiện, Xã Bình Chánh, Bình Chánh, TP. HCM', 10.6619, 106.57457, 4.5, 35000, '08:00', '21:00', 'bakery'),
(N'Xôi Bình Tiên - Phạm Hùng', N'163 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.734971848, 106.672741437, 4.5, 30000, '06:00', '22:00', 'vietnamese'),
(N'Trà Sữa HongKong Baley - Trần Văn Giàu', N'Số 2880 Đường Trần Văn Giàu, X. Phạm Văn Hai, Bình Chánh, TP. HCM', 10.789146538, 106.515628388, 4.5, 30000, '08:00', '22:00', 'beverage'),
(N'Bún Bò Huế Cô Tuyết - Đường Số 10', N'Số 4 Đường Số 10, KDC Bình Hưng, Bình Chánh, TP. HCM', 10.7268842, 106.6527673, 4.5, 55000, '06:00', '21:00', 'vietnamese'),
(N'Đắc Hòa II - Heo Quay & Vịt Quay', N'F15/25R Hương Lộ 80, Ấp 6, Xã Vĩnh Lộc A, Bình Chánh, TP. HCM', 10.8119579, 106.5763687, 4.5, 44000, '06:00', '20:00', 'vietnamese'),
(N'Nem Nướng Nha Trang - Bếp Của Vân', N'A23/19N Quốc Lộ 50, X. Bình Hưng, Bình Chánh, TP. HCM', 10.7205815, 106.6558763, 4.5, 80000, '10:00', '21:00', 'vietnamese'),
(N'Bún Thịt Nướng Ngọc Liên', N'C3/15 Phạm Hùng, X. Bình Hưng, Bình Chánh, TP. HCM', 10.732555568, 106.674273353, 4.5, 35000, '06:30', '21:00', 'vietnamese'),
(N'Cơm Tấm A Tài - Cơm Sườn Mỡ', N'C3/14 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.7324793, 106.6742666, 4.5, 45000, '06:00', '21:00', 'vietnamese');
GO

-- =============================================
-- BÌNH CHÁNH: KHAI BÁO BIẾN ID
-- =============================================
DECLARE @IdHighlandsS1 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Số 1 Bình Chánh');
DECLARE @IdHighlandsMall INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Central Mall Bình Chánh');
DECLARE @IdBanhKem INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh');
DECLARE @IdXoiBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Xôi Bình Tiên - Phạm Hùng');
DECLARE @IdHongKong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa HongKong Baley - Trần Văn Giàu');
DECLARE @IdBunBo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò Huế Cô Tuyết - Đường Số 10');
DECLARE @IdHeoQuay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Đắc Hòa II - Heo Quay & Vịt Quay');
DECLARE @IdNemNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang - Bếp Của Vân');
DECLARE @IdBunThit INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Thịt Nướng Ngọc Liên');
DECLARE @IdComTam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm A Tài - Cơm Sườn Mỡ');

-- =============================================
-- BÌNH CHÁNH: CHÈN THỰC ĐƠN (MENUITEMS)
-- =============================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
-- Highlands Coffee Số 1
(@IdHighlandsS1, N'Trà Sen Vàng (Củ Năng)', N'Trà ô long kết hợp cùng sen và củ năng giòn', 49000, 'drink', 'oolong tea, lotus, water chestnut'),
(@IdHighlandsS1, N'Trà Thạch Đào', N'Trà sữa Highlands kết hợp thạch đào giòn tan', 49000, 'drink', 'tea, milk, peach jelly'),
(@IdHighlandsS1, N'PhinĐI Kem Sữa', N'Cà phê phin kết hợp lớp kem sữa béo ngậy', 49000, 'drink', 'coffee, milk cream'),
(@IdHighlandsS1, N'Bánh Mì Que Pate Highlands', N'Bánh mì que giòn nóng kẹp pate đặc trưng', 19000, 'snack', 'bread, pate'),
(@IdHighlandsS1, N'MatchaĐI Latte', N'Trà xanh Nhật Bản thơm béo', 59000, 'drink', 'matcha, milk'),

-- Highlands Coffee Central Mall
(@IdHighlandsMall, N'Trà Sữa Đài Loan', N'Trà sữa truyền thống đậm vị trà', 65000, 'drink', 'tea, milk'),
(@IdHighlandsMall, N'Trà Sữa Trà Xanh', N'Sự kết hợp giữa trà xanh và sữa', 65000, 'drink', 'matcha, milk'),
(@IdHighlandsMall, N'Trà Sữa Hojicha', N'Trà xanh rang thơm mùi khói đặc trưng', 65000, 'drink', 'hojicha, milk'),
(@IdHighlandsMall, N'Bánh Croissant Highlands', N'Bánh sừng bò thơm mùi bơ', 29000, 'snack', 'flour, butter'),

-- Tiệm Bánh Kem
(@IdBanhKem, N'Bánh su kem hộp', N'Vỏ bánh mềm, nhân kem béo tan chảy', 40000, 'bakery', 'flour, egg, cream'),
(@IdBanhKem, N'Bánh mì phô mai tan chảy', N'Bánh mì mềm nhân phô mai đậm đà', 38000, 'bakery', 'bread, cheese'),
(@IdBanhKem, N'Bánh crep sầu riêng', N'Vỏ bánh mỏng cuộn kem và sầu riêng tươi', 35000, 'bakery', 'flour, cream, durian'),
(@IdBanhKem, N'Bánh mì hoa cúc', N'Bánh mì thơm hương hoa cúc pháp', 32000, 'bakery', 'bread, egg'),
(@IdBanhKem, N'Bông lan trứng muối phô mai', N'Bánh bông lan nướng cùng trứng muối và phô mai', 55000, 'bakery', 'flour, egg, salted egg, cheese'),

-- Xôi Bình Tiên
(@IdXoiBT, N'Xôi đùi gà', N'Xôi dẻo ăn kèm đùi gà chiên giòn rụm', 30000, 'vietnamese', 'sticky rice, chicken'),
(@IdXoiBT, N'Xôi mặn', N'Thập cẩm lạp xưởng, chà bông và mỡ hành', 33000, 'vietnamese', 'sticky rice, sausage, pork floss'),
(@IdXoiBT, N'Xôi nếp than', N'Xôi nếp than ăn kèm đậu xanh bùi béo', 22000, 'vietnamese', 'black sticky rice, mung bean'),
(@IdXoiBT, N'Xôi ca dé', N'Vị ngọt béo đặc trưng từ trứng và cốt dừa', 22000, 'vietnamese', 'sticky rice, egg, coconut milk'),
(@IdXoiBT, N'Bánh ướt', N'Bánh ướt mỏng ăn kèm chả và hành phi', 25000, 'vietnamese', 'rice paper, pork sausage'),

-- Trà Sữa HongKong Baley
(@IdHongKong, N'Trà Sữa Khoai Môn Tươi', N'Vị khoai môn tự nhiên bùi béo', 33000, 'drink', 'taro, milk, tea'),
(@IdHongKong, N'Matcha Latte', N'Trà xanh Nhật Bản quyện cùng sữa tươi', 30000, 'drink', 'matcha, milk'),
(@IdHongKong, N'Trà Sữa HongKong Baley', N'Trà sữa đặc sản của quán', 23000, 'drink', 'tea, milk'),
(@IdHongKong, N'Trà Oolong Sữa', N'Cốt trà oolong đậm vị sữa béo', 25000, 'drink', 'oolong tea, milk'),
(@IdHongKong, N'Trà Sữa Choco - Phô Mai', N'Sự kết hợp giữa socola và phô mai', 28000, 'drink', 'chocolate, cheese, tea'),

-- Bún Bò Huế Cô Tuyết
(@IdBunBo, N'Bún bò đầy đủ sườn sụn', N'Nước dùng đậm đà với sườn sụn giòn sần sật', 70000, 'vietnamese', 'noodle, beef, pork rib'),
(@IdBunBo, N'Bún thập cẩm không giò', N'Tái, nạm, gân và các loại chả', 55000, 'vietnamese', 'noodle, beef, pork paste'),
(@IdBunBo, N'Bún bò đặc biệt giò heo', N'Phiên bản đầy đủ nhất kèm giò heo béo ngậy', 85000, 'vietnamese', 'noodle, beef, pork leg'),
(@IdBunBo, N'Bún bò tái + nạm', N'Thịt bò tái mềm và nạm bò béo bùi', 55000, 'vietnamese', 'noodle, beef'),

-- Đắc Hòa II
(@IdHeoQuay, N'Vịt quay', N'Vịt quay da giòn, thịt mềm thơm mùi thảo mộc', 440000, 'vietnamese', 'duck, spices'),
(@IdHeoQuay, N'Heo Quay', N'Thịt heo quay giòn tan lớp da', 440000, 'vietnamese', 'pork'),
(@IdHeoQuay, N'Xá xíu', N'Thịt xá xíu đậm đà kiểu Hoa', 230000, 'vietnamese', 'pork, bbq sauce'),
(@IdHeoQuay, N'Lạp vịt', N'Đặc sản lạp vịt phơi khô', 440000, 'vietnamese', 'duck'),

-- Nem Nướng Bếp Của Vân
(@IdNemNuong, N'Set Nem Nướng 1 Người', N'Đầy đủ nem, rau sống và nước chấm', 80000, 'vietnamese', 'pork, vegetable, rice paper'),
(@IdNemNuong, N'Set Nem Nướng 2 Người', N'Combo tiết kiệm cho 2 người ăn', 160000, 'vietnamese', 'pork, vegetable'),
(@IdNemNuong, N'Set Nem Phên 1 Người', N'Nem nướng dạng phên độc đáo', 70000, 'vietnamese', 'pork'),
(@IdNemNuong, N'Set Nem Lụi 1 Người', N'Nem lụi nướng sả thơm lừng', 80000, 'vietnamese', 'pork, lemongrass'),

-- Bún Thịt Nướng Ngọc Liên
(@IdBunThit, N'Bún thịt nướng + nem', N'Thịt nướng xém cạnh kèm nem nướng vàng', 28500, 'vietnamese', 'noodle, pork'),
(@IdBunThit, N'Bún thịt nướng + chả giò', N'Sự kết hợp giữa thịt nướng và chả giò giòn', 28500, 'vietnamese', 'noodle, pork, spring roll'),
(@IdBunThit, N'Bún chả giò', N'Phần bún thanh đạm với chả giò chiên', 28500, 'vietnamese', 'noodle, spring roll'),
(@IdBunThit, N'Bún thịt nướng đặc biệt', N'Phiên bản đầy đủ thịt, nem và chả giò', 35000, 'vietnamese', 'noodle, pork, spring roll, nem'),

-- Cơm Tấm A Tài
(@IdComTam, N'Cơm sườn', N'Sườn nướng mật ong đậm đà', 42750, 'vietnamese', 'rice, pork chop'),
(@IdComTam, N'Cơm chả trứng', N'Cơm tấm ăn kèm chả trứng hấp béo bùi', 33250, 'vietnamese', 'rice, egg meatloaf'),
(@IdComTam, N'Cơm bì chả', N'Combo bì heo trộn thính và chả trứng', 38000, 'vietnamese', 'rice, pork skin, meatloaf'),
(@IdComTam, N'Cơm sườn - bì - chả', N'Phần cơm tấm đầy đủ truyền thống', 59000, 'vietnamese', 'rice, pork, skin, meatloaf'),
(@IdComTam, N'Cơm đùi gà lớn', N'Đùi gà chiên mắm thơm nức mũi', 52250, 'vietnamese', 'rice, chicken');
GO
