USE travel_food_db
GO

-- ==========================================
-- QUẬN 1
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Cháo Sườn Cô Giang - Quận 1', N'15bis Đinh Tiên Hoàng, P. Đa Kao, Quận 1, TP. HCM', 10.79038, 106.6974993, 4.7, 40000, '06:00', '23:00', 'vietnamese'),
(N'Nem Nướng Nha Trang - Since 1982 - Quận 1', N'Hẻm TK 25/3 Trần Hưng Đạo, P. Cầu Kho, Quận 1, TP. HCM', 10.7577826, 106.687461, 3.8, 70000, '09:00', '22:00', 'vietnamese'),
(N'Cơm Phủ Trứng Sốt Sệt - Quận 1', N'Số 7B Tôn Thất Tùng, P. Phạm Ngũ Lão, Quận 1, TP. HCM', 10.7701035, 106.6883820, 4.3, 75000, '10:00', '21:00', 'asian'),
(N'Bún Ốc Sườn Cô Sáu - Quận 1', N'454 Hai Bà Trưng, P. Tân Định , Quận 1, TP. HCM', 10.7917682, 106.6871762, 4.6, 65000, '07:00', '22:00', 'vietnamese'),
(N'Bánh Mì 1 Phút 30 Giây - Lạc Long Quân', N'219 Lạc Long Quân, P. 3, Quận 11, TP. HCM', 10.7639496, 106.6421519, 4.2, 35000, '06:00', '13:00', 'fastfood'),
(N'Bánh Kem Phương Loan Quận 1 - Cống Quỳnh', N'185F Cống Quỳnh, P. Phạm Ngũ Lão, Quận 1, TP. HCM', 10.7664286, 106.6883326, 4.9, 100000, '08:00', '22:00', 'bakery'),
(N'Trà Sữa Thế Giới - Nguyễn Du', N'155 Nguyễn Du, P. Bến Thành, Quận 1, TP. HCM', 10.7723079, 106.6929944, 4.4, 25000, '09:00', '23:00', 'beverage'),
(N'Quán Chay Diệu Hạnh - Tân Thới Nhất 1', N'75/6Bis Tân Thới Nhất 1, P. Tân Thới Nhất, Quận 12, TP. HCM', 10.8335575, 106.6160156, 0.3, 30000, '07:00', '20:00', 'vegetarian'),
(N'Bún Mắm Nêm Chị Linh Quận 1 - 15 Lê Thánh Tôn', N'15 Lê Thánh Tôn, P. Bến Nghé, Quận 1, TP. HCM', 10.7808536, 106.7048691, 4.7, 55000, '08:00', '21:00', 'vietnamese'),
(N'Vua Gà Tần - Since 1999 - Quận 1', N'130 Cô Bắc, P. Cô Giang, Quận 1, TP. HCM', 10.7644521, 106.6941977, 4.1, 120000, '10:00', '23:00', 'vietnamese'),
(N'Gà Tần Gia Bảo - Quận 1', N'TK24/9 Nguyễn Cảnh Chân, P. Cầu Kho, Quận 1, TP. HCM', 10.7573279, 106.6891781, 4.8, 110000, '09:00', '22:30', 'vietnamese'),
(N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Quận 1', N'42/2 Trần Đình Xu, P. Cô Giang, Quận 1, TP. HCM', 10.7599604, 106.6923702, 4.3, 150000, '10:00', '21:30', 'korean'),
(N'Tiệm Xôi Mềm - CN Nguyễn Trãi Quận 1', N'215J-215K Nguyễn Trãi, P. Cầu Ông Lãnh, Quận 1, TP. HCM', 10.7649255, 106.6877622, 4.6, 55000, '07:00', '22:00', 'vietnamese'),
(N'BẾP LÀNH QUẬN 1 - COFFEE, TEA & CƠM VĂN PHÒNG', N'331/03 Trần Hưng Đạo, P. Cầu Ông Lãnh, Quận 1, TP. HCM', 10.7615468, 106.6903982, 4.7, 50000, '07:00', '20:00', 'cafe'),
(N'Highlands Coffee - Trà, Cà Phê & Bánh - 46 Bùi Thị Xuân - Quận 1', N'46 - 48 Bùi Thị Xuân, P. Bến Thành, Quận 1, TP. HCM', 10.7715827, 106.6899971, 4.4, 60000, '07:00', '23:00', 'cafe'),
(N'Hủ Tiếu Cô Tám Quận 1 - Nguyễn Thái Bình', N'Đối Diện 81 Nguyễn Thái Bình, P. Nguyễn Thái Bình, Quận 1, TP. HCM', 10.7691748, 106.6997809, 4.8, 60000, '06:00', '14:00', 'vietnamese');
GO

DECLARE @IdChaoSuon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Sườn Cô Giang - Quận 1');
DECLARE @IdNemNuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Quận 1');
DECLARE @IdComPhuTrung INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Phủ Trứng Sốt Sệt - Quận 1');
DECLARE @IdBunOc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Ốc Sườn Cô Sáu - Quận 1');
DECLARE @IdBanhMi1P30s INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì 1 Phút 30 Giây - Lạc Long Quân');
DECLARE @IdBanhKemPL INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Kem Phương Loan Quận 1 - Cống Quỳnh');
DECLARE @IdTraSuaTG INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa Thế Giới - Nguyễn Du');
DECLARE @IdChayDH INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Chay Diệu Hạnh - Tân Thới Nhất 1');
DECLARE @IdBunMamLinh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Mắm Nêm Chị Linh Quận 1 - 15 Lê Thánh Tôn');
DECLARE @IdVuaGaTan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Vua Gà Tần - Since 1999 - Quận 1');
DECLARE @IdGaTanGB INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Tần Gia Bảo - Quận 1');
DECLARE @IdCoThao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Quận 1');
DECLARE @IdXoiMem INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Xôi Mềm - CN Nguyễn Trãi Quận 1');
DECLARE @IdBepLanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'BẾP LÀNH QUẬN 1 - COFFEE, TEA & CƠM VĂN PHÒNG');
DECLARE @IdHighlands INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - 46 Bùi Thị Xuân - Quận 1');
DECLARE @IdCoTam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Cô Tám Quận 1 - Nguyễn Thái Bình');

-- ==========================================
-- CHÈN MENU (3 MÓN CHÍNH GIỮA CỦA MỖI QUÁN)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdChaoSuon, N'Cháo Sườn Thịt Bằm', N'', 42000, 'vietnamese', 'porridge,pork ribs,minced pork'),
(@IdChaoSuon, N'CHÁO SƯỜN TRỨNG BÁCH THẢO', N'', 44000, 'vietnamese', 'porridge,pork ribs,century egg'),
(@IdChaoSuon, N'Cháo Thịt Bằm Quẩy', N'', 41000, 'vietnamese', 'porridge,minced pork,fried dough'),

(@IdNemNuong, N'Nem Nướng Nha Trang + 30 Tôm Viên Chiên + Trà Tắc', N'', 90300, 'vietnamese', 'grilled pork sausage,fried shrimp balls,kumquat tea'),
(@IdNemNuong, N'Nem Nướng Nha Trang + 30 Cá Viên Chiên + Trà Tắc', N'', 90300, 'vietnamese', 'grilled pork sausage,fried fish balls,kumquat tea'),
(@IdNemNuong, N'Combo 5 Nem Chua Rán Chị Hạnh + Trà Tắc', N'', 49000, 'vietnamese', 'fried fermented pork roll,kumquat tea'),

(@IdComPhuTrung, N'Cơm cá hồi bạch tuộc phủ trứng', N'', 79000, 'asian', 'rice,salmon,octopus,egg'),
(@IdComPhuTrung, N'Cơm bạch tuộc phủ trứng', N'', 69000, 'asian', 'rice,octopus,egg'),
(@IdComPhuTrung, N'Phở bò sốt vang', N'', 89000, 'vietnamese', 'pho noodles,beef stew,wine sauce'),

(@IdBunOc, N'Bún ốc to bò', N'', 63050, 'vietnamese', 'rice noodles,large snail,beef'),
(@IdBunOc, N'Bún ốc to sườn', N'', 67900, 'vietnamese', 'rice noodles,large snail,pork ribs'),
(@IdBunOc, N'Bún ốc lẫn bò', N'Ốc to + ốc nhỏ + bò', 63050, 'vietnamese', 'rice noodles,snail,beef'),

(@IdBanhMi1P30s, N'Combo Hamburger + Thức Uống', N'', 33000, 'fastfood', 'hamburger,drink'),
(@IdBanhMi1P30s, N'Combo Hotdog + Thức Uống', N'', 33000, 'fastfood', 'hotdog,drink'),
(@IdBanhMi1P30s, N'Combo Pita Tôm + Thức Uống', N'', 43000, 'fastfood', 'pita bread,shrimp,drink'),

(@IdBanhKemPL, N'Pannacotta chanh dây việt quất dâu tây', N'', 20000, 'bakery', 'pannacotta,passion fruit,blueberry,strawberry'),
(@IdBanhKemPL, N'Bông lan cuộn kem', N'', 35000, 'bakery', 'sponge cake,cream'),
(@IdBanhKemPL, N'Bánh kem Hàn Quốc happy birthday', N'', 300000, 'bakery', 'cake,cream'),

(@IdTraSuaTG, N'Trà Sữa Lài Mật Ong', N'', 18000, 'beverage', 'jasmine tea,milk,honey'),
(@IdTraSuaTG, N'Trà Việt Quất Trân Châu', N'', 17000, 'beverage', 'blueberry tea,boba'),
(@IdTraSuaTG, N'Trà Đào Trân Châu', N'', 17000, 'beverage', 'peach tea,boba'),

(@IdChayDH, N'Cơm rau (các món rau có thể t...', N'', 25000, 'vegetarian', 'rice,vegetables'),
(@IdChayDH, N'Bánh bao chay', N'', 23000, 'vegetarian', 'vegan steamed bun,mushroom'),
(@IdChayDH, N'Cơm thập cẩm và đậu hủ kho', N'', 33000, 'vegetarian', 'rice,mixed veg,braised tofu'),

(@IdBunMamLinh, N'Gỏi đu đủ ngó sen', N'', 60000, 'vietnamese', 'papaya,lotus stem,herbs'),
(@IdBunMamLinh, N'Combo Bánh hỏi heo quay đầy đủ', N'', 55000, 'vietnamese', 'woven rice noodles,roast pork,herbs'),
(@IdBunMamLinh, N'Gỏi đu đủ', N'', 55000, 'vietnamese', 'papaya,herbs,fish sauce'),

(@IdVuaGaTan, N'Măng chua ngâm ớt', N'Măng chua cay ăn cùng mì gà rất ngon', 5000, 'vietnamese', 'pickled bamboo shoots,chili'),
(@IdVuaGaTan, N'Rau ngải cứu đã hầm', N'rau ngải cứu đã hầm thêm dành cho quý khách thích ăn rau', 20000, 'vietnamese', 'stewed mugwort'),
(@IdVuaGaTan, N'Bánh mì', N'Bánh mì đặc ruột', 8000, 'vietnamese', 'bread'),

(@IdGaTanGB, N'Ngọc kê gà ta tiềm thuốc bắc, ngải cứu 200g', N'1 lạng kê khoảng 7,8 quả tiềm thuốc bắc, ngải cứu', 240000, 'vietnamese', 'chicken testicles,herbs,mugwort'),
(@IdGaTanGB, N'Bộ cổ cánh gà ta tiềm thuốc bắc, ngải cứu', N'Cổ và bộ 2 cánh gà ta tần ngải cứu, táo đỏ, hạt sen', 95000, 'vietnamese', 'chicken neck,chicken wings,herbs,mugwort'),
(@IdGaTanGB, N'Gà ta tiềm thuốc bắc, ngải cứu nguyên con', N'gà ta (ri) size nhỏ 800-900g, nguyên con tươi ngon hầm ngải cứu', 200000, 'vietnamese', 'whole chicken,herbs,mugwort'),

(@IdCoThao, N'Set 5 - Cơm tôm, trứng ngâm tương', N'Món gồm: 4 tôm, 1 trứng lòng đào, kim chi, rau cải mầm', 124000, 'korean', 'rice,soy-marinated shrimp,egg'),
(@IdCoThao, N'(GẠO LỨT) Set cơm gạo lứt ngâm tương', N'- Set 1: Cơm (gạo lứt) cá hồi ngâm tương', 1000, 'korean', 'brown rice,soy-marinated salmon'),
(@IdCoThao, N'Cá hồi Nauy ngâm tương S - 120g', N'6-7 pcs cá hồi ngâm tương. Dùng kèm: kim chi', 225000, 'korean', 'salmon,soy sauce,kimchi'),

(@IdXoiMem, N'Xôi thịt kho, trứng kho', N'', 58000, 'vietnamese', 'sticky rice,braised pork,braised egg'),
(@IdXoiMem, N'Xôi chà bông, chả mỡ', N'LƯU Ý: Giá món đã bao gồm VAT ạ huhu', 54000, 'vietnamese', 'sticky rice,pork floss,pork sausage'),
(@IdXoiMem, N'Xôi chả mỡ, trứng kho', N'LƯU Ý: Giá món đã bao gồm VAT ạ', 56000, 'vietnamese', 'sticky rice,pork sausage,braised egg'),

(@IdBepLanh, N'MATCHA LATTE DÂU Size L', N'Matcha Latte Dâu là một phiên bản ngọt ngào', 49000, 'cafe', 'matcha,milk,strawberry'),
(@IdBepLanh, N'COFFEE MATCHA Size L', N'Coffee Matcha là một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê', 49000, 'cafe', 'coffee,matcha,milk'),
(@IdBepLanh, N'MATCHA LATTE DÂU Size M', N'Matcha Latte Dâu là một phiên bản ngọt ngào', 39000, 'cafe', 'matcha,milk,strawberry'),

(@IdHighlands, N'Trà Sen Vàng M', N'Từ Ô Long kết hợp với hương sen thanh mát', 59000, 'cafe', 'oolong tea,lotus seed,water chestnut'),
(@IdHighlands, N'Trà Sen Vàng L', N'Từ Ô Long kết hợp với hương sen thanh mát', 69000, 'cafe', 'oolong tea,lotus seed,water chestnut'),
(@IdHighlands, N'Trà Sen Vàng S', N'Từ Ô Long kết hợp với hương sen thanh mát', 49000, 'cafe', 'oolong tea,lotus seed,water chestnut'),

(@IdCoTam, N'Hủ tiếu thập cẩm', N'Chưa bao gồm dụng cụ ăn uống', 65000, 'vietnamese', 'hu tieu noodles,mixed meat,broth'),
(@IdCoTam, N'Hủ tiếu xương', N'Chưa bao gồm dụng cụ ăn uống', 60000, 'vietnamese', 'hu tieu noodles,pork bone,broth'),
(@IdCoTam, N'Hủ tiếu thịt', N'Chưa bao gồm dụng cụ ăn uống', 60000, 'vietnamese', 'hu tieu noodles,pork,broth');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdChaoSuon, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lsu1j5ud2655c4@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdNemNuong, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7ras8-mbdkkpydg6oo16@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdComPhuTrung, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7ras8-mcd5d2ydc6gsf0@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBunOc, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lzi28fuml36598@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhMi1P30s, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lsty67odkdz86c@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhKemPL, 'https://down-cvs-vn.img.susercontent.com/vn-11134259-7ras8-m4bjymto930008@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTraSuaTG, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lsu2pa6yrydg5b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChayDH, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-81ztc-mmbrecthdczo4e@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBunMamLinh, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lv1jhm4whud56e@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdVuaGaTan, 'https://down-cvs-vn.img.susercontent.com/vn-11134259-820l4-mh752ciebv2l0c@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdGaTanGB, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-7ra0g-m7ui0hwwiqv7fd@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdCoThao, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-820l4-mi2xfx966knc9d@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdXoiMem, 'https://down-cvs-vn.img.susercontent.com/vn-11134259-81ztc-mn5hrerr8lxe92@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBepLanh, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-81ztc-mma4ttf0zksi96@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdHighlands, 'https://down-cvs-vn.img.susercontent.com/vn-11134513-81ztc-mnuydm94s9oi84@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdCoTam, 'https://down-cvs-vn.img.susercontent.com/vn-11134259-7r98o-m0cpvhc658tp5c@resize_ss280x175!@crop_w280_h175_cT', 1);

-- ==========================================
-- CHÈN ẢNH CHO TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Cháo Sườn Cô Giang
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lu4him3vc8wva3' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Cháo Sườn Thịt Bằm' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lu4hnwy62dxt90' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'CHÁO SƯỜN TRỨNG BÁCH THẢO' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lu4h2w03rk0ha8' FROM MenuItems WHERE restaurant_id = @IdChaoSuon AND name = N'Cháo Thịt Bằm Quẩy' UNION ALL

-- Nem Nướng
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm024upz04xt66' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem Nướng Nha Trang + 30 Tôm Viên Chiên + Trà Tắc' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm023rly9g5g2d' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Nem Nướng Nha Trang + 30 Cá Viên Chiên + Trà Tắc' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mgarivqa6hhm19' FROM MenuItems WHERE restaurant_id = @IdNemNuong AND name = N'Combo 5 Nem Chua Rán Chị Hạnh + Trà Tắc' UNION ALL

-- Cơm Phủ Trứng
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-mchepcnwh40s8f' FROM MenuItems WHERE restaurant_id = @IdComPhuTrung AND name = N'Cơm cá hồi bạch tuộc phủ trứng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134505-81ztc-mm9vlzjncjcx8c' FROM MenuItems WHERE restaurant_id = @IdComPhuTrung AND name = N'Cơm bạch tuộc phủ trứng' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-mca2fm0y23lo0e' FROM MenuItems WHERE restaurant_id = @IdComPhuTrung AND name = N'Phở bò sốt vang' UNION ALL

-- Bún Ốc
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lzpmtqe47xhpdd' FROM MenuItems WHERE restaurant_id = @IdBunOc AND name = N'Bún ốc to bò' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lzpmszuuc9sx98' FROM MenuItems WHERE restaurant_id = @IdBunOc AND name = N'Bún ốc to sườn' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lzpmsjyob5whea' FROM MenuItems WHERE restaurant_id = @IdBunOc AND name = N'Bún ốc lẫn bò' UNION ALL

-- Bánh Mì 1P30s
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m5tm6gg72nqwf8' FROM MenuItems WHERE restaurant_id = @IdBanhMi1P30s AND name = N'Combo Hamburger + Thức Uống' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqziw16esi4ka3' FROM MenuItems WHERE restaurant_id = @IdBanhMi1P30s AND name = N'Combo Hotdog + Thức Uống' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ra0g-m790yiwf4unnbb' FROM MenuItems WHERE restaurant_id = @IdBanhMi1P30s AND name = N'Combo Pita Tôm + Thức Uống' UNION ALL

-- Bánh Kem Phương Loan
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-megx5p5o2p6p59' FROM MenuItems WHERE restaurant_id = @IdBanhKemPL AND name = N'Pannacotta chanh dây việt quất dâu tây' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-megxp5e1kw06b3' FROM MenuItems WHERE restaurant_id = @IdBanhKemPL AND name = N'Bông lan cuộn kem' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-mauwealc9plj84' FROM MenuItems WHERE restaurant_id = @IdBanhKemPL AND name = N'Bánh kem Hàn Quốc happy birthday' UNION ALL

-- Trà Sữa Thế Giới
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqyv2j5fc6u136' FROM MenuItems WHERE restaurant_id = @IdTraSuaTG AND name = N'Trà Sữa Lài Mật Ong' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3kxk6xkxp53b' FROM MenuItems WHERE restaurant_id = @IdTraSuaTG AND name = N'Trà Việt Quất Trân Châu' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3lpwlubuf8e0' FROM MenuItems WHERE restaurant_id = @IdTraSuaTG AND name = N'Trà Đào Trân Châu' UNION ALL

-- Quán Chay Diệu Hạnh
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn2arzxhtv5xae' FROM MenuItems WHERE restaurant_id = @IdChayDH AND name = N'Cơm rau (các món rau có thể t...' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmbdygnkiiv6ab' FROM MenuItems WHERE restaurant_id = @IdChayDH AND name = N'Bánh bao chay' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mmbitvu380lf67' FROM MenuItems WHERE restaurant_id = @IdChayDH AND name = N'Cơm thập cẩm và đậu hủ kho' UNION ALL

-- Bún Mắm Nêm Chị Linh
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lv01gatgvy1x88' FROM MenuItems WHERE restaurant_id = @IdBunMamLinh AND name = N'Gỏi đu đủ ngó sen' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lv01hsmg3ztedb' FROM MenuItems WHERE restaurant_id = @IdBunMamLinh AND name = N'Combo Bánh hỏi heo quay đầy đủ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lv01fqbou6ud17' FROM MenuItems WHERE restaurant_id = @IdBunMamLinh AND name = N'Gỏi đu đủ' UNION ALL

-- Vua Gà Tần
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mhg6u1yjm29y24' FROM MenuItems WHERE restaurant_id = @IdVuaGaTan AND name = N'Măng chua ngâm ớt' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mhg6oqn1tiiu54' FROM MenuItems WHERE restaurant_id = @IdVuaGaTan AND name = N'Rau ngải cứu đã hầm' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-miz5ihyyfu2u66' FROM MenuItems WHERE restaurant_id = @IdVuaGaTan AND name = N'Bánh mì' UNION ALL

-- Gà Tần Gia Bảo
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mlgaau1r2uwy84' FROM MenuItems WHERE restaurant_id = @IdGaTanGB AND name = N'Ngọc kê gà ta tiềm thuốc bắc, ngải cứu 200g' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mlgaavy39on533' FROM MenuItems WHERE restaurant_id = @IdGaTanGB AND name = N'Bộ cổ cánh gà ta tiềm thuốc bắc, ngải cứu' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mlgaavqjtfr943' FROM MenuItems WHERE restaurant_id = @IdGaTanGB AND name = N'Gà ta tiềm thuốc bắc, ngải cứu nguyên con' UNION ALL

-- Cô Thảo
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lr3qe9bz6uu15a' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Set 5 - Cơm tôm, trứng ngâm tương' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mjbldcsbqxol48' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'(GẠO LỨT) Set cơm gạo lứt ngâm tương' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7r98o-lqyyclevldxg25' FROM MenuItems WHERE restaurant_id = @IdCoThao AND name = N'Cá hồi Nauy ngâm tương S - 120g' UNION ALL

-- Xôi Mềm
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn5ig11i6zns04' FROM MenuItems WHERE restaurant_id = @IdXoiMem AND name = N'Xôi thịt kho, trứng kho' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn5ier3xbh1hec' FROM MenuItems WHERE restaurant_id = @IdXoiMem AND name = N'Xôi chà bông, chả mỡ' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mn5if8diqtxe26' FROM MenuItems WHERE restaurant_id = @IdXoiMem AND name = N'Xôi chả mỡ, trứng kho' UNION ALL

-- Bếp Lành
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm8a290rgsn979' FROM MenuItems WHERE restaurant_id = @IdBepLanh AND name = N'MATCHA LATTE DÂU Size L' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm8a28wnib5w6b' FROM MenuItems WHERE restaurant_id = @IdBepLanh AND name = N'COFFEE MATCHA Size L' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-81ztc-mm8a290rgsn979' FROM MenuItems WHERE restaurant_id = @IdBepLanh AND name = N'MATCHA LATTE DÂU Size M' UNION ALL

-- Highlands Coffee
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mjps9goxc5j957' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Trà Sen Vàng M' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mjpsa8ix82kl96' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Trà Sen Vàng L' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-820l4-mjpsc35vl89360' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Trà Sen Vàng S' UNION ALL

-- Hủ Tiếu Cô Tám
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m0hdkt8jo1rhd2' FROM MenuItems WHERE restaurant_id = @IdCoTam AND name = N'Hủ tiếu thập cẩm' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m0hdo0dl6ahb19' FROM MenuItems WHERE restaurant_id = @IdCoTam AND name = N'Hủ tiếu xương' UNION ALL
SELECT id, 'https://down-cvs-vn.img.susercontent.com/vn-11134517-7ras8-m0hdyhgjczv3f2' FROM MenuItems WHERE restaurant_id = @IdCoTam AND name = N'Hủ tiếu thịt';