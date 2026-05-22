USE travel_food_db
GO

-- ==========================================
-- NHÀ BÈ VÀ CÁC KHU VỰC LÂN CẬN
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Nem Nướng Nha Trang Bé Thảo', N'1237/31 Hoàng Sa, P. 5, Tân Bình, TP. HCM', 10.790253, 106.663963, 4.8, 80000, '08:00', '22:00', N'vietnamese, bình dân'),
(N'Tacos Toro - Nhà Bè', N'2129/47 Huỳnh Tấn Phát, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.693359, 106.742441, 4.2, 50000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Thị Gọt Fruits - Trái Cây Tươi Gọt Sẵn - Nhà Bè', N'Block A Dragon Hill 2, Xã Phước Kiển, Nhà Bè, TP. HCM', 10.709213, 106.709760, 4.7, 45000, '08:00', '21:30', N'dessert, bình dân'),
(N'Nhà Food - Lê Tấn Bê', N'130/1 Lê Tấn Bê, P. An Lạc, Bình Tân, TP. HCM', 10.715225, 106.604252, 4.3, 35000, '15:00', '23:30', N'asian, bình dân'),
(N'Highlands Coffee - Trà, Cà Phê & Bánh - Dragon Hill 1 Nhà Bè', N'15A Nguyễn Hữu Thọ, X. Phước Kiểng, Nhà Bè, TP. HCM', 10.717847, 106.703113, 4.1, 60000, '07:00', '22:30', N'cafe, bình dân'),
(N'Cơm Nhà Bé Bự', N'3/37/8 Đường Số 25A, P. Tân Quy, Quận 7, TP. HCM', 10.742891, 106.707924, 4.8, 55000, '09:00', '21:00', N'vietnamese, bình dân'),
(N'Yn Tea - Tiệm Trà Sữa Nhà Bè', N'1768/6 Huỳnh Tấn Phát, Khu Phố 5, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.698452, 106.738732, 4.2, 35000, '08:00', '22:30', N'cafe, bình dân'),
(N'Bếp Nhà - Cơm Văn Phòng & Cơm Phần', N'227 Lý Thái Tổ, P. 9, Quận 10, TP. HCM', 10.767640, 106.672609, 4.6, 68000, '10:00', '21:30', N'vietnamese, bình dân'),
(N'Bếp Nhà Bin - Kinh Dương Vương', N'600/12/4A Kinh Dương Vương, P. An Lạc, Bình Tân, TP. HCM', 10.730281, 106.608685, 4.1, 55000, '09:00', '22:00', N'asian, bình dân'),
(N'BÁNH XÈO MIỀN TÂY - HUỲNH THỊ ĐỒNG, NHÀ BÈ', N'1979/23/36 Huỳnh Thị Đồng, X. Phú Xuân, Nhà Bè, TP. HCM', 10.679238, 106.751206, 4.4, 50000, '15:00', '22:00', N'vietnamese, bình dân'),
(N'Bánh Mì Sốt Gạch Cua Nhà Bé Chi', N'376/48 Nguyễn Đình Chiểu, P. 4, Quận 3, TP. HCM', 10.774537, 106.684939, 4.8, 65000, '06:30', '21:00', N'vietnamese, bình dân'),
(N'Khoai Mỡ Lắc - Nhà Bé Gôn', N'401 Bùi Đình Tuý, P. 14, Bình Thạnh, TP. HCM', 10.806581, 106.698054, 4.3, 30000, '14:00', '22:30', N'asian, bình dân'),
(N'Khói Quán Nhà Bè', N'199 Lê Văn Lương (Khu 4T Park), X. Phước Kiểng, Nhà Bè, TP. HCM', 10.704912, 106.702774, 4.2, 150000, '16:00', '23:30', N'vietnamese, nhậu'),
(N'T & T Coffee - NHÀ BÈ', N'1-2 Đường 17, KDC Cotec, Nhà Bè, TP. HCM', 10.676322, 106.734273, 4.5, 35000, '07:00', '22:00', N'cafe, bình dân'),
(N'Sầu Riêng Nhà Vườn Bé Sáo - Lê Quang Định', N'284 Lê Quang Định, P. 11, Bình Thạnh, TP. HCM', 10.808794, 106.694233, 4.1, 350000, '08:00', '22:00', N'dessert, quà tặng'),
(N'Sâm Chill Me Nhà Bè - Phạm Hữu Lầu', N'336/8 Phạm Hữu Lầu, X. Phước Kiển, Nhà Bè, TP. HCM', 10.702848, 106.723548, 4.8, 35000, '08:00', '22:30', N'cafe, bình dân'),
(N'Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè', N'236 Huỳnh Tấn Phát, Khu Phố 6, TT. Nhà Bè, Nhà Bè, TP. HCM', 10.696746, 106.739289, 4.6, 40000, '06:00', '21:00', N'bakery, bình dân'),
(N'Bếp Nhà Bé Béo - Phạm Hùng', N'C1/15TR Phạm Hùng, X. Bình Hưng, Bình Chánh, TP. HCM', 10.726273, 106.671528, 4.4, 50000, '09:00', '21:00', N'vietnamese, bình dân'),
(N'Bếp Nhà Na Sindat Thai - Đinh Bộ Lĩnh', N'369/10 Đinh Bộ Lĩnh, P. 26, Bình Thạnh, TP. HCM', 10.815730, 106.710440, 4.1, 70000, '10:00', '22:00', N'thai, bình dân'),
(N'Nem Nướng Nha Trang - Bếp Của Vân', N'A23/19N Quốc Lộ 50, X. Bình Hưng, Bình Chánh, TP. HCM', 10.720581, 106.655876, 4.9, 100000, '10:00', '22:00', N'vietnamese, gia đình');
GO

DECLARE @IdBeThao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang Bé Thảo');
DECLARE @IdToro INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tacos Toro - Nhà Bè');
DECLARE @IdThiGot INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thị Gọt Fruits - Trái Cây Tươi Gọt Sẵn - Nhà Bè');
DECLARE @IdNhaFood INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Food - Lê Tấn Bê');
DECLARE @IdHighlands INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Dragon Hill 1 Nhà Bè');
DECLARE @IdBeBu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Nhà Bé Bự');
DECLARE @IdYnTea INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Yn Tea - Tiệm Trà Sữa Nhà Bè');
DECLARE @IdBepNha INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà - Cơm Văn Phòng & Cơm Phần');
DECLARE @IdBepNhaBin INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà Bin - Kinh Dương Vương');
DECLARE @IdBanhXeo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'BÁNH XÈO MIỀN TÂY - HUỲNH THỊ ĐỒNG, NHÀ BÈ');
DECLARE @IdBanhMiCua INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Sốt Gạch Cua Nhà Bé Chi');
DECLARE @IdKhoaiMo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Khoai Mỡ Lắc - Nhà Bé Gôn');
DECLARE @IdKhoiQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Khói Quán Nhà Bè');
DECLARE @IdTTCoffee INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'T & T Coffee - NHÀ BÈ');
DECLARE @IdSauRieng INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sầu Riêng Nhà Vườn Bé Sáo - Lê Quang Định');
DECLARE @IdChillMe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sâm Chill Me Nhà Bè - Phạm Hữu Lầu');
DECLARE @IdBanhMiHN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè');
DECLARE @IdBeBeo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà Bé Béo - Phạm Hùng');
DECLARE @IdNaThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà Na Sindat Thai - Đinh Bộ Lĩnh');
DECLARE @IdNemVan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang - Bếp Của Vân');

-- ==========================================
-- CHÈN MENU (4 món ngẫu nhiên)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdBeThao, N'Nem nướng 1phần', N'1 phần/1 nguoi nem gồm: có 8 miếng nem nhỏ, ram giòn, bún, rau', 60000, 'vietnamese', 'grilled pork sausage, spring roll, rice noodles, vegetables'),
(@IdBeThao, N'Combo 2 phần Nem Nướng', N'2phần/ 2người nem gồm: có 16 miếng nem nhỏ, ram giòn, bún', 115000, 'vietnamese', 'grilled pork sausage, spring roll, rice noodles, vegetables'),
(@IdBeThao, N'Nem chua nướng', N'1 cái.', 7000, 'vietnamese', 'grilled fermented pork roll'),
(@IdBeThao, N'Nem chua ( Ăn liền )', N'1 cái.', 6000, 'vietnamese', 'fermented pork roll'),

(@IdToro, N'Tacos BÒ PHÔ MAI', N'', 53000, 'fastfood', 'tacos, beef, cheese'),
(@IdToro, N'Tacos GÀ PHÔ MAI', N'', 53000, 'fastfood', 'tacos, chicken, cheese'),
(@IdToro, N'Tacos HẢI SẢN', N'', 53000, 'fastfood', 'tacos, seafood'),
(@IdToro, N'Tacos BÒ TRỨNG', N'', 48000, 'fastfood', 'tacos, beef, egg'),

(@IdThiGot, N'Mận Hậu Gọt Vỏ Bỏ Hạt', N'300 - 350g + 1 muối tôm.', 45000, 'dessert', 'plum, shrimp salt'),
(@IdThiGot, N'Thơm Thái Chua Ngọt', N'300 - 350g + kèm 1 muối tôm.', 52000, 'dessert', 'pineapple, shrimp salt'),
(@IdThiGot, N'Xoài Chín Mềm Ngọt', N'300 - 350g. Xoài Keo hoặc Tứ Quý chín ngọt lịm.', 40000, 'dessert', 'mango'),
(@IdThiGot, N'Táo Đỏ Nhập Khẩu', N'300 - 350g.', 45000, 'dessert', 'apple'),

(@IdNhaFood, N'Mì Indomie Trộn Xúc Xích', N'Xúc xích, Cải thìa', 15000, 'snack', 'indomie noodles, sausage, bok choy'),
(@IdNhaFood, N'Mì trộn gà viên', N'Gà viên, Cải thìa', 22500, 'snack', 'noodles, chicken balls, bok choy'),
(@IdNhaFood, N'Combo Bữa Ăn TIẾT KIỆM', N'1 phần mì trộn cá viên + 1 chai Coca', 42000, 'snack', 'noodles, fish balls, coke'),
(@IdNhaFood, N'Mì Indomie Trộn Xá Xíu', N'Xá xíu, Cải thìa', 40000, 'snack', 'indomie noodles, char siu, bok choy'),

(@IdHighlands, N'Trà Sữa Trà Xanh', N'', 65000, 'cafe', 'green milk tea'),
(@IdHighlands, N'Trà Thạch Đào-Trà Sữa', N'Sự hoà quyện của hương thơm đào và độ thơm béo của sữa.', 24500, 'cafe', 'peach tea, peach jelly'),
(@IdHighlands, N'PhinĐI Choco', N'Cà phê Phin kết hợp cùng Choco ngọt tan.', 49000, 'cafe', 'coffee, chocolate'),
(@IdHighlands, N'Bánh Mì Que Pate', N'Bánh nóng hổi, giòn giòn.', 19000, 'cafe', 'breadstick, pate'),

(@IdBeBu, N'Bún nước tương Keo Vy', N'Rau, bún, thịt luộc, đậu hũ, trứng sợi, hành phi', 62000, 'vietnamese', 'rice noodles, soy sauce, boiled pork, tofu, egg'),
(@IdBeBu, N'Cơm Ba Rọi Chiên Sả Ớt', N'', 59000, 'vietnamese', 'rice, fried pork belly, lemongrass, chili'),
(@IdBeBu, N'Cơm Thịt kho tiêu', N'', 50000, 'vietnamese', 'rice, braised pork, pepper'),
(@IdBeBu, N'Cơm Gà Kho Sả Ớt', N'', 50000, 'vietnamese', 'rice, braised chicken, lemongrass, chili'),

(@IdYnTea, N'MATCHA LATTE', N'MATCHA NHẬT', 35000, 'beverage', 'matcha, milk'),
(@IdYnTea, N'MATCHA DÂU', N'', 40000, 'beverage', 'matcha, strawberry'),
(@IdYnTea, N'NGUYÊN LÁ KEM CHESSE', N'', 42000, 'beverage', 'tea, cream cheese'),
(@IdYnTea, N'LỤC TRÀ SỮA LÀI', N'', 37000, 'beverage', 'jasmine green milk tea'),

(@IdBepNha, N'[Cơm Tấm] Sườn Cốt Lết nướng.', N'Topping miễn phí, cơm tấm tơi xốp', 68000, 'vietnamese', 'broken rice, grilled pork chop'),
(@IdBepNha, N'Cơm cá Hú kho tộ.', N'Cá hú kho tộ thơm béo hấp dẫn', 68000, 'vietnamese', 'rice, braised catfish'),
(@IdBepNha, N'Cơm Thịt kho trứng', N'Thịt ba chỉ kho trứng', 68000, 'vietnamese', 'rice, braised pork, egg'),
(@IdBepNha, N'Cơm cá Diêu Hồng chiên', N'mắm chua ngọt', 68000, 'vietnamese', 'rice, fried red tilapia, fish sauce'),

(@IdBepNhaBin, N'Bánh crepe sầu riêng', N'Vỏ bánh mỏng nhiều sầu hộp 8 cái', 70000, 'dessert', 'durian crepe'),
(@IdBepNhaBin, N'Kimbap thập cẩm', N'', 45000, 'korean', 'kimbap, mixed fillings'),
(@IdBepNhaBin, N'Mì ý bò sốt tiêu đen', N'Không đều chỉnh được lượng tiêu', 55000, 'italian', 'spaghetti, beef, black pepper'),
(@IdBepNhaBin, N'Mì cay gà sốt', N'Mì có kèm trứng ốp la', 55000, 'korean', 'spicy noodles, chicken, egg'),

(@IdBanhXeo, N'Nui Xào Bò', N'', 40000, 'vietnamese', 'macaroni, beef'),
(@IdBanhXeo, N'Nui Xào Bò Trứng', N'', 50000, 'vietnamese', 'macaroni, beef, egg'),
(@IdBanhXeo, N'Mì Xào Bò', N'', 40000, 'vietnamese', 'noodles, beef'),
(@IdBanhXeo, N'Bánh xèo miền tây', N'', 55000, 'vietnamese', 'vietnamese crepe, shrimp, pork, bean sprouts'),

(@IdBanhMiCua, N'Bánh Mì Sốt Gạch Cua', N'Bánh mì + sốt gạch Cua biển', 55000, 'vietnamese', 'bread, crab paste, minced pork'),
(@IdBanhMiCua, N'Bánh Mì Sốt Gạch Cua + Trứng Tôm', N'Sốt nhiều gạch son, ngon bùi', 68000, 'vietnamese', 'bread, crab paste, shrimp roe'),
(@IdBanhMiCua, N'Bánh Mì Sốt Gạch Cua + Thịt Cua Tuyết', N'Dùng thịt Cua Tuyết lạ lạ', 95000, 'vietnamese', 'bread, crab paste, snow crab'),
(@IdBanhMiCua, N'Combo 04 Bánh mì Gạch Cua', N'TẶNG 1 Chai nước mát 330ml', 180000, 'vietnamese', 'bread, crab paste, herbal drink'),

(@IdKhoaiMo, N'Khoai Tây lốc xoáy', N'Phủ phô mai', 25000, 'snack', 'potato, cheese'),
(@IdKhoaiMo, N'Khoai mỡ lắc phô mai - Phần lớn', N'Lắc phô mai (40 viên)', 38000, 'snack', 'purple yam, cheese'),
(@IdKhoaiMo, N'Khoai mỡ lắc phô mai - Phần nhỏ', N'Lắc phô mai (26 viên)', 28000, 'snack', 'purple yam, cheese'),
(@IdKhoaiMo, N'Khoai mỡ chiên - Phần lớn', N'Phần lớn (40 viên)', 37000, 'snack', 'purple yam'),

(@IdKhoiQuan, N'Chả Mực-Cá Thác Lác Chiên', N'giòn, dai và vị ngọt tự nhiên.', 119000, 'vietnamese', 'fried squid paste, fish paste'),
(@IdKhoiQuan, N'Khoai Tây Lắc Phô Mai', N'giòn và béo thơm', 79000, 'snack', 'french fries, cheese'),
(@IdKhoiQuan, N'Cơm Chiên Hải Sản', N'món ăn quốc dân', 169000, 'vietnamese', 'fried rice, seafood'),
(@IdKhoiQuan, N'Bún Gạo Xào Bò', N'Sợi bún Tơi và Thấm', 189000, 'vietnamese', 'rice vermicelli, beef'),

(@IdTTCoffee, N'Cà Phê Muối', N'', 35000, 'cafe', 'salted coffee'),
(@IdTTCoffee, N'Bạc Xỉu Đá', N'ly', 30000, 'cafe', 'coffee, milk'),
(@IdTTCoffee, N'Đá Xay Matcha', N'', 38000, 'cafe', 'matcha ice blended'),
(@IdTTCoffee, N'Yaourt Matcha Dâu', N'ly 700ml', 35000, 'beverage', 'yogurt, matcha, strawberry'),

(@IdSauRieng, N'Cơm sầu riêng Ri6 - Hộp 500gr', N'Sầu riêng Ri 6 miền tây', 225000, 'dessert', 'durian'),
(@IdSauRieng, N'Cơm sầu riêng Ri 6 - Hộp 1kg', N'Sầu riêng Ri 6 miền tây', 445000, 'dessert', 'durian'),
(@IdSauRieng, N'Cơm sầu Thái chín cây - Hộp 500gr', N'Sầu riêng Thái miền tây', 300000, 'dessert', 'durian'),
(@IdSauRieng, N'Cơm sầu riêng Chuồng Bò - hộp 500gr', N'Sầu Riêng Chuồng Bò cơm vị bơ sữa', 350000, 'dessert', 'durian'),

(@IdChillMe, N'Nước Dừa Tắc - Size L', N'COMBO hoàn hảo giữa 100% nước dừa tươi', 30100, 'beverage', 'coconut water, kumquat, palm seed'),
(@IdChillMe, N'Sâm Táo Bát Bảo', N'Sâm Táo Bát Bảo là thức uống thảo mộc', 38000, 'beverage', 'herbal drink, jujube, chia seed'),
(@IdChillMe, N'Me Đác Mê Mẫn', N'Me Đác Mê Mẫn là ly nước me chua ngọt', 33000, 'beverage', 'tamarind juice, palm seed'),
(@IdChillMe, N'Trà Sữa Kem Trứng', N'Trà sữa kem trứng – nhà nấu', 40000, 'beverage', 'milk tea, egg cream'),

(@IdBanhMiHN, N'Bông lan trứng muối', N'', 56733, 'bakery', 'sponge cake, salted egg'),
(@IdBanhMiHN, N'Bánh bông cúc', N'', 36733, 'bakery', 'daisy bread'),
(@IdBanhMiHN, N'Bánh mì sốt chà bông', N'', 45900, 'bakery', 'bread, pork floss'),
(@IdBanhMiHN, N'Humburger bò trứng', N'', 40178, 'bakery', 'hamburger, beef, egg'),

(@IdBeBeo, N'Mì phá lấu nước', N'1 gói mì, Phá lấu nước', 50000, 'vietnamese', 'noodles, beef offal'),
(@IdBeBeo, N'Phá lấu bò', N'1 chén phá lấu kèm 1 ổ bánh mì', 45000, 'vietnamese', 'beef offal, bread'),
(@IdBeBeo, N'Mì trộn đùi gà mắm tỏi', N'Mì gói, đùi gà, trứng opla', 60000, 'vietnamese', 'noodles, chicken, garlic fish sauce, egg'),
(@IdBeBeo, N'Chén lá mía', N'Chén lá mía, Bánh mì', 40000, 'vietnamese', 'beef spleen, bread'),

(@IdNaThai, N'Canh tomyum hải sản', N'Tom, muc, Nấm đùi gà', 85000, 'thai', 'tomyum, seafood, mushroom'),
(@IdNaThai, N'Hủ tíu xào tôm gà', N'Sợi tủ tíu xào thái xào với 2 con tôm gà', 65000, 'thai', 'rice noodles, shrimp, chicken, egg'),
(@IdNaThai, N'Xôi xoài', N'xôi lá dứa ngọt ăn kèm cốt dừa và xoài cát', 65000, 'thai', 'sticky rice, mango, coconut milk'),
(@IdNaThai, N'Gỏi đu đủ thai ba khía', N'Đu đủ bằm tay, có đậu đũa, cà pháo', 60000, 'thai', 'papaya, fermented crab, long bean'),

(@IdNemVan, N'Set Nem Nướng Đặc Biệt 1 Người', N'Nhiều hơn với 3 loại nem nướng', 80000, 'vietnamese', 'grilled pork sausage, spring roll, vegetables'),
(@IdNemVan, N'Set Nem Nướng 2 Người', N'Mix 2 loại nem Phên nướng và nem Lụi nướng', 135000, 'vietnamese', 'grilled pork sausage, lemongrass pork skewer'),
(@IdNemVan, N'Thịt Xiên Nướng', N'', 19000, 'vietnamese', 'grilled pork skewer'),
(@IdNemVan, N'Nem Kem Phô Mai', N'', 22000, 'vietnamese', 'pork sausage, cheese');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdBeThao, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mjve1ddcjsoz8c@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdToro, 'https://down-zl-vn.img.susercontent.com/vn-11134259-820l4-mg4on29makgb44@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdThiGot, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mnod197ppatcb5@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdNhaFood, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mo3fh4e4fh1e46@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdHighlands, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mnuyfsskgvlu73@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBeBu, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ras8-m1ialjjor45b95@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdYnTea, 'https://down-zl-vn.img.susercontent.com/vn-11134513-81ztc-mkb6s6qxecjp2f@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBepNha, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsvctiusksecb8@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBepNhaBin, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mj2yk7a665mr5b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhXeo, 'https://down-zl-vn.img.susercontent.com/vn-11134259-7ras8-mdfvm2fui6cs0f@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhMiCua, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ras8-md6ukuyjbu4f0f@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdKhoaiMo, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mi0c3mi746bkd4@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdKhoiQuan, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ra0g-ma43xpw94axgad@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTTCoffee, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mjultr78yivb51@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdSauRieng, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsvgv4p5rvdl4b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChillMe, 'https://down-zl-vn.img.susercontent.com/vn-11134513-820l4-mjjpctb7yqyq3e@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhMiHN, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsvd07j6diftf9@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBeBeo, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7ras8-mdvi1cty4btl09@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdNaThai, 'https://down-zl-vn.img.susercontent.com/vn-11134513-7r98o-lsttnadwpj1571@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdNemVan, 'https://down-zl-vn.img.susercontent.com/vn-11134259-7ras8-mcyuyzvtttgc85@resize_ss280x175!@crop_w280_h175_cT', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Bé Thảo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjv5rja35am922' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'Nem nướng 1phần' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjv5vt9e19fma4' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'Combo 2 phần Nem Nướng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr2r3wdfu6ro2c' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'Nem chua nướng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqvzg3qaf9ndc7' FROM MenuItems WHERE restaurant_id = @IdBeThao AND name = N'Nem chua ( Ăn liền )' UNION ALL

-- Toro
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg4zqjwpwh7167' FROM MenuItems WHERE restaurant_id = @IdToro AND name = N'Tacos BÒ PHÔ MAI' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg4zr45ei8zu2e' FROM MenuItems WHERE restaurant_id = @IdToro AND name = N'Tacos GÀ PHÔ MAI' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg4ztlflaqz0f0' FROM MenuItems WHERE restaurant_id = @IdToro AND name = N'Tacos HẢI SẢN' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg4zrqeqiosob8' FROM MenuItems WHERE restaurant_id = @IdToro AND name = N'Tacos BÒ TRỨNG' UNION ALL

-- Thị Gọt Fruits
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mo3xm29tsnpcbb' FROM MenuItems WHERE restaurant_id = @IdThiGot AND name = N'Mận Hậu Gọt Vỏ Bỏ Hạt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mo3zldfsvwucdd' FROM MenuItems WHERE restaurant_id = @IdThiGot AND name = N'Thơm Thái Chua Ngọt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mo3zp1g20ao622' FROM MenuItems WHERE restaurant_id = @IdThiGot AND name = N'Xoài Chín Mềm Ngọt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mo3yeutujx1h35' FROM MenuItems WHERE restaurant_id = @IdThiGot AND name = N'Táo Đỏ Nhập Khẩu' UNION ALL

-- Nhà Food
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-modytd1f6vikde' FROM MenuItems WHERE restaurant_id = @IdNhaFood AND name = N'Mì Indomie Trộn Xúc Xích' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-modytd0v68lqf2' FROM MenuItems WHERE restaurant_id = @IdNhaFood AND name = N'Mì trộn gà viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mo39pru2eww03c' FROM MenuItems WHERE restaurant_id = @IdNhaFood AND name = N'Combo Bữa Ăn TIẾT KIỆM' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-modytkrkosuh1d' FROM MenuItems WHERE restaurant_id = @IdNhaFood AND name = N'Mì Indomie Trộn Xá Xíu' UNION ALL

-- Highlands Coffee
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meyiqvqwyt4x15' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Trà Sữa Trà Xanh' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lz4nt51gghwh4f' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Trà Thạch Đào-Trà Sữa' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lz4tz8thlrc19a' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'PhinĐI Choco' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lz4vcku6njxdaa' FROM MenuItems WHERE restaurant_id = @IdHighlands AND name = N'Bánh Mì Que Pate' UNION ALL

-- Cơm Nhà Bé Bự
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mn4ajlk6641ue5' FROM MenuItems WHERE restaurant_id = @IdBeBu AND name = N'Bún nước tương Keo Vy' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1gpa4wse8ur44' FROM MenuItems WHERE restaurant_id = @IdBeBu AND name = N'Cơm Ba Rọi Chiên Sả Ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1hv73as5ozjda' FROM MenuItems WHERE restaurant_id = @IdBeBu AND name = N'Cơm Thịt kho tiêu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1gp71lnbm8j45' FROM MenuItems WHERE restaurant_id = @IdBeBu AND name = N'Cơm Gà Kho Sả Ớt' UNION ALL

-- Yn Tea
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh2xjwgewky2c7' FROM MenuItems WHERE restaurant_id = @IdYnTea AND name = N'MATCHA LATTE' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhprwjd3orgk01' FROM MenuItems WHERE restaurant_id = @IdYnTea AND name = N'MATCHA DÂU' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-maqlf617t9qk8b' FROM MenuItems WHERE restaurant_id = @IdYnTea AND name = N'NGUYÊN LÁ KEM CHESSE' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-maqlglx3vu0x6e' FROM MenuItems WHERE restaurant_id = @IdYnTea AND name = N'LỤC TRÀ SỮA LÀI' UNION ALL

-- Bếp Nhà
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhiumbwk2hab24' FROM MenuItems WHERE restaurant_id = @IdBepNha AND name = N'[Cơm Tấm] Sườn Cốt Lết nướng.' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mfkyfhs5l9ft47' FROM MenuItems WHERE restaurant_id = @IdBepNha AND name = N'Cơm cá Hú kho tộ.' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9ufnevrna6c92' FROM MenuItems WHERE restaurant_id = @IdBepNha AND name = N'Cơm Thịt kho trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m2c2xxqvx29g9e' FROM MenuItems WHERE restaurant_id = @IdBepNha AND name = N'Cơm cá Diêu Hồng chiên' UNION ALL

-- Bếp Nhà Bin
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lybv4gblgihte8' FROM MenuItems WHERE restaurant_id = @IdBepNhaBin AND name = N'Bánh crepe sầu riêng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mel4iioeebk6c1' FROM MenuItems WHERE restaurant_id = @IdBepNhaBin AND name = N'Kimbap thập cẩm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbf03zb3bf7lf5' FROM MenuItems WHERE restaurant_id = @IdBepNhaBin AND name = N'Mì ý bò sốt tiêu đen' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mel4gv5gks93ab' FROM MenuItems WHERE restaurant_id = @IdBepNhaBin AND name = N'Mì cay gà sốt' UNION ALL

-- BÁNH XÈO MIỀN TÂY
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqr0a3g4t1ca6' FROM MenuItems WHERE restaurant_id = @IdBanhXeo AND name = N'Nui Xào Bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqr19an63uq88' FROM MenuItems WHERE restaurant_id = @IdBanhXeo AND name = N'Nui Xào Bò Trứng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqqyzq6dvr834' FROM MenuItems WHERE restaurant_id = @IdBanhXeo AND name = N'Mì Xào Bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqqiqzfco3q2c' FROM MenuItems WHERE restaurant_id = @IdBanhXeo AND name = N'Bánh  xèo  miền  tây' UNION ALL

-- Bánh Mì Sốt Gạch Cua
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-md6q03dlhaxoc2' FROM MenuItems WHERE restaurant_id = @IdBanhMiCua AND name = N'Bánh Mì Sốt Gạch Cua' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-md6v99knnr8t20' FROM MenuItems WHERE restaurant_id = @IdBanhMiCua AND name = N'Bánh Mì Sốt Gạch Cua + Trứng Tôm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-md8bf98m12db40' FROM MenuItems WHERE restaurant_id = @IdBanhMiCua AND name = N'Bánh Mì Sốt Gạch Cua + Thịt Cua Tuyết' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-md53b2lox4fhc8' FROM MenuItems WHERE restaurant_id = @IdBanhMiCua AND name = N'Combo 04 Bánh mì Gạch Cua' UNION ALL

-- Khoai Mỡ Lắc
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mkeps6tg46wz12' FROM MenuItems WHERE restaurant_id = @IdKhoaiMo AND name = N'Khoai Tây lốc xoáy' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr0tr39zshxg32' FROM MenuItems WHERE restaurant_id = @IdKhoaiMo AND name = N'Khoai mỡ lắc phô mai - Phần lớn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr788i7od28pf5' FROM MenuItems WHERE restaurant_id = @IdKhoaiMo AND name = N'Khoai mỡ lắc phô mai - Phần nhỏ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr788fy3ofq1cb' FROM MenuItems WHERE restaurant_id = @IdKhoaiMo AND name = N'Khoai mỡ chiên - Phần lớn' UNION ALL

-- Khói Quán
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mnbfd25iieise1' FROM MenuItems WHERE restaurant_id = @IdKhoiQuan AND name = N'Chả Mực-Cá Thác Lác Chiên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mnbf381mpo20a9' FROM MenuItems WHERE restaurant_id = @IdKhoiQuan AND name = N'Khoai Tây Lắc Phô Mai' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mnbiqz4d0umb15' FROM MenuItems WHERE restaurant_id = @IdKhoiQuan AND name = N'Cơm Chiên Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mnbmvq4l6tj96c' FROM MenuItems WHERE restaurant_id = @IdKhoiQuan AND name = N'Bún Gạo Xào Bò' UNION ALL

-- T & T Coffee
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjtndd3tm7eu4f' FROM MenuItems WHERE restaurant_id = @IdTTCoffee AND name = N'Cà Phê Muối' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjtndxfe61oh6a' FROM MenuItems WHERE restaurant_id = @IdTTCoffee AND name = N'Bạc Xỉu Đá' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjtxt3ozh5a838' FROM MenuItems WHERE restaurant_id = @IdTTCoffee AND name = N'Đá Xay Matcha' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj5coqq6nsw3b4' FROM MenuItems WHERE restaurant_id = @IdTTCoffee AND name = N'Yaourt Matcha Dâu' UNION ALL

-- Sầu Riêng Nhà Vườn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6pbuzruv89aa' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Cơm sầu riêng Ri6 - Hộp 500gr' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb1v3c1qc05z57' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Cơm sầu riêng Ri 6 - Hộp 1kg' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6k1ewex41w59' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Cơm sầu Thái chín cây - Hộp 500gr' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6oojwhrkbd0a' FROM MenuItems WHERE restaurant_id = @IdSauRieng AND name = N'Cơm sầu riêng Chuồng Bò - hộp 500gr' UNION ALL

-- Sâm Chill Me
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1dw2ctjldw86' FROM MenuItems WHERE restaurant_id = @IdChillMe AND name = N'Nước Dừa Tắc - Size L' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1dw1wkqj9hbc' FROM MenuItems WHERE restaurant_id = @IdChillMe AND name = N'Sâm Táo Bát Bảo' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1dw1y37eh03d' FROM MenuItems WHERE restaurant_id = @IdChillMe AND name = N'Me Đác Mê Mẫn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm1dw2wd5xxg91' FROM MenuItems WHERE restaurant_id = @IdChillMe AND name = N'Trà Sữa Kem Trứng' UNION ALL

-- Bánh Mì Hà Nội
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr75mzup1xhg62' FROM MenuItems WHERE restaurant_id = @IdBanhMiHN AND name = N'Bông lan trứng muối' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr75my0nb449bf' FROM MenuItems WHERE restaurant_id = @IdBanhMiHN AND name = N'Bánh bông cúc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr0qbbhoand0d9' FROM MenuItems WHERE restaurant_id = @IdBanhMiHN AND name = N'Bánh mì sốt chà bông' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr0j41bnrah065' FROM MenuItems WHERE restaurant_id = @IdBanhMiHN AND name = N'Humburger bò trứng' UNION ALL

-- Bếp Nhà Bé Béo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdvhfcmhjbml21' FROM MenuItems WHERE restaurant_id = @IdBeBeo AND name = N'Mì phá lấu nước' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdpqztignpv06c' FROM MenuItems WHERE restaurant_id = @IdBeBeo AND name = N'Phá lấu bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnxqx2klj4065f' FROM MenuItems WHERE restaurant_id = @IdBeBeo AND name = N'Mì trộn đùi gà mắm tỏi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdq1su78kkhx32' FROM MenuItems WHERE restaurant_id = @IdBeBeo AND name = N'Chén lá mía' UNION ALL

-- Bếp Nhà Na
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqx396zwunycb7' FROM MenuItems WHERE restaurant_id = @IdNaThai AND name = N'Canh tomyum hải sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqvvxbepsm8p09' FROM MenuItems WHERE restaurant_id = @IdNaThai AND name = N'Hủ tíu xào tôm gà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m5s43mhje58j09' FROM MenuItems WHERE restaurant_id = @IdNaThai AND name = N'Xôi xoài' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-ma16x1ahrkn80c' FROM MenuItems WHERE restaurant_id = @IdNaThai AND name = N'Gỏi đu đủ thai ba khía' UNION ALL

-- Nem Nướng Vân
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcz4gxyhiyzg91' FROM MenuItems WHERE restaurant_id = @IdNemVan AND name = N'Set Nem Nướng Đặc Biệt 1 Người' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcz343huv1cs4c' FROM MenuItems WHERE restaurant_id = @IdNemVan AND name = N'Set Nem Nướng 2 Người' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcz2oiezw6e477' FROM MenuItems WHERE restaurant_id = @IdNemVan AND name = N'Thịt Xiên Nướng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mcz2pj860xpp84' FROM MenuItems WHERE restaurant_id = @IdNemVan AND name = N'Nem Kem Phô Mai';