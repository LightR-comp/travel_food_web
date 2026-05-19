USE travel_food_db
GO

-- ==========================================
-- BÌNH THẠNH
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Bánh Mì Mập - Thịt Chả - Huỳnh Mẫn Đạt, Bình Thạnh', N'11a Huỳnh Mẫn Đạt, P. 19, Bình Thạnh, TP. HCM', 10.789764, 106.708612, 4.2, 35000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Mì Quảng Bình Thạnh - Phan Văn Hân', N'182 Phan Văn Hân, P. 17, Bình Thạnh, TP. HCM', 10.794219, 106.704493, 4.7, 65000, '07:00', '21:30', N'vietnamese, bình dân'),
(N'Bánh Mì Hamburger & Cà Phê Legacy Bình Thạnh - FastFood - Tân Cảnh', N'Đối Diện Số 37 Đường Tân Cảng, P. 25, Bình Thạnh, TP. HCM', 10.799973, 106.720925, 4.1, 40000, '06:30', '23:00', N'fastfood, bình dân'),
(N'Bánh Bao Thọ Phát Bình Thạnh', N'436 Nơ Trang Long, P. 13, Bình Thạnh, TP. HCM', 10.819502, 106.702884, 4.8, 30000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Ăn Vặt Bình Thạnh - Xôi Chiên - Lê Quang Định', N'377/9/45 Lê Quang Định, P. 5, Bình Thạnh, TP. HCM', 10.805903, 106.697358, 4.3, 30000, '14:00', '23:00', N'vietnamese, bình dân'),
(N'Phở Bò Thanh Đa - Bình Quới', N'61 Bình Quới, P. 27, Bình Thạnh, TP. HCM', 10.816072, 106.719036, 4.6, 65000, '06:00', '22:30', N'vietnamese, bình dân'),
(N'Bánh Mì Bình Định Thanh Mai - Nguyễn Quang Bích', N'2 Nguyễn Quang Bích, P. 13, Tân Bình, TP. HCM', 10.804661, 106.647395, 4.1, 30000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Quán Bún Cá Rô Đồng Bà Thành - Nguyễn Thái Bình', N'331A Nguyễn Thái Bình, P. 12, Tân Bình, TP. HCM', 10.796523, 106.652569, 4.4, 50000, '06:30', '21:30', N'vietnamese, bình dân'),
(N'Sầu Riêng - Lan Ngọc - Bình Thành', N'299 Bình Thành, Bình Tân, TP. HCM', 10.810678, 106.589189, 4.2, 200000, '08:00', '22:00', N'dessert, quà tặng'),
(N'Bánh Mì Bình Định Thanh Mai - 21 Lê Lợi', N'21 Lê Lợi, P. 4, Gò Vấp, TP. HCM', 10.820932, 106.687607, 4.3, 30000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Ăn Vặt - Landmark Bình Thạnh', N'Landmark 4, 208 Nguyễn Hữu Cảnh, Vinhomes Tân Cảng, Bình Thạnh, TP. HCM', 10.795470, 106.720677, 4.6, 80000, '15:00', '23:00', N'asian, bình dân'),
(N'Ăn Vặt Tiger - Khô Bò - Bình Thạnh', N'125/101/71A Đinh Tiên Hoàng, P. 3, Bình Thạnh, TP. HCM', 10.790678, 106.696982, 4.2, 120000, '09:00', '22:00', N'asian, nhậu'),
(N'Cơm Tấm Miền Tây - Bún Thịt Nướng & Bánh Mì Thịt Nướng - Bình Thành Liên Khu 4-5', N'6/3A Bình Thành, P. Bình Hưng Hòa B, Bình Tân, TP. HCM', 10.800050, 106.587155, 4.1, 45000, '06:00', '14:00', N'vietnamese, bình dân'),
(N'Hoàng Anh Bakery - Bánh Kem & Bánh Ngọt Ngon - Bình Thạnh', N'434 Nơ Trang Long, P. 13, Bình Thạnh, TP. HCM', 10.819489, 106.702865, 4.6, 150000, '07:00', '22:00', N'bakery, gia đình'),
(N'Omsom - Cà Phê Đặc Sản, Trà Sữa & Trà Trái Cây - Bình Thạnh', N'94 Chu Văn An, Bình Thạnh, TP. HCM', 10.810652, 106.709357, 4.8, 50000, '07:30', '22:30', N'cafe, bình dân'),
(N'Bánh Mì Hoàng Thanh - Hiệp Bình', N'45A Hiệp Bình, P. Hiệp Bình Chánh, Thành Phố Thủ Đức, TP. HCM', 10.840995, 106.731415, 4.1, 35000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Ăn Vặt Bé Thảo - Bình Thạnh', N'80/57D Hoàng Hoa Thám, P. 7, Bình Thạnh, TP. HCM', 10.807767, 106.690283, 4.7, 60000, '14:00', '23:30', N'asian, bình dân'),
(N'Bún Riêu & Canh Bún 30 - Bình Thạnh', N'16 Huỳnh Đình Hai, P. 14, Bình Thạnh, TP. HCM', 10.804983, 106.701509, 4.2, 55000, '06:30', '21:00', N'vietnamese, bình dân'),
(N'Hảo Vị Vạn Gia - Món Ăn Trung Quốc - 608 Điện Biên Phủ, Bình Thạnh', N'608 Điện Biên Phủ, P. 22, Bình Thạnh, TP. HCM', 10.799154, 106.718104, 4.9, 150000, '10:00', '22:00', N'chinese, gia đình'),
(N'Cơm Bắc Ngon - Cơm - Bình Thạnh', N'93 Trần Văn Kỷ, P. 14, Bình Thạnh, TP. HCM', 10.804253, 106.695973, 4.3, 50000, '10:00', '21:00', N'vietnamese, bình dân'),
(N'Yến Nhà Mình - 100% Yến Chưng Tươi Giao Nóng - Bình Thạnh', N'24/21 Trần Bình Trọng, P. 5, Bình Thạnh, TP. HCM', 10.811914, 106.689532, 4.7, 120000, '08:00', '21:00', N'healthy, quà tặng'),
(N'Súp Cua Ông Bắp - Bình Thạnh', N'122/5 Bùi Đình Tuý, P. 12, Bình Thạnh, TP. HCM', 10.808337, 106.704995, 4.4, 50000, '13:00', '22:00', N'vietnamese, bình dân'),
(N'Súp Cua Vương Gia - Điểm Tâm & Ăn Vặt - Bình Thạnh', N'69/23 Nguyễn Gia Trí, P. 25, Bình Thạnh, TP. HCM', 10.803527, 106.714709, 4.1, 40000, '10:00', '22:00', N'vietnamese, bình dân'),
(N'Bún Thái & Cơm Phủ Trứng - Bình Thạnh', N'24/2 Võ Oanh, P. 25, Bình Thạnh, TP. HCM', 10.803674, 106.719658, 4.2, 70000, '08:00', '22:00', N'asian, bình dân');
GO

DECLARE @IdBanhMiMap INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Mập - Thịt Chả - Huỳnh Mẫn Đạt, Bình Thạnh');
DECLARE @IdMiQuang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Quảng Bình Thạnh - Phan Văn Hân');
DECLARE @IdBurgerLegacy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Hamburger & Cà Phê Legacy Bình Thạnh - FastFood - Tân Cảnh');
DECLARE @IdBanhBaoThoPhat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Bao Thọ Phát Bình Thạnh');
DECLARE @IdXoiChien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Bình Thạnh - Xôi Chiên - Lê Quang Định');
DECLARE @IdPhoThanhDa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Bò Thanh Đa - Bình Quới');
DECLARE @IdBanhMiNQB INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Bình Định Thanh Mai - Nguyễn Quang Bích');
DECLARE @IdBunCaRo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Bún Cá Rô Đồng Bà Thành - Nguyễn Thái Bình');
DECLARE @IdSauRieng INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sầu Riêng - Lan Ngọc - Bình Thành');
DECLARE @IdBanhMiLL INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Bình Định Thanh Mai - 21 Lê Lợi');
DECLARE @IdAnVatLandmark INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt - Landmark Bình Thạnh');
DECLARE @IdKhoBoTiger INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Tiger - Khô Bò - Bình Thạnh');
DECLARE @IdComTamMienTay INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Miền Tây - Bún Thịt Nướng & Bánh Mì Thịt Nướng - Bình Thành Liên Khu 4-5');
DECLARE @IdHoangAnhBakery INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hoàng Anh Bakery - Bánh Kem & Bánh Ngọt Ngon - Bình Thạnh');
DECLARE @IdOmsom INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Omsom - Cà Phê Đặc Sản, Trà Sữa & Trà Trái Cây - Bình Thạnh');
DECLARE @IdBanhMiHoangThanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Hoàng Thanh - Hiệp Bình');
DECLARE @IdBeThao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ăn Vặt Bé Thảo - Bình Thạnh');
DECLARE @IdBunRieu30 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Riêu & Canh Bún 30 - Bình Thạnh');
DECLARE @IdHaoVi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hảo Vị Vạn Gia - Món Ăn Trung Quốc - 608 Điện Biên Phủ, Bình Thạnh');
DECLARE @IdComBac INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Bắc Ngon - Cơm - Bình Thạnh');
DECLARE @IdYenNhaMinh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Yến Nhà Mình - 100% Yến Chưng Tươi Giao Nóng - Bình Thạnh');
DECLARE @IdSupCuaOngBap INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Súp Cua Ông Bắp - Bình Thạnh');
DECLARE @IdSupCuaVuongGia INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Súp Cua Vương Gia - Điểm Tâm & Ăn Vặt - Bình Thạnh');
DECLARE @IdBunThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Thái & Cơm Phủ Trứng - Bình Thạnh');

-- ==========================================
-- CHÈN MENU (Lấy ngẫu nhiên 4 món)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdBanhMiMap, N'Bánh mì MẬP Đặc Biệt', N'Pate, Bơ, Chả Lụa, Thịt nguội, Thịt Khìa, Heo Quay', 33000, 'vietnamese', 'bread,pate,pork sausage,roast pork'),
(@IdBanhMiMap, N'Bánh bao Xá Xíu Xá Xíu', N'Nhân thịt heo nướng ướp đậm đà', 44999, 'vietnamese', 'bao bun,char siu pork'),
(@IdBanhMiMap, N'Bánh bao Chay - Vỏ Truyền Thống', N'Nhân chủ yếu từ rau củ, nấm, miến, đậu hũ', 29999, 'vegetarian', 'bao bun,mushroom,vegetables,tofu'),
(@IdBanhMiMap, N'Bánh Bao thịt trứng Muối , Cút', N'Nhân đậm đà từ thịt bằm, nấm, và trứng muối', 49999, 'vietnamese', 'bao bun,minced pork,salted egg,quail egg'),

(@IdMiQuang, N'Mì Quảng Thịt Trứng Cút', N'Có vị hơi cay nhẹ, hương vị thơm đậm đà', 53000, 'vietnamese', 'mi quang noodles,pork,quail egg'),
(@IdMiQuang, N'Mì Quảng Thập Cẩm', N'Mì Quảng thập cẩm với tôm, trứng cút, thịt heo, chả, sườn non, gà', 67000, 'vietnamese', 'mi quang noodles,mixed meat,shrimp,chicken'),
(@IdMiQuang, N'Mì Quảng Sườn Non', N'Nguyên liệu tươi sạch, nước dùng đậm đà', 61000, 'vietnamese', 'mi quang noodles,pork ribs'),
(@IdMiQuang, N'Mì Quảng Gà Ta', N'Nguyên liệu tươi sạch, nước dùng đậm đà', 59000, 'vietnamese', 'mi quang noodles,chicken'),

(@IdBurgerLegacy, N'Burger Xúc Xích', N'Xúc xích + rau + sốt', 28178, 'fastfood', 'hamburger,sausage,vegetables'),
(@IdBurgerLegacy, N'Burger Đầy Đủ', N'Thịt burger + phô mai + rau + sốt', 38000, 'fastfood', 'hamburger,beef,cheese,vegetables'),
(@IdBurgerLegacy, N'Sandwich Thịt Nguội', N'Thịt nguội + rau + sốt', 39000, 'fastfood', 'sandwich,ham,vegetables'),
(@IdBurgerLegacy, N'Hotdog Xúc Xích Phô Mai', N'', 36000, 'fastfood', 'hotdog,sausage,cheese'),

(@IdBanhBaoThoPhat, N'Hamburger bò', N'', 41550, 'fastfood', 'hamburger,beef'),
(@IdBanhBaoThoPhat, N'CAFE SỮA ĐÁ', N'', 23500, 'cafe', 'coffee,milk,ice'),
(@IdBanhBaoThoPhat, N'Combo Hoàn hảo 1 : Hamburger Gà + 1 Coca 320ml', N'1 Hamburger Gà + 1 Coca 320ml', 66000, 'fastfood', 'hamburger,chicken,coke'),
(@IdBanhBaoThoPhat, N'Combo 3 : 1 BB Thập Cẩm + 1 Coca', N'1 BB Thập Cẩm + 1 Coca 320ml', 67000, 'vietnamese', 'bao bun,mixed meat,coke'),

(@IdXoiChien, N'Combo 5 Cái Xôi Chiên Nhân Thịt', N'', 45600, 'vietnamese', 'fried sticky rice,pork'),
(@IdXoiChien, N'Combo 5 Xôi Thịt Chà Bông', N'', 52250, 'vietnamese', 'fried sticky rice,pork floss'),
(@IdXoiChien, N'3 Cái Xôi Chiên Nhân Thịt Chà Bông', N'', 30000, 'vietnamese', 'fried sticky rice,pork floss'),
(@IdXoiChien, N'1 Cái Xôi Chiên không nhân', N'', 7000, 'vietnamese', 'fried sticky rice'),

(@IdPhoThanhDa, N'Bò kho bánh mì', N'', 65000, 'vietnamese', 'beef stew,bread'),
(@IdPhoThanhDa, N'Phở bò kho', N'', 65000, 'vietnamese', 'pho noodles,beef stew'),
(@IdPhoThanhDa, N'Phở tái + bò viên', N'', 65000, 'vietnamese', 'pho noodles,rare beef,beef balls'),
(@IdPhoThanhDa, N'Pho Tái Nạm', N'', 65000, 'vietnamese', 'pho noodles,rare beef,beef flank'),

(@IdBanhMiNQB, N'Bánh mì Đặc Biệt', N'Nước sốt đặc biệt, chả lụa, chả cá, heo quay, chả ram', 32000, 'vietnamese', 'bread,pork sausage,fish cake,roast pork'),
(@IdBanhMiNQB, N'Bánh mì Trứng Opla', N'Nước sốt đặc biệt, trứng opla, chả ram', 22000, 'vietnamese', 'bread,fried egg,spring roll'),
(@IdBanhMiNQB, N'Bánh mì Heo Quay', N'Nước sốt đặc biệt, heo quay, chả ram', 30000, 'vietnamese', 'bread,roast pork,spring roll'),
(@IdBanhMiNQB, N'Matcha Latte [ size M ]', N'Trà matcha thơm ngon, sữa tươi béo ngậy, đá mát lạnh.', 34000, 'cafe', 'matcha,milk'),

(@IdBunCaRo, N'Bún cá rô đồng', N'', 48000, 'vietnamese', 'rice noodles,climbing perch fish'),
(@IdBunCaRo, N'Bánh đa cá rô đồng', N'', 48000, 'vietnamese', 'brown rice noodles,climbing perch fish'),
(@IdBunCaRo, N'Trà tắc', N'', 18622, 'beverage', 'kumquat tea'),
(@IdBunCaRo, N'Nước cam ép', N'', 27000, 'beverage', 'orange juice'),

(@IdSauRieng, N'500g cơm sầu Ri6', N'Cơm sầu vàng bắt mắt,vị béo ngậy', 199000, 'dessert', 'durian'),
(@IdSauRieng, N'Trái Sầu riêng Ri6 Cái mơn loại 1', N'Đặc trưng cơm vàng bắt mắt.vị béo ngậy', 150000, 'dessert', 'durian'),
(@IdSauRieng, N'Mít đỏ indo', N'Thịt mít ngọt đậm,thơm đậm,rất bắt miệng', 79000, 'dessert', 'jackfruit'),
(@IdSauRieng, N'Sầu Thái Monthong 2,5_3kg', N'', 450000, 'dessert', 'durian'),

(@IdBanhMiLL, N'Bánh mì Chả Cá', N'Nước sốt đặc biệt, chả cá, chả ram', 25178, 'vietnamese', 'bread,fish cake,spring roll'),
(@IdBanhMiLL, N'Bánh mì Heo Quay - Trứng luộc', N'Nước sốt đặc biệt, heo quay, trứng luộc, chả ram', 30000, 'vietnamese', 'bread,roast pork,boiled egg'),
(@IdBanhMiLL, N'Bánh mì Thịt - Chả - Trứng', N'Nước sốt đặc biệt, heo quay, chả lụa, trứng, chả ram', 30000, 'vietnamese', 'bread,roast pork,pork sausage,egg'),
(@IdBanhMiLL, N'Chả lụa (500gr)', N'1 cây (500gr)', 100000, 'vietnamese', 'pork sausage'),

(@IdAnVatLandmark, N'Cheese Tokbokki + Khoai Tây Lắc Phô Mai', N'', 139000, 'korean', 'tteokbokki,cheese,french fries'),
(@IdAnVatLandmark, N'Xúc Xích Chiên - 5 Xiên', N'', 79000, 'fastfood', 'sausage'),
(@IdAnVatLandmark, N'Khoai Tây Lắc Rong Biển', N'', 84000, 'snack', 'french fries,seaweed'),
(@IdAnVatLandmark, N'Cheese Tokbokki Lắc Phô Mai Sốt Sô-cô-la', N'', 84000, 'korean', 'tteokbokki,cheese,chocolate'),

(@IdKhoBoTiger, N'Mực Cán Tẩm Vị', N'KHÔ MỰC CÁN TẨM VỊ 1 hu pet 200 gr', 149000, 'snack', 'dried squid'),
(@IdKhoBoTiger, N'Xoài Sấy Muối Ớt', N'Lon pet 500gr', 129000, 'snack', 'dried mango,chili salt'),
(@IdKhoBoTiger, N'Khô Gà Lá Chanh - 500gr', N'', 149000, 'snack', 'dried chicken,lemon leaves'),
(@IdKhoBoTiger, N'Tóp Mỡ Liền Da Sốt Mắm Hành', N'Thơm lừng, cay cay, mặn mặn ngọt ngọt thấm đều từng miếng', 129000, 'snack', 'pork crackling,fish sauce,scallion'),

(@IdComTamMienTay, N'Bún Thịt Nướng Miền Tây', N'Thịt nướng, Bì, Chả giò rế miền Tây', 45000, 'vietnamese', 'rice noodles,grilled pork,shredded pork skin,spring roll'),
(@IdComTamMienTay, N'Cơm Sườn Miền Tây', N'Sườn, Bì, Nước súp đi kèm', 45000, 'vietnamese', 'broken rice,pork ribs,shredded pork skin'),
(@IdComTamMienTay, N'Trà sữa thái xanh (1 Lít)', N'Trà sữa kèm tẩy đá lớn', 35000, 'beverage', 'thai green milk tea'),
(@IdComTamMienTay, N'Trà sữa truyền thống (1 Lít)', N'', 35000, 'beverage', 'milk tea'),

(@IdHoangAnhBakery, N'BÁNH CUA PHÔ MAI', N'', 20000, 'bakery', 'cheese bread'),
(@IdHoangAnhBakery, N'BÔNG LAN PHÔ MAI NƯỚNG', N'', 25000, 'bakery', 'sponge cake,cheese'),
(@IdHoangAnhBakery, N'TART TRỨNG', N'', 20000, 'bakery', 'egg tart'),
(@IdHoangAnhBakery, N'BÔNG LAN TRỨNG MUỐI', N'', 60000, 'bakery', 'sponge cake,salted egg'),

(@IdOmsom, N'Espresso - 1 Shot Là Tỉnh', N'100% HẠT ARABICA CẦU ĐẤT', 45000, 'cafe', 'espresso'),
(@IdOmsom, N'Latte - Sữa Ôm Cà Phê', N'', 55000, 'cafe', 'latte,milk'),
(@IdOmsom, N'Americano - Đen Nhẹ Tênh', N'Espresso pha cùng nước lọc', 45000, 'cafe', 'americano'),
(@IdOmsom, N'Matcha Latte - Mát Tim', N'', 59000, 'cafe', 'matcha,milk'),

(@IdBanhMiHoangThanh, N'Bánh mì Gà xé', N'bao gồm bánh mì, đồ chua, dưa leo, hành ngò, bơ, pate, gà xé', 32000, 'vietnamese', 'bread,shredded chicken,pate'),
(@IdBanhMiHoangThanh, N'BÁNH MÌ CHẢ CÁ NHA TRANG', N'bánh mì, đồ chua, chả cá, dưa leo', 32000, 'vietnamese', 'bread,fish cake'),
(@IdBanhMiHoangThanh, N'Bánh mì nem nướng', N'BÁNH MÌ+ DƯA LEO+HÀNH NGÒ+BƠ+ PATE+NEM NƯỚNG', 32000, 'vietnamese', 'bread,grilled sausage,pate'),
(@IdBanhMiHoangThanh, N'XÔI CHẢ', N'XÔI, CHÀ BÔNG GÀ, CHẢ LỤA, HÀNH PHI', 30000, 'vietnamese', 'sticky rice,chicken floss,pork sausage'),

(@IdBeThao, N'SET 10 BỊCH CƠM CHÁY MẮM HÀNH', N'Cơm sốt mắm hành giòn rụm', 95900, 'snack', 'scorched rice,fish sauce,scallion'),
(@IdBeThao, N'TRÀ TẮC LY KHỔNG LỒ', N'', 20000, 'beverage', 'kumquat tea'),
(@IdBeThao, N'BÁNH TRÁNG CUỐN CHẤM SỐT ME BƠ', N'', 35000, 'snack', 'rice paper,tamarind sauce,butter'),
(@IdBeThao, N'ĐÁ ME LY 500ml', N'', 18000, 'beverage', 'tamarind drink'),

(@IdBunRieu30, N'Bún Riêu Cua Đồng', N'Gồm chả heo, riêu cua, huyết, đậu hũ, cà chua', 47000, 'vietnamese', 'rice noodles,crab paste,tofu,tomato'),
(@IdBunRieu30, N'Canh Bún Cua Đồng', N'Gồm chả heo, riêu cua, huyết, rau muống', 47000, 'vietnamese', 'thick rice noodles,crab paste,water spinach'),
(@IdBunRieu30, N'Bún riêu chả cá', N'Gồm chả heo, riêu cua, chả cá thác lác', 59000, 'vietnamese', 'rice noodles,crab paste,fish cake'),
(@IdBunRieu30, N'Bún riêu cua ốc xương nạc heo', N'Đậu hũ, chả heo, ốc bươu đen, xương nạc heo', 77000, 'vietnamese', 'rice noodles,crab paste,snail,pork bone'),

(@IdHaoVi, N'ẾCH NỒI KHÔ', N'Ếch xào cay khô, đậm vị, ăn rất bắt cơm', 199000, 'chinese', 'frog,spicy sauce'),
(@IdHaoVi, N'BÒ XÀO TIÊU ĐEN', N'Bò mềm thơm, vị tiêu cay nhẹ', 178000, 'chinese', 'beef,black pepper'),
(@IdHaoVi, N'Đậu hủ xốt tứ xuyên', N'Đậu hủ mềm, sốt cay tê đặc trưng', 168000, 'chinese', 'tofu,sichuan sauce'),
(@IdHaoVi, N'THỊT KHO TÀU KHOAI TÂY', N'Thịt mềm béo, kho cùng khoai bùi', 159000, 'chinese', 'braised pork,potato'),

(@IdComBac, N'Cơm gà rang gừng sả', N'', 48000, 'vietnamese', 'rice,chicken,ginger,lemongrass'),
(@IdComBac, N'Cơm thịt cuốn lá lốt canh cua', N'', 49000, 'vietnamese', 'rice,grilled pork in lolot leaves,crab soup'),
(@IdComBac, N'Cơm thịt luộc cà pháo mắm tôm', N'', 55000, 'vietnamese', 'rice,boiled pork,eggplant,shrimp paste'),
(@IdComBac, N'Cơm cá điêu hồng chiên', N'', 49000, 'vietnamese', 'rice,fried red tilapia'),

(@IdYenNhaMinh, N'Yến Chưng Tươi Đường Phèn', N'10gr Yến tươi, nước tinh khiết, đường phèn', 103500, 'healthy', 'bird nest,rock sugar'),
(@IdYenNhaMinh, N'Yến Chưng Tươi Hạt Sen Tươi', N'10gr Yến tươi, nước tinh khiết, Hạt Sen Tươi', 103500, 'healthy', 'bird nest,lotus seed'),
(@IdYenNhaMinh, N'Yến Chưng Tươi Táo Đỏ', N'10gr Yến tươi, nước tinh khiết, táo đỏ', 103500, 'healthy', 'bird nest,jujube'),
(@IdYenNhaMinh, N'Yến Chưng Tươi Kỷ Tử', N'10gr Yến tươi, nước tinh khiết, Kỷ tử', 103500, 'healthy', 'bird nest,goji berry'),

(@IdSupCuaOngBap, N'Súp Cua Đặc Biệt', N'Thịt cua, gà xé, trứng cút, bắp, óc, tủy', 98000, 'vietnamese', 'crab soup,chicken,quail egg,pig brain'),
(@IdSupCuaOngBap, N'Súp cua truyền thống', N'Súp cua + trứng cút + 1 ít tuỷ heo', 35000, 'vietnamese', 'crab soup,quail egg,pork marrow'),
(@IdSupCuaOngBap, N'Súp cua óc heo - nửa bộ', N'Súp cua + nửa bộ óc heo size lớn', 58000, 'vietnamese', 'crab soup,pig brain'),
(@IdSupCuaOngBap, N'Súp cua trứng bắc thảo - 1/2 trứng', N'Súp cua + nửa trứng bắc thảo siêu béo', 45000, 'vietnamese', 'crab soup,century egg'),

(@IdSupCuaVuongGia, N'Combo 1: Súp Cua 1 Bắc Thảo + 01 Coca Cola', N'', 71250, 'vietnamese', 'crab soup,century egg,coke'),
(@IdSupCuaVuongGia, N'Súp Cua (nhỏ)', N'1 trứng cút', 25000, 'vietnamese', 'crab soup,quail egg'),
(@IdSupCuaVuongGia, N'Súp Cua (lớn)', N'2 trứng cút', 35000, 'vietnamese', 'crab soup,quail egg'),
(@IdSupCuaVuongGia, N'Súp cua nửa bộ óc', N'1/2 bộ óc', 65000, 'vietnamese', 'crab soup,pig brain'),

(@IdBunThai, N'Bún Thái Hải Sản', N'Thịt bò, chả cá, tôm, mực và rau muống', 65000, 'thai', 'rice noodles,beef,seafood,water spinach'),
(@IdBunThai, N'Mì Thái Hải Sản', N'Thịt bò, tôm, mực, chả cá và rau muống', 65000, 'thai', 'noodles,beef,seafood,water spinach'),
(@IdBunThai, N'Cơm Chiên Phủ Trứng-Tôm', N'Cơm chiên trứng, rau củ, trứng chiên tôm', 68000, 'asian', 'fried rice,egg,shrimp'),
(@IdBunThai, N'CƠM CHIÊN PHỦ TRỨNG-BÒ XÀO', N'Cơm chiên trứng+rau củ, bò xào', 68000, 'asian', 'fried rice,egg,stir-fried beef');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdBanhMiMap, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lzyyj0f5x0eld1', 1),
(@IdMiQuang, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgc02mxqufij1e', 1),
(@IdBurgerLegacy, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqzsy74tblxgf6', 1),
(@IdBanhBaoThoPhat, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m48i3a2ct8c016', 1),
(@IdXoiChien, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-m05nud47xbzh21', 1),
(@IdPhoThanhDa, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3vrtbkdsbdea', 1),
(@IdBanhMiNQB, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lz5wfvkoww4hec', 1),
(@IdBunCaRo, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3kf4bt2eu17a', 1),
(@IdSauRieng, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmi7wx2oj1tx27', 1),
(@IdBanhMiLL, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m7vwzws3yd6s81', 1),
(@IdAnVatLandmark, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lwafa4wpcp21d0', 1),
(@IdKhoBoTiger, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m84oau20mz5z99', 1),
(@IdComTamMienTay, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn7uqurye0hv3b', 1),
(@IdHoangAnhBakery, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-ma1e0k7a8eu27f', 1),
(@IdOmsom, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-me9u122tv3er68', 1),
(@IdBanhMiHoangThanh, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqxdf2gk0f5wc8', 1),
(@IdBeThao, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m65fbvrq55xzec', 1),
(@IdBunRieu30, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr2w1btukja1fc', 1),
(@IdHaoVi, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnnzbzh666f475', 1),
(@IdComBac, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnvux042tfycdc', 1),
(@IdYenNhaMinh, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml5w2ww1pukjd6', 1),
(@IdSupCuaOngBap, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf42b99tvv2g20', 1),
(@IdSupCuaVuongGia, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnxpgd3pg7pdc3', 1),
(@IdBunThai, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm2pt0z5mqdrc8', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Bánh Mì Mập
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lzyyj0f5x0eld1' FROM MenuItems WHERE restaurant_id = @IdBanhMiMap AND name = N'Bánh mì MẬP Đặc Biệt' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-mjpg16ys9urmc2' FROM MenuItems WHERE restaurant_id = @IdBanhMiMap AND name = N'Bánh bao Xá Xíu Xá Xíu' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-mjqmz2ug5edced' FROM MenuItems WHERE restaurant_id = @IdBanhMiMap AND name = N'Bánh bao Chay - Vỏ Truyền Thống' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-81ztc-mkaprqcdytqb55' FROM MenuItems WHERE restaurant_id = @IdBanhMiMap AND name = N'Bánh Bao thịt trứng Muối , Cút' UNION ALL

-- Mì Quảng
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgc02mxqufij1e' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Thịt Trứng Cút' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgc085rv198ud0' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Thập Cẩm' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgc076dw90qw4f' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Sườn Non' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgc06yee28zx8a' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Gà Ta' UNION ALL

-- Burger Legacy
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqzsy74tblxgf6' FROM MenuItems WHERE restaurant_id = @IdBurgerLegacy AND name = N'Burger Xúc Xích' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqzxhjodux7dd6' FROM MenuItems WHERE restaurant_id = @IdBurgerLegacy AND name = N'Burger Đầy Đủ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-megx7cilqebm1f' FROM MenuItems WHERE restaurant_id = @IdBurgerLegacy AND name = N'Sandwich Thịt Nguội' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr6psk10be84bc' FROM MenuItems WHERE restaurant_id = @IdBurgerLegacy AND name = N'Hotdog Xúc Xích Phô Mai' UNION ALL

-- Thọ Phát
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m48i3a2ct8c016' FROM MenuItems WHERE restaurant_id = @IdBanhBaoThoPhat AND name = N'Hamburger bò' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mo6ou5cjho8w49' FROM MenuItems WHERE restaurant_id = @IdBanhBaoThoPhat AND name = N'CAFE SỮA ĐÁ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-mcg6zuq56fd1c0' FROM MenuItems WHERE restaurant_id = @IdBanhBaoThoPhat AND name = N'Combo Hoàn hảo 1 : Hamburger Gà + 1 Coca 320ml' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mh0lwxvdkxl598' FROM MenuItems WHERE restaurant_id = @IdBanhBaoThoPhat AND name = N'Combo 3 : 1 BB Thập Cẩm + 1 Coca' UNION ALL

-- Xôi Chiên
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-m05nud47xbzh21' FROM MenuItems WHERE restaurant_id = @IdXoiChien AND name = N'Combo 5 Cái Xôi Chiên Nhân Thịt' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-m05nzrmv9tan79' FROM MenuItems WHERE restaurant_id = @IdXoiChien AND name = N'Combo 5 Xôi Thịt Chà Bông' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m0tm333bsezx4e' FROM MenuItems WHERE restaurant_id = @IdXoiChien AND name = N'3 Cái Xôi Chiên Nhân Thịt Chà Bông' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m35z4ftzbydq16' FROM MenuItems WHERE restaurant_id = @IdXoiChien AND name = N'1 Cái Xôi Chiên không nhân' UNION ALL

-- Phở Thanh Đa
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3vrtbkdsbdea' FROM MenuItems WHERE restaurant_id = @IdPhoThanhDa AND name = N'Bò kho bánh mì' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqzdjjklfijde1' FROM MenuItems WHERE restaurant_id = @IdPhoThanhDa AND name = N'Phở bò kho' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqx514zc6d95e8' FROM MenuItems WHERE restaurant_id = @IdPhoThanhDa AND name = N'Phở tái + bò viên' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr6l337i4kw439' FROM MenuItems WHERE restaurant_id = @IdPhoThanhDa AND name = N'Pho Tái Nạm' UNION ALL

-- Bánh Mì NQB
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lz5wfvkoww4hec' FROM MenuItems WHERE restaurant_id = @IdBanhMiNQB AND name = N'Bánh mì Đặc Biệt' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lz5wm201hx2929' FROM MenuItems WHERE restaurant_id = @IdBanhMiNQB AND name = N'Bánh mì Trứng Opla' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lz5wnba55ndt2c' FROM MenuItems WHERE restaurant_id = @IdBanhMiNQB AND name = N'Bánh mì Heo Quay' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-map76m13hp6p96' FROM MenuItems WHERE restaurant_id = @IdBanhMiNQB AND name = N'Matcha Latte [ size M ]' UNION ALL

-- Bún Cá Rô
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3kf4bt2eu17a' FROM MenuItems WHERE restaurant_id = @IdBunCaRo AND name = N'Bún cá rô đồng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqytm5s2cmv87e' FROM MenuItems WHERE restaurant_id = @IdBunCaRo AND name = N'Bánh đa cá rô đồng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mdvpsfrp49vmdc' FROM MenuItems WHERE restaurant_id = @IdBunCaRo AND name = N'Trà tắc' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mdvpspjs0yrq2e' FROM MenuItems WHERE restaurant_id = @IdBunCaRo AND name = N'Nước cam ép' UNION ALL

-- Sầu Riêng
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmi7wx2oj1tx27' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'500g cơm sầu Ri6' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmi7ci7ex6a021' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Trái Sầu riêng Ri6 Cái mơn loại 1' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmzwbqtyxa8100' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Mít đỏ indo' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmi8eq6lyvb713' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Sầu Thái Monthong 2,5_3kg' UNION ALL

-- Bánh Mì LL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m7vwzws3yd6s81' FROM MenuItems WHERE restaurant_id = @IdBanhMiLL AND name = N'Bánh mì Chả Cá' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m7vwv86unzno0c' FROM MenuItems WHERE restaurant_id = @IdBanhMiLL AND name = N'Bánh mì Heo Quay - Trứng luộc' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m7vwyip58sas3e' FROM MenuItems WHERE restaurant_id = @IdBanhMiLL AND name = N'Bánh mì Thịt - Chả - Trứng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m7vws4p1tpac9d' FROM MenuItems WHERE restaurant_id = @IdBanhMiLL AND name = N'Chả lụa (500gr)' UNION ALL

-- Ăn Vặt Landmark
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lwafa4wpcp21d0' FROM MenuItems WHERE restaurant_id = @IdAnVatLandmark AND name = N'Cheese Tokbokki + Khoai Tây Lắc Phô Mai' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mk2us8tmjsaq1f' FROM MenuItems WHERE restaurant_id = @IdAnVatLandmark AND name = N'Xúc Xích Chiên - 5 Xiên' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm65we0m4mblc3' FROM MenuItems WHERE restaurant_id = @IdAnVatLandmark AND name = N'Khoai Tây Lắc Rong Biển' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml8quqp815vm03' FROM MenuItems WHERE restaurant_id = @IdAnVatLandmark AND name = N'Cheese Tokbokki Lắc Phô Mai Sốt Sô-cô-la' UNION ALL

-- Khô Bò Tiger
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m84oau20mz5z99' FROM MenuItems WHERE restaurant_id = @IdKhoBoTiger AND name = N'Mực Cán Tẩm Vị' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lxht2jdvlrkra9' FROM MenuItems WHERE restaurant_id = @IdKhoBoTiger AND name = N'Xoài Sấy Muối Ớt' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m284r7pyn25wb3' FROM MenuItems WHERE restaurant_id = @IdKhoBoTiger AND name = N'Khô Gà Lá Chanh - 500gr' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lsjdc0kz8og480' FROM MenuItems WHERE restaurant_id = @IdKhoBoTiger AND name = N'Tóp Mỡ Liền Da Sốt Mắm Hành' UNION ALL

-- Cơm Tấm Miền Tây
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn7uqurye0hv3b' FROM MenuItems WHERE restaurant_id = @IdComTamMienTay AND name = N'Bún Thịt Nướng Miền Tây' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn7ufjtbdfrabb' FROM MenuItems WHERE restaurant_id = @IdComTamMienTay AND name = N'Cơm Sườn Miền Tây' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn7vj0r0th52ad' FROM MenuItems WHERE restaurant_id = @IdComTamMienTay AND name = N'Trà sữa thái xanh (1 Lít)' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn7vqsgwk6x494' FROM MenuItems WHERE restaurant_id = @IdComTamMienTay AND name = N'Trà sữa truyền thống (1 Lít)' UNION ALL

-- Hoàng Anh Bakery
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-ma1e0k7a8eu27f' FROM MenuItems WHERE restaurant_id = @IdHoangAnhBakery AND name = N'BÁNH CUA PHÔ MAI' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-ma1e91evlegea6' FROM MenuItems WHERE restaurant_id = @IdHoangAnhBakery AND name = N'BÔNG LAN PHÔ MAI NƯỚNG' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-ma1eb7axneoqa0' FROM MenuItems WHERE restaurant_id = @IdHoangAnhBakery AND name = N'TART TRỨNG' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-ma1efnq2uryy7a' FROM MenuItems WHERE restaurant_id = @IdHoangAnhBakery AND name = N'BÔNG LAN TRỨNG MUỐI' UNION ALL

-- Omsom
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-me9u122tv3er68' FROM MenuItems WHERE restaurant_id = @IdOmsom AND name = N'Espresso - 1 Shot Là Tỉnh' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf3wa92m407c03' FROM MenuItems WHERE restaurant_id = @IdOmsom AND name = N'Latte - Sữa Ôm Cà Phê' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-me9u603404qr40' FROM MenuItems WHERE restaurant_id = @IdOmsom AND name = N'Americano - Đen Nhẹ Tênh' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-820l4-me9sj858sv0lf7' FROM MenuItems WHERE restaurant_id = @IdOmsom AND name = N'Matcha Latte - Mát Tim' UNION ALL

-- Bánh Mì Hoàng Thanh
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqxdf2gk0f5wc8' FROM MenuItems WHERE restaurant_id = @IdBanhMiHoangThanh AND name = N'Bánh mì Gà xé' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqxtkbl8m8ih1c' FROM MenuItems WHERE restaurant_id = @IdBanhMiHoangThanh AND name = N'BÁNH MÌ CHẢ CÁ NHA TRANG' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqz04p4qizyx84' FROM MenuItems WHERE restaurant_id = @IdBanhMiHoangThanh AND name = N'Bánh mì nem nướng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqxvondrk0wpa4' FROM MenuItems WHERE restaurant_id = @IdBanhMiHoangThanh AND name = N'XÔI CHẢ' UNION ALL

-- Bé Thảo
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m65fbvrq55xzec' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'SET 10 BỊCH CƠM CHÁY MẮM HÀNH' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-me64xo2tt4ar93' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'TRÀ TẮC LY KHỔNG LỒ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mj5mn3jvsow7d6' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'(BÉO NHON) BÁNH TRÁNG CUỐN CHẤM SỐT ME BƠ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn1ndnvdmv4234' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'ĐÁ ME LY 500ml' UNION ALL

-- Bún Riêu 30
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr2w1btukja1fc' FROM MenuItems WHERE restaurant_id = @IdBunRieu30 AND name = N'Bún Riêu Cua Đồng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr2w1ce46chw36' FROM MenuItems WHERE restaurant_id = @IdBunRieu30 AND name = N'Canh Bún Cua Đồng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr2wpcv2p4g477' FROM MenuItems WHERE restaurant_id = @IdBunRieu30 AND name = N'Bún riêu chả cá' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m65adhmq5z6f58' FROM MenuItems WHERE restaurant_id = @IdBunRieu30 AND name = N'Bún riêu cua ốc xương nạc heo' UNION ALL

-- Hảo Vị
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnnzbzh666f475' FROM MenuItems WHERE restaurant_id = @IdHaoVi AND name = N'ẾCH NỒI KHÔ / 干锅牛蛙 / Dry Pot Frog' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnnzbwj0csnce6' FROM MenuItems WHERE restaurant_id = @IdHaoVi AND name = N'BÒ XÀO TIÊU ĐEN / 黑胡椒牛肉 / Black Pepper Beef Stir-fry' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnnzbxwsiewz74' FROM MenuItems WHERE restaurant_id = @IdHaoVi AND name = N'Đậu hủ xốt tứ xuyên / MAPO TOFU / 麻婆豆腐' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnnzbx4sfh1i6b' FROM MenuItems WHERE restaurant_id = @IdHaoVi AND name = N'THỊT KHO TÀU KHOAI TÂY / 土豆红烧肉 / Braised Pork with Potatoes' UNION ALL

-- Cơm Bắc
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnvux042tfycdc' FROM MenuItems WHERE restaurant_id = @IdComBac AND name = N'Cơm gà rang gừng sả' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m149c0iwy7i33a' FROM MenuItems WHERE restaurant_id = @IdComBac AND name = N'Cơm thịt cuốn lá lốt canh cua/ canh ngót' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m149aaejuuey84' FROM MenuItems WHERE restaurant_id = @IdComBac AND name = N'Cơm thịt luộc cà pháo mắm tôm canh cua' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m14a1ra2r9164f' FROM MenuItems WHERE restaurant_id = @IdComBac AND name = N'Cơm cá điêu hồng chiên' UNION ALL

-- Yến Nhà Mình
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml5w2ww1pukjd6' FROM MenuItems WHERE restaurant_id = @IdYenNhaMinh AND name = N'Yến Chưng Tươi Đường Phèn - Tăng Miễn Dịch' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml5w0oqhih3ca5' FROM MenuItems WHERE restaurant_id = @IdYenNhaMinh AND name = N'Yến Chưng Tươi Hạt Sen Tươi - Ngủ Ngon' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml5w1wnk69z882' FROM MenuItems WHERE restaurant_id = @IdYenNhaMinh AND name = N'Yến Chưng Tươi Táo Đỏ - Bổ Máu' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-ml5w4srpwmq5bf' FROM MenuItems WHERE restaurant_id = @IdYenNhaMinh AND name = N'Yến Chưng Tươi Kỷ Tử - Bổ Thận' UNION ALL

-- Súp Cua Ông Bắp
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf42b99tvv2g20' FROM MenuItems WHERE restaurant_id = @IdSupCuaOngBap AND name = N'Súp Cua Đặc Biệt ( Full 9 lọai topping )' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf42cvkwo1zjaf' FROM MenuItems WHERE restaurant_id = @IdSupCuaOngBap AND name = N'Súp cua truyền thống' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf42bqkjf9caea' FROM MenuItems WHERE restaurant_id = @IdSupCuaOngBap AND name = N'Súp cua óc heo - nửa bộ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mf42edt0pfree6' FROM MenuItems WHERE restaurant_id = @IdSupCuaOngBap AND name = N'Súp cua trứng bắc thảo - 1/2 trứng' UNION ALL

-- Súp Cua Vương Gia
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mnxpgd3pg7pdc3' FROM MenuItems WHERE restaurant_id = @IdSupCuaVuongGia AND name = N'Combo 1: Súp Cua 1 Bắc Thảo + 01 Coca Cola (kèm Tẩy đá)' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmked3hillvnc2' FROM MenuItems WHERE restaurant_id = @IdSupCuaVuongGia AND name = N'Súp Cua (nhỏ)' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmke79tmob2954' FROM MenuItems WHERE restaurant_id = @IdSupCuaVuongGia AND name = N'Súp Cua (lớn)' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmkebv3dpmo2d2' FROM MenuItems WHERE restaurant_id = @IdSupCuaVuongGia AND name = N'Súp cua nửa bộ óc' UNION ALL

-- Bún Thái
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm2pt0z5mqdrc8' FROM MenuItems WHERE restaurant_id = @IdBunThai AND name = N'Bún Thái Hải Sản' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm2ptgk06z9re8' FROM MenuItems WHERE restaurant_id = @IdBunThai AND name = N'Mì Thái Hải Sản' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm2pu7t33oxtb6' FROM MenuItems WHERE restaurant_id = @IdBunThai AND name = N'Cơm Chiên Phủ Trứng-Tôm (kèm canh rong biển)' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm3en3ylo0zo4d' FROM MenuItems WHERE restaurant_id = @IdBunThai AND name = N'CƠM CHIÊN PHỦ TRỨNG-BÒ XÀO (kèm canh rong biển)';