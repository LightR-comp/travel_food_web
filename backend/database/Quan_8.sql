USE travel_food_db
GO

-- ==========================================
-- QUẬN 8
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Texas Chicken - PARC  Mall Quận 8', N'Lô Số L3-06, Tầng 3, Thuộc Khối B1, B2, B3, B4, B5, TTTM Parc Mall, 547 - 549 Tạ Quang Bửu, P.4, Quận 8, TP. HCM', 10.740447, 106.678734, 4.3, 100000, '09:00', '22:00', N'fastfood, gia đình'),
(N'Matcha Khum? Phố Tây Quận 8', N'Căn 01.11 Shophouse Pegasuite 1, 1002 Tạ Quang Bửu, P. 6, Quận 8, TP. HCM', 10.734251, 106.653306, 4.8, 60000, '08:00', '22:30', N'cafe, bình dân'),
(N'Ăn Vặt Mỡ Mỡ - Quận 8', N'125/107/54/15 Tám Danh, P. 4, Quận 8, TP. HCM', 10.740796, 106.672972, 4.2, 80000, '09:00', '22:00', N'asian, bình dân'),
(N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - Liên Tỉnh 5 Quận 8', N'200 Liên Tỉnh 5, P. 5, Quận 8, TP. HCM', 10.736804, 106.656057, 4.6, 50000, '08:30', '21:30', N'fastfood, bình dân'),
(N'Mì Trộn Tóp Mỡ & Sa Tế Tôm Hồng Kông - LAI GIA - Quận 8', N'Số 4 Lô 18 Lưu Quý Kỳ, P. 10, Quận 8, TP. HCM', 10.746706, 106.666530, 4.1, 60000, '07:00', '22:00', N'asian, bình dân'),
(N'Hello Linh Quận 8 - Bánh Tráng Mỡ Hành - 46 Đinh Hoà', N'46 Đường Đinh Hòa, P. 13, Quận 8, TP. HCM', 10.747021, 106.659732, 4.7, 40000, '10:00', '22:30', N'asian, bình dân'),
(N'ĂN VẶT TÁ LẢ - QUẬN 8', N'19 Tuy Lý Vương, P. 12, Quận 8, TP. HCM', 10.744100, 106.655510, 4.3, 30000, '15:00', '23:30', N'asian, bình dân'),
(N'Mì Cay Seoul - Quận 8', N'90 Dương Quang Đông, P. 5, Quận 8, TP. HCM', 10.736661, 106.667198, 4.9, 70000, '09:00', '22:00', N'korean, bình dân'),
(N'Bún Đậu Em Thuỷ - Các Món Ăn Hà Nội - Quận 8', N'959 Tạ Quang Bửu, P. 6, Quận 8, TP. HCM', 10.733980, 106.655438, 4.2, 55000, '10:00', '22:00', N'vietnamese, bình dân'),
(N'Đậu Hũ Co Vang Quận 8', N'198 Đặng Thúc Liêng, P. 4, Quận 8, TP. HCM', 10.741569, 106.669611, 4.6, 25000, '07:00', '22:00', N'dessert, bình dân'),
(N'Sâm Chill Me - Bông Sao Quận 8', N'112 Bông Sao, P. 5, Quận 8, TP. HCM', 10.739289, 106.662167, 4.8, 35000, '08:00', '22:00', N'cafe, bình dân'),
(N'Hồng Trà Sữa Ba Cô Gái Tam Hảo - 421 Liên Tỉnh 5, Quận 8', N'421 Liên Tỉnh 5 (Quốc Lộ 50), P. 5, Quận 8, TP. HCM', 10.732446, 106.656192, 4.2, 25000, '08:00', '22:30', N'cafe, bình dân'),
(N'Bánh Tráng Hằng Quận 8 (Chi Nhánh 1)', N'142 Tạ Quang Bửu, P. 3, Quận 8, TP. HCM', 10.743061, 106.682865, 4.9, 30000, '09:00', '22:00', N'asian, bình dân'),
(N'Nước Sâm Bưu Điện Quận 8', N'426 Tùng Thiện Vương, P. 12, Quận 8, TP. HCM', 10.744596, 106.656271, 4.1, 15000, '07:00', '23:00', N'cafe, bình dân'),
(N'ZINC CORNER - Trà Sữa, Ăn Vặt & Gà Tokbokki - Quận 8', N'1106/8 Phạm Thế Hiển, P. 5, Quận 8, TP. HCM', 10.743129, 106.666261, 4.7, 75000, '10:00', '22:00', N'korean, bình dân'),
(N'Cơm Thố Anh Nguyễn - Dương Bá Trạc (Quận 8)', N'28/66 Dương Bá Trạc, P. 2, Quận 8, TP. HCM', 10.749971, 106.686912, 4.2, 65000, '09:00', '21:30', N'vietnamese, bình dân'),
(N'Cát Cát House - Kem Ý Gelato, Bánh Trứng Gà Non & Trà Trái Cây - Quận 8', N'41 Trần Thị Nơi, P. 4, Quận 8, TP. HCM', 10.739642, 106.677014, 4.8, 35000, '08:00', '22:30', N'dessert, bình dân'),
(N'A DUY FOOD - Gà Quay Sườn Quay Cơm Lam - Quận 8', N'1670 Phạm Thế Hiển, P. 6, Quận 8, TP. HCM', 10.739362, 106.653500, 4.3, 200000, '09:00', '22:00', N'vietnamese, gia đình');
GO

DECLARE @IdTexas INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Texas Chicken - PARC  Mall Quận 8');
DECLARE @IdMatchaKhum INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Matcha Khum? Phố Tây Quận 8');
DECLARE @IdAnVatMoMo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Mỡ Mỡ - Quận 8');
DECLARE @IdJimama INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - Liên Tỉnh 5 Quận 8');
DECLARE @IdLaiGia INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn Tóp Mỡ & Sa Tế Tôm Hồng Kông - LAI GIA - Quận 8');
DECLARE @IdHelloLinh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hello Linh Quận 8 - Bánh Tráng Mỡ Hành - 46 Đinh Hoà');
DECLARE @IdTaLa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'ĂN VẶT TÁ LẢ - QUẬN 8');
DECLARE @IdSeoul INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Seoul - Quận 8');
DECLARE @IdEmThuy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Đậu Em Thuỷ - Các Món Ăn Hà Nội - Quận 8');
DECLARE @IdCoVang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Đậu Hũ Co Vang Quận 8');
DECLARE @IdChillMeBS INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sâm Chill Me - Bông Sao Quận 8');
DECLARE @IdBaCoGai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hồng Trà Sữa Ba Cô Gái Tam Hảo - 421 Liên Tỉnh 5, Quận 8');
DECLARE @IdBanhTrangHang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Hằng Quận 8 (Chi Nhánh 1)');
DECLARE @IdSamBuuDien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nước Sâm Bưu Điện Quận 8');
DECLARE @IdZincCorner INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'ZINC CORNER - Trà Sữa, Ăn Vặt & Gà Tokbokki - Quận 8');
DECLARE @IdAnhNguyen INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Thố Anh Nguyễn - Dương Bá Trạc (Quận 8)');
DECLARE @IdCatCat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cát Cát House - Kem Ý Gelato, Bánh Trứng Gà Non & Trà Trái Cây - Quận 8');
DECLARE @IdADuy8 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'A DUY FOOD - Gà Quay Sườn Quay Cơm Lam - Quận 8');

-- ==========================================
-- CHÈN MENU (Lấy ngẫu nhiên 4 món)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdTexas, N'Khoai tây chiên phô mai', N'Khoai tây chiên phô mai, 1 Tương ớt + 1 tương cà', 49000, 'fastfood', 'french fries,cheese'),
(@IdTexas, N'Khoai tây chiên - Cỡ lớn', N'Khoai tây chiên - cỡ lớn, 1 Tương ớt + 1 tương cà', 45000, 'fastfood', 'french fries'),
(@IdTexas, N'05 bánh quy bơ mật ong', N'', 49000, 'bakery', 'honey butter biscuit'),
(@IdTexas, N'Combo 1 miếng Gà sốt bơ tỏi & thảo mộc', N'1 Miếng gà sốt bơ tỏi và thảo mộc, khoai tây, nước ngọt', 79000, 'fastfood', 'fried chicken,garlic butter,herbs'),

(@IdMatchaKhum, N'Matcha latte Premium', N'Matcha Nhật Premium + sữa tươi + sữa đặc', 133178, 'cafe', 'matcha,milk'),
(@IdMatchaKhum, N'Matcha Coco Cloud', N'Nước dừa + nước đường + kem matcha + vụn dừa + hạt nổ củ năng', 48000, 'cafe', 'matcha,coconut,water chestnut'),
(@IdMatchaKhum, N'Matcha Earl Grey ( Matcha Trà Bá Tước )', N'sữa đặc + sữa tươi + matcha nhật+ sốt trà bá tước', 52000, 'cafe', 'matcha,milk,earl grey tea'),
(@IdMatchaKhum, N'Dâu Mộng Mơ', N'Matcha - sữa đặc - sữa tươi - sốt dâu - kem cheese - vụn dâu sấy giòn', 76000, 'cafe', 'matcha,milk,strawberry,cream cheese'),

(@IdAnVatMoMo, N'Khô Gà Lá Chanh 300g', N'Khô Gà Lá Chanh Mỡ Mỡ - Thơm Ngon, Đậm Đà', 94000, 'snack', 'dried chicken,lemon leaves'),
(@IdAnVatMoMo, N'Cơm Cháy Chà Bông Tiến Vua 180g', N'1 túi cơm cháy giòn, chà bông thơm ngon, gia vị đậm đà.', 54000, 'snack', 'scorched rice,pork floss'),
(@IdAnVatMoMo, N'Da Cá Trứng Muối 250g', N'Da Cá Trứng Muối Mỡ Mỡ - Giòn Rụm', 99000, 'snack', 'fish skin,salted egg'),
(@IdAnVatMoMo, N'Khô Heo Cháy Tỏi 300g', N'Khô heo chất lượng cao, tẩm ướp tỏi cháy thơm lừng', 94000, 'snack', 'dried pork,garlic'),

(@IdJimama, N'Combo Mỳ Ý Đùi Gà Giòn', N'1 Mỳ ý sốt cà chua + 1 Đùi gà chiên giòn + 1 Nước ngọt', 59000, 'italian', 'spaghetti,tomato sauce,fried chicken'),
(@IdJimama, N'Mỳ Ý Lạp Xưởng', N'Mỳ ý mềm dai, sốt cà đậm đà, lạp xưởng đặc biệt', 42800, 'italian', 'spaghetti,tomato sauce,sausage'),
(@IdJimama, N'Cơm Đùi Gà Sốt', N'Cơm nóng, gà giòn, sốt đậm đà vị Jimama', 52800, 'asian', 'rice,fried chicken,sauce'),
(@IdJimama, N'Cơm tôm chiên Tempura (New)', N'', 59000, 'asian', 'rice,tempura shrimp'),

(@IdLaiGia, N'Hủ Tiếu Trộn Xá Xíu Bò Viên', N'Xá xíu, bò viên, đậu hủ, da heo', 55800, 'asian', 'rice noodles,char siu,beef balls'),
(@IdLaiGia, N'Hủ Tiếu Trộn Hải Sản', N'Tôm, mực tàu, thanh cua, cua viên', 56700, 'asian', 'rice noodles,shrimp,squid,crab stick'),
(@IdLaiGia, N'Mì Tươi Trộn Đặc Biệt', N'Xương, xá xíu, tôm ,mực tàu, bò viên, đậu hủ, da heo', 64800, 'asian', 'egg noodles,char siu,shrimp,beef balls'),
(@IdLaiGia, N'Mì Tươi Trộn Gà Nướng BBQ+Xá xíu', N'Má đùi gà, 3 miếng xá xíu', 57600, 'asian', 'egg noodles,grilled chicken,char siu'),

(@IdHelloLinh, N'Bánh Tráng Chấm Ớt Rim', N'', 28000, 'snack', 'rice paper,chili'),
(@IdHelloLinh, N'Combo 5 bịch 5 vị trộn sẵn', N'mỡ hành , muối tắc , bơ tỏi , bơ mỡ hành , sate tỏi', 140000, 'snack', 'rice paper,mixed flavors'),
(@IdHelloLinh, N'Bánh tráng muối tắc tỏi', N'', 28000, 'snack', 'rice paper,kumquat,salt,garlic'),
(@IdHelloLinh, N'Bánh tráng bơ mỡ hành', N'', 28000, 'snack', 'rice paper,butter,scallion oil'),

(@IdTaLa, N'Hột vịt lộn', N'', 11000, 'vietnamese', 'balut'),
(@IdTaLa, N'Cút lộn xào me', N'10 trứng', 30000, 'vietnamese', 'quail egg,tamarind sauce'),
(@IdTaLa, N'ca viên chiên nước mắm', N'xiên que nhặt gẫu nhiên', 50000, 'snack', 'fish balls,fish sauce'),
(@IdTaLa, N'Khô mực chiên nước mắm 1  phần', N'Phần nhỡ', 110000, 'snack', 'dried squid,fish sauce'),

(@IdSeoul, N'Mì Kim Chi Bò Mỹ', N'', 70000, 'korean', 'noodles,kimchi,beef'),
(@IdSeoul, N'Mì Kim Chi Hải Sản', N'', 70000, 'korean', 'noodles,kimchi,seafood'),
(@IdSeoul, N'Bibimbap Bò', N'', 75000, 'korean', 'rice,beef,vegetables,egg'),
(@IdSeoul, N'Gà cay phô mai', N'', 74000, 'korean', 'chicken,cheese,spicy sauce'),

(@IdEmThuy, N'Bún đậu thịt', N'bún lá + 10 viên đậu hũ chiên + 5 lát thịt bắp heo + rau dưa leo + mắm đường tắc ớt', 45000, 'vietnamese', 'rice noodles,tofu,pork'),
(@IdEmThuy, N'Bún Đậu Chả Cốm', N'Bún lá + đậu hũ chiên + 2 chả cốm + rau dưa leo + mắm tắt đường ớt', 45000, 'vietnamese', 'rice noodles,tofu,green rice pork sausage'),
(@IdEmThuy, N'Mẹt cơ bản', N'Bún lá + 9 viên đậu + 3 lát thịt bắp heo + 1 chả cốm+ rau dưa leo', 45000, 'vietnamese', 'rice noodles,tofu,pork,green rice pork sausage'),
(@IdEmThuy, N'Bún Đậu Nem Chua Rán', N'Bún lá + đậu hũ chiên + 2 nem chua rán + rau dưa leo', 45000, 'vietnamese', 'rice noodles,tofu,fried fermented pork roll'),

(@IdCoVang, N'Đậu Hũ Co Vang - 5 hộp', N'', 97000, 'dessert', 'tofu pudding'),
(@IdCoVang, N'Cà Phê Sữa Đá Pha Máy', N'Cà Phê Rang Xay Nguyên Chất', 18900, 'cafe', 'coffee,milk,ice'),
(@IdCoVang, N'Trà Vải Ly Lớn', N'', 27000, 'beverage', 'lychee tea'),
(@IdCoVang, N'Cam Vắt Ly Lớn', N'Cam tươi', 16733, 'beverage', 'orange juice'),

(@IdChillMeBS, N'5 Ly Sâm Táo Bát Bảo - Size L', N'Cốt Sâm Táo, Táo Đỏ lát, Sương Sáo, Rong Sụn, Hạt Chia...', 200000, 'beverage', 'herbal drink,jujube'),
(@IdChillMeBS, N'Sâm Táo Bát Bảo', N'Sâm Táo Đỏ là thức uống thảo mộc', 30400, 'beverage', 'herbal drink,jujube,chia seed'),
(@IdChillMeBS, N'Sâm Táo Dừa Nước', N'Cốt Sâm Táo, Táo Đỏ lát, Sương Sáo, Rong Sụn, Hạt Chia và Cơm Dừa Nước', 26400, 'beverage', 'herbal drink,jujube,palm seed'),
(@IdChillMeBS, N'Me Đác Mê Mẫn', N'Mật Me, Hạt Đác, Hạt Me Rim và Đậu Phộng rang.', 26400, 'beverage', 'tamarind juice,palm seed'),

(@IdBaCoGai, N'Hồng Trà Sữa Đặc Biệt L', N'Hồng trà sữa thơm đậm vị trà kết hợp với vị sữa thanh béo', 24000, 'beverage', 'black tea,milk'),
(@IdBaCoGai, N'Hồng Trà Nhãn Nhục', N'Giảm lo âu, an thần, bồi bổ khí huyết', 22000, 'beverage', 'black tea,longan'),
(@IdBaCoGai, N'Lục Trà Mãng Cầu', N'Kết hợp cùng MÃNG CẦU TƯƠI Thơm thanh vị chua chua ngọt ngọt', 20000, 'beverage', 'green tea,soursop'),
(@IdBaCoGai, N'Hồng Trà Bí Đao', N'Hồng trà thơm đậm hòa quyện cùng bí đao giải nhiệt', 15000, 'beverage', 'black tea,winter melon'),

(@IdBanhTrangHang, N'Bánh Tráng Dẻo ( Đầy Đủ )', N'(Tóp Mỡ Muối Nhuyễn Mỡ Hành Sate Tỏi Giòn)', 35000, 'snack', 'rice paper,pork crackling,scallion oil'),
(@IdBanhTrangHang, N'Bánh Tráng Dẻo (Không Tóp Mỡ)', N'(Muối Nhuyễn Mỡ Hành Sate Tỏi Giòn)', 28000, 'snack', 'rice paper,scallion oil,garlic'),
(@IdBanhTrangHang, N'5 Trứng Cút', N'', 10000, 'snack', 'quail egg'),
(@IdBanhTrangHang, N'Hủ Muối Nhuyễn', N'', 28000, 'snack', 'salt'),

(@IdSamBuuDien, N'Sâm lạnh', N'1 chai', 10000, 'beverage', 'herbal drink'),
(@IdSamBuuDien, N'Bông cúc', N'1 chai', 10000, 'beverage', 'chrysanthemum tea'),
(@IdSamBuuDien, N'Rau má', N'1 chai', 10000, 'beverage', 'pennywort juice'),
(@IdSamBuuDien, N'Nước đắng', N'1 chai', 10000, 'beverage', 'bitter herbal drink'),

(@IdZincCorner, N'Cánh Gà Chiên Giòn', N'1 cánh 130gr', 44622, 'fastfood', 'fried chicken wing'),
(@IdZincCorner, N'Tokbokki Gà Sốt Chua Ngọt', N'Gà không xương sốt bằng vị nước sốt chua ngọt bí quyết của ZINC.', 95000, 'korean', 'tteokbokki,chicken,sweet and sour sauce'),
(@IdZincCorner, N'Chả Cá Tokbokki Sốt Mật Ong', N'Sốt mật ong (hơi lỏng) bí quyết của Zinc ăn cùng 2 miếng chả cá', 75000, 'korean', 'tteokbokki,fish cake,honey sauce'),
(@IdZincCorner, N'Tobokki Nhân Phô Mai Lắc Phô Mai', N'14v/1 phần. Tok phô mai được chiên giòn, lắc với bột phô mai', 65000, 'korean', 'tteokbokki,cheese'),

(@IdAnhNguyen, N'Cơm Thố Gà + Xá Xíu', N'Phần ăn đi kèm: Canh cải/canh củ theo ngày và Kim chi muối.', 66300, 'vietnamese', 'rice,chicken,char siu'),
(@IdAnhNguyen, N'Cơm Thố Xá Xíu', N'', 63950, 'vietnamese', 'rice,char siu'),
(@IdAnhNguyen, N'Combo Cơm Thố Hot 88k', N'Combo Thố Xá Xíu & Thố Ốp la.', 111750, 'vietnamese', 'rice,char siu,fried egg'),
(@IdAnhNguyen, N'Combo Cơm Thố Gà + Cơm Thố Bò', N'01 Cơm Thố Gà 01 Cơm Thố Bò', 125850, 'vietnamese', 'rice,chicken,beef'),

(@IdCatCat, N'Bánh trứng gà non nguyên vị', N'Ko nhân', 16000, 'dessert', 'egg waffle'),
(@IdCatCat, N'Bánh trứng nguyên vị + Kem Ý Gelato', N'1 Bánh nguyên vị không nhân + 1 hộp kem Ý Gelato 95ml', 31500, 'dessert', 'egg waffle,gelato'),
(@IdCatCat, N'Bánh trứng tam bảo & Kem Ý Gelato', N'1 bánh bao gồm 3 vị + 1 hộp kem Ý Gelato', 38700, 'dessert', 'egg waffle,gelato'),
(@IdCatCat, N'Bánh Trứng Tứ Sắc + Trà Sữa', N'1 bánh 4/5 vị + 1 trà sữa truyền thống 700ml', 44100, 'dessert', 'egg waffle,milk tea'),

(@IdADuy8, N'Combo gà quay', N'', 249000, 'vietnamese', 'roasted chicken'),
(@IdADuy8, N'COMBO VỊT QUAY DA GIÒN nguyên con', N'', 409000, 'vietnamese', 'roasted duck'),
(@IdADuy8, N'Sườn không', N'', 219000, 'vietnamese', 'roasted pork ribs'),
(@IdADuy8, N'Xuxoa ( thạch rau đông)', N'', 35000, 'dessert', 'jelly');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdTexas, 'https://down-zl-vn.img.susercontent.com/vn-11134259-7r98o-lybsrrkmxljh51@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdMatchaKhum, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ras8-mctcf2jgb35916@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdAnVatMoMo, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lzkfktm6fwp902@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdJimama, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mlrgsls5x79cb7@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdLaiGia, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsvf5wirbkplc3@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdHelloLinh, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ra0g-m74xxapt183cf4@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTaLa, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsv4ckvzi3dlce@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdSeoul, 'https://down-zl-vn.img.susercontent.com/vn-11134259-81ztc-mmbol2fmh3woff@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdEmThuy, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mgzbipikb1fu8b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdCoVang, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lua92040b5ld6b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChillMeBS, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-miy14agwguthee@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBaCoGai, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mo87aogez1fofb@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhTrangHang, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mmt4xewbda8366@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdSamBuuDien, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsu35fzxdjgk57@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdZincCorner, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lz9k4mieioip53@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdAnhNguyen, 'https://down-zl-vn.img.susercontent.com/vn-11134259-7ra0g-m99qzuhk8bd309@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdCatCat, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ras8-m5whs7njgqgz95@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdADuy8, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lu6n6lbgxu737f@resize_ss280x175!@crop_w280_h175_cT', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Texas Chicken
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lzm4cggy8y8d21' FROM MenuItems WHERE restaurant_id = @IdTexas AND name = N'Khoai tây chiên phô mai' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqvve8mz6vmh17' FROM MenuItems WHERE restaurant_id = @IdTexas AND name = N'Khoai tây chiên - Cỡ lớn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqxdde5o98rdfe' FROM MenuItems WHERE restaurant_id = @IdTexas AND name = N'05 bánh quy bơ mật ong' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjghz5h4luyuda' FROM MenuItems WHERE restaurant_id = @IdTexas AND name = N'Combo 1 miếng Gà sốt bơ tỏi & thảo mộc' UNION ALL

-- Matcha Khum?
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9dtn5slayr283' FROM MenuItems WHERE restaurant_id = @IdMatchaKhum AND name = N'Matcha latte Premium' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj54ddhsdatd89' FROM MenuItems WHERE restaurant_id = @IdMatchaKhum AND name = N'Matcha Coco Cloud' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm8nmduvi9kzab' FROM MenuItems WHERE restaurant_id = @IdMatchaKhum AND name = N'Matcha Earl Grey ( Matcha Trà Bá Tước )' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmfoitx7zd3cf4' FROM MenuItems WHERE restaurant_id = @IdMatchaKhum AND name = N'Dâu Mộng Mơ' UNION ALL

-- Ăn Vặt Mỡ Mỡ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m15fp5hc71bv7f' FROM MenuItems WHERE restaurant_id = @IdAnVatMoMo AND name = N'Khô Gà Lá Chanh 300g' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m2b7h6on4ywk25' FROM MenuItems WHERE restaurant_id = @IdAnVatMoMo AND name = N'Cơm Cháy Chà Bông Tiến Vua 180g' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m15gwqdge0zefe' FROM MenuItems WHERE restaurant_id = @IdAnVatMoMo AND name = N'Da Cá Trứng Muối 250g' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m15igy3auflm4d' FROM MenuItems WHERE restaurant_id = @IdAnVatMoMo AND name = N'Khô Heo Cháy Tỏi 300g' UNION ALL

-- Jimama
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-midxnzzfbkle23' FROM MenuItems WHERE restaurant_id = @IdJimama AND name = N'Combo Mỳ Ý Đùi Gà Giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-midxoen8ejuoee' FROM MenuItems WHERE restaurant_id = @IdJimama AND name = N'Mỳ Ý Lạp Xưởng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-midxoqtpe5fn5a' FROM MenuItems WHERE restaurant_id = @IdJimama AND name = N'Cơm Đùi Gà Sốt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjb5ucofz2ti90' FROM MenuItems WHERE restaurant_id = @IdJimama AND name = N'Cơm tôm chiên Tempura (New)' UNION ALL

-- Lai Gia
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhta71gempdt14' FROM MenuItems WHERE restaurant_id = @IdLaiGia AND name = N'Hủ Tiếu Trộn Xá Xíu Bò Viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhvuxmo0guthbd' FROM MenuItems WHERE restaurant_id = @IdLaiGia AND name = N'Hủ Tiếu Trộn Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhu1rv6uapz951' FROM MenuItems WHERE restaurant_id = @IdLaiGia AND name = N'Mì Tươi Trộn Đặc Biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhvuvf7cwpaed3' FROM MenuItems WHERE restaurant_id = @IdLaiGia AND name = N'Mì Tươi Trộn Gà Nướng BBQ+Xá xíu' UNION ALL

-- Hello Linh
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mo8k8swcsdmo5a' FROM MenuItems WHERE restaurant_id = @IdHelloLinh AND name = N'Bánh Tráng Chấm Ớt Rim' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbvaxg6qyi5mfd' FROM MenuItems WHERE restaurant_id = @IdHelloLinh AND name = N'Combo 5 bịch 5 vị trộn sẵn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m6z36tgt8pjs0d' FROM MenuItems WHERE restaurant_id = @IdHelloLinh AND name = N'Bánh tráng muối tắc tỏi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m6z3bw1y1q2gd0' FROM MenuItems WHERE restaurant_id = @IdHelloLinh AND name = N'Bánh tráng bơ mỡ hành' UNION ALL

-- Tá Lả
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr60kqw17dfo1d' FROM MenuItems WHERE restaurant_id = @IdTaLa AND name = N'Hột vịt lộn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqy5vtt9zee143' FROM MenuItems WHERE restaurant_id = @IdTaLa AND name = N'Cút lộn xào me' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr3c4z59s0xw9f' FROM MenuItems WHERE restaurant_id = @IdTaLa AND name = N'ca viên chiên nước mắm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqy7ovv8o4gp75' FROM MenuItems WHERE restaurant_id = @IdTaLa AND name = N'Khô mực chiên nước mắm 1  phần' UNION ALL

-- Seoul
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbnshx015vz29' FROM MenuItems WHERE restaurant_id = @IdSeoul AND name = N'Mì Kim Chi Bò Mỹ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbns1c1nchv1e' FROM MenuItems WHERE restaurant_id = @IdSeoul AND name = N'Mì Kim Chi Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbnvnwh3q4h40' FROM MenuItems WHERE restaurant_id = @IdSeoul AND name = N'Bibimbap Bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbnwhxot4hxcc' FROM MenuItems WHERE restaurant_id = @IdSeoul AND name = N'Gà cay phô mai' UNION ALL

-- Em Thuỷ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm31ic3xtn9d64' FROM MenuItems WHERE restaurant_id = @IdEmThuy AND name = N'Bún đậu thịt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm30jv5kn9jj6c' FROM MenuItems WHERE restaurant_id = @IdEmThuy AND name = N'Bún Đậu Chả Cốm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm31gy3pzhfkec' FROM MenuItems WHERE restaurant_id = @IdEmThuy AND name = N'Mẹt cơ bản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm30jv5kn9jj6c' FROM MenuItems WHERE restaurant_id = @IdEmThuy AND name = N'Bún Đậu Nem Chua Rán' UNION ALL

-- Cô Vang
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lw55ilxpeifvde' FROM MenuItems WHERE restaurant_id = @IdCoVang AND name = N'Đậu Hũ Co Vang - 5 hộp' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lw55ldf7teqhbc' FROM MenuItems WHERE restaurant_id = @IdCoVang AND name = N'Cà Phê Sữa Đá Pha Máy' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lw55qvak997d7c' FROM MenuItems WHERE restaurant_id = @IdCoVang AND name = N'Trà Vải Ly Lớn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lw4dzhg1hasb08' FROM MenuItems WHERE restaurant_id = @IdCoVang AND name = N'Cam Vắt Ly Lớn' UNION ALL

-- Sâm Chill Me BS
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1ypdmspm3338' FROM MenuItems WHERE restaurant_id = @IdChillMeBS AND name = N'5 Ly Sâm Táo Bát Bảo - Size L' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1ypdmspm3338' FROM MenuItems WHERE restaurant_id = @IdChillMeBS AND name = N'Sâm Táo Bát Bảo' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1ypdnfjdvzc0' FROM MenuItems WHERE restaurant_id = @IdChillMeBS AND name = N'Sâm Táo Dừa Nước' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1ypdnf2hhc26' FROM MenuItems WHERE restaurant_id = @IdChillMeBS AND name = N'Me Đác Mê Mẫn' UNION ALL

-- Ba Cô Gái
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-ml7ol6hhrsw02c' FROM MenuItems WHERE restaurant_id = @IdBaCoGai AND name = N'Hồng Trà Sữa Đặc Biệt L' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mluxt2xl38qr81' FROM MenuItems WHERE restaurant_id = @IdBaCoGai AND name = N'Hồng Trà Nhãn Nhục' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mkmh3lsw19ty3c' FROM MenuItems WHERE restaurant_id = @IdBaCoGai AND name = N'Lục Trà Mãng Cầu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mk4t7vyjdi4gb3' FROM MenuItems WHERE restaurant_id = @IdBaCoGai AND name = N'Hồng Trà Bí Đao' UNION ALL

-- Bánh Tráng Hằng
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmt6aoufabk628' FROM MenuItems WHERE restaurant_id = @IdBanhTrangHang AND name = N'Bánh Tráng Dẻo ( Đầy Đủ )' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmt6aoufd4p275' FROM MenuItems WHERE restaurant_id = @IdBanhTrangHang AND name = N'Bánh Tráng Dẻo (Không Tóp Mỡ)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmt7ba74x88zbd' FROM MenuItems WHERE restaurant_id = @IdBanhTrangHang AND name = N'5 Trứng Cút' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmt7ba7501dvbe' FROM MenuItems WHERE restaurant_id = @IdBanhTrangHang AND name = N'Hủ Muối Nhuyễn' UNION ALL

-- Sâm Bưu Điện
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6m984x1b7qb6' FROM MenuItems WHERE restaurant_id = @IdSamBuuDien AND name = N'Sâm lạnh' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6m93bc6z9dcd' FROM MenuItems WHERE restaurant_id = @IdSamBuuDien AND name = N'Bông cúc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6m93bc6z9dcd' FROM MenuItems WHERE restaurant_id = @IdSamBuuDien AND name = N'Rau má' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-me6m93bc6z9dcd' FROM MenuItems WHERE restaurant_id = @IdSamBuuDien AND name = N'Nước đắng' UNION ALL

-- Zinc Corner
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m57lcq7i6gw36f' FROM MenuItems WHERE restaurant_id = @IdZincCorner AND name = N'Cánh Gà Chiên Giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-luwbdakrhbma11' FROM MenuItems WHERE restaurant_id = @IdZincCorner AND name = N'Tokbokki Gà Sốt Chua Ngọt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lxirlzxa4esb96' FROM MenuItems WHERE restaurant_id = @IdZincCorner AND name = N'Chả Cá Tokbokki Sốt Mật Ong' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lxe6pku4f4rf89' FROM MenuItems WHERE restaurant_id = @IdZincCorner AND name = N'Tobokki Nhân Phô Mai Lắc Phô Mai' UNION ALL

-- Anh Nguyễn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m8j1xs6tb6f8aa' FROM MenuItems WHERE restaurant_id = @IdAnhNguyen AND name = N'Cơm Thố Gà + Xá Xíu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mld5gaetxy4je9' FROM MenuItems WHERE restaurant_id = @IdAnhNguyen AND name = N'Cơm Thố Xá Xíu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7nmyi02wj3l84' FROM MenuItems WHERE restaurant_id = @IdAnhNguyen AND name = N'Combo Cơm Thố Hot 88k' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mkm91oiyocn9a2' FROM MenuItems WHERE restaurant_id = @IdAnhNguyen AND name = N'Combo Cơm Thố Gà + Cơm Thố Bò' UNION ALL

-- Cát Cát
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr71l4x6q3yx3c' FROM MenuItems WHERE restaurant_id = @IdCatCat AND name = N'Bánh trứng gà non nguyên vị' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m87ihp7i0k1z6d' FROM MenuItems WHERE restaurant_id = @IdCatCat AND name = N'Bánh trứng nguyên vị + Kem Ý Gelato' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m87ibq04whaf19' FROM MenuItems WHERE restaurant_id = @IdCatCat AND name = N'Bánh trứng tam bảo & Kem Ý Gelato' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-luiwk4v1ftwl4e' FROM MenuItems WHERE restaurant_id = @IdCatCat AND name = N'Bánh Trứng Tứ Sắc + Trà Sữa' UNION ALL

-- A Duy 8
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lubbzj13n8cx47' FROM MenuItems WHERE restaurant_id = @IdADuy8 AND name = N'Combo gà quay' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcw02j1hcm997a' FROM MenuItems WHERE restaurant_id = @IdADuy8 AND name = N'COMBO VỊT QUAY DA GIÒN nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lubccx1q9rtr4f' FROM MenuItems WHERE restaurant_id = @IdADuy8 AND name = N'Sườn không' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lubcurrhqg41d1' FROM MenuItems WHERE restaurant_id = @IdADuy8 AND name = N'Xuxoa ( thạch rau đông)';