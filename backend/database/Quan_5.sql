use travel_food_db
go

--QUẬN 5

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Cơm Tấm Sườn Nướng, Trà Sữa & Ăn Vặt Quận 5 - Phùng Hưng', N'89/12 Phùng Hưng, P. 13, Quận 5, TP. HCM', 10.749751, 106.657012, 4.0, 45000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Lẩu Bò Hân Quận 5 - Nguyễn Biểu', N'88 Nguyễn Biểu, P. 1, Quận 5, TP. HCM', 10.755316, 106.684000, 4.5, 150000, '10:00', '23:00', N'vietnamese, nhậu'),
(N'Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5', N'813 Trần Hưng Đạo, P. 1, Quận 5, TP. HCM', 10.755144, 106.680825, 3.5, 60000, '08:00', '22:00', N'bakery, bình dân'),
(N'Bánh Sầu Riêng 9 Sạch - Quận 5', N'Số 04B Chung Cư 109 Nguyễn Biểu, P. 1, Quận 5, TP. HCM', 10.754819, 106.683594, 4.5, 175000, '09:00', '22:00', N'bakery, quà tặng'),
(N'Ốc Trứng Muối - Chi Nhánh 5 Quận 5', N'55 Nguyễn Chí Thanh, P. 9, Quận 5, TP. HCM', 10.760305, 106.671534, 4.5, 80000, '15:00', '23:30', N'seafood, bình dân'),
(N'Domoto Saigon Quận 5 - Quán Cơm Nhật Bình Dân - Trần Hưng Đạo', N'835/32 Trần Hưng Đạo, P. 1, Quận 5, TP. HCM', 10.754335, 106.680585, 4.5, 100000, '10:30', '22:00', N'japanese, bình dân'),
(N'Ốc Trứng Muối - Chi Nhánh Quận 5', N'244 Đường Trần Phú, P. 9, Quận 5, TP. HCM', 10.757988, 106.674203, 0.0, 80000, '15:00', '23:30', N'seafood, bình dân'),
(N'Truyền Thuyết Champong - Nguyễn Trãi Quận 5', N'197 Nguyễn Trãi, P. 2, Quận 5, TP. HCM', 10.756797, 106.677606, 4.5, 180000, '10:00', '22:00', N'korean, gia đình'),
(N'An Lạc - Ăn Chay - Quận 5', N'129/17 Nguyễn Trãi, P. 2, Quận 5, TP. HCM', 10.757449, 106.679902, 4.5, 30000, '07:00', '21:00', N'asian, ăn chay'),
(N'Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải', N'159 Trần Tuấn Khải, P. 5, Quận 5, TP. HCM', 10.752392, 106.673820, 5.0, 30000, '08:00', '22:00', N'dessert, bình dân');
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

-- ==========================================
-- 1. CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdComTamPhungHung, 'https://down-aka-vn.img.susercontent.com/vn-11134513-7r98o-lsvbr4mbb83oce@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdLauBoHan, 'https://down-aka-vn.img.susercontent.com/vn-11134259-7ras8-mcg68apen9a48a@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhKem1819, 'https://down-aka-vn.img.susercontent.com/vn-11134259-81ztc-mk9g0sx2p2q03d@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdSauRieng9Sach, 'https://down-aka-vn.img.susercontent.com/vn-11134259-820l4-mjjbizc1l3wga5@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdOcTrungMuoiCN5, 'https://down-aka-vn.img.susercontent.com/vn-11134513-7r98o-lx0t5qzoc3q34f@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdDomotoSaigon, 'https://down-aka-vn.img.susercontent.com/vn-11134513-7r98o-m09qer17nkdp32@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdOcTrungMuoiQ5, 'https://down-aka-vn.img.susercontent.com/vn-11134259-820l4-mj2879jem41wdb@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChampong, 'https://down-aka-vn.img.susercontent.com/vn-11134259-820l4-mgltt4foyvii9a@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdAnLacChay, 'https://down-aka-vn.img.susercontent.com/vn-11134513-7r98o-ltt4utxw90y2cb@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTauHuCovang, 'https://down-aka-vn.img.susercontent.com/vn-11134513-7r98o-lsvb1fbbdu4k12@resize_ss280x175!@crop_w280_h175_cT', 1);

-- ==========================================
-- 2. CHÈN ẢNH CHO TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Cơm Tấm Phùng Hưng
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr0g1hifowbd27' FROM MenuItems WHERE restaurant_id = @IdComTamPhungHung AND name = N'CƠM THỊT BA ROI XÀO RUỐC' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ra0g-m6ml3gr8fcd411' FROM MenuItems WHERE restaurant_id = @IdComTamPhungHung AND name = N'BÁNH TRÁNG CUỐN' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ra0g-m6ml5ev1vg4889' FROM MenuItems WHERE restaurant_id = @IdComTamPhungHung AND name = N'BÁNH TRÁNG TRỘN' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mloykqj60nbja1' FROM MenuItems WHERE restaurant_id = @IdComTamPhungHung AND name = N'3 CUỐN CHẢ GIÒ HẢI SẢN' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr49u9lrn6op9b' FROM MenuItems WHERE restaurant_id = @IdComTamPhungHung AND name = N'CƠM TẤM SƯỜN TRỨNG' UNION ALL

-- Lẩu Bò Hân
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mci07sdxvhrhf1' FROM MenuItems WHERE restaurant_id = @IdLauBoHan AND name = N'Bắp bò hấp' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mci1q8cbpw9o45' FROM MenuItems WHERE restaurant_id = @IdLauBoHan AND name = N'Đuôi bò hấp' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mci084vpmr6q15' FROM MenuItems WHERE restaurant_id = @IdLauBoHan AND name = N'Óc bò hấp' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mci1r2ofbq5e4d' FROM MenuItems WHERE restaurant_id = @IdLauBoHan AND name = N'Lòng hấp' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mfm0ejt1whzc7c' FROM MenuItems WHERE restaurant_id = @IdLauBoHan AND name = N'Gù Bò Hấp' UNION ALL

-- Bánh Kem 1819
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mkaqc5x37y8219' FROM MenuItems WHERE restaurant_id = @IdBanhKem1819 AND name = N'Su kem' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mkaqb00kxame44' FROM MenuItems WHERE restaurant_id = @IdBanhKem1819 AND name = N'Bánh kem bắp' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mkaossn4z5s512' FROM MenuItems WHERE restaurant_id = @IdBanhKem1819 AND name = N'Bánh Phú Sĩ' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mkaqdfy8xpms51' FROM MenuItems WHERE restaurant_id = @IdBanhKem1819 AND name = N'Bông lan 4 vị' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mkap0o6tn280eb' FROM MenuItems WHERE restaurant_id = @IdBanhKem1819 AND name = N'Bông lan cuộn mứt dâu' UNION ALL

-- Bánh Sầu Riêng 9 Sạch
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjks2qdmdn2a5c' FROM MenuItems WHERE restaurant_id = @IdSauRieng9Sach AND name = N'BÁNH SẦU RIÊNG MIX 3 VỊ 12CM FULL SẦU TƯƠI RI6' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjks41ezjncz4d' FROM MenuItems WHERE restaurant_id = @IdSauRieng9Sach AND name = N'BÁNH SẦU RIÊNG CHOCO HẠNH NHÂN 12CM' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjks5d9s28ld89' FROM MenuItems WHERE restaurant_id = @IdSauRieng9Sach AND name = N'BÁNH SẦU RIÊNG NGÀN LỚP 12CM SIÊU SẦU' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjks5ojj8ni848' FROM MenuItems WHERE restaurant_id = @IdSauRieng9Sach AND name = N'BÁNH SẦU RIÊNG PHÔ MAI THAN TRE 12CM' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjks6d7qxjpge4' FROM MenuItems WHERE restaurant_id = @IdSauRieng9Sach AND name = N'BÁNH SẦU RIÊNG NGÀN LỚP 12CM VỊ LÁ DỨA' UNION ALL

-- Ốc Trứng Muối CN5
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mcghngubih7g5a' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiCN5 AND name = N'Ốc Bươu nướng tiêu' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mcgk0td98rksd2' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiCN5 AND name = N'Ốc Bưu Sốt Tiêu Đen' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mcgk07m92k4cf7' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiCN5 AND name = N'Ốc Bươu hấp sả' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiCN5 AND name = N'Ốc Bươu hấp Thái' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mcgi3snpbcbm95' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiCN5 AND name = N'Tôm càng xanh nướng phô mai khè' UNION ALL

-- Domoto Saigon
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-m04bzbh2sozz94' FROM MenuItems WHERE restaurant_id = @IdDomotoSaigon AND name = N'Cơm Lươn' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-m04cbwd61mgdbe' FROM MenuItems WHERE restaurant_id = @IdDomotoSaigon AND name = N'Cơm Tôm Chiên' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m56zi4hpq877e3' FROM MenuItems WHERE restaurant_id = @IdDomotoSaigon AND name = N'Cơm bò Hamburger trứng cuộn' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m56zsy8jdtdv73' FROM MenuItems WHERE restaurant_id = @IdDomotoSaigon AND name = N'Cơm cà ri bò Hamburger' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-m56zk2z4l14z56' FROM MenuItems WHERE restaurant_id = @IdDomotoSaigon AND name = N'Cơm bò Hamburger phô mai' UNION ALL

-- Ốc Trứng Muối Quận 5
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiQ5 AND name = N'Combo Hàu Hấp Xả 2kg' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiQ5 AND name = N'Combo Hàu Sữa hấp xả 1kg' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiQ5 AND name = N'Trà tắc' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiQ5 AND name = N'Trà ổi' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoiQ5 AND name = N'Nước ngọt' UNION ALL

-- Truyền Thuyết Champong
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mhd94o5ncemh76' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Tteobokki' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mha3fy5937yl7f' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Lẩu Chả Cá' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mha3h0fvaqks09' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Tteobokki - Lẩu Chả Cá' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mglu1pdrnr4e10' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mì tương đen- 짜장면' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mglu1xlrint461' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Thịt heo chua ngọt Size Mini-찹쌀탕수육미니' UNION ALL

-- An Lạc Chay
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-mmi71snm4tfsc7' FROM MenuItems WHERE restaurant_id = @IdAnLacChay AND name = N'Cơm chiên thập cẩm' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-81ztc-ml1cmku0cq9w39' FROM MenuItems WHERE restaurant_id = @IdAnLacChay AND name = N'Bánh Mì Chả Nấm An Lạc' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-luljj0c3j7ki11' FROM MenuItems WHERE restaurant_id = @IdAnLacChay AND name = N'Bánh Mì Chả Cá Chay' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7ras8-mca1uuxifq7793' FROM MenuItems WHERE restaurant_id = @IdAnLacChay AND name = N'Bánh Mì Nấm (Best Seller)' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr0f4sc6cclg0b' FROM MenuItems WHERE restaurant_id = @IdAnLacChay AND name = N'Bánh Mì Xúc Xích Chay (Best Seller)' UNION ALL

-- Tàu Hũ Tươi Covang
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lqzw86s7eg7td8' FROM MenuItems WHERE restaurant_id = @IdTauHuCovang AND name = N'Sương sáo gói sữa béo' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-lr44ld737tll46' FROM MenuItems WHERE restaurant_id = @IdTauHuCovang AND name = N'Tàu hũ tươi Co Vang' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-ly1o323os9g990' FROM MenuItems WHERE restaurant_id = @IdTauHuCovang AND name = N'Set 10 tàu hũ tươi Co Vang' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-7r98o-ly1oad140r8bc3' FROM MenuItems WHERE restaurant_id = @IdTauHuCovang AND name = N'Set 5 Tàu hũ tươi Co Vang' UNION ALL
SELECT id, 'https://down-aka-vn.img.susercontent.com/vn-11134517-820l4-mjm5g7q5f5s315' FROM MenuItems WHERE restaurant_id = @IdTauHuCovang AND name = N'Set 20 tàu hũ Covang';