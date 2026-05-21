USE travel_food_db
GO

-- ==========================================
-- QUẬN 7
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Mì Cay Sasin - Tân Phong Quận 7', N'69 Đường số 1, P. Tân Phong, Quận 7, TP. HCM', 10.734890, 106.700425, 4.3, 70000, '09:00', '22:00', N'korean, bình dân'),
(N'Phan Rang Quán Quận 7 - Thức Ăn - Lê Văn Lương', N'399 Lê Văn Lương, P. Tân Phong, Quận 7, TP. HCM', 10.739365, 106.703550, 4.7, 50000, '07:00', '21:30', N'vietnamese, bình dân'),
(N'Ốc Trứng Muối - Chi Nhánh 17 Quận 7', N'109 Đường Số 79, P. Tân Quy, Quận 7, TP. HCM', 10.740234, 106.708427, 3.8, 80000, '15:00', '23:30', N'seafood, bình dân'),
(N'Link Ốc Quận 7 - Đường Số 10', N'1 Đường Số 10, P. Tân Kiểng, Quận 7, TP. HCM', 10.747582, 106.710297, 4.2, 100000, '15:00', '23:30', N'seafood, nhậu'),
(N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu', N'269 Phạm Hữu Lầu, P. Phú Mỹ, Quận 7, TP. HCM', 10.704106, 106.729072, 4.6, 65000, '06:30', '21:00', N'vietnamese, bình dân'),
(N'Lẩu Cá Đuối 79k - Lotte Quận 7', N'621 Nguyễn Thị Thập, P. Tân Hưng, Quận 7, TP. HCM', 10.740129, 106.701868, 4.1, 150000, '10:00', '23:00', N'vietnamese, nhậu'),
(N'Trà Sữa MayCha - Yola, Quận 7', N'52-54-56 Đường D1, KDC Him Lam, P. Tân Hưng, Quận 7, TP. HCM', 10.741387, 106.695871, 4.8, 30000, '08:00', '22:30', N'cafe, bình dân'),
(N'Trạm Mì Ý Dì Hiền Quận 7 - 6 Đường 15', N'6 Đường 15, P. Tân Kiểng, Quận 7, TP. HCM', 10.745560, 106.709786, 4.6, 45000, '09:00', '21:00', N'italian, bình dân'),
(N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN - Quận 7', N'Số 1 Đường 12, Khu Dân Cư Nam Long, Quận 7, TP. HCM', 10.743764, 106.735954, 4.3, 75000, '07:00', '21:00', N'vietnamese, bình dân'),
(N'Tacos Labubu Quận 7 - Đường Số 17', N'145 Đường Số 17, P. Tân Quy, Quận 7, TP. HCM', 10.744893, 106.711792, 4.1, 55000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Chicken 3S - Gà Rán Xốt Hàn & Mỳ Cay - Nguyễn Thị Thập Quận 7', N'Số 475A Nguyễn Thị Thập, Quận 7, TP. HCM', 10.738784, 106.709719, 4.7, 150000, '09:30', '22:30', N'korean, gia đình'),
(N'Tứ Quý Trà - Carameo Machiato Quận 7', N'79A Đường 79, P. Tân Quy, Quận 7, TP. HCM', 10.739978, 106.710062, 4.2, 35000, '07:00', '22:00', N'cafe, bình dân'),
(N'Chiang Thai Delivery - Quận 7', N'75A Đường Số 1, Lý Phục Man, P. Bình Thuận, Quận 7, TP. HCM', 10.740073, 106.726566, 4.8, 70000, '10:00', '21:30', N'thai, bình dân'),
(N'Tiệm Fulleaf - Quận 7', N'75 Đường Số 13, P. Tân Kiểng, Quận 7, TP. HCM', 10.745886, 106.707554, 4.2, 40000, '08:00', '22:00', N'cafe, bình dân'),
(N'Gangnam Tanghulu - Lotte Mart Quận 7', N'1F 68 Lotte Mart Quận 7, P. Tân Hưng, Quận 7, TP. HCM', 10.740944, 106.701808, 4.7, 55000, '09:00', '22:00', N'asian, bình dân'),
(N'Pave Glace Chocolate Quận 7', N'98 Đường 65, KĐC Tân Quy Đông, P. Tân Phong, Quận 7, TP. HCM', 10.736773, 106.706300, 4.1, 100000, '08:00', '21:30', N'dessert, quà tặng'),
(N'Tacos Nhà Labubu 149 - Phạm Hữu Lầu Quận 7', N'Số 149 Phạm Hữu Lầu, Khu Phố 2, P. Phú Mỹ, Quận 7, TP. HCM', 10.704536, 106.733710, 4.6, 50000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Tacos Nhà LuXaBu - 335 Nguyễn Hữu Thọ, Quận 7', N'335 Nguyễn Hữu Thọ, P. Tân Phong, Quận 7, TP. HCM', 10.732360, 106.700114, 4.2, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Tacos Xin Chào - 333 Nguyễn Hữu Thọ Quận 7', N'333 Nguyễn Hữu Thọ, P. Tân Hưng, Quận 7, TP. HCM', 10.732054, 106.700256, 4.8, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Bánh Mì Pate Hải Phòng Quận 7 - 141 Đường Số 1', N'141 Đường Số 1, P. Tân Phú, Quận 7, TP. HCM', 10.737000, 106.717146, 4.3, 40000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'A Duy Food - Hệ Thống Gà Quay, Sườn Quay & Cơm Lam - Chi Nhánh Quận 7', N'163 Nguyễn Thị Thập, P. Tân Phú, Quận 7, TP. HCM', 10.738042, 106.719663, 4.7, 220000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'Ola Tacos Quận 7', N'50 Đường Số 10, P. Tân Hưng, Quận 7, TP. HCM', 10.742259, 106.696250, 4.2, 45000, '09:00', '22:00', N'fastfood, bình dân'),
(N'LaSiMi Quận 7- Trà Ngon Đậm Vị - Đường Số 17', N'147c đường số 17, P. Tân Quy, Quận 7, TP. HCM', 10.744884, 106.711646, 4.9, 45000, '07:30', '22:30', N'cafe, bình dân'),
(N'Sâm Chill Me - Lý Phục Man Quận 7', N'89 Lý Phục Man, P. Bình Thuận, Quận 7, TP. HCM', 10.742821, 106.724262, 4.7, 35000, '08:00', '22:00', N'cafe, bình dân');
GO

DECLARE @IdMiCaySasin INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Sasin - Tân Phong Quận 7');
DECLARE @IdPhanRangQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phan Rang Quán Quận 7 - Thức Ăn - Lê Văn Lương');
DECLARE @IdOcTrungMuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 17 Quận 7');
DECLARE @IdLinkOc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Link Ốc Quận 7 - Đường Số 10');
DECLARE @IdBunRieu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu');
DECLARE @IdLauCaDuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Cá Đuối 79k - Lotte Quận 7');
DECLARE @IdMayCha INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa MayCha - Yola, Quận 7');
DECLARE @IdMiYDiHien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trạm Mì Ý Dì Hiền Quận 7 - 6 Đường 15');
DECLARE @IdIchiQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN - Quận 7');
DECLARE @IdTacosLabubu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Labubu Quận 7 - Đường Số 17');
DECLARE @IdChicken3S INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chicken 3S - Gà Rán Xốt Hàn & Mỳ Cay - Nguyễn Thị Thập Quận 7');
DECLARE @IdTuQuyTra INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tứ Quý Trà - Carameo Machiato Quận 7');
DECLARE @IdChiangThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chiang Thai Delivery - Quận 7');
DECLARE @IdFulleaf INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Fulleaf - Quận 7');
DECLARE @IdTanghulu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gangnam Tanghulu - Lotte Mart Quận 7');
DECLARE @IdPaveGlace INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Pave Glace Chocolate Quận 7');
DECLARE @IdLabubu149 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Nhà Labubu 149 - Phạm Hữu Lầu Quận 7');
DECLARE @IdLuXaBu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Nhà LuXaBu - 335 Nguyễn Hữu Thọ, Quận 7');
DECLARE @IdTacosXinChao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Xin Chào - 333 Nguyễn Hữu Thọ Quận 7');
DECLARE @IdPateHaiPhong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Pate Hải Phòng Quận 7 - 141 Đường Số 1');
DECLARE @IdADuyFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'A Duy Food - Hệ Thống Gà Quay, Sườn Quay & Cơm Lam - Chi Nhánh Quận 7');
DECLARE @IdOlaTacos INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ola Tacos Quận 7');
DECLARE @IdLaSiMi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'LaSiMi Quận 7- Trà Ngon Đậm Vị - Đường Số 17');
DECLARE @IdSamChillMe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7');

-- ==========================================
-- CHÈN MENU (Lấy ngẫu nhiên 4 món)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdMiCaySasin, N'Mì trộn tương đen bò', N'Mì cay Sasin,thịt bò, cá viên,chả cá Hàn Quốc, ớt chuông, hành tây,cà rốt', 76000, 'korean', 'noodles,beef,fish balls,bell pepper,onion,carrot'),
(@IdMiCaySasin, N'Mì trộn tương đen mandu', N'Mì cay Sasin, mandu, cá viên, ớt chuông', 61000, 'korean', 'noodles,mandu,fish balls,bell pepper'),
(@IdMiCaySasin, N'Mì kim chi Bò Mỹ', N'Mì cay Sasin, thịt bò, xúc xích,cá viên, kim chi', 70000, 'korean', 'noodles,beef,sausage,fish balls,kimchi'),
(@IdMiCaySasin, N'Mì kim chi hải sản', N'Mì cay Sasin, tôm, mực, cá viên, súp lơ, chả cá HQ, kim chi', 71000, 'korean', 'noodles,shrimp,squid,fish balls,kimchi'),

(@IdPhanRangQuan, N'Nem cuốn đặc biệt', N'Nhân cuốn gồm có chả lụa, nem nướng, bánh giòn, trứng, xoài, rau sống', 27000, 'vietnamese', 'pork sausage,grilled sausage,egg,mango,vegetables'),
(@IdPhanRangQuan, N'Nem cuốn thường', N'Nhân cuốn gồm có chả lụa, nem nướng, bánh giòn, trứng, xoài, rau sống', 22000, 'vietnamese', 'pork sausage,grilled sausage,egg,mango,vegetables'),
(@IdPhanRangQuan, N'Bún nem nướng', N'Một phần bún có chả lụa, nem nướng, bánh giòn, trứng, xoài, rau sống', 49000, 'vietnamese', 'rice noodles,pork sausage,grilled sausage,egg,mango'),
(@IdPhanRangQuan, N'Nem phần tự cuốn', N'Một phần gồm có chả lụa, nem nướng, bánh giòn, trứng, xoài, rau sống và bánh tráng', 85000, 'vietnamese', 'pork sausage,grilled sausage,egg,mango,rice paper'),

(@IdOcTrungMuoi, N'Ốc hương sốt trứng muối', N'', 79000, 'seafood', 'sweet snail,salted egg sauce'),
(@IdOcTrungMuoi, N'Ốc hương cháy tỏi tóp mỡ', N'', 79000, 'seafood', 'sweet snail,garlic,pork crackling'),
(@IdOcTrungMuoi, N'Ốc hương hấp sả', N'', 79000, 'seafood', 'sweet snail,lemongrass'),
(@IdOcTrungMuoi, N'Ốc hương sốt bơ tỏi bắp mỹ', N'', 79000, 'seafood', 'sweet snail,garlic butter,corn'),

(@IdLinkOc, N'Tôm Mắm Nhĩ', N'', 119000, 'seafood', 'shrimp,fish sauce'),
(@IdLinkOc, N'Sứa mắm nhĩ', N'', 109000, 'seafood', 'jellyfish,fish sauce'),
(@IdLinkOc, N'Tôm phô mai đút lò', N'', 109000, 'seafood', 'shrimp,cheese'),
(@IdLinkOc, N'Khô mực khoai môn chiên mắm', N'', 99000, 'seafood', 'dried squid,taro,fish sauce'),

(@IdBunRieu, N'Bún riêu bát đặc biệt', N'Topping gồm có: Tóp mỡ giòn rụm, chả ốc giòn, giò lụa, viên mọc', 85000, 'vietnamese', 'rice noodles,pork crackling,snail sausage,pork sausage'),
(@IdBunRieu, N'Bún riêu bát đầy đủ', N'Topping gồm có: Tóp mỡ giòn rụm, chả ốc, giò lụa sụn, viên mọc cua', 75000, 'vietnamese', 'rice noodles,pork crackling,snail sausage,crab meatball'),
(@IdBunRieu, N'Bún riêu bát tùy chọn ít topping', N'Là bát tùy chọn topping theo sở thích riêng', 68000, 'vietnamese', 'rice noodles,crab paste'),
(@IdBunRieu, N'Bún riêu bát nhỏ', N'Là bát nhỏ, 2 món topping', 48000, 'vietnamese', 'rice noodles,crab paste'),

(@IdLauCaDuoi, N'Gỏi Cá Trích', N'', 139000, 'hotpot', 'herring,herbs'),
(@IdLauCaDuoi, N'Chả giò cá trích(Không rau)', N'', 69000, 'hotpot', 'spring rolls,herring'),
(@IdLauCaDuoi, N'Chả giò cá trích(Có rau)', N'', 89000, 'hotpot', 'spring rolls,herring,vegetables'),
(@IdLauCaDuoi, N'Lẩu Cá Đuối(Vừa)', N'Chưa Có Măng', 189000, 'hotpot', 'stingray,hotpot broth'),

(@IdMayCha, N'Trà Bí Đao XL', N'Với nước bí đao ngọt thanh, cùng size siêu to khổng lồ', 11000, 'beverage', 'winter melon tea'),
(@IdMayCha, N'COMBO 4 LY', N'Tiết kiệm 22K khi mua combo 4 ly Trà/Trà Sữa tuỳ chọn', 89600, 'beverage', 'milk tea'),
(@IdMayCha, N'COMBO 5 LY', N'Tiết kiệm 28K khi mua combo 5 ly Trà/Trà Sữa tuỳ chọn', 105000, 'beverage', 'milk tea'),
(@IdMayCha, N'Trà Quýt Ép Tươi', N'Nước ép quýt tươi kết hợp với trà lài thanh nhẹ', 33000, 'beverage', 'tangerine juice,jasmine tea'),

(@IdMiYDiHien, N'(Món Mới) Mì Ý Thịt Bằm Gà Viên', N'', 50000, 'italian', 'spaghetti,minced meat,chicken balls'),
(@IdMiYDiHien, N'Mì Ý Bò Bằm', N'', 37000, 'italian', 'spaghetti,minced beef'),
(@IdMiYDiHien, N'Mì Ý Bò Bằm Thập Cẩm', N'', 54000, 'italian', 'spaghetti,minced beef,mixed toppings'),
(@IdMiYDiHien, N'Mì Ý Bò Bằm Trứng Ốp La', N'', 43000, 'italian', 'spaghetti,minced beef,fried egg'),

(@IdIchiQuan, N'Bún Chả Hà Nội Truyền Thống', N'1 cây chả giò giòn rụm, thịt viên, thịt nướng thơm lừng', 74000, 'vietnamese', 'rice noodles,spring roll,meatballs,grilled pork'),
(@IdIchiQuan, N'Bún Chả Hà Nội - Thịt Viên, thịt miếng', N'Thịt viên, thịt miếng nướng thơm lừng, bún tươi', 64000, 'vietnamese', 'rice noodles,meatballs,grilled pork'),
(@IdIchiQuan, N'Bún Nem Cua Bể + Thịt viên, thịt miếng', N'Chả giò giòn rụm, ngọt vị cua, thịt viên, thịt nướng', 89000, 'vietnamese', 'rice noodles,crab spring roll,meatballs'),
(@IdIchiQuan, N'Bún Nem Cua Bể', N'Bún + 2 cây Nem Cua thơm lừng đậm vị cua', 75000, 'vietnamese', 'rice noodles,crab spring roll'),

(@IdTacosLabubu, N'Khoai tây chiên phủ phô mai', N'', 45000, 'fastfood', 'french fries,cheese'),
(@IdTacosLabubu, N'Khoai tây chiên đặc biệt', N'', 55000, 'fastfood', 'french fries'),
(@IdTacosLabubu, N'Khoai tây chiên trộn bò bằm', N'', 50000, 'fastfood', 'french fries,minced beef'),
(@IdTacosLabubu, N'Cặp đôi hoàn cảnh', N'1 tacos bò+ 1 tacos gà rút xương', 95000, 'fastfood', 'tacos,beef,chicken'),

(@IdChicken3S, N'Đùi Gà (1 Cái)', N'', 35000, 'korean', 'chicken drumstick'),
(@IdChicken3S, N'Cánh Gà (1 Cánh)', N'', 35000, 'korean', 'chicken wing'),
(@IdChicken3S, N'Gà Nửa Con', N'Bao gồm cơm rong biển xốt ngũ vị', 149000, 'korean', 'chicken,seaweed rice'),
(@IdChicken3S, N'Gà Không Xương (400Gram)', N'Bao gồm cơm rong biển xốt ngũ vị', 149000, 'korean', 'boneless chicken,seaweed rice'),

(@IdTuQuyTra, N'Bạc xĩu', N'', 22000, 'cafe', 'coffee,milk'),
(@IdTuQuyTra, N'Sữa đá', N'', 22000, 'cafe', 'coffee,milk,ice'),
(@IdTuQuyTra, N'Cafe kem béo', N'', 29000, 'cafe', 'coffee,cream'),
(@IdTuQuyTra, N'Cafe sương sáo', N'', 29000, 'cafe', 'coffee,grass jelly'),

(@IdChiangThai, N'Trứng ốp la', N'', 12000, 'thai', 'fried egg'),
(@IdChiangThai, N'Bún tươi', N'', 6500, 'thai', 'rice noodles'),
(@IdChiangThai, N'Cơm chiên Cua', N'Crab Fried Rice', 69500, 'thai', 'fried rice,crab'),
(@IdChiangThai, N'Cơm chiên thịt Bò', N'Fried rice with beef', 72000, 'thai', 'fried rice,beef'),

(@IdFulleaf, N'TRÀ SỮA NGUYÊN LÁ (Best Seller)', N'Trà sữa thơm ngon với hương vị trà đen nguyên lá', 33300, 'beverage', 'black tea,milk'),
(@IdFulleaf, N'TRÀ SỮA LÀI', N'Độ ngọt trà sữa tụi mình đong 100% bằng sữa đặc', 33300, 'beverage', 'jasmine tea,milk'),
(@IdFulleaf, N'TRÀ MÃNG CẦU (Best Seller)', N'', 36600, 'beverage', 'soursop tea'),
(@IdFulleaf, N'CHANH THÁI ĐỎ', N'', 29550, 'beverage', 'thai red tea,lemon'),

(@IdTanghulu, N'Tanghulu Dâu tây & Nho mẫu đơn', N'Mua từ 3 cây bất kì sẽ được tặng đóng gói túi bạc giữ nhiệt', 55000, 'snack', 'tanghulu,strawberry,grape'),
(@IdTanghulu, N'Tanghulu Nho mẫu đơn', N'Mua từ 3 cây bất kì sẽ được tặng đóng gói túi bạc giữ nhiệt', 55000, 'snack', 'tanghulu,grape'),
(@IdTanghulu, N'Tanghulu Cầu Vồng', N'Mua từ 3 cây bất kì sẽ được tặng đóng gói túi bạc giữ nhiệt', 55000, 'snack', 'tanghulu,mixed fruits'),
(@IdTanghulu, N'Tanghulu Dâu Tây-Mẫu Đơn-Quýt Tách Múi', N'Mua từ 3 cây bất kì sẽ được tặng đóng gói túi bạc giữ nhiệt', 55000, 'snack', 'tanghulu,strawberry,grape,tangerine'),

(@IdPaveGlace, N'Socola hạnh nhân 50gr', N'Được làm từ những hạt hạnh nhân tươi ngon, phủ 1 lớp socola mỏng', 80000, 'dessert', 'chocolate,almond'),
(@IdPaveGlace, N'Hạt Macca Caramel 50gr', N'Được sản xuất từ hạt macca lựa chọn kỹ càng, phủ ngoài là lớp đường caramel', 100000, 'dessert', 'macadamia,caramel'),
(@IdPaveGlace, N'Socola macca 50gr', N'Được làm từ những hạt macca tươi ngon, phủ 1 lớp socola', 110000, 'dessert', 'chocolate,macadamia'),
(@IdPaveGlace, N'Hạt hạnh nhân Caramel 50gr', N'Được sản xuất từ hạt hạnh nhân rang lựa chọn kỹ càng', 60000, 'dessert', 'almond,caramel'),

(@IdLabubu149, N'MỲ TRỘN FULL TOPPING', N'Mỳ trộn siêu xịn đầy topping, hòa quyện bò bằm, gà, trứng, xúc xích', 65000, 'fastfood', 'noodles,minced beef,chicken,egg,sausage'),
(@IdLabubu149, N'MỲ TRỘN TRỨNG XÚC XÍCH', N'Mì trộn đậm đà, trứng mềm mại, xúc xích thơm ngon.', 39000, 'fastfood', 'noodles,egg,sausage'),
(@IdLabubu149, N'MỲ TRỘN BÒ BẰM', N'Mỳ trộn thơm ngon với bò bằm bơ tỏi đậm đà.', 42000, 'fastfood', 'noodles,minced beef,garlic butter'),
(@IdLabubu149, N'MỲ GÀ XÙ BƠ CAY', N'Mì trộn thơm ngon với gà chiên xù giòn rụm', 52000, 'fastfood', 'noodles,fried chicken,spicy butter'),

(@IdLuXaBu, N'Bò Bằm Phô Mai', N'', 60000, 'fastfood', 'minced beef,cheese'),
(@IdLuXaBu, N'Gà Phô Mai Mozzrarela', N'', 60000, 'fastfood', 'chicken,mozzarella cheese'),
(@IdLuXaBu, N'Tôm Chiên Sốt Cay', N'', 60000, 'fastfood', 'fried shrimp,spicy sauce'),
(@IdLuXaBu, N'Trứng Xúc Xích', N'', 52000, 'fastfood', 'egg,sausage'),

(@IdTacosXinChao, N'Bò Bằm Phô Mai', N'', 58000, 'fastfood', 'minced beef,cheese'),
(@IdTacosXinChao, N'Gà Phô Mai MOZZARELLA', N'', 58000, 'fastfood', 'chicken,mozzarella cheese'),
(@IdTacosXinChao, N'Đặc Biệt Thập Cẩm', N'Tôm, bò, gà, xúc xích, thịt nướng , trứng ,rau ,khoai', 79000, 'fastfood', 'shrimp,beef,chicken,sausage,egg,vegetables'),
(@IdTacosXinChao, N'Tôm Chiên Giòn Sốt Cay', N'', 59000, 'fastfood', 'fried shrimp,spicy sauce'),

(@IdPateHaiPhong, N'Combo Ăn Sáng Chuẩn Gu', N'Bánh mì que đặc biệt + Cà phê/Cà phê sữa', 49000, 'vietnamese', 'breadstick,pate,coffee'),
(@IdPateHaiPhong, N'Tương ớt Bắc chai 1kg', N'', 90000, 'vietnamese', 'chili sauce'),
(@IdPateHaiPhong, N'Xôi mặn', N'Patê, chả lụa, chà bông, Lạp xưởng, trứng cút chiên', 38000, 'vietnamese', 'sticky rice,pate,pork sausage,chinese sausage,quail egg'),
(@IdPateHaiPhong, N'Xôi gà xé', N'Pate, gà xé, nước xốt gà, mỡ hành', 45000, 'vietnamese', 'sticky rice,pate,shredded chicken'),

(@IdADuyFood, N'0.5kg xu xoa rong biển Lý sơn', N'Xu xoa rong biển hoàn toàn từ tự nhiên', 35000, 'vietnamese', 'seaweed jelly'),
(@IdADuyFood, N'Ống cơm lam', N'', 19000, 'vietnamese', 'bamboo sticky rice'),
(@IdADuyFood, N'Combo Gà Quay Size Lớn Siêu To', N'1 Con Gà + 1cơm lam + 4 bánh bao', 249000, 'vietnamese', 'roasted chicken,bamboo sticky rice,bao bun'),
(@IdADuyFood, N'Combo 1/2 Vịt Quay Da Giòn Rút Xương Size Lớn', N'Combo 1/2 con vịt + 5 bánh bao', 215000, 'vietnamese', 'roasted duck,bao bun'),

(@IdOlaTacos, N'Bánh khoai mỡ Truyền Thống-Không nhân', N'Lắc PM free', 35000, 'fastfood', 'purple yam,cheese powder'),
(@IdOlaTacos, N'Bánh khoai mỡ nhân phô mai', N'Lắc phô mai free', 45000, 'fastfood', 'purple yam,cheese'),
(@IdOlaTacos, N'Bánh khoai mỡ truyền thống không nhân', N'Không lắc PM', 35000, 'fastfood', 'purple yam'),
(@IdOlaTacos, N'Bánh khoai mỡ mix 3 loại- lắc pm free', N'Lắc PM free', 45000, 'fastfood', 'purple yam,mixed filling,cheese powder'),

(@IdLaSiMi, N'OLONG LÀI SỮA', N'Trà Ô Long đậm vị kết hợp cùng vị sữa thơm béo', 40500, 'beverage', 'oolong tea,jasmine,milk'),
(@IdLaSiMi, N'OLONG SỮA HẠNH NHÂN', N'Trà Ô Long đậm vị kết hợp cùng với hạnh nhân', 45000, 'beverage', 'oolong tea,milk,almond'),
(@IdLaSiMi, N'ỔI NHÃN HOA', N'Tận hưởng vị trà Ô Long đậm vị kết hợp cùng syrup ổi', 49500, 'beverage', 'oolong tea,guava syrup,longan'),
(@IdLaSiMi, N'TRÀ OLONG SEN VÀNG KEM PHÔMAI', N'Trà Ô Long đậm vị kết hợp cùng hạt sen dẻo bùi', 45000, 'beverage', 'oolong tea,lotus seed,cream cheese'),

(@IdSamChillMe, N'Me Đác Mê Mẫn', N'Me Đác Mê Mẫn là ly nước me chua ngọt quyến rũ', 38000, 'beverage', 'tamarind juice,palm seed,peanut'),
(@IdSamChillMe, N'Me Mê Mẫn', N'Me Mê Mẫn là ly nước me chua ngọt cuốn hút', 33000, 'beverage', 'tamarind juice,peanut'),
(@IdSamChillMe, N'Sâm Táo Bát Bảo', N'Sâm Táo Bát Bảo là thức uống thảo mộc', 43000, 'beverage', 'herbal drink,chia seed,jujube,lotus seed'),
(@IdSamChillMe, N'Sâm Táo Hạt Đác', N'Sâm Táo Hạt Đác là thức uống thảo mộc', 38000, 'beverage', 'herbal drink,palm seed,chia seed');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdMiCaySasin, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr0em4v6ykzo9a', 1),
(@IdPhanRangQuan, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3u57vgtf92te5', 1),
(@IdOcTrungMuoi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81', 1),
(@IdLinkOc, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m10vfk0q54tbc8', 1),
(@IdBunRieu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8wrwymwt17y6a', 1),
(@IdLauCaDuoi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meeitws1iio36f', 1),
(@IdMayCha, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjnig2xoynlv0d', 1),
(@IdMiYDiHien, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mj3g0kd5a802a4', 1),
(@IdIchiQuan, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbm59eqowj5gc4', 1),
(@IdTacosLabubu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbphfz7cn6k69', 1),
(@IdChicken3S, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmolxm9nmoea18', 1),
(@IdTuQuyTra, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mkav6jwilszq09', 1),
(@IdChiangThai, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3nqyk95y71de7', 1),
(@IdFulleaf, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgb6h6bxan0ta4', 1),
(@IdTanghulu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m2vy2goc27y294', 1),
(@IdPaveGlace, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73yjcnpiftf4', 1),
(@IdLabubu149, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9jjpszf30k53', 1),
(@IdLuXaBu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mi2lylql4o3o73', 1),
(@IdTacosXinChao, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgcyd75j318of6', 1),
(@IdPateHaiPhong, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfqq0qxti96xe9', 1),
(@IdADuyFood, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m0shzyq7s7f30a', 1),
(@IdOlaTacos, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdpp7x1p3zchb0', 1),
(@IdLaSiMi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlql33ubb6dc3f', 1),
(@IdSamChillMe, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mioaeo0ze13b28', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Mì Cay Sasin
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr0em4v6ykzo9a' FROM MenuItems WHERE restaurant_id = @IdMiCaySasin AND name = N'Mì trộn tương đen bò' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr0b50c6si3d04' FROM MenuItems WHERE restaurant_id = @IdMiCaySasin AND name = N'Mì trộn tương đen mandu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqzc68n0tvh505' FROM MenuItems WHERE restaurant_id = @IdMiCaySasin AND name = N'Mì kim chi Bò Mỹ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqzc79xe9h211e' FROM MenuItems WHERE restaurant_id = @IdMiCaySasin AND name = N'Mì kim chi hải sản' UNION ALL
-- Phan Rang Quán
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3u57vgtf92te5' FROM MenuItems WHERE restaurant_id = @IdPhanRangQuan AND name = N'Nem cuốn đặc biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3u58y36wlv993' FROM MenuItems WHERE restaurant_id = @IdPhanRangQuan AND name = N'Nem cuốn thường' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr3xqar95i8p68' FROM MenuItems WHERE restaurant_id = @IdPhanRangQuan AND name = N'Bún nem nướng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr3vhwd2qx7dd9' FROM MenuItems WHERE restaurant_id = @IdPhanRangQuan AND name = N'Nem phần tự cuốn' UNION ALL
-- Ốc Trứng Muối
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc hương sốt trứng muối' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc hương cháy tỏi tóp mỡ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc hương hấp sả' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc hương sốt bơ tỏi bắp mỹ' UNION ALL
-- Link Ốc
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m10vfk0q54tbc8' FROM MenuItems WHERE restaurant_id = @IdLinkOc AND name = N'Tôm Mắm Nhĩ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m10vgt642l2322' FROM MenuItems WHERE restaurant_id = @IdLinkOc AND name = N'Sứa mắm nhĩ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m10x0qkfph270a' FROM MenuItems WHERE restaurant_id = @IdLinkOc AND name = N'Tôm phô mai đút lò' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnrcyeynvh8o94' FROM MenuItems WHERE restaurant_id = @IdLinkOc AND name = N'Khô mực khoai môn chiên mắm' UNION ALL
-- Bún Riêu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8wrwymwt17y6a' FROM MenuItems WHERE restaurant_id = @IdBunRieu AND name = N'Bún riêu bát đặc biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8ws07s2k772d9' FROM MenuItems WHERE restaurant_id = @IdBunRieu AND name = N'Bún riêu bát đầy đủ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8ws228d9yem02' FROM MenuItems WHERE restaurant_id = @IdBunRieu AND name = N'Bún riêu bát tùy chọn ít topping' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbnaw15ovt6v1b' FROM MenuItems WHERE restaurant_id = @IdBunRieu AND name = N'Bún riêu bát nhỏ' UNION ALL
-- Lẩu Cá Đuối
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meeitws1iio36f' FROM MenuItems WHERE restaurant_id = @IdLauCaDuoi AND name = N'Gỏi Cá Trích' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-memeansoe4uad5' FROM MenuItems WHERE restaurant_id = @IdLauCaDuoi AND name = N'Chả giò cá trích(Không rau)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-memec3aobocg70' FROM MenuItems WHERE restaurant_id = @IdLauCaDuoi AND name = N'Chả giò cá trích(Có rau)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-meei0452oa9z63' FROM MenuItems WHERE restaurant_id = @IdLauCaDuoi AND name = N'Lẩu Cá Đuối(Vừa)' UNION ALL
-- MayCha
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjnig2xoynlv0d' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Trà Bí Đao XL' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnp1nimwyzgl4c' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'COMBO 4 LY' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnp1nimwkzcwc6' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'COMBO 5 LY' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo0em9idjzlu38' FROM MenuItems WHERE restaurant_id = @IdMayCha AND name = N'Trà Quýt Ép Tươi' UNION ALL
-- Mì Ý Dì Hiền
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mj3g0kd5a802a4' FROM MenuItems WHERE restaurant_id = @IdMiYDiHien AND name = N'(Món Mới) Mì Ý Thịt Bằm Gà Viên' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcjzbo3t6hpe0d' FROM MenuItems WHERE restaurant_id = @IdMiYDiHien AND name = N'Mì Ý Bò Bằm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcjzbo3tc3z6b4' FROM MenuItems WHERE restaurant_id = @IdMiYDiHien AND name = N'Mì Ý Bò Bằm Thập Cẩm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcvgagdiji2n9b' FROM MenuItems WHERE restaurant_id = @IdMiYDiHien AND name = N'Mì Ý Bò Bằm Trứng Ốp La' UNION ALL
-- ICHI QUÁN
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbm59eqowj5gc4' FROM MenuItems WHERE restaurant_id = @IdIchiQuan AND name = N'Bún Chả Hà Nội Truyền Thống' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbq4ywc4y6l126' FROM MenuItems WHERE restaurant_id = @IdIchiQuan AND name = N'Bún Chả Hà Nội - Thịt Viên, thịt miếng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbq7jewv0j8yda' FROM MenuItems WHERE restaurant_id = @IdIchiQuan AND name = N'Bún Nem Cua Bể + Thịt viên, thịt miếng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mc0ejizv7bea9c' FROM MenuItems WHERE restaurant_id = @IdIchiQuan AND name = N'Bún Nem Cua Bể' UNION ALL
-- Tacos Labubu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbphfz7cn6k69' FROM MenuItems WHERE restaurant_id = @IdTacosLabubu AND name = N'Khoai tây chiên phủ phô mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbq7d5reg5b0e' FROM MenuItems WHERE restaurant_id = @IdTacosLabubu AND name = N'Khoai tây chiên đặc biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbq7d5rd1kvc1' FROM MenuItems WHERE restaurant_id = @IdTacosLabubu AND name = N'Khoai tây chiên trộn bò bằm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdek6qh7khwx92' FROM MenuItems WHERE restaurant_id = @IdTacosLabubu AND name = N'Cặp đôi hoàn cảnh' UNION ALL
-- Chicken 3S
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmolxm9nmoea18' FROM MenuItems WHERE restaurant_id = @IdChicken3S AND name = N'Đùi Gà (1 Cái)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnhbj0ildczm57' FROM MenuItems WHERE restaurant_id = @IdChicken3S AND name = N'Cánh Gà (1 Cánh)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnhbk49o9q1054' FROM MenuItems WHERE restaurant_id = @IdChicken3S AND name = N'Gà Nửa Con' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmolx6zh5zicc3' FROM MenuItems WHERE restaurant_id = @IdChicken3S AND name = N'Gà Không Xương (400Gram)' UNION ALL
-- Tứ Quý Trà
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mkav6jwilszq09' FROM MenuItems WHERE restaurant_id = @IdTuQuyTra AND name = N'Bạc xĩu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mkay29mwc8w384' FROM MenuItems WHERE restaurant_id = @IdTuQuyTra AND name = N'Sữa đá' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mkav6jyjlvyabe' FROM MenuItems WHERE restaurant_id = @IdTuQuyTra AND name = N'Cafe kem béo' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mkav6jem0r9ffd' FROM MenuItems WHERE restaurant_id = @IdTuQuyTra AND name = N'Cafe sương sáo' UNION ALL
-- Chiang Thai
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3nqyk95y71de7' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Trứng ốp la' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3nr1q3lcnng53' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Bún tươi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3npqbh6tq640e' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Cơm chiên Cua' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3nqczty5fi412' FROM MenuItems WHERE restaurant_id = @IdChiangThai AND name = N'Cơm chiên thịt Bò' UNION ALL
-- Tiệm Fulleaf
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgb6h6bxan0ta4' FROM MenuItems WHERE restaurant_id = @IdFulleaf AND name = N'TRÀ SỮA NGUYÊN LÁ (Best Seller)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ltgtr7k5rwgd37' FROM MenuItems WHERE restaurant_id = @IdFulleaf AND name = N'TRÀ SỮA LÀI' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-md4ir4kufwktd1' FROM MenuItems WHERE restaurant_id = @IdFulleaf AND name = N'TRÀ MÃNG CẦU (Best Seller)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-md4irooh0yp944' FROM MenuItems WHERE restaurant_id = @IdFulleaf AND name = N'CHANH THÁI ĐỎ' UNION ALL
-- Gangnam Tanghulu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m2vy2goc27y294' FROM MenuItems WHERE restaurant_id = @IdTanghulu AND name = N'Tanghulu Dâu tây & Nho mẫu đơn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m2vy3hvdo3rafe' FROM MenuItems WHERE restaurant_id = @IdTanghulu AND name = N'Tanghulu Nho mẫu đơn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnog5euj2eboa1' FROM MenuItems WHERE restaurant_id = @IdTanghulu AND name = N'Tanghulu Cầu Vồng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m2vy4q1szax2a2' FROM MenuItems WHERE restaurant_id = @IdTanghulu AND name = N'Tanghulu Dâu Tây-Mẫu Đơn-Quýt Tách Múi' UNION ALL
-- Pave Glace Chocolate
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73yjcnpiftf4' FROM MenuItems WHERE restaurant_id = @IdPaveGlace AND name = N'Socola hạnh nhân 50gr' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr4fwapngpms72' FROM MenuItems WHERE restaurant_id = @IdPaveGlace AND name = N'Hạt Macca Caramel 50gr' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr73yg5icm2s33' FROM MenuItems WHERE restaurant_id = @IdPaveGlace AND name = N'Socola macca 50gr' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr08hisj82bof1' FROM MenuItems WHERE restaurant_id = @IdPaveGlace AND name = N'Hạt hạnh nhân Caramel 50gr' UNION ALL
-- Labubu 149
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9jjpszf30k53' FROM MenuItems WHERE restaurant_id = @IdLabubu149 AND name = N'MỲ TRỘN FULL TOPPING' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9jjpszavb82d' FROM MenuItems WHERE restaurant_id = @IdLabubu149 AND name = N'MỲ TRỘN TRỨNG XÚC XÍCH' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9jjpszhw5c8c' FROM MenuItems WHERE restaurant_id = @IdLabubu149 AND name = N'MỲ TRỘN BÒ BẰM' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9jjpszc9vo76' FROM MenuItems WHERE restaurant_id = @IdLabubu149 AND name = N'MỲ GÀ XÙ BƠ CAY' UNION ALL
-- LuXaBu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mi2lylql4o3o73' FROM MenuItems WHERE restaurant_id = @IdLuXaBu AND name = N'Bò Bằm Phô Mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mi2lwld1c9hd4e' FROM MenuItems WHERE restaurant_id = @IdLuXaBu AND name = N'Gà Phô Mai Mozzrarela' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mi2m3nknq2vc0d' FROM MenuItems WHERE restaurant_id = @IdLuXaBu AND name = N'Tôm Chiên Sốt Cay' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mi2m6ro9ysxsd1' FROM MenuItems WHERE restaurant_id = @IdLuXaBu AND name = N'Trứng Xúc Xích' UNION ALL
-- Tacos Xin Chào
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgcyd75j318of6' FROM MenuItems WHERE restaurant_id = @IdTacosXinChao AND name = N'Bò Bằm Phô Mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgcy2mkn2lfy12' FROM MenuItems WHERE restaurant_id = @IdTacosXinChao AND name = N'Gà Phô Mai MOZZARELLA' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgcyfroaqjnx2f' FROM MenuItems WHERE restaurant_id = @IdTacosXinChao AND name = N'Đặc Biệt Thập Cẩm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mgrii1orjtop79' FROM MenuItems WHERE restaurant_id = @IdTacosXinChao AND name = N'Tôm Chiên Giòn Sốt Cay' UNION ALL
-- Pate Hải Phòng
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfqq0qxti96xe9' FROM MenuItems WHERE restaurant_id = @IdPateHaiPhong AND name = N'Combo Ăn Sáng Chuẩn Gu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnjifwr5p24h74' FROM MenuItems WHERE restaurant_id = @IdPateHaiPhong AND name = N'Tương ớt Bắc chai 1kg' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mchk7zb4de02aa' FROM MenuItems WHERE restaurant_id = @IdPateHaiPhong AND name = N'Xôi mặn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-7ras8-md9x14d3d3mk78' FROM MenuItems WHERE restaurant_id = @IdPateHaiPhong AND name = N'Xôi gà xé' UNION ALL
-- A Duy Food
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m0shzyq7s7f30a' FROM MenuItems WHERE restaurant_id = @IdADuyFood AND name = N'0.5kg xu xoa rong biển Lý sơn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m0shf78vmr5954' FROM MenuItems WHERE restaurant_id = @IdADuyFood AND name = N'Ống cơm lam' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m0shdb2zdqq7d7' FROM MenuItems WHERE restaurant_id = @IdADuyFood AND name = N'Combo Gà Quay Size Lớn Siêu To' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcosqowohg0sbf' FROM MenuItems WHERE restaurant_id = @IdADuyFood AND name = N'Combo 1/2 Vịt Quay Da Giòn Rút Xương Size Lớn 2.6-2.8lg' UNION ALL
-- Ola Tacos
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdpp7x1p3zchb0' FROM MenuItems WHERE restaurant_id = @IdOlaTacos AND name = N'Bánh khoai mỡ Truyền Thống-Không nhân' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdpp7x1p6shd21' FROM MenuItems WHERE restaurant_id = @IdOlaTacos AND name = N'Bánh khoai mỡ nhân phô mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdpp7x1p5dwx77' FROM MenuItems WHERE restaurant_id = @IdOlaTacos AND name = N'Bánh khoai mỡ truyền thống không nhân' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdpp7x1pgmgh38' FROM MenuItems WHERE restaurant_id = @IdOlaTacos AND name = N'Bánh khoai mỡ mix 3 loại- lắc pm free' UNION ALL
-- LaSiMi
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlql33ubb6dc3f' FROM MenuItems WHERE restaurant_id = @IdLaSiMi AND name = N'OLONG LÀI SỮA' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlql33ur9onj62' FROM MenuItems WHERE restaurant_id = @IdLaSiMi AND name = N'OLONG SỮA HẠNH NHÂN' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlql337f321485' FROM MenuItems WHERE restaurant_id = @IdLaSiMi AND name = N'ỔI NHÃN HOA' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlql33v5fksgaa' FROM MenuItems WHERE restaurant_id = @IdLaSiMi AND name = N'TRÀ OLONG SEN VÀNG KEM PHÔMAI' UNION ALL
-- Sâm Chill Me
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mioaeo0ze13b28' FROM MenuItems WHERE restaurant_id = @IdSamChillMe AND name = N'Me Đác Mê Mẫn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mioa1v6m8m4jc9' FROM MenuItems WHERE restaurant_id = @IdSamChillMe AND name = N'Me Mê Mẫn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mioajp11emtg03' FROM MenuItems WHERE restaurant_id = @IdSamChillMe AND name = N'Sâm Táo Bát Bảo' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mioan1w3xfk8d2' FROM MenuItems WHERE restaurant_id = @IdSamChillMe AND name = N'Sâm Táo Hạt Đác';