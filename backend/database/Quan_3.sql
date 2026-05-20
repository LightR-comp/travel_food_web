USE travel_food_db
GO

-- ==========================================
-- QUẬN 3
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Bún Bò Sa Tế Sả Quận 3 - Nguyễn Thông', N'37B Nguyễn Thông, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.778046, 106.684332, 4.3, 60000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Big Feet - Chân Gà Đông Tảo Hấp Hành - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.8, 450000, '10:00', '23:00', N'vietnamese, nhậu'),
(N'Tre Tre - Gà Nướng Ống Tre Tây Bắc - Quận 3', N'52/1 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790639, 106.686359, 4.7, 350000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'Hanyang - Gà Tre Hầm Sâm Hàn Quốc - Quận 3', N'52/1 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790639, 106.686359, 4.2, 400000, '10:00', '22:30', N'korean, nhà hàng'),
(N'Lão Trư - Chân Gà Hấp Tàu Xì - Quận 3', N'52/6 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790644, 106.686412, 3.2, 480000, '15:00', '23:30', N'asian, nhậu'),
(N'Thằng Bờm - Gà Lam Ống Nứa Tây Nguyên - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 4.8, 350000, '10:00', '22:00', N'vietnamese, gia đình'),
(N'Phở Thìn - Bà Huyện Thanh Quan', N'39 Bà Huyện Thanh Quan, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.775511, 106.689706, 4.1, 125000, '06:00', '21:00', N'vietnamese, nhà hàng'),
(N'GÀ ĐẤT - Gà Đất Sét Ôm Xôi & Gà Nướng Nồi Đất - Quận 3', N'52/1/1 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790800, 106.686353, 3.7, 300000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'Gà Đốt Kampot - Đặc Sản Hà Tiên - Quận 3', N'52/1 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790639, 106.686359, 3.4, 400000, '10:00', '22:00', N'vietnamese, độc lạ'),
(N'Vịt Khói - Đặc Sản Xôi Vịt Trời Tây Bắc - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.2, 350000, '10:00', '23:00', N'vietnamese, gia đình'),
(N'O Thum - Gà Không Lối Thoát & Gà Đốt Lá Chúc - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 4.6, 400000, '09:00', '22:00', N'vietnamese, độc lạ'),
(N'Gà Ủ Muối Deli - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.4, 200000, '08:00', '21:00', N'vietnamese, mang về'),
(N'GUTA CAFE - 8 Bà Huyện Thanh Quan', N'8 Bà Huyện Thanh Quan, P. 6, Quận 3, TP. HCM', 10.783606, 106.679681, 4.8, 45000, '07:00', '22:00', N'cafe, bình dân'),
(N'A Phủ - Gà Hấp Nước Tương - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.9, 170000, '10:00', '22:00', N'vietnamese, nhậu'),
(N'Bếp Xanh - Hủ Tiếu Ngon Quận 3 & Hủ Tiếu Mực Bào Ngư', N'428 Cách Mạng Tháng Tám, P. 9, Quận 3, TP. HCM', 10.783759, 106.670753, 4.2, 80000, '06:00', '21:30', N'vietnamese, bình dân'),
(N'Vịt Bamboo - Vịt Lam Ống Tre Tây Bắc - Quận 3', N'52/1 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790639, 106.686359, 4.6, 350000, '10:00', '22:00', N'vietnamese, gia đình'),
(N'Nam Phương Quán - Cá Lóc Đồng Quay Me Cuốn Bánh Tráng - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 4.1, 290000, '10:30', '22:30', N'vietnamese, nhậu'),
(N'Gà Bản Đôn - Gà Nướng Sa Lửa & Gà Nướng Cơm Lam Tây Nguyên - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.8, 300000, '09:00', '22:00', N'vietnamese, gia đình'),
(N'Út Lục Lâm - Ốc Hấp Tiêu Xanh - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 2.8, 80000, '15:00', '23:30', N'seafood, bình dân'),
(N'Đất Phương Nam - Vịt Nướng Muối Ớt - Quận 3', N'52/3 Lý Chính Thắng, P. Võ Thị Sáu, Quận 3, TP. HCM', 10.790614, 106.686320, 3.6, 330000, '10:00', '22:00', N'vietnamese, nhậu');
GO

DECLARE @IdBunBoSaTe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò Sa Tế Sả Quận 3 - Nguyễn Thông');
DECLARE @IdBigFeet INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Big Feet - Chân Gà Đông Tảo Hấp Hành - Quận 3');
DECLARE @IdTreTre INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tre Tre - Gà Nướng Ống Tre Tây Bắc - Quận 3');
DECLARE @IdHanyang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hanyang - Gà Tre Hầm Sâm Hàn Quốc - Quận 3');
DECLARE @IdLaoTru INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lão Trư - Chân Gà Hấp Tàu Xì - Quận 3');
DECLARE @IdThangBom INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thằng Bờm - Gà Lam Ống Nứa Tây Nguyên - Quận 3');
DECLARE @IdPhoThin INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Thìn - Bà Huyện Thanh Quan');
DECLARE @IdGaDat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'GÀ ĐẤT - Gà Đất Sét Ôm Xôi & Gà Nướng Nồi Đất - Quận 3');
DECLARE @IdGaDotKampot INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Đốt Kampot - Đặc Sản Hà Tiên - Quận 3');
DECLARE @IdVitKhoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Vịt Khói - Đặc Sản Xôi Vịt Trời Tây Bắc - Quận 3');
DECLARE @IdOThum INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'O Thum - Gà Không Lối Thoát & Gà Đốt Lá Chúc - Quận 3');
DECLARE @IdGaUMuoiDeli INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Ủ Muối Deli - Quận 3');
DECLARE @IdGutaCafe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'GUTA CAFE - 8 Bà Huyện Thanh Quan');
DECLARE @IdAPhu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'A Phủ - Gà Hấp Nước Tương - Quận 3');
DECLARE @IdBepXanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Xanh - Hủ Tiếu Ngon Quận 3 & Hủ Tiếu Mực Bào Ngư');
DECLARE @IdVitBamboo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Vịt Bamboo - Vịt Lam Ống Tre Tây Bắc - Quận 3');
DECLARE @IdNamPhuong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nam Phương Quán - Cá Lóc Đồng Quay Me Cuốn Bánh Tráng - Quận 3');
DECLARE @IdGaBanDon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Bản Đôn - Gà Nướng Sa Lửa & Gà Nướng Cơm Lam Tây Nguyên - Quận 3');
DECLARE @IdUtLucLam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Út Lục Lâm - Ốc Hấp Tiêu Xanh - Quận 3');
DECLARE @IdDatPhuongNam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Đất Phương Nam - Vịt Nướng Muối Ớt - Quận 3');

-- ==========================================
-- CHÈN MENU (Lấy ngẫu nhiên 4-5 món)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdBunBoSaTe, N'BÚN BÒ KHÔ TÔ THƯỜNG', N'Gồm thịt, chả cua, chả Huế. Chưa bao gồm hộp và dụng cụ ăn uống', 73000, 'vietnamese', 'beef noodle soup,crab sausage,pork sausage'),
(@IdBunBoSaTe, N'BÚN BÒ NƯỚC TÔ THƯỜNG', N'Chưa có tô giấy và bộ muỗng đũa. Gồm thịt, chả cua, chả Huế.', 73000, 'vietnamese', 'beef noodle soup,crab sausage,pork sausage,broth'),
(@IdBunBoSaTe, N'BÚN BÒ KHÔ ĐẶC BIỆT SỤN', N'Gồm thịt, chả cua, chả Huế, sụn bò.', 93000, 'vietnamese', 'beef noodle soup,beef cartilage,crab sausage'),
(@IdBunBoSaTe, N'BÁNH MÌ XÍU MẠI', N'Đã có bộ dụng cụ ăn uống, gồm 2 viên xíu mại và 1 ổ bánh mì', 45000, 'vietnamese', 'bread,meatball'),

(@IdBigFeet, N'Chân Gà Đông Tảo Hưng Yên Hấp Mắm Nhĩ (2 Chân)', N'', 454100, 'vietnamese', 'dong tao chicken feet,fish sauce'),
(@IdBigFeet, N'Chân Gà Đông Tảo Hầm Táo Đỏ Hạt Sen (2 Chân)', N'', 470250, 'vietnamese', 'dong tao chicken feet,jujube,lotus seed'),
(@IdBigFeet, N'Gà Đông Tảo ủ muối hoa tiêu nguyên con', N'', 1800250, 'vietnamese', 'dong tao chicken,pepper salt'),
(@IdBigFeet, N'Nộm Chân Gà Đông Tảo Hưng Yên (2 Chân)', N'', 498750, 'vietnamese', 'dong tao chicken feet,salad,prawn crackers'),

(@IdTreTre, N'Gà vườn ôm xôi lòng mề hạt sen nướng ống tre Tây Bắc nguyên con', N'Gà thả vườn con còn sống 1.2-1.4kg', 448000, 'vietnamese', 'free-range chicken,sticky rice,chicken giblets,lotus seed'),
(@IdTreTre, N'Gà đen Tủa Chùa ôm nấm nướng ống tre Tây Bắc nguyên con', N'', 748000, 'vietnamese', 'black chicken,mushroom,bamboo tube'),
(@IdTreTre, N'Gà Đông Tảo Hưng Yên nướng ống tre Tây Bắc nguyên con', N'', 1348000, 'vietnamese', 'dong tao chicken,bamboo tube'),
(@IdTreTre, N'Vịt cherry nướng ống tre nguyên con', N'', 448000, 'vietnamese', 'duck,bamboo tube'),

(@IdHanyang, N'Gà vườn hầm sâm Hàn Quốc nguyên con', N'', 388000, 'korean', 'free-range chicken,ginseng,broth'),
(@IdHanyang, N'Gà đen Sa Pa hầm sâm Hàn Quốc nguyên con', N'', 748000, 'korean', 'black chicken,ginseng,broth'),
(@IdHanyang, N'Gà Đông Tảo Hưng Yên nấu giả cầy - 1/2 con', N'', 768000, 'korean', 'dong tao chicken,galangal,shrimp paste'),
(@IdHanyang, N'Chân gà Đông Tảo hấp xì dầu (2 chân)', N'', 648000, 'korean', 'dong tao chicken feet,soy sauce'),

(@IdLaoTru, N'Chân Gà Đông Tảo Hấp Tàu Xì (2 Chân)', N'', 488000, 'asian', 'dong tao chicken feet,soy sauce,black bean sauce'),
(@IdLaoTru, N'Chân Gà Đông Tảo Hấp Mắm Nhĩ (2 Chân)', N'', 488000, 'vietnamese', 'dong tao chicken feet,fish sauce'),
(@IdLaoTru, N'Chân Gà Đông Tảo Trộn Thính (2 Chân)', N'', 468000, 'vietnamese', 'dong tao chicken feet,roasted rice powder'),
(@IdLaoTru, N'Gà Vườn Nướng Ớt - 1 Con', N'', 245000, 'vietnamese', 'grilled chicken,chili'),

(@IdThangBom, N'Gà vườn lam ống nứa nguyên con', N'1 con gà sẽ lam được trong 3-6 ống nứa', 345000, 'vietnamese', 'free-range chicken,bamboo tube'),
(@IdThangBom, N'Gà Đông Tảo Hưng Yên lam ống nứa nguyên con', N'', 1395000, 'vietnamese', 'dong tao chicken,bamboo tube'),
(@IdThangBom, N'Vịt Cherry lam ống nứa nguyên con', N'', 445000, 'vietnamese', 'duck,bamboo tube'),
(@IdThangBom, N'Gà vườn nướng ống tre nguyên con + xôi lòng mề hạt sen', N'', 445000, 'vietnamese', 'grilled chicken,bamboo tube,sticky rice'),

(@IdPhoThin, N'Phở Tái Lăn Truyền Thống', N'', 125000, 'vietnamese', 'pho noodles,stir-fried beef,broth,scallion'),
(@IdPhoThin, N'Phở Đặc Biệt', N'', 165000, 'vietnamese', 'pho noodles,mixed beef,broth'),
(@IdPhoThin, N'Phở Lõi Lăn', N'', 220000, 'vietnamese', 'pho noodles,stir-fried beef shank,broth'),
(@IdPhoThin, N'Phở Sốt Vang', N'', 140000, 'vietnamese', 'pho noodles,beef stew,wine sauce'),

(@IdGaDat, N'Gà đen Tây Bắc ôm xôi trắng nướng đất sét nguyên con', N'', 691456, 'vietnamese', 'black chicken,sticky rice,clay baked'),
(@IdGaDat, N'Gà Đông Tảo Hưng Yên nướng đất sét nguyên con', N'', 1371456, 'vietnamese', 'dong tao chicken,clay baked'),
(@IdGaDat, N'Gà thả vườn nổ muối hột chanh sả trong nồi đất nguyên con', N'', 291456, 'vietnamese', 'free-range chicken,rock salt,lemongrass'),
(@IdGaDat, N'Chân gà Đông Tảo ủ muối (2 chân)', N'', 591456, 'vietnamese', 'dong tao chicken feet,salt'),

(@IdGaDotKampot, N'Gà vườn đốt Kampot nguyên con', N'Gà đốt Kampot hay còn gọi là gà đốt lá chúc', 398000, 'vietnamese', 'free-range chicken,kampot leaves'),
(@IdGaDotKampot, N'Vịt Cherry đốt Kampot nguyên con', N'', 398000, 'vietnamese', 'duck,kampot leaves'),
(@IdGaDotKampot, N'Gà đen H''Mông hầm nấm mối táo đỏ hạt sen nguyên con', N'', 745000, 'vietnamese', 'black chicken,termite mushroom,jujube'),
(@IdGaDotKampot, N'Gà Đông Tảo ủ muối thảo mộc nguyên con', N'', 1895000, 'vietnamese', 'dong tao chicken,herbal salt'),

(@IdVitKhoi, N'Xôi vịt trời hun khói (xôi chiên chà bông áp chảo) - nguyên 1 con', N'', 545000, 'vietnamese', 'sticky rice,smoked mallard,pork floss'),
(@IdVitKhoi, N'Mẹt Vịt Lên Mâm 5 Món (vịt quay+vịt rang+gỏi+lòng vịt+bún)', N'', 525000, 'vietnamese', 'roast duck,duck salad,rice noodles'),
(@IdVitKhoi, N'Vịt trời hun khói nướng sa tế - 1 con', N'', 348000, 'vietnamese', 'smoked mallard,sate sauce'),
(@IdVitKhoi, N'Vịt trời hun khói nấu giả cầy nguyên con', N'', 525000, 'vietnamese', 'smoked mallard,galangal,shrimp paste'),

(@IdOThum, N'Gà vườn không lối thoát (gà bó xôi) trắng truyền thống chiên giòn', N'', 370000, 'vietnamese', 'free-range chicken,fried sticky rice'),
(@IdOThum, N'Gà vườn không lối thoát (gà bó xôi) ngũ sắc Tây Bắc nguyên con', N'', 520000, 'vietnamese', 'free-range chicken,colored sticky rice'),
(@IdOThum, N'Chân Gà Đông Tảo Bó Xôi Trắng Chiên Giòn (2 Chân)', N'', 595000, 'vietnamese', 'dong tao chicken feet,fried sticky rice'),
(@IdOThum, N'Gà Đen H''Mông Không Lối Thoát (Gà Đen Bó Xôi)', N'', 745000, 'vietnamese', 'black chicken,fried sticky rice'),

(@IdGaUMuoiDeli, N'Gà Đông Tảo Hưng Yên ủ muối thảo mộc - 1/2 con', N'', 985000, 'vietnamese', 'dong tao chicken,herbal salt'),
(@IdGaUMuoiDeli, N'1/2 con gà ta ủ muối', N'', 118000, 'vietnamese', 'chicken,salt'),
(@IdGaUMuoiDeli, N'1 con Gà vườn nướng ống tre Tây Bắc  - ít ớt', N'', 360000, 'vietnamese', 'grilled chicken,bamboo tube,chili'),
(@IdGaUMuoiDeli, N'Lẩu gà Đông Tảo nấu nấm nguyên con', N'', 1395000, 'vietnamese', 'dong tao chicken,mushroom,hotpot'),

(@IdGutaCafe, N'Trà sữa  Oolong đặc biệt size M', N'', 40500, 'cafe', 'oolong tea,milk,boba'),
(@IdGutaCafe, N'Matcha Latte', N'', 35000, 'cafe', 'matcha,milk'),
(@IdGutaCafe, N'Bánh Mì Que Pate Chà Bông', N'', 22000, 'cafe', 'breadstick,pate,pork floss'),
(@IdGutaCafe, N'Hot Cappuccino', N'', 35000, 'cafe', 'cappuccino,milk'),

(@IdAPhu, N'Gà hấp nước tương nguyên con + xôi tam sắc + gỏi + trứng non', N'', 445000, 'vietnamese', 'steamed chicken,soy sauce,sticky rice,young egg'),
(@IdAPhu, N'Gà hấp nước tương mỡ hành tóp mỡ - nguyên con', N'', 315000, 'vietnamese', 'steamed chicken,soy sauce,scallion oil,pork crackling'),
(@IdAPhu, N'Gà đen H''Mông hấp nước tương - nguyên con', N'', 545000, 'vietnamese', 'black chicken,soy sauce'),
(@IdAPhu, N'Gà Đông Tảo Hưng Yên hấp nước tương - nguyên con', N'', 1315000, 'vietnamese', 'dong tao chicken,soy sauce'),

(@IdBepXanh, N'Hủ tiếu gà trứng non', N'', 99000, 'vietnamese', 'hu tieu noodles,chicken,young egg'),
(@IdBepXanh, N'Hủ tiếu xá xíu', N'', 79000, 'vietnamese', 'hu tieu noodles,char siu pork'),
(@IdBepXanh, N'Hủ tiếu mực', N'', 97000, 'vietnamese', 'hu tieu noodles,squid'),
(@IdBepXanh, N'Hủ tiếu bào ngư hải sản', N'', 229000, 'vietnamese', 'hu tieu noodles,abalone,seafood'),

(@IdVitBamboo, N'Vịt Đồng Lam Ống Tre Nguyên Con', N'', 345000, 'vietnamese', 'duck,bamboo tube'),
(@IdVitBamboo, N'Vịt Cherry Lam Ống Tre Nguyên Con', N'', 445000, 'vietnamese', 'duck,bamboo tube'),
(@IdVitBamboo, N'Gà Mẹt 7 Món', N'', 895000, 'vietnamese', 'chicken,sticky rice,salad,spring roll'),
(@IdVitBamboo, N'Gà Đông Tảo Hưng Yên bó xôi truyền thống nguyên con', N'', 1395000, 'vietnamese', 'dong tao chicken,fried sticky rice'),

(@IdNamPhuong, N'Cá lóc đồng nướng muối ớt cuốn bánh tráng (size nhỏ)', N'', 195000, 'vietnamese', 'snakehead fish,chili salt,rice paper,herbs'),
(@IdNamPhuong, N'Cá lóc đồng quay sốt xí muội cuốn bánh tráng (size to)', N'', 385000, 'vietnamese', 'snakehead fish,plum sauce,rice paper'),
(@IdNamPhuong, N'Cá lóc đồng nướng lá chuối cuốn bánh tráng (size to)', N'', 285000, 'vietnamese', 'snakehead fish,banana leaf,rice paper'),
(@IdNamPhuong, N'Chả giò cá lóc (8 cuốn)', N'', 165000, 'vietnamese', 'snakehead fish,spring roll'),

(@IdGaBanDon, N'Gà nướng sa lửa nguyên con + 1 cơm lam Tây Nguyên', N'', 308000, 'vietnamese', 'grilled chicken,bamboo sticky rice'),
(@IdGaBanDon, N'Gà nướng sa tế nguyên con + 5 ống cơm lam Tây Nguyên + 4 xiên thịt nướng', N'', 478000, 'vietnamese', 'grilled chicken,sate sauce,bamboo sticky rice,grilled meat'),
(@IdGaBanDon, N'Gà nướng mắc khén nguyên con + 2 ống cơm lam Tây Nguyên', N'', 298000, 'vietnamese', 'grilled chicken,mac khen pepper,bamboo sticky rice'),
(@IdGaBanDon, N'Gà nướng sốt chanh dây nguyên con + 2 ống cơm lam Tây Nguyên', N'', 298000, 'vietnamese', 'grilled chicken,passion fruit sauce,bamboo sticky rice'),

(@IdUtLucLam, N'Ốc bươu hấp tiêu xanh', N'', 78000, 'seafood', 'apple snail,green pepper'),
(@IdUtLucLam, N'Ốc bulot hấp sả ớt', N'', 88000, 'seafood', 'bulot snail,lemongrass,chili'),
(@IdUtLucLam, N'Sò điệp hấp sả', N'', 88000, 'seafood', 'scallop,lemongrass'),
(@IdUtLucLam, N'Vẹm hấp sả', N'', 78000, 'seafood', 'mussel,lemongrass'),

(@IdDatPhuongNam, N'Vịt cỏ nướng muối ớt - 1 con', N'', 331650, 'vietnamese', 'grass duck,chili salt'),
(@IdDatPhuongNam, N'Vịt cherry nướng ống tre nguyên con', N'', 460350, 'vietnamese', 'duck,bamboo tube'),
(@IdDatPhuongNam, N'Vịt cỏ nướng sa tế - 1 con', N'', 331650, 'vietnamese', 'grass duck,sate sauce'),
(@IdDatPhuongNam, N'Vịt cherry nướng tiêu đen - 1 con', N'', 391050, 'vietnamese', 'duck,black pepper');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
-- Tự động trích xuất ảnh của một trong các món để làm thumbnail cho quán
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdBunBoSaTe, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m8orsna2jkuc63', 1),
(@IdBigFeet, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meu12y1dophif9', 1),
(@IdTreTre, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg7nbu9fsdu1f7', 1),
(@IdHanyang, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj9koxe3z8ch7e', 1),
(@IdLaoTru, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqzt1i1yhvld7', 1),
(@IdThangBom, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhbbps1d1nv346', 1),
(@IdPhoThin, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m31hd7qgevui67', 1),
(@IdGaDat, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb4you5drsns1a', 1),
(@IdGaDotKampot, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh0ip7pmg55b4f', 1),
(@IdVitKhoi, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdu2vfntllfp4b', 1),
(@IdOThum, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb2c17uwnw7s35', 1),
(@IdGaUMuoiDeli, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhpz5b2436km19', 1),
(@IdGutaCafe, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mny44s32xurp20', 1),
(@IdAPhu, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-metsacpgatjab9', 1),
(@IdBepXanh, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnux6u9dughy92', 1),
(@IdVitBamboo, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh4jo6uj6ayxc4', 1),
(@IdNamPhuong, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mii7e9zpce86cf', 1),
(@IdGaBanDon, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdyahelhdpmt2a', 1),
(@IdUtLucLam, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mi47zirvtypz5e', 1),
(@IdDatPhuongNam, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miqxsecbetjc83', 1);

-- ==========================================
-- CHÈN ẢNH CHO TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Bún Bò Sa Tế Sả Quận 3
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m8orsna2jkuc63' FROM MenuItems WHERE restaurant_id = @IdBunBoSaTe AND name = N'BÚN BÒ KHÔ TÔ THƯỜNG' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9oi0jo36esu92' FROM MenuItems WHERE restaurant_id = @IdBunBoSaTe AND name = N'BÚN BÒ NƯỚC TÔ THƯỜNG' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9ohlgcs7ofid6' FROM MenuItems WHERE restaurant_id = @IdBunBoSaTe AND name = N'BÚN BÒ KHÔ ĐẶC BIỆT SỤN' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9oinzm64i9aca' FROM MenuItems WHERE restaurant_id = @IdBunBoSaTe AND name = N'BÁNH MÌ XÍU MẠI' UNION ALL

-- Big Feet
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meu12y1dophif9' FROM MenuItems WHERE restaurant_id = @IdBigFeet AND name = N'Chân Gà Đông Tảo Hưng Yên Hấp Mắm Nhĩ (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mexvh0wjk4qt20' FROM MenuItems WHERE restaurant_id = @IdBigFeet AND name = N'Chân Gà Đông Tảo Hầm Táo Đỏ Hạt Sen (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgk7wuuzi5mza5' FROM MenuItems WHERE restaurant_id = @IdBigFeet AND name = N'Gà Đông Tảo ủ muối hoa tiêu nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mexw3mbj2ole5d' FROM MenuItems WHERE restaurant_id = @IdBigFeet AND name = N'Nộm Chân Gà Đông Tảo Hưng Yên (2 Chân)' UNION ALL

-- Tre Tre
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg7nbu9fsdu1f7' FROM MenuItems WHERE restaurant_id = @IdTreTre AND name = N'Gà vườn ôm xôi lòng mề hạt sen nướng ống tre Tây Bắc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg7ndvj71s7h40' FROM MenuItems WHERE restaurant_id = @IdTreTre AND name = N'Gà đen Tủa Chùa ôm nấm nướng ống tre Tây Bắc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mg7nudgy2xhp69' FROM MenuItems WHERE restaurant_id = @IdTreTre AND name = N'Gà Đông Tảo Hưng Yên nướng ống tre Tây Bắc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh5x54resp3i67' FROM MenuItems WHERE restaurant_id = @IdTreTre AND name = N'Vịt cherry nướng ống tre nguyên con' UNION ALL

-- Hanyang
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj9koxe3z8ch7e' FROM MenuItems WHERE restaurant_id = @IdHanyang AND name = N'Gà vườn hầm sâm Hàn Quốc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj9kw4s3jls64e' FROM MenuItems WHERE restaurant_id = @IdHanyang AND name = N'Gà đen Sa Pa hầm sâm Hàn Quốc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj9vt2vjkutg3d' FROM MenuItems WHERE restaurant_id = @IdHanyang AND name = N'Gà Đông Tảo Hưng Yên nấu giả cầy - 1/2 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mj9vs7d60ow795' FROM MenuItems WHERE restaurant_id = @IdHanyang AND name = N'Chân gà Đông Tảo hấp xì dầu (2 chân)' UNION ALL

-- Lão Trư
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqzt1i1yhvld7' FROM MenuItems WHERE restaurant_id = @IdLaoTru AND name = N'Chân Gà Đông Tảo Hấp Tàu Xì (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-meqzuk26ttds84' FROM MenuItems WHERE restaurant_id = @IdLaoTru AND name = N'Chân Gà Đông Tảo Hấp Mắm Nhĩ (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mer0843ylqmd27' FROM MenuItems WHERE restaurant_id = @IdLaoTru AND name = N'Chân Gà Đông Tảo Trộn Thính (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr6frs5khvb826' FROM MenuItems WHERE restaurant_id = @IdLaoTru AND name = N'Gà Vườn Nướng Ớt - 1 Con' UNION ALL

-- Thằng Bờm
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhbbps1d1nv346' FROM MenuItems WHERE restaurant_id = @IdThangBom AND name = N'Gà vườn lam ống nứa nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhbbwr6xhwjx1d' FROM MenuItems WHERE restaurant_id = @IdThangBom AND name = N'Gà Đông Tảo Hưng Yên lam ống nứa nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhbc25rwjdoo4b' FROM MenuItems WHERE restaurant_id = @IdThangBom AND name = N'Vịt Cherry lam ống nứa nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhbcgq00n1n2c8' FROM MenuItems WHERE restaurant_id = @IdThangBom AND name = N'Gà vườn nướng ống tre nguyên con + xôi lòng mề hạt sen' UNION ALL

-- Phở Thìn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m31hd7qgevui67' FROM MenuItems WHERE restaurant_id = @IdPhoThin AND name = N'Phở Tái Lăn Truyền Thống' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m31hfkm65ur465' FROM MenuItems WHERE restaurant_id = @IdPhoThin AND name = N'Phở Đặc Biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m31hghji0oa861' FROM MenuItems WHERE restaurant_id = @IdPhoThin AND name = N'Phở Lõi Lăn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m31hf9o66fao09' FROM MenuItems WHERE restaurant_id = @IdPhoThin AND name = N'Phở Sốt Vang' UNION ALL

-- Gà Đất
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb4you5drsns1a' FROM MenuItems WHERE restaurant_id = @IdGaDat AND name = N'Gà đen Tây Bắc ôm xôi trắng nướng đất sét nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb4z53quqswoa2' FROM MenuItems WHERE restaurant_id = @IdGaDat AND name = N'Gà Đông Tảo Hưng Yên nướng đất sét nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbardbrrglw7d8' FROM MenuItems WHERE restaurant_id = @IdGaDat AND name = N'Gà thả vườn nổ muối hột chanh sả trong nồi đất nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgn6lke8akuhe4' FROM MenuItems WHERE restaurant_id = @IdGaDat AND name = N'Chân gà Đông Tảo ủ muối (2 chân)' UNION ALL

-- Gà Đốt Kampot
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh0ip7pmg55b4f' FROM MenuItems WHERE restaurant_id = @IdGaDotKampot AND name = N'Gà vườn đốt Kampot nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh1hxsg35gy69f' FROM MenuItems WHERE restaurant_id = @IdGaDotKampot AND name = N'Vịt Cherry đốt Kampot nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh1i7x88e4un01' FROM MenuItems WHERE restaurant_id = @IdGaDotKampot AND name = N'Gà đen H''Mông hầm nấm mối táo đỏ hạt sen nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh2zcokxw9ag4b' FROM MenuItems WHERE restaurant_id = @IdGaDotKampot AND name = N'Gà Đông Tảo ủ muối thảo mộc nguyên con' UNION ALL

-- Vịt Khói
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdu2vfntllfp4b' FROM MenuItems WHERE restaurant_id = @IdVitKhoi AND name = N'Xôi vịt trời hun khói (xôi chiên chà bông áp chảo) - nguyên 1 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdvao6pxp3n630' FROM MenuItems WHERE restaurant_id = @IdVitKhoi AND name = N'Mẹt Vịt Lên Mâm 5 Món (vịt quay+vịt rang+gỏi+lòng vịt+bún)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdv8n8bh9wnxda' FROM MenuItems WHERE restaurant_id = @IdVitKhoi AND name = N'Vịt trời hun khói nướng sa tế - 1 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdvl9qpulgcld4' FROM MenuItems WHERE restaurant_id = @IdVitKhoi AND name = N'Vịt trời hun khói nấu giả cầy nguyên con' UNION ALL

-- O Thum
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mb2c17uwnw7s35' FROM MenuItems WHERE restaurant_id = @IdOThum AND name = N'Gà vườn không lối thoát (gà bó xôi) trắng truyền thống chiên giòn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbd6l6h4tiaf98' FROM MenuItems WHERE restaurant_id = @IdOThum AND name = N'Gà vườn không lối thoát (gà bó xôi) ngũ sắc Tây Bắc nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mggbygkg0x701f' FROM MenuItems WHERE restaurant_id = @IdOThum AND name = N'Chân Gà Đông Tảo Bó Xôi Trắng Chiên Giòn (2 Chân)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbs4upyg5r3m8b' FROM MenuItems WHERE restaurant_id = @IdOThum AND name = N'Gà Đen H''Mông Không Lối Thoát (Gà Đen Bó Xôi)' UNION ALL

-- Gà Ủ Muối Deli
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhpz5b2436km19' FROM MenuItems WHERE restaurant_id = @IdGaUMuoiDeli AND name = N'Gà Đông Tảo Hưng Yên ủ muối thảo mộc - 1/2 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqz53vavhfpgdb' FROM MenuItems WHERE restaurant_id = @IdGaUMuoiDeli AND name = N'1/2 con gà ta ủ muối' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ls3tvduer9vo2c' FROM MenuItems WHERE restaurant_id = @IdGaUMuoiDeli AND name = N'1 con Gà vườn nướng ống tre Tây Bắc  - ít ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhpzo6w9vll4c5' FROM MenuItems WHERE restaurant_id = @IdGaUMuoiDeli AND name = N'Lẩu gà Đông Tảo nấu nấm nguyên con' UNION ALL

-- Guta Cafe
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mny44s32xurp20' FROM MenuItems WHERE restaurant_id = @IdGutaCafe AND name = N'Trà sữa  Oolong đặc biệt size M' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9fsiekflnpgca' FROM MenuItems WHERE restaurant_id = @IdGutaCafe AND name = N'Matcha Latte' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mk93ac3p1jwj02' FROM MenuItems WHERE restaurant_id = @IdGutaCafe AND name = N'Bánh Mì Que Pate Chà Bông' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lshycd769qkka8' FROM MenuItems WHERE restaurant_id = @IdGutaCafe AND name = N'Hot Cappuccino' UNION ALL

-- A Phủ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-metsacpgatjab9' FROM MenuItems WHERE restaurant_id = @IdAPhu AND name = N'Gà hấp nước tương nguyên con + xôi tam sắc + gỏi + trứng non' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-metshyz3skxtdf' FROM MenuItems WHERE restaurant_id = @IdAPhu AND name = N'Gà hấp nước tương mỡ hành tóp mỡ - nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mett36btvrwl1b' FROM MenuItems WHERE restaurant_id = @IdAPhu AND name = N'Gà đen H''Mông hấp nước tương - nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mett5jjnuubp90' FROM MenuItems WHERE restaurant_id = @IdAPhu AND name = N'Gà Đông Tảo Hưng Yên hấp nước tương - nguyên con' UNION ALL

-- Bếp Xanh
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnux6u9dughy92' FROM MenuItems WHERE restaurant_id = @IdBepXanh AND name = N'Hủ tiếu gà trứng non' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnuxi4t174li30' FROM MenuItems WHERE restaurant_id = @IdBepXanh AND name = N'Hủ tiếu xá xíu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnuxi4sw7bwj2d' FROM MenuItems WHERE restaurant_id = @IdBepXanh AND name = N'Hủ tiếu mực' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnuvikko7i8695' FROM MenuItems WHERE restaurant_id = @IdBepXanh AND name = N'Hủ tiếu bào ngư hải sản' UNION ALL

-- Vịt Bamboo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh4jo6uj6ayxc4' FROM MenuItems WHERE restaurant_id = @IdVitBamboo AND name = N'Vịt Đồng Lam Ống Tre Nguyên Con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh4jf8n0737t97' FROM MenuItems WHERE restaurant_id = @IdVitBamboo AND name = N'Vịt Cherry Lam Ống Tre Nguyên Con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mh4k2c3irg2659' FROM MenuItems WHERE restaurant_id = @IdVitBamboo AND name = N'Gà Mẹt 7 Món' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-micmnspkz11f24' FROM MenuItems WHERE restaurant_id = @IdVitBamboo AND name = N'Gà Đông Tảo Hưng Yên bó xôi truyền thống nguyên con' UNION ALL

-- Nam Phương Quán
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mii7e9zpce86cf' FROM MenuItems WHERE restaurant_id = @IdNamPhuong AND name = N'Cá lóc đồng nướng muối ớt cuốn bánh tráng (size nhỏ)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhmzlxpm6sjl7e' FROM MenuItems WHERE restaurant_id = @IdNamPhuong AND name = N'Cá lóc đồng quay sốt xí muội cuốn bánh tráng (size to)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhijartnm5fp93' FROM MenuItems WHERE restaurant_id = @IdNamPhuong AND name = N'Cá lóc đồng nướng lá chuối cuốn bánh tráng (size to)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mhiivh4eqfpi39' FROM MenuItems WHERE restaurant_id = @IdNamPhuong AND name = N'Chả giò cá lóc (8 cuốn)' UNION ALL

-- Gà Bản Đôn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdyahelhdpmt2a' FROM MenuItems WHERE restaurant_id = @IdGaBanDon AND name = N'Gà nướng sa lửa nguyên con + 1 cơm lam Tây Nguyên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdvd2svqop0d26' FROM MenuItems WHERE restaurant_id = @IdGaBanDon AND name = N'Gà nướng sa tế nguyên con + 5 ống cơm lam Tây Nguyên + 4 xiên thịt nướng' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdvcxjk3p5el77' FROM MenuItems WHERE restaurant_id = @IdGaBanDon AND name = N'Gà nướng mắc khén nguyên con + 2 ống cơm lam Tây Nguyên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mdy3a72utf5u7e' FROM MenuItems WHERE restaurant_id = @IdGaBanDon AND name = N'Gà nướng sốt chanh dây nguyên con + 2 ống cơm lam Tây Nguyên' UNION ALL

-- Út Lục Lâm
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mi47zirvtypz5e' FROM MenuItems WHERE restaurant_id = @IdUtLucLam AND name = N'Ốc bươu hấp tiêu xanh' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mi480qey02rsc9' FROM MenuItems WHERE restaurant_id = @IdUtLucLam AND name = N'Ốc bulot hấp sả ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mi48mg1w12q01a' FROM MenuItems WHERE restaurant_id = @IdUtLucLam AND name = N'Sò điệp hấp sả' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mi491rkfb0ua07' FROM MenuItems WHERE restaurant_id = @IdUtLucLam AND name = N'Vẹm hấp sả' UNION ALL

-- Đất Phương Nam
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miqxsecbetjc83' FROM MenuItems WHERE restaurant_id = @IdDatPhuongNam AND name = N'Vịt cỏ nướng muối ớt - 1 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mir9tv8zover81' FROM MenuItems WHERE restaurant_id = @IdDatPhuongNam AND name = N'Vịt cherry nướng ống tre nguyên con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miqy0v95cwe8eb' FROM MenuItems WHERE restaurant_id = @IdDatPhuongNam AND name = N'Vịt cỏ nướng sa tế - 1 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mis72qq7nnygb6' FROM MenuItems WHERE restaurant_id = @IdDatPhuongNam AND name = N'Vịt cherry nướng tiêu đen - 1 con';