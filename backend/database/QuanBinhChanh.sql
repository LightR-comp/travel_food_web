USE travel_food_db
GO

-- ==========================================
-- BÌNH CHÁNH
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Mì Trộn, Ăn Vặt & Cá Viên - Bình Chánh', N'47B/2Đ Ấp 2, X. An Phú Tây, Bình Chánh, TP. HCM', 10.685544, 106.601863, 4.2, 69000, '15:00', '23:30', N'asian, bình dân'),
(N'Ốc Trứng Muối - Chi Nhánh 14 Bình Chánh', N'A11/1A6 Đường Số 10, X. Bình Hưng, Bình Chánh, TP. HCM', 10.726873, 106.655247, 4.3, 69000, '15:00', '23:30', N'seafood, bình dân'),
(N'MÊ - Coffee, Tea & Matcha - Bình Chánh', N'385 Hương Lộ 11, Bình Chánh, TP. HCM', 10.656371, 106.586641, 4.8, 40000, '08:00', '22:00', N'cafe, bình dân'),
(N'Gà Rán KFC - Central Plaza', N'C6/27 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.733682, 106.674694, 4.6, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh', N'C13/36 Đinh Đức Thiện, Xã Bình Chánh, Bình Chánh, TP. HCM', 10.661900, 106.574570, 4.3, 35000, '07:00', '22:00', N'bakery, bình dân'),
(N'Highlands Coffee - Trà, Cà Phê & Bánh - Central Mall Bình Chánh', N'Satra Phạm Hùng, C6/27 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.733786, 106.674370, 4.7, 50000, '07:00', '23:00', N'cafe, bình dân'),
(N'3 Râu - Gà Rán, Pizza & Trà Sữa - Đường Số 1, Bình Chánh', N'Lô D, D01-02 Chung Cư An Gia Westgate, Đường Số 1, TT. Tân Túc, Bình Chánh, TP. HCM', 10.689147, 106.585212, 4.2, 65000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Highlands Coffee - Trà, Cà Phê & Bánh - Số 1 Bình Chánh', N'Số 73 Đường Số 1, Ấp 2, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.728475, 106.653341, 4.4, 50000, '07:00', '23:00', N'cafe, bình dân'),
(N'Highlands Coffee - Trà, Cà Phê & Bánh - West Gate Bình Chánh', N'C2-15 Chung Cư West Gate 349 Tân Túc, TT. Tân Túc, Bình Chánh, TP. HCM', 10.689524, 106.587362, 4.6, 50000, '07:00', '23:00', N'cafe, bình dân'),
(N'Bánh Tráng Lòng Đào - Bình Chánh', N'Số 349 Đường Tân túc, Chung Cư Westgate, TT. Tân Túc, Bình Chánh, TP. HCM', 10.689524, 106.587362, 4.2, 45000, '09:00', '22:00', N'asian, bình dân'),
(N'Gà Rán KFC - Nguyễn Thị Tú', N'D6/22 Nguyễn Thị Tú, Bình Chánh, TP. HCM', 10.814203, 106.581533, 4.3, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Gà Rán KFC - Hiệp Bình', N'112 Hiệp Bình, P. Hiệp Bình Chánh, Thành Phố Thủ Đức, TP. HCM', 10.842297, 106.731216, 4.7, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Bún Đậu Lực Phát - Bình Chánh', N'163 Nguyễn Thị Tú, X. Vĩnh Lộc B, Bình Chánh, TP. HCM', 10.813570, 106.579378, 4.6, 65000, '09:00', '22:00', N'vietnamese, bình dân'),
(N'Phở Đức 2 - 137 Đường Hiệp Bình, Phường Hiệp Bình Chánh, TP Thủ Đức', N'137 Đường Hiệp Bình, Thành Phố Thủ Đức, TP. HCM', 10.844465, 106.729970, 4.3, 45000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Bobapop - Bình Chánh', N'7 Đường Số 5, X. Bình Hưng, Bình Chánh, TP. HCM', 10.724917, 106.653255, 4.2, 45000, '09:00', '22:00', N'cafe, bình dân'),
(N'Gà Nướng 2 Vị CoGaVa Bình Chánh - Thới Hòa', N'335 Thới Hòa, Ấp 49, X. Vĩnh Lộc A, Bình Chánh, TP. HCM', 10.829093, 106.581176, 4.8, 150000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'Cơm Gà Xối Mỡ A Hí - Hiệp Bình Chánh', N'176 Hiệp Bình, Thành Phố Thủ Đức, TP. HCM', 10.844660, 106.730036, 4.4, 45000, '09:00', '22:00', N'vietnamese, bình dân'),
(N'Bếp Ăn Vặt Của HyyRuu - Ăn Vặt & Xiên Que Chiên Các Loại - Bình Chánh', N'E15/328 Đường Bờ Bao Hợp Tác Xã, X. Phong Phú, Bình Chánh, TP. HCM', 10.710762, 106.660523, 4.7, 60000, '15:00', '23:30', N'asian, bình dân'),
(N'Gà Rán KFC - Giga Mall', N'B1-01B1 Tầng B1, Giga Mall, 242 Phạm Văn Đồng, P. Hiệp Bình Chánh, Thành Phố Thủ Đức, TP. HCM', 10.827854, 106.721396, 4.2, 60000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Xôi Bình Tiên - Phạm Hùng', N'163 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.734971, 106.672741, 4.6, 35000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Gà Rán & Burger McDonald’s Satra Pham Hung', N'Tầng Trệt, TTTM Satra Phạm Hùng, C6/27 Phạm Hùng, Xã Bình Hưng, Bình Chánh, TP. HCM', 10.733632, 106.674541, 4.4, 80000, '09:00', '23:00', N'fastfood, bình dân'),
(N'ỐC HÀ ĐỒNG GIÁ 40K - Đinh Đức Thiện', N'442 Đinh Đức Thiện, X. Tân Quý Tây, Bình Chánh, TP. HCM', 10.658111, 106.580900, 3.7, 55000, '15:00', '23:30', N'seafood, nhậu'),
(N'Bếp Nhà Thỏ - Ăn Vặt Hàn Quốc - Quốc Lộ 50', N'B2/18 Ấp 2A Quốc Lộ 50, X. Bình Hưng, Bình Chánh, TP. HCM', 10.728475, 106.655582, 4.8, 55000, '09:00', '22:00', N'korean, bình dân'),
(N'Bánh Tacos Pháp Newday - Trần Đại Nghĩa', N'12/5B Trần Đại Nghĩa, X. Tân Kiên, Bình Chánh, TP. HCM', 10.723969, 106.597301, 4.2, 60000, '09:00', '22:00', N'fastfood, bình dân');
GO

DECLARE @IdMiTron INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Trộn, Ăn Vặt & Cá Viên - Bình Chánh');
DECLARE @IdOcTrungMuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 14 Bình Chánh');
DECLARE @IdMeCoffee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'MÊ - Coffee, Tea & Matcha - Bình Chánh');
DECLARE @IdKFCCentral INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán KFC - Central Plaza');
DECLARE @IdBanhKemNgon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh');
DECLARE @IdHLCentral INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Central Mall Bình Chánh');
DECLARE @Id3Rau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'3 Râu - Gà Rán, Pizza & Trà Sữa - Đường Số 1, Bình Chánh');
DECLARE @IdHLSo1 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Số 1 Bình Chánh');
DECLARE @IdHLWestGate INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - West Gate Bình Chánh');
DECLARE @IdBanhTrang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Lòng Đào - Bình Chánh');
DECLARE @IdKFCNTT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán KFC - Nguyễn Thị Tú');
DECLARE @IdKFCHiepBinh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán KFC - Hiệp Bình');
DECLARE @IdBunDauLucPhat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Đậu Lực Phát - Bình Chánh');
DECLARE @IdPhoDuc2 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Đức 2 - 137 Đường Hiệp Bình, Phường Hiệp Bình Chánh, TP Thủ Đức');
DECLARE @IdBobapop INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bobapop - Bình Chánh');
DECLARE @IdGaNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Nướng 2 Vị CoGaVa Bình Chánh - Thới Hòa');
DECLARE @IdComGaAHi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Gà Xối Mỡ A Hí - Hiệp Bình Chánh');
DECLARE @IdHyyRuu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Ăn Vặt Của HyyRuu - Ăn Vặt & Xiên Que Chiên Các Loại - Bình Chánh');
DECLARE @IdKFCGiga INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán KFC - Giga Mall');
DECLARE @IdXoiBinhTien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Xôi Bình Tiên - Phạm Hùng');
DECLARE @IdMcDonalds INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán & Burger McDonald’s Satra Pham Hung');
DECLARE @IdOcHa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'ỐC HÀ ĐỒNG GIÁ 40K - Đinh Đức Thiện');
DECLARE @IdBepNhaTho INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà Thỏ - Ăn Vặt Hàn Quốc - Quốc Lộ 50');
DECLARE @IdTacosNewday INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tacos Pháp Newday - Trần Đại Nghĩa');

-- ==========================================
-- CHÈN MENU (4 món ngẫu nhiên mỗi quán)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdMiTron, N'Combo chiên mắm tỏi nhỏ (69k)', N'Gồm các loại viên chiên lộn xộn siêu ngon', 69000, 'snack', 'fried mixed balls, fish sauce, garlic'),
(@IdMiTron, N'Mì trộn thập cẩm - full topping', N'Phần mì gồm cải thìa, nhiều loại topping ngon', 59000, 'asian', 'noodles, mixed toppings'),
(@IdMiTron, N'Mì trộn xúc xích - ốp la', N'Phần mì gồm: 1 mì, cải thìa, 1 trứng, 1 xúc xích', 38000, 'asian', 'noodles, sausage, egg'),
(@IdMiTron, N'Phô mai que loại siêu to', N'1 cây/ xiên', 15000, 'snack', 'cheese stick'),

(@IdOcTrungMuoi, N'Ốc mỡ cháy tỏi tóp mỡ', N'', 69000, 'seafood', 'snail, garlic, pork crackling'),
(@IdOcTrungMuoi, N'Sò huyết xào me', N'', 59000, 'seafood', 'blood cockle, tamarind sauce'),
(@IdOcTrungMuoi, N'Sò lông mỡ hành', N'', 49000, 'seafood', 'hairy cockle, scallion oil'),
(@IdOcTrungMuoi, N'Ốc khế nướng mắm tỏi', N'', 55000, 'seafood', 'snail, garlic fish sauce'),

(@IdMeCoffee, N'Matcha Latte', N'', 38000, 'cafe', 'matcha, milk'),
(@IdMeCoffee, N'Trà Sữa MÊ', N'', 33000, 'beverage', 'milk tea'),
(@IdMeCoffee, N'Dừa Sen Full Topping', N'Dừa xiêm mát lạnh, sen bùi nhẹ, topping giòn dai', 39000, 'dessert', 'coconut water, lotus seed, jelly'),
(@IdMeCoffee, N'Cacao Sữa Gấu', N'', 40000, 'cafe', 'cacao, milk'),

(@IdKFCCentral, N'Combo Cơm Trưa Phi-lê Gà Quay', N'1 Cơm Phi-lê Gà Quay + 1 ly Pepsi', 46000, 'fastfood', 'rice, roasted chicken fillet, pepsi'),
(@IdKFCCentral, N'Combo Trưa Burger Tôm', N'1 Burger Tôm + 1 ly Pepsi', 46000, 'fastfood', 'shrimp burger, pepsi'),
(@IdKFCCentral, N'Combo 79k Trùm Deal ShopeeFood', N'2 Gà + 1 Khoai Tây Chiên', 79000, 'fastfood', 'fried chicken, french fries'),
(@IdKFCCentral, N'1 Bánh Trứng', N'', 18000, 'bakery', 'egg tart'),

(@IdBanhKemNgon, N'Bánh su kem  hộp', N'', 40000, 'bakery', 'choux pastry, cream'),
(@IdBanhKemNgon, N'Bánh mì phô mai tan chảy', N'', 38000, 'bakery', 'bread, cheese'),
(@IdBanhKemNgon, N'Bánh crep sầu riêng', N'', 35000, 'bakery', 'durian crepe'),
(@IdBanhKemNgon, N'Bông lan trứng muối phô mai tô giấy', N'', 55000, 'bakery', 'sponge cake, salted egg, cheese'),

(@IdHLCentral, N'MatchaĐI Dừa Mây', N'Lớp Matcha mịn thơm hòa quyện cùng nước dừa', 69000, 'cafe', 'matcha, coconut milk'),
(@IdHLCentral, N'Bánh Mì Que Pate Highlands', N'Bánh nóng hổi, giòn giòn, béo ngậy pa tê', 19000, 'vietnamese', 'breadstick, pate'),
(@IdHLCentral, N'Combo Sáng Highlands 58K', N'', 58000, 'cafe', 'coffee, bread'),
(@IdHLCentral, N'Trà Thanh Đào', N'Vị trà cao cấp, những miếng đào ngọt giòn', 49000, 'beverage', 'peach tea, lemongrass'),

(@Id3Rau, N'COMBO MÌ Ý BÒ BẰM + 1 Coca-Cola', N'Giảm 25K khi đặt combo', 69350, 'italian', 'spaghetti, minced beef, coke'),
(@Id3Rau, N'COMBO 5 - 1 MIẾNG GÀ GIÒN', N'1 miếng gà, 1 khoai tây, 1 nước ngọt', 62000, 'fastfood', 'fried chicken, french fries, coke'),
(@Id3Rau, N'GÀ VIÊN LẮC PHÔ MAI', N'', 49000, 'fastfood', 'chicken balls, cheese powder'),
(@Id3Rau, N'GÀ SỐT HÀN QUỐC', N'1 phần gà sốt Hàn Quốc, bánh gạo', 138000, 'korean', 'korean fried chicken, tteokbokki'),

(@IdHLSo1, N'Cà Phê Phin Đen Đá (Coffee)', N'Pha hoàn toàn từ Phin, cực đậm vị', 35000, 'cafe', 'black coffee'),
(@IdHLSo1, N'Combo Tỉnh Táo Highlands', N'', 67000, 'cafe', 'coffee, cake'),
(@IdHLSo1, N'PhinĐI Matcha Dâu', N'Hòa quyện giữa nốt dâu, matcha và cà phê', 59000, 'cafe', 'coffee, matcha, strawberry'),
(@IdHLSo1, N'Trà Thạch Vải', N'Quả vải mọng nước cùng trà đen', 49000, 'beverage', 'lychee tea, jelly'),

(@IdHLWestGate, N'Trà Sữa Đài Loan', N'', 65000, 'beverage', 'taiwanese milk tea'),
(@IdHLWestGate, N'Trà Sữa Hojicha', N'', 65000, 'beverage', 'hojicha milk tea'),
(@IdHLWestGate, N'Trà Sen Vàng (Củ Năng)', N'Ô Long kết hợp sen thanh mát và củ năng', 49000, 'beverage', 'lotus seed tea, water chestnut'),
(@IdHLWestGate, N'Trà Thạch Vải', N'', 49000, 'beverage', 'lychee tea, jelly'),

(@IdBanhTrang, N'Chân gà sốt thái trứng non lòng đào', N'', 60000, 'snack', 'chicken feet, thai sauce, young egg'),
(@IdBanhTrang, N'Mẹt Bánh Tráng', N'', 195000, 'snack', 'rice paper, mixed toppings'),
(@IdBanhTrang, N'Trà Xoài Chanh Dây', N'', 39000, 'beverage', 'mango passion fruit tea'),
(@IdBanhTrang, N'Matcha Latte', N'', 39000, 'cafe', 'matcha, milk'),

(@IdKFCNTT, N'Combo Cơm Trưa Gà Mắm Tỏi', N'1 Cơm gà Xốt Mắm Tỏi + 1 ly Pepsi', 49000, 'fastfood', 'rice, fried chicken, garlic fish sauce, pepsi'),
(@IdKFCNTT, N'Combo Trưa Mì Ý', N'1 Mì Migaxuxi + 1 ly Pepsi', 46000, 'fastfood', 'spaghetti, pepsi'),
(@IdKFCNTT, N'Combo Gà & Nuggets', N'3 Miếng Gà + 4 Miếng Nuggets', 99000, 'fastfood', 'fried chicken, chicken nuggets'),
(@IdKFCNTT, N'Xế Xõa_Tặng Gà & Bánh Trứng', N'Gà viên, khoai tây, pepsi, tặng gà rán & bánh trứng', 154000, 'fastfood', 'chicken balls, french fries, pepsi, fried chicken, egg tart'),

(@IdKFCHiepBinh, N'Combo Cơm Trưa Gà Viên Nanban', N'1 Cơm gà viên Nanban + 1 ly Pepsi', 46000, 'fastfood', 'rice, chicken balls, nanban sauce, pepsi'),
(@IdKFCHiepBinh, N'20 Gà Miếng Nuggets', N'', 99000, 'fastfood', 'chicken nuggets'),
(@IdKFCHiepBinh, N'Xế Xõa_Tặng Mì Ý', N'Gà viên, khoai tây, pepsi, tặng mì ý', 99000, 'fastfood', 'chicken balls, french fries, pepsi, spaghetti'),
(@IdKFCHiepBinh, N'COMBO HỘI CÚ ĐÊM 149K', N'3 miếng Gà, Burger Tôm, Khoai Tây Chiên, 2 Pepsi', 149000, 'fastfood', 'fried chicken, shrimp burger, french fries, pepsi'),

(@IdBunDauLucPhat, N'Bún Đậu Thập Cẩm', N'', 75000, 'vietnamese', 'rice noodles, tofu, mixed toppings, shrimp paste'),
(@IdBunDauLucPhat, N'Combo 2 Người', N'', 135000, 'vietnamese', 'rice noodles, tofu, mixed toppings, shrimp paste'),
(@IdBunDauLucPhat, N'Nem Chua Rán', N'', 30000, 'vietnamese', 'fried fermented pork roll'),
(@IdBunDauLucPhat, N'Chả Ốc', N'', 30000, 'vietnamese', 'snail sausage'),

(@IdPhoDuc2, N'Phở tái', N'', 40000, 'vietnamese', 'pho noodles, rare beef'),
(@IdPhoDuc2, N'Phở sườn', N'', 55000, 'vietnamese', 'pho noodles, beef ribs'),
(@IdPhoDuc2, N'Hủ tiếu bò kho', N'', 40000, 'vietnamese', 'hu tieu noodles, beef stew'),
(@IdPhoDuc2, N'Bò kho bánh mì', N'', 40000, 'vietnamese', 'beef stew, bread'),

(@IdBobapop, N'Trà Bá Tước sủi bọt size M', N'', 43000, 'beverage', 'earl grey tea, milk foam'),
(@IdBobapop, N'Trà xanh sủi bọt', N'Jasmine green tea', 43000, 'beverage', 'green tea, milk foam'),
(@IdBobapop, N'Trà sữa 4Q', N'4 loại topping : trân châu đen, Flan, Thủy tinh dâu, Hạt trái cây', 46000, 'beverage', 'milk tea, boba, flan, fruit jelly'),
(@IdBobapop, N'Hồng trà dâu', N'Strawberry black tea', 43000, 'beverage', 'strawberry black tea'),

(@IdGaNuong, N'Combo gà quay 4 bánh + 1 cơm lam', N'1 con gà, 4 bánh bao, 1 cây cơm lam', 245000, 'vietnamese', 'roasted chicken, bao bun, bamboo sticky rice'),
(@IdGaNuong, N'Gà nguyên con', N'1 Gà nướng thơm giòn', 209000, 'vietnamese', 'roasted chicken'),
(@IdGaNuong, N'500g sườn nướng + 4 bánh', N'Sườn nướng cháy cạnh + 4 bánh bao', 245000, 'vietnamese', 'grilled pork ribs, bao bun'),
(@IdGaNuong, N'Cơm lam', N'', 29000, 'vietnamese', 'bamboo sticky rice'),

(@IdComGaAHi, N'Cơm gà xối mỡ lớn ( góc tư )', N'Cơm chiên đậu - rau - súp - tương', 65000, 'vietnamese', 'fried rice, fried chicken leg'),
(@IdComGaAHi, N'Cơm chiên bò xào hành tây', N'Cơm chiên + bò xào hành tây', 45000, 'vietnamese', 'fried rice, stir-fried beef, onion'),
(@IdComGaAHi, N'Cơm chiên dương châu', N'', 40000, 'vietnamese', 'yangzhou fried rice'),
(@IdComGaAHi, N'Cơm chiên xúc xích 2 cây', N'', 40000, 'vietnamese', 'fried rice, sausage'),

(@IdHyyRuu, N'COMBO 1 NGON HƠN NYC', N'Phần nhỏ, ngẫu nhiên 10 loại viên', 89000, 'snack', 'mixed fried balls'),
(@IdHyyRuu, N'Mì trộn cơ bản', N'Ngẫu nhiên 6 loại viên', 29000, 'asian', 'noodles, mixed fried balls'),
(@IdHyyRuu, N'nem chua rán Hà Nội', N'3 thanh', 22000, 'snack', 'fried fermented pork roll'),
(@IdHyyRuu, N'đậu hũ phô mai', N'3 viên', 14500, 'snack', 'cheese tofu'),

(@IdKFCGiga, N'COMBO 6 MÓN 119K', N'', 119000, 'fastfood', 'fried chicken, french fries, pepsi'),
(@IdKFCGiga, N'Combo Cơm Phi-lê Gà quay', N'', 46000, 'fastfood', 'rice, roasted chicken fillet, pepsi'),
(@IdKFCGiga, N'COMBO CÚ ĐÊM 149K', N'', 149000, 'fastfood', 'fried chicken, burger, french fries, pepsi'),
(@IdKFCGiga, N'Xế Xõa 1', N'', 45000, 'fastfood', 'fried chicken, pepsi'),

(@IdXoiBinhTien, N'Xôi mặn', N'', 30000, 'vietnamese', 'sticky rice, mixed toppings'),
(@IdXoiBinhTien, N'Xôi nếp than', N'', 22000, 'vietnamese', 'black sticky rice, coconut milk'),
(@IdXoiBinhTien, N'Xôi ca dé', N'', 22000, 'vietnamese', 'sticky rice, kaya jam'),
(@IdXoiBinhTien, N'Xôi đùi gà', N'', 45000, 'vietnamese', 'sticky rice, chicken drumstick'),

(@IdMcDonalds, N'Combo 1 Người - Gà Xốt Kem Lá Chanh', N'1 Miếng Gà, 1 Burger Bò Phô Mai, 1 Nước', 94000, 'fastfood', 'fried chicken, lime cream sauce, beef burger, cheese, coke'),
(@IdMcDonalds, N'Phần Ăn 2 Miếng Gà Xốt Kem Lá Chanh', N'Kèm khoai tây chiên (L) và Nước uống (L)', 129000, 'fastfood', 'fried chicken, lime cream sauce, french fries, coke'),
(@IdMcDonalds, N'Mua 1 tặng 1 giá 119k (2593)', N'Mì Ý, 2 Miếng Gà Rán, Khoai, Nước', 119000, 'fastfood', 'spaghetti, fried chicken, french fries, coke'),
(@IdMcDonalds, N'Mì Ý - Spaghetti (2661)', N'', 49000, 'fastfood', 'spaghetti, tomato sauce'),

(@IdOcHa, N'Ốc tỏi nướng mỡ hành 2con/phần', N'', 55000, 'seafood', 'garlic snail, scallion oil'),
(@IdOcHa, N'Sò huyết rang me', N'', 55000, 'seafood', 'blood cockle, tamarind sauce'),
(@IdOcHa, N'Trứng gà non xào bơ bắp', N'', 55000, 'seafood', 'young egg, butter, corn'),
(@IdOcHa, N'Ốc bươu đồng hấp tiêu xanh', N'', 55000, 'seafood', 'apple snail, green pepper'),

(@IdBepNhaTho, N'MÌ Ý SỐT- XÚC XÍCH', N'Mì ý + Xúc xích cắt miếng+ Salad trộn', 53500, 'italian', 'spaghetti, sausage, salad'),
(@IdBepNhaTho, N'MATCHA LATTE KEM MUỐI', N'Size 500ml', 32500, 'cafe', 'matcha, milk, salt cream'),
(@IdBepNhaTho, N'MÌ Ý - GÀ SỐT HÀN QUỐC', N'Mì ý sốt spaghetti + Gà rán sốt HQ + Salad trộn', 65000, 'korean', 'spaghetti, korean fried chicken'),
(@IdBepNhaTho, N'COMBO 2 : Gà Sốt Phô Mai Tan Chảy + Trà Sữa Kem Trứng', N'', 93000, 'korean', 'fried chicken, cheese sauce, milk tea, egg cream'),

(@IdTacosNewday, N'Tacos Bò Xào Gà Giòn', N'Xúc Xích, Gà Giòn, Bò Xào, Khoai Tây, Rau, Tương Ớt', 70000, 'fastfood', 'tacos, minced beef, fried chicken, sausage, french fries, sauce'),
(@IdTacosNewday, N'Tacos Thập Cẩm Khủng Lồ', N'Trứng, Thanh Cua, Heo Xông Khói, Bò Xào, Gà Giòn...', 150000, 'fastfood', 'tacos, mixed meats, egg, crab stick, french fries, sauce'),
(@IdTacosNewday, N'Tacos Tôm Xù', N'Phô Mai Kéo Sợi, Gà Giòn, Khoai Tây', 60000, 'fastfood', 'tacos, fried shrimp, cheese, french fries, sauce'),
(@IdTacosNewday, N'Sữa chuối choco', N'', 45000, 'beverage', 'banana milk, chocolate');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdMiTron, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mo4c2jn41hqc3a', 1),
(@IdOcTrungMuoi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81', 1),
(@IdMeCoffee, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjy8gqyiefic5f', 1),
(@IdKFCCentral, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7263n7cktr576', 1),
(@IdBanhKemNgon, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqzpf0z6wdz8f3', 1),
(@IdHLCentral, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4p0y66imod75', 1),
(@Id3Rau, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lybr59u0ff6p51', 1),
(@IdHLSo1, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4wpumewae992', 1),
(@IdHLWestGate, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mez6m6s08qh6ec', 1),
(@IdBanhTrang, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmw7m18wa51e0b', 1),
(@IdKFCNTT, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfamqpj7mzgre7', 1),
(@IdKFCHiepBinh, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7htrlzki6ur8c', 1),
(@IdBunDauLucPhat, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3y9k0dk9yxtca', 1),
(@IdPhoDuc2, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr6tsm3n4jwk64', 1),
(@IdBobapop, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8wsdnj4q83md1', 1),
(@IdGaNuong, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7ozf8bbm6nn50', 1),
(@IdComGaAHi, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7rp3l605t4hbe', 1),
(@IdHyyRuu, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdcyeh7wxhloe5', 1),
(@IdKFCGiga, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnoog0kgh15265', 1),
(@IdXoiBinhTien, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxvkcgg9qysee', 1),
(@IdMcDonalds, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn99twv38fm0cb', 1),
(@IdOcHa, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbq42uooq7039', 1),
(@IdBepNhaTho, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8nelbwycwvic2', 1),
(@IdTacosNewday, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmanmqbwav45bb', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Mì Trộn
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mo4c2jn41hqc3a' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Combo chiên mắm tỏi nhỏ (69k)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo8kghqff8jp50' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn thập cẩm - full topping' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mo48mjoa6j291f' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Mì trộn xúc xích - ốp la' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mo73tqem641v05' FROM MenuItems WHERE restaurant_id = @IdMiTron AND name = N'Phô mai que loại siêu to' UNION ALL

-- Ốc Trứng Muối
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc mỡ cháy tỏi tóp mỡ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Sò huyết xào me' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx5u0yzt3a81' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Sò lông mỡ hành' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-megx7vwewd1g14' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc khế nướng mắm tỏi' UNION ALL

-- MÊ Coffee
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjy8gqyiefic5f' FROM MenuItems WHERE restaurant_id = @IdMeCoffee AND name = N'Matcha Latte' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjy8rvvjztok2f' FROM MenuItems WHERE restaurant_id = @IdMeCoffee AND name = N'Trà Sữa MÊ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mlfwt6a1d4aqda' FROM MenuItems WHERE restaurant_id = @IdMeCoffee AND name = N'Dừa Sen Full Topping' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjy9o8olgqo7a6' FROM MenuItems WHERE restaurant_id = @IdMeCoffee AND name = N'Cacao Sữa Gấu' UNION ALL

-- KFC Central
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7263n7cktr576' FROM MenuItems WHERE restaurant_id = @IdKFCCentral AND name = N'Combo Cơm Trưa Phi-lê Gà Quay' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7262ix1kk8749' FROM MenuItems WHERE restaurant_id = @IdKFCCentral AND name = N'Combo Trưa Burger Tôm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmzw6t69v7cwe8' FROM MenuItems WHERE restaurant_id = @IdKFCCentral AND name = N'Combo 79k Trùm Deal ShopeeFood' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxid180hndl7c' FROM MenuItems WHERE restaurant_id = @IdKFCCentral AND name = N'1 Bánh Trứng' UNION ALL

-- Tiệm Bánh Kem Ngon
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqzpf0z6wdz8f3' FROM MenuItems WHERE restaurant_id = @IdBanhKemNgon AND name = N'Bánh su kem  hộp' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m2uylgrudgvue5' FROM MenuItems WHERE restaurant_id = @IdBanhKemNgon AND name = N'Bánh mì phô mai tan chảy' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr412x4ylrix11' FROM MenuItems WHERE restaurant_id = @IdBanhKemNgon AND name = N'Bánh crep sầu riêng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr442hqdj44952' FROM MenuItems WHERE restaurant_id = @IdBanhKemNgon AND name = N'Bông lan trứng muối phô mai tô giấy' UNION ALL

-- Highlands Central Mall
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-ml6vdsqgbocv29' FROM MenuItems WHERE restaurant_id = @IdHLCentral AND name = N'MatchaĐI Dừa Mây' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4v94zvx50h70' FROM MenuItems WHERE restaurant_id = @IdHLCentral AND name = N'Bánh Mì Que Pate Highlands' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnhe5zzeaayrd8' FROM MenuItems WHERE restaurant_id = @IdHLCentral AND name = N'Combo Sáng Highlands 58K' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4ojg5yhswxf6' FROM MenuItems WHERE restaurant_id = @IdHLCentral AND name = N'Trà Thanh Đào' UNION ALL

-- 3 Râu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lybr59u0ff6p51' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'COMBO MÌ Ý BÒ BẰM + 1 Coca-Cola' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'COMBO 5 - 1 MIẾNG GÀ GIÒN' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7tiz6s6cx37d6' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'GÀ VIÊN LẮC PHÔ MAI' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ly4sdhyyddw0b8' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'GÀ SỐT HÀN QUỐC' UNION ALL

-- Highlands Số 1
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4wpumewae992' FROM MenuItems WHERE restaurant_id = @IdHLSo1 AND name = N'Cà Phê Phin Đen Đá (Coffee)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjrd75azonie3b' FROM MenuItems WHERE restaurant_id = @IdHLSo1 AND name = N'Combo Tỉnh Táo Highlands' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnsq8x0zi77lcd' FROM MenuItems WHERE restaurant_id = @IdHLSo1 AND name = N'PhinĐI Matcha Dâu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lz4o51i9g5l922' FROM MenuItems WHERE restaurant_id = @IdHLSo1 AND name = N'Trà Thạch Vải' UNION ALL

-- Highlands West Gate
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mez6m6s08qh6ec' FROM MenuItems WHERE restaurant_id = @IdHLWestGate AND name = N'Trà Sữa Đài Loan' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mez6mlfbc7ij4d' FROM MenuItems WHERE restaurant_id = @IdHLWestGate AND name = N'Trà Sữa Hojicha' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mez6mdq8wb2j98' FROM MenuItems WHERE restaurant_id = @IdHLWestGate AND name = N'Trà Sen Vàng (Củ Năng)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mez6mulrfpxnfe' FROM MenuItems WHERE restaurant_id = @IdHLWestGate AND name = N'Trà Thạch Vải' UNION ALL

-- Bánh Tráng Lòng Đào
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmw7m18wa51e0b' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Chân gà sốt thái trứng non lòng đào' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmw77xr1r3lwd6' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Mẹt Bánh Tráng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmw73pxvwf7s99' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trà Xoài Chanh Dây' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmw743omexom20' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Matcha Latte' UNION ALL

-- KFC Nguyễn Thị Tú
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfamqpj7mzgre7' FROM MenuItems WHERE restaurant_id = @IdKFCNTT AND name = N'Combo Cơm Trưa Gà Mắm Tỏi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mff0v1m5nuoaca' FROM MenuItems WHERE restaurant_id = @IdKFCNTT AND name = N'Combo Trưa Mì Ý' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmzjgbn3f0n948' FROM MenuItems WHERE restaurant_id = @IdKFCNTT AND name = N'Combo Gà & Nuggets' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn1h9runvh8i65' FROM MenuItems WHERE restaurant_id = @IdKFCNTT AND name = N'Xế Xõa_Tặng Gà & Bánh Trứng' UNION ALL

-- KFC Hiệp Bình
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7htrlzki6ur8c' FROM MenuItems WHERE restaurant_id = @IdKFCHiepBinh AND name = N'Combo Cơm Trưa Gà Viên Nanban' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmzjrsojzeo329' FROM MenuItems WHERE restaurant_id = @IdKFCHiepBinh AND name = N'20 Gà Miếng Nuggets' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn1h83cr79qa0a' FROM MenuItems WHERE restaurant_id = @IdKFCHiepBinh AND name = N'Xế Xõa_Tặng Mì Ý' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnrd4ju899fka7' FROM MenuItems WHERE restaurant_id = @IdKFCHiepBinh AND name = N'COMBO HỘI CÚ ĐÊM 149K' UNION ALL

-- Bún Đậu Lực Phát
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3y9k0dk9yxtca' FROM MenuItems WHERE restaurant_id = @IdBunDauLucPhat AND name = N'Bún Đậu Thập Cẩm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3y9kmttf6sh08' FROM MenuItems WHERE restaurant_id = @IdBunDauLucPhat AND name = N'Combo 2 Người' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8zoy1431g0402' FROM MenuItems WHERE restaurant_id = @IdBunDauLucPhat AND name = N'Nem Chua Rán' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8zoy5lkh4qs03' FROM MenuItems WHERE restaurant_id = @IdBunDauLucPhat AND name = N'Chả Ốc' UNION ALL

-- Phở Đức 2
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr6tsm3n4jwk64' FROM MenuItems WHERE restaurant_id = @IdPhoDuc2 AND name = N'Phở tái' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr6u4rnatwp08b' FROM MenuItems WHERE restaurant_id = @IdPhoDuc2 AND name = N'Phở sườn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr6udfb4r1l02d' FROM MenuItems WHERE restaurant_id = @IdPhoDuc2 AND name = N'Hủ tiếu bò kho' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr6uddapp0nt09' FROM MenuItems WHERE restaurant_id = @IdPhoDuc2 AND name = N'Bò kho bánh mì' UNION ALL

-- Bobapop
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8wsdnj4q83md1' FROM MenuItems WHERE restaurant_id = @IdBobapop AND name = N'Trà Bá Tước sủi bọt size M' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqvt1ofpmd210b' FROM MenuItems WHERE restaurant_id = @IdBobapop AND name = N'Trà xanh sủi bọt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-820l4-mia9htfvjh1fbf' FROM MenuItems WHERE restaurant_id = @IdBobapop AND name = N'Trà sữa 4Q' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqvxaa7u3jq184' FROM MenuItems WHERE restaurant_id = @IdBobapop AND name = N'Hồng trà dâu' UNION ALL

-- Gà Nướng CoGaVa
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7ozf8bbm6nn50' FROM MenuItems WHERE restaurant_id = @IdGaNuong AND name = N'Combo gà quay 4 bánh + 1 cơm lam' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7ozemzktoee8a' FROM MenuItems WHERE restaurant_id = @IdGaNuong AND name = N'Gà nguyên con' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7ke5fo6m1rq42' FROM MenuItems WHERE restaurant_id = @IdGaNuong AND name = N'500g sườn nướng + 4 bánh' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7k7k2w2v30c22' FROM MenuItems WHERE restaurant_id = @IdGaNuong AND name = N'Cơm lam' UNION ALL

-- Cơm Gà A Hí
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7rp3l605t4hbe' FROM MenuItems WHERE restaurant_id = @IdComGaAHi AND name = N'Cơm gà xối mỡ lớn ( góc tư )' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7rp7ooeaoxdcb' FROM MenuItems WHERE restaurant_id = @IdComGaAHi AND name = N'Cơm chiên bò xào hành tây' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mbh2mwto40s4d0' FROM MenuItems WHERE restaurant_id = @IdComGaAHi AND name = N'Cơm chiên dương châu' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m7rp9amnhpkh97' FROM MenuItems WHERE restaurant_id = @IdComGaAHi AND name = N'Cơm chiên xúc xích 2 cây' UNION ALL

-- HyyRuu
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdcyeh7wxhloe5' FROM MenuItems WHERE restaurant_id = @IdHyyRuu AND name = N'COMBO 1 NGON HƠN NYC' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mepqh6lt57uq77' FROM MenuItems WHERE restaurant_id = @IdHyyRuu AND name = N'Mì trộn cơ bản' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-md9w6iec193330' FROM MenuItems WHERE restaurant_id = @IdHyyRuu AND name = N'nem chua rán Hà Nội' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-md9w4psmhu0va6' FROM MenuItems WHERE restaurant_id = @IdHyyRuu AND name = N'đậu hũ phô mai' UNION ALL

-- KFC Giga
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnoog0kgh15265' FROM MenuItems WHERE restaurant_id = @IdKFCGiga AND name = N'COMBO 6 MÓN 119K' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnkj1kddgum90f' FROM MenuItems WHERE restaurant_id = @IdKFCGiga AND name = N'Combo Cơm Phi-lê Gà quay' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnoog0be78cl6e' FROM MenuItems WHERE restaurant_id = @IdKFCGiga AND name = N'COMBO CÚ ĐÊM 149K' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnttqi4g3wnc65' FROM MenuItems WHERE restaurant_id = @IdKFCGiga AND name = N'Xế Xõa 1' UNION ALL

-- Xôi Bình Tiên
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxvkcgg9qysee' FROM MenuItems WHERE restaurant_id = @IdXoiBinhTien AND name = N'Xôi mặn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr5vpwstub44d7' FROM MenuItems WHERE restaurant_id = @IdXoiBinhTien AND name = N'Xôi nếp than' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxwvvggfgd595' FROM MenuItems WHERE restaurant_id = @IdXoiBinhTien AND name = N'Xôi ca dé' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m3u9fat81hns14' FROM MenuItems WHERE restaurant_id = @IdXoiBinhTien AND name = N'Xôi đùi gà' UNION ALL

-- McDonald's
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn99twv38fm0cb' FROM MenuItems WHERE restaurant_id = @IdMcDonalds AND name = N'Combo 1 Người - Gà Xốt Kem Lá Chanh' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn99twxu9gxse5' FROM MenuItems WHERE restaurant_id = @IdMcDonalds AND name = N'Phần Ăn 2 Miếng Gà Xốt Kem Lá Chanh' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mocsfy42ppn32a' FROM MenuItems WHERE restaurant_id = @IdMcDonalds AND name = N'Mua 1 tặng 1 giá 119k (2593)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mm1h6fxfe2o387' FROM MenuItems WHERE restaurant_id = @IdMcDonalds AND name = N'Mì Ý - Spaghetti (2661)' UNION ALL

-- ỐC HÀ
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbq42uooq7039' FROM MenuItems WHERE restaurant_id = @IdOcHa AND name = N'Ốc tỏi nướng mỡ hành 2con/phần' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mcowfmw4tcws67' FROM MenuItems WHERE restaurant_id = @IdOcHa AND name = N'Sò huyết rang me' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-mdbpuxswsmzg53' FROM MenuItems WHERE restaurant_id = @IdOcHa AND name = N'Trứng gà non xào bơ bắp' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mfm0egifrhfzac' FROM MenuItems WHERE restaurant_id = @IdOcHa AND name = N'Ốc bươu đồng hấp tiêu xanh' UNION ALL

-- Bếp Nhà Thỏ
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8nelbwycwvic2' FROM MenuItems WHERE restaurant_id = @IdBepNhaTho AND name = N'MÌ Ý SỐT- XÚC XÍCH' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mjrt4fnjy8sm3b' FROM MenuItems WHERE restaurant_id = @IdBepNhaTho AND name = N'MATCHA LATTE KEM MUỐI' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8xlmwo5gw3mfc' FROM MenuItems WHERE restaurant_id = @IdBepNhaTho AND name = N'MÌ Ý - GÀ SỐT HÀN QUỐC' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqz0cvfzu4ecef' FROM MenuItems WHERE restaurant_id = @IdBepNhaTho AND name = N'COMBO 2 :  Gà Sốt Phô Mai Tan Chảy + Trà Sữa Kem Trứng' UNION ALL

-- Bánh Tacos Newday
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmanmqbwav45bb' FROM MenuItems WHERE restaurant_id = @IdTacosNewday AND name = N'Tacos Bò Xào Gà Giòn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmanngebzmkj8e' FROM MenuItems WHERE restaurant_id = @IdTacosNewday AND name = N'Tacos Thập Cẩm Khủng Lồ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmanpasiduyq2f' FROM MenuItems WHERE restaurant_id = @IdTacosNewday AND name = N'Tacos Tôm Xù' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo50gaz7g83o60' FROM MenuItems WHERE restaurant_id = @IdTacosNewday AND name = N'Sữa chuối choco';