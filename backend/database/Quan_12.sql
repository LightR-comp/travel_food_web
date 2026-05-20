USE travel_food_db
GO

-- ==========================================
-- QUẬN 12
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Phở Nguyên Quận 12 - Vườn Lài', N'51A Vườn Lài, P. An Phú Đông, Quận 12, TP. HCM', 10.863468, 106.690417, 4.2, 50000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Súp Cua Cô 8', N'76/49 Đ.369 - TTH.21 Khu Phố 1, P. Tân Thới Hiệp, Quận 12, TP. HCM', 10.860969, 106.646513, 4.7, 60000, '10:00', '21:00', N'vietnamese, bình dân'),
(N'Tiệm Mùa Hạ - Trà & Bánh - Thạnh Xuân Quận 12', N'20/53 Thạnh Xuân 24, Khu Phố 7, P. Thạnh Xuân, Quận 12, TP. HCM', 10.873976, 106.673103, 4.3, 50000, '09:00', '22:00', N'cafe, bình dân'),
(N'Mì Cay Nam Hàn - Mì Cay & Tokbokki - Đông Hưng Thuận 2', N'191/30 Đông Hưng Thuận 2, P. Tân Hưng Thuận, Quận 12, TP. HCM', 10.839079, 106.627498, 4.8, 65000, '09:00', '22:30', N'korean, bình dân'),
(N'NT Food - Mì Trộn Indo - Gà Rán & Ăn Vặt', N'292 Huỳnh Thị Hai, P. Tân Chánh Hiệp, Quận 12, TP. HCM', 10.867033, 106.625224, 4.1, 55000, '08:00', '22:00', N'asian, bình dân'),
(N'Mì Ý Happy Meal - Nui & Nước - 481/9/21 HT17', N'481/9/21 HT17, P. Hiệp Thành, Quận 12, TP. HCM', 10.883152, 106.642093, 4.6, 45000, '09:00', '21:30', N'italian, bình dân'),
(N'Trà Sữa Te Amo - 109 Dương Thị Mười', N'109 Dương Thị Mười, Khu Phố 6, P. Hiệp Thành, Quận 12, TP. HCM', 10.875230, 106.640012, 4.9, 30000, '08:00', '22:30', N'cafe, bình dân'),
(N'Cô Lan - Bún Thịt Nướng & Bột Chiên - Nguyễn Văn Quá', N'715/23/1 Nguyễn Văn Quá, P. Đông Hưng Thuận, Quận 12, TP. HCM', 10.847112, 106.633436, 4.3, 40000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Quán Cơm Gà Mắm Tỏi 1208 - Nguyễn Văn Quá', N'1208 Nguyễn Văn Quá, P. Tân Thới Hiệp, Quận 12, TP. HCM', 10.855831, 106.639251, 4.6, 65000, '09:00', '22:00', N'vietnamese, bình dân'),
(N'Cá Viên Chiên TyBy - Trần Thị Hè', N'621/39/2/4 Trần Thị Hè, P. Hiệp Thành, Quận 12, TP. HCM', 10.880628, 106.627846, 4.2, 60000, '15:00', '23:30', N'asian, bình dân'),
(N'3 Râu - Gà Rán Pizza & Trà Sữa – 1208 Nguyễn Văn Quá', N'1208 Nguyễn Văn Quá, Tổ 5, Khu Phố 2A, P. Tân Thới Hiệp, Quận 12, TP. HCM', 10.855826, 106.639274, 4.4, 65000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Trà Sữa HongKong Baley - Phan Văn Hớn', N'93 Phan Văn Hớn, P. Tân Thới Nhất, Quận 12, TP. HCM', 10.828145, 106.620263, 4.7, 35000, '08:00', '22:00', N'cafe, bình dân'),
(N'Cháo Sò Huyết 1999 - Hiệp Thành 13', N'585 Hiệp Thành 13, Quận 12, TP. HCM', 10.885557, 106.631548, 4.8, 60000, '15:00', '23:00', N'seafood, bình dân'),
(N'TUTIMI - Milo Dầm - Trà Sữa & Cà Phê - 71A Nguyễn Văn Quá', N'71A Nguyễn Văn Quá, P. Tân Hưng Thuận, Quận 12, TP. HCM', 10.828357, 106.626737, 4.2, 40000, '08:00', '22:30', N'cafe, bình dân'),
(N'Phở Nguyễn - Tô Ký', N'250 Tô Ký, P. Tân Chánh Hiệp, Quận 12, TP. HCM', 10.857072, 106.620231, 4.1, 60000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Quán Ăn 7 Thức - Bún Riêu & Hủ Tiếu', N'121 Lê Văn Khương, P. Hiệp Thành, Quận 12, TP. HCM', 10.877546, 106.648881, 4.6, 50000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Gà Nướng Cơm Lam - Trần Tính', N'42 Tân Chánh Hiệp 18, P. Tân Chánh Hiệp, Quận 12, TP. HCM', 10.864723, 106.617366, 4.3, 150000, '09:00', '22:00', N'vietnamese, gia gia đình'),
(N'PHONG VŨ - BÁNH MÌ HÀ NỘI, XÔI MẶN & BÁNH BAO - TÔ KÝ', N'169 Tô Ký, P. Đông Hưng Thuận, Quận 12, TP. HCM', 10.849130, 106.632675, 4.8, 35000, '06:00', '22:00', N'vietnamese, bình dân');

-- Đã gộp Batch (Không dùng chữ GO ở đây) để giữ phạm vi hoạt động cho các biến DECLARE

DECLARE @IdPhoNguyen INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Nguyên Quận 12 - Vườn Lài');
DECLARE @IdSupCuaCo8 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Súp Cua Cô 8');
DECLARE @IdTiemMuaHa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Mùa Hạ - Trà & Bánh - Thạnh Xuân Quận 12');
DECLARE @IdMiCayNamHan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Nam Hàn - Mì Cay & Tokbokki - Đông Hưng Thuận 2');
DECLARE @IdNTFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'NT Food - Mì Trộn Indo - Gà Rán & Ăn Vặt');
DECLARE @IdMiYHappyMeal INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Ý Happy Meal - Nui & Nước - 481/9/21 HT17');
DECLARE @IdTeAmo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa Te Amo - 109 Dương Thị Mười');
DECLARE @IdCoLan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cô Lan - Bún Thịt Nướng & Bột Chiên - Nguyễn Văn Quá');
DECLARE @IdComGa1208 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Cơm Gà Mắm Tỏi 1208 - Nguyễn Văn Quá');
DECLARE @IdTyBy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cá Viên Chiên TyBy - Trần Thị Hè');
DECLARE @Id3Rau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'3 Râu - Gà Rán Pizza & Trà Sữa – 1208 Nguyễn Văn Quá');
DECLARE @IdBaley INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trà Sữa HongKong Baley - Phan Văn Hớn');
DECLARE @IdChaoSoHuyet INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Sò Huyết 1999 - Hiệp Thành 13');
DECLARE @IdTutimi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'TUTIMI - Milo Dầm - Trà Sữa & Cà Phê - 71A Nguyễn Văn Quá');
DECLARE @IdPhoNguyenToKy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Nguyễn - Tô Ký');
DECLARE @IdQuan7Thuc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Ăn 7 Thức - Bún Riêu & Hủ Tiếu');
DECLARE @IdGaNuongCL INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Nướng Cơm Lam - Trần Tính');
DECLARE @IdPhongVu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'PHONG VŨ - BÁNH MÌ HÀ NỘI, XÔI MẶN & BÁNH BAO - TÔ KÝ');

-- ==========================================
-- CHÈN MENU
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdPhoNguyen, N'Phở tái', N'', 40000, 'vietnamese', 'pho noodles, rare beef'),
(@IdPhoNguyen, N'Phở tái nạm', N'', 47000, 'vietnamese', 'pho noodles, rare beef, beef flank'),
(@IdPhoNguyen, N'Phở gà', N'', 40000, 'vietnamese', 'pho noodles, chicken'),
(@IdPhoNguyen, N'Bún thập cẩm', N'', 47000, 'vietnamese', 'rice noodles, mixed meat, broth'),

(@IdSupCuaCo8, N'Súp cua truyền thống', N'CUA, SỤN GÀ, TRỨNG CÚT', 43000, 'vietnamese', 'crab soup, quail egg, cartilage'),
(@IdSupCuaCo8, N'Súp cua bắc thảo', N'CUA, SỤN GÀ, TRỨNG CÚT, TRỨNG BẮC THẢO', 60000, 'vietnamese', 'crab soup, century egg'),
(@IdSupCuaCo8, N'Súp cua hải sản', N'CUA, SỤN GÀ, TRỨNG CÚT, TÔM, MỰC', 85000, 'vietnamese', 'crab soup, seafood'),
(@IdSupCuaCo8, N'Súp cua 1/2 óc heo', N'CUA, SỤN GÀ, TRỨNG CÚT, 1/2 ÓC HEO', 75000, 'vietnamese', 'crab soup, pig brain'),

(@IdTiemMuaHa, N'Trà sữa chai TRUYỀN THỐNG 330ml', N'', 40000, 'beverage', 'milk tea'),
(@IdTiemMuaHa, N'Chân Gà RÚT XƯƠNG SẢ TẮC (Hộp 500GR)', N'100gr chân gà rút xương + hủ muối chấm', 94000, 'snack', 'boneless chicken feet, lemongrass, kumquat'),
(@IdTiemMuaHa, N'Chân gà rút xương TRỘN mắm TOMYUM - Size M', N'100gr chân gà rút xương, sử dụng xoài hoặc cóc', 94000, 'snack', 'boneless chicken feet, tomyum sauce, mango'),
(@IdTiemMuaHa, N'Chân Gà RÚT XƯƠNG SẢ TẮC (Hộp 750GR) + TẶNG 1 chai trà sữa', N'120gr chân gà rút xương + hủ muối chấm', 119000, 'snack', 'boneless chicken feet, lemongrass, kumquat, milk tea'),

(@IdMiCayNamHan, N'Mì cay hải sản đặc biệt', N'Vui lòng note cấp độ cay từ 1-7', 68000, 'korean', 'spicy noodles, seafood'),
(@IdMiCayNamHan, N'Mì cay xúc xích cá viên', N'Vui lòng note cấp độ cay từ 1-7', 48000, 'korean', 'spicy noodles, sausage, fish balls'),
(@IdMiCayNamHan, N'Mì cay bò', N'Vui lòng note cấp độ cay từ 1-7', 68000, 'korean', 'spicy noodles, beef'),
(@IdMiCayNamHan, N'Mì cay nam hàn đặc biệt', N'', 88000, 'korean', 'spicy noodles, mixed toppings'),

(@IdNTFood, N'MÌ TƯƠNG ĐEN TRỨNG ỐP LA', N'Mì đen mềm, trứng ốp la béo ngậy, hấp dẫn lôi cuốn.', 29000, 'asian', 'jajangmyeon, fried egg'),
(@IdNTFood, N'MÌ TƯƠNG ĐEN ĐÙI GÀ GIÒN+TRỨNG CHIÊN(Tặng sốt tự chọn)', N'Mì đen đậm đà, đùi gà giòn, trứng chiên béo ngậy.', 65000, 'asian', 'jajangmyeon, fried chicken, fried egg'),
(@IdNTFood, N'Cơm Chiên Hải Sản', N'', 79000, 'asian', 'fried rice, seafood'),
(@IdNTFood, N'MÌ XÀO BÒ', N'', 59000, 'asian', 'fried noodles, beef'),

(@IdMiYHappyMeal, N'Mì Ý Xốt Bò Bằm Phô Mai', N'1 phần : 120gr mì + phô mai', 35000, 'italian', 'spaghetti, minced beef, cheese'),
(@IdMiYHappyMeal, N'Nui Xốt Bò Bằm Phô Mai', N'1 phần : 120gr nui + phô mai', 35000, 'italian', 'macaroni, minced beef, cheese'),
(@IdMiYHappyMeal, N'Mỳ ý + Gà viên popcorn', N'1 phần : 120gr mì + 60gr gà viên', 50000, 'italian', 'spaghetti, popcorn chicken'),
(@IdMiYHappyMeal, N'Khoai tây chiên', N'', 27000, 'fastfood', 'french fries'),

(@IdTeAmo, N'TRÀ ĐÀO CAM SẢ', N'', 18000, 'beverage', 'peach tea, orange, lemongrass'),
(@IdTeAmo, N'LỤC TRÀ NHO', N'', 26000, 'beverage', 'green tea, grape'),
(@IdTeAmo, N'HỒNG TRÀ TRÂN CHÂU 3Q', N'Hồng trà tươi. Topping trân châu 3Q', 18000, 'beverage', 'black tea, boba'),
(@IdTeAmo, N'TRÀ SỮA BÍ ĐAO', N'', 27000, 'beverage', 'winter melon milk tea'),

(@IdCoLan, N'Bún thịt nướng (chả giò + thịt)', N'Bún, thịt nướng, chả giò, xà lách, quế, giá...', 42000, 'vietnamese', 'rice noodles, grilled pork, spring roll'),
(@IdCoLan, N'Bột chiên 2 trứng', N'Bột chiên, trứng, đu đủ, hành lá và đậu phộng', 38000, 'vietnamese', 'fried rice flour, egg, papaya'),
(@IdCoLan, N'Nui chiên 1 trứng', N'Nui chiên, trứng, đu đủ, hành lá và đậu phộng', 34000, 'vietnamese', 'fried macaroni, egg'),
(@IdCoLan, N'Mì xào bò', N'Mì xào, thịt bò, rau cải ngọt, hành phi và tiêu', 40000, 'vietnamese', 'fried noodles, beef, vegetables'),

(@IdComGa1208, N'Cơm Gà góc tư mắm tỏi đặc biệt', N'Gà góc tư +Dưa leo + tỏi + ớt', 67000, 'vietnamese', 'rice, chicken leg, garlic fish sauce'),
(@IdComGa1208, N'Cơm gà góc tư sốt ngọt đặc biệt', N'', 67000, 'vietnamese', 'rice, chicken leg, sweet sauce'),
(@IdComGa1208, N'Cơm gà viên sốt chua ngọt', N'', 65000, 'vietnamese', 'rice, chicken balls, sweet and sour sauce'),
(@IdComGa1208, N'Cơm gà góc tư xối mỡ đặc biệt', N'', 67000, 'vietnamese', 'rice, fried chicken'),

(@IdTyBy, N'Combo 30 Cá Tôm Bò Viên Chiên + Trà Tắc', N'10 Cá Viên 10 Tôm Viên 10 Bò Viên', 54000, 'snack', 'fish balls, shrimp balls, beef balls, kumquat tea'),
(@IdTyBy, N'Combo 24 Hoành Thánh Chiên + Coca', N'Phần 20 Viên Ăn Kèm Sa Tế Tương Ớt', 58500, 'snack', 'fried wonton, coke'),
(@IdTyBy, N'Combo Cá Viên Thập Cẩm 15 Món Truyền Thống', N'Phần 15 Món: Đậu Bắp, Cá Viên, Tôm Viên...', 73800, 'snack', 'mixed fried balls'),
(@IdTyBy, N'Khoai Tây Chiên', N'Phần 150g Ăn Kèm Sốt Mayo', 40000, 'fastfood', 'french fries'),

(@Id3Rau, N'COMBO 2 Miếng Gà + 1 Coca-Cola', N'Giảm 25K khi đặt combo có Coca-Cola.', 83600, 'fastfood', 'fried chicken, coke'),
(@Id3Rau, N'COMBO 5 - 1 MIẾNG GÀ GIÒN + Khoai + 1 Coca-Cola', N'1 miếng gà giòn + khoai tây chiên + nước ngọt', 57000, 'fastfood', 'fried chicken, french fries, coke'),
(@Id3Rau, N'CƠM GÀ GIÒN XỐT', N'Cơm trắng, má đùi, xốt tuỳ chọn, xà lách, cà chua', 51000, 'fastfood', 'rice, fried chicken, sauce'),
(@Id3Rau, N'COMBO 3 - GÀ VIÊN CHIÊN GIÒN', N'Gà viên chiên giòn + khoai tây chiên + nước ngọt', 66000, 'fastfood', 'fried chicken balls, french fries, coke'),

(@IdBaley, N'Trà Sữa Khoai Môn Tươi', N'Trà sữa khoai môn tươi hoà quyện vị béo bùi', 33000, 'beverage', 'taro milk tea'),
(@IdBaley, N'Matcha latte', N'Sữa thơm béo,matcha thơm lừng tươi mát', 33000, 'cafe', 'matcha, milk'),
(@IdBaley, N'Trà Sữa HongKong Baley', N'Vị trà đậm đà được nhập từ HongKong.', 23000, 'beverage', 'hong kong milk tea'),
(@IdBaley, N'Trà Sữa Kem Trứng Nướng', N'Vị trà sữa đậm đà kết hợp lớp kem trứng nướng', 33000, 'beverage', 'milk tea, egg cream'),

(@IdChaoSoHuyet, N'Sò huyết Rang Muối Ớt', N'Sò Huyết  bao tươi sống', 61733, 'seafood', 'blood cockle, chili salt'),
(@IdChaoSoHuyet, N'Cháo sò huyết', N'', 46000, 'seafood', 'blood cockle porridge'),
(@IdChaoSoHuyet, N'Cháo Sò huyết +Hàu', N'Sò Huyết + Hàu', 60000, 'seafood', 'blood cockle, oyster porridge'),
(@IdChaoSoHuyet, N'Ốc Hương Cháy tỏi', N'', 65000, 'seafood', 'sweet snail, garlic'),

(@IdTutimi, N'Milo Dầm Full Topping Tutimi', N'Lượng đường cố định', 43650, 'cafe', 'milo, mixed toppings'),
(@IdTutimi, N'Cà Phê Kem Muối Biển Size 530ml', N'', 34200, 'cafe', 'coffee, salt cream'),
(@IdTutimi, N'Trà Sữa Olong Trân Châu Trắng', N'', 19000, 'beverage', 'oolong milk tea, white boba'),
(@IdTutimi, N'Mây Đào size 530ml', N'Olong thơm dịu, đào thanh mát', 19000, 'beverage', 'peach tea'),

(@IdQuan7Thuc, N'Bún riêu thập cẩm', N'', 55000, 'vietnamese', 'rice noodles, crab paste, mixed toppings'),
(@IdQuan7Thuc, N'Canh bún', N'', 45000, 'vietnamese', 'thick rice noodles, crab paste'),
(@IdQuan7Thuc, N'Hủ tiếu thập cẩm', N'', 55000, 'vietnamese', 'hu tieu noodles, mixed toppings'),
(@IdQuan7Thuc, N'Bánh canh chả cá nha trang đặc biệt', N'Chả cá nha trang, trứng cút, giò heo', 55000, 'vietnamese', 'thick noodles, fish cake, quail egg, pork knuckle'),

(@IdGaNuongCL, N'Gà nướng mật ong', N'Ăn kèm rau răm, đồ chua, dưa leo, muối ớt đỏ', 185000, 'vietnamese', 'roasted chicken, honey'),
(@IdGaNuongCL, N'Gà nướng có phủ ớt', N'Ăn kèm rau răm, đồ chua, dưa leo, muối ớt đỏ', 180000, 'vietnamese', 'roasted chicken, chili'),
(@IdGaNuongCL, N'Gà nướng mắc khén', N'', 185000, 'vietnamese', 'roasted chicken, mac khen pepper'),
(@IdGaNuongCL, N'1/2 Con Gà Ủ Muối không đầu, không chân', N'', 110000, 'vietnamese', 'salted chicken'),

(@IdPhongVu, N'Bánh mì thịt chả đặc biệt', N'4 loại chả ngon Bơ patê chà bông', 16500, 'vietnamese', 'bread, mixed pork sausage, pate'),
(@IdPhongVu, N'Bánh mì heo quay', N'Bơ patê heo quay', 30000, 'vietnamese', 'bread, roasted pork'),
(@IdPhongVu, N'Xôi Mặn Đặc Biệt Hộp Lớn', N'Bơ patê 4loại 2 chả lặp sưởng 3 trứng cút chà bông', 37000, 'vietnamese', 'sticky rice, mixed toppings'),
(@IdPhongVu, N'Bánh Bao Trứng Cút', N'2 Trưng cút+thịt', 26000, 'vietnamese', 'bao bun, quail egg, pork');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdPhoNguyen, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvpwatisrgmaa', 1),
(@IdSupCuaCo8, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr36hi8uvsm167', 1),
(@IdTiemMuaHa, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT', 1),
(@IdMiCayNamHan, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m2xs1relgquoa9', 1),
(@IdNTFood, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhx7x4b96qdc73', 1),
(@IdMiYHappyMeal, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdyhuu5urgu9c0', 1),
(@IdTeAmo, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9pqgrnstidge3', 1),
(@IdCoLan, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7gk2p2bavwc39', 1),
(@IdComGa1208, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzhiamf1wasd5', 1),
(@IdTyBy, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr02wyvqotcp05', 1),
(@Id3Rau, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lvwvwzeus2jf9f', 1),
(@IdBaley, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3n8ahem6jzp64', 1),
(@IdChaoSoHuyet, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-m08jt4nexo19d6', 1),
(@IdTutimi, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjpozc9v0c1zf5', 1),
(@IdPhoNguyenToKy, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1rzb3oonbgfd7', 1),
(@IdQuan7Thuc, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr5ux0a0iqx07a', 1),
(@IdGaNuongCL, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3p8n2iya4v572', 1),
(@IdPhongVu, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7ymwyiqmhdze5', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Phở Nguyên Quận 12
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvpwatisrgmaa' FROM MenuItems WHERE restaurant_id = @IdPhoNguyen AND name = N'Phở tái' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvpwatisrgmaa' FROM MenuItems WHERE restaurant_id = @IdPhoNguyen AND name = N'Phở tái nạm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvpwatisrgmaa' FROM MenuItems WHERE restaurant_id = @IdPhoNguyen AND name = N'Phở gà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvpridfpu6a20' FROM MenuItems WHERE restaurant_id = @IdPhoNguyen AND name = N'Bún thập cẩm' UNION ALL

-- Súp Cua Cô 8
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr36hi8uvsm167' FROM MenuItems WHERE restaurant_id = @IdSupCuaCo8 AND name = N'Súp cua truyền thống' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr35x43t7i559a' FROM MenuItems WHERE restaurant_id = @IdSupCuaCo8 AND name = N'Súp cua bắc thảo' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr36hhr3ls5gf8' FROM MenuItems WHERE restaurant_id = @IdSupCuaCo8 AND name = N'Súp cua hải sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr35x4j2l66x2a' FROM MenuItems WHERE restaurant_id = @IdSupCuaCo8 AND name = N'Súp cua 1/2 óc heo' UNION ALL

-- Tiệm Mùa Hạ
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdTiemMuaHa AND name = N'Trà sữa chai TRUYỀN THỐNG 330ml' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mfg4tsccum8e8a' FROM MenuItems WHERE restaurant_id = @IdTiemMuaHa AND name = N'Chân Gà RÚT XƯƠNG SẢ TẮC (Hộp 500GR)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mk7w60r7cd1g01' FROM MenuItems WHERE restaurant_id = @IdTiemMuaHa AND name = N'Chân gà rút xương TRỘN mắm TOMYUM - Size M' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mci2zlt1cbks27' FROM MenuItems WHERE restaurant_id = @IdTiemMuaHa AND name = N'Chân Gà RÚT XƯƠNG SẢ TẮC (Hộp 750GR) + TẶNG 1 chai trà sữa' UNION ALL

-- Mì Cay Nam Hàn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqw4unadkcd5f0' FROM MenuItems WHERE restaurant_id = @IdMiCayNamHan AND name = N'Mì cay hải sản đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqw4v1d0yx7d19' FROM MenuItems WHERE restaurant_id = @IdMiCayNamHan AND name = N'Mì cay xúc xích cá viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqw4vc615nt03a' FROM MenuItems WHERE restaurant_id = @IdMiCayNamHan AND name = N'Mì cay bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqw4xk00bxy13f' FROM MenuItems WHERE restaurant_id = @IdMiCayNamHan AND name = N'Mì cay nam hàn đặc biệt' UNION ALL

-- NT Food
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhx7x4b96qdc73' FROM MenuItems WHERE restaurant_id = @IdNTFood AND name = N'MÌ TƯƠNG ĐEN TRỨNG ỐP LA' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhx7x4b984xsf7' FROM MenuItems WHERE restaurant_id = @IdNTFood AND name = N'MÌ TƯƠNG ĐEN ĐÙI GÀ GIÒN+TRỨNG CHIÊN(Tặng sốt tự chọn)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmaemwk0qakle1' FROM MenuItems WHERE restaurant_id = @IdNTFood AND name = N'Cơm Chiên Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmaemwk0koat05' FROM MenuItems WHERE restaurant_id = @IdNTFood AND name = N'MÌ XÀO BÒ' UNION ALL

-- Mì Ý Happy Meal
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3kliw8i8jw58d' FROM MenuItems WHERE restaurant_id = @IdMiYHappyMeal AND name = N'Mì Ý Xốt Bò Bằm Phô Mai' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3kljf1iptpx2d' FROM MenuItems WHERE restaurant_id = @IdMiYHappyMeal AND name = N'Nui Xốt Bò Bằm Phô Mai' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3kljzs6d76w4e' FROM MenuItems WHERE restaurant_id = @IdMiYHappyMeal AND name = N'Mỳ ý + Gà viên popcorn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3klo0k2i7jp1b' FROM MenuItems WHERE restaurant_id = @IdMiYHappyMeal AND name = N'Khoai tây chiên' UNION ALL

-- Te Amo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9pqgrnstidge3' FROM MenuItems WHERE restaurant_id = @IdTeAmo AND name = N'TRÀ ĐÀO CAM SẢ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9pqn603qq842e' FROM MenuItems WHERE restaurant_id = @IdTeAmo AND name = N'LỤC TRÀ NHO' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9pqc21n14xwaa' FROM MenuItems WHERE restaurant_id = @IdTeAmo AND name = N'HỒNG TRÀ TRÂN CHÂU 3Q' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9pqxk9s1mx02c' FROM MenuItems WHERE restaurant_id = @IdTeAmo AND name = N'TRÀ SỮA BÍ ĐAO' UNION ALL

-- Cô Lan
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcg1etbs1i6q88' FROM MenuItems WHERE restaurant_id = @IdCoLan AND name = N'Bún thịt nướng (chả giò + thịt)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lx7qkk5hw44b9a' FROM MenuItems WHERE restaurant_id = @IdCoLan AND name = N'Bột chiên 2 trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lx7qo5bsuymxa1' FROM MenuItems WHERE restaurant_id = @IdCoLan AND name = N'Nui chiên 1 trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lx7pveib6xnd13' FROM MenuItems WHERE restaurant_id = @IdCoLan AND name = N'Mì xào bò' UNION ALL

-- Cơm Gà 1208
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzhiamf1wasd5' FROM MenuItems WHERE restaurant_id = @IdComGa1208 AND name = N'Cơm Gà góc tư mắm tỏi đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6lkd3a2s2h02' FROM MenuItems WHERE restaurant_id = @IdComGa1208 AND name = N'Cơm gà góc tư sốt ngọt đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr3vllrzig1w98' FROM MenuItems WHERE restaurant_id = @IdComGa1208 AND name = N'Cơm gà viên sốt chua ngọt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzh37svekzoa6' FROM MenuItems WHERE restaurant_id = @IdComGa1208 AND name = N'Cơm gà góc tư xối mỡ đặc biệt' UNION ALL

-- TyBy
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr02wyvqotcp05' FROM MenuItems WHERE restaurant_id = @IdTyBy AND name = N'Combo 30 Cá Tôm Bò Viên Chiên + Trà Tắc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr79bib1n3ycfd' FROM MenuItems WHERE restaurant_id = @IdTyBy AND name = N'Combo 24 Hoành Thánh Chiên + Coca' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr02x51ppe4ked' FROM MenuItems WHERE restaurant_id = @IdTyBy AND name = N'Combo Cá Viên Thập Cẩm 15 Món Truyền Thống' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6uzo3yvj4p3c' FROM MenuItems WHERE restaurant_id = @IdTyBy AND name = N'Khoai Tây Chiên' UNION ALL

-- 3 Râu
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lvwvwzeus2jf9f' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'COMBO 2 Miếng Gà + 1 Coca-Cola' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ly4sbgkns2a86a' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'COMBO 5 - 1 MIẾNG GÀ GIÒN + Khoai + 1 Coca-Cola' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ly4seypd7ao32b' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'CƠM GÀ GIÒN XỐT' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ly4satdrptowa4' FROM MenuItems WHERE restaurant_id = @Id3Rau AND name = N'COMBO 3 - GÀ VIÊN CHIÊN GIÒN' UNION ALL

-- HongKong Baley
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3n8ahem6jzp64' FROM MenuItems WHERE restaurant_id = @IdBaley AND name = N'Trà Sữa Khoai Môn Tươi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m6s47cwi2czc31' FROM MenuItems WHERE restaurant_id = @IdBaley AND name = N'Matcha latte' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6odqtt4ngk83' FROM MenuItems WHERE restaurant_id = @IdBaley AND name = N'Trà Sữa HongKong Baley' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzpsrrku4617c' FROM MenuItems WHERE restaurant_id = @IdBaley AND name = N'Trà Sữa Kem Trứng Nướng' UNION ALL

-- Cháo Sò Huyết 1999
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-m08jt4nexo19d6' FROM MenuItems WHERE restaurant_id = @IdChaoSoHuyet AND name = N'Sò huyết Rang Muối Ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-m08hhustxastf2' FROM MenuItems WHERE restaurant_id = @IdChaoSoHuyet AND name = N'Cháo sò huyết' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-m08hngmskgb3b4' FROM MenuItems WHERE restaurant_id = @IdChaoSoHuyet AND name = N'Cháo Sò huyết +Hàu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m20zldtuby72f5' FROM MenuItems WHERE restaurant_id = @IdChaoSoHuyet AND name = N'Ốc Hương Cháy tỏi' UNION ALL

-- Tutimi
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjpozc9v0c1zf5' FROM MenuItems WHERE restaurant_id = @IdTutimi AND name = N'Milo Dầm Full Topping Tutimi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miy1ndcc7b4253' FROM MenuItems WHERE restaurant_id = @IdTutimi AND name = N'Cà Phê Kem Muối Biển Size 530ml' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjpphm1mtedj72' FROM MenuItems WHERE restaurant_id = @IdTutimi AND name = N'Trà Sữa Olong Trân Châu Trắng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjpqub8a0k5da0' FROM MenuItems WHERE restaurant_id = @IdTutimi AND name = N'Mây Đào size 530ml' UNION ALL

-- Phở Nguyễn Tô Ký
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1rzb3oonbgfd7' FROM MenuItems WHERE restaurant_id = @IdPhoNguyenToKy AND name = N'Phở bò tái nạm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1rzep5t6bf77c' FROM MenuItems WHERE restaurant_id = @IdPhoNguyenToKy AND name = N'Phở bò thập cẩm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1rzzyln1p3neb' FROM MenuItems WHERE restaurant_id = @IdPhoNguyenToKy AND name = N'Phở Gà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1rze2whqy4zca' FROM MenuItems WHERE restaurant_id = @IdPhoNguyenToKy AND name = N'Phở bắp bò' UNION ALL

-- Quán Ăn 7 Thức
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr5ux0a0iqx07a' FROM MenuItems WHERE restaurant_id = @IdQuan7Thuc AND name = N'Bún riêu thập cẩm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr3541l4nu6x1e' FROM MenuItems WHERE restaurant_id = @IdQuan7Thuc AND name = N'Canh bún' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqxvngbuk53872' FROM MenuItems WHERE restaurant_id = @IdQuan7Thuc AND name = N'Hủ tiếu thập cẩm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m12wdwlvqfbv27' FROM MenuItems WHERE restaurant_id = @IdQuan7Thuc AND name = N'Bánh canh chả cá nha trang đặc biệt' UNION ALL

-- Gà Nướng Trần Tính
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3p8n2iya4v572' FROM MenuItems WHERE restaurant_id = @IdGaNuongCL AND name = N'Gà nướng mật ong' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m3p8k01hyo5897' FROM MenuItems WHERE restaurant_id = @IdGaNuongCL AND name = N'Gà nướng có phủ ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mo9gbk5ggiz3e8' FROM MenuItems WHERE restaurant_id = @IdGaNuongCL AND name = N'Gà nướng mắc khén' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgpfs9f3grv10c' FROM MenuItems WHERE restaurant_id = @IdGaNuongCL AND name = N'1/2 Con Gà Ủ Muối không đầu, không chân' UNION ALL

-- Phong Vũ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7ymwyiqmhdze5' FROM MenuItems WHERE restaurant_id = @IdPhongVu AND name = N'Bánh mì thịt chả đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7yn0scmxe2qfb' FROM MenuItems WHERE restaurant_id = @IdPhongVu AND name = N'Bánh mì heo quay' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7ynzxrl58jmdb' FROM MenuItems WHERE restaurant_id = @IdPhongVu AND name = N'Xôi Mặn Đặc Biệt Hộp Lớn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m7yngst1crb8ce' FROM MenuItems WHERE restaurant_id = @IdPhongVu AND name = N'Bánh Bao Trứng Cút';
GO