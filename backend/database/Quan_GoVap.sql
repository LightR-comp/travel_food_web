USE travel_food_db
GO

-- ==========================================
-- GÒ VẤP
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Cháo Hàu Ngọc Béo Gò Vấp', N'12 Dương Quảng Hàm, P. 5, Gò Vấp, TP. HCM', 10.823457, 106.695759, 4.3, 50000, '07:00', '22:00', N'vietnamese, bình dân'),
(N'Ghiền Ăn Vặt - Bánh Tráng Nướng - Gò Vấp', N'220/116/7 Nguyễn Văn Khối, P. Thông Tây Hội, Gò Vấp, TP. HCM', 10.845467, 106.655054, 4.7, 30000, '14:00', '23:30', N'asian, bình dân'),
(N'Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp', N'79/5 Thống Nhất, P. 11, Gò Vấp, TP. HCM', 10.833102, 106.662779, 4.2, 30000, '09:00', '22:30', N'asian, bình dân'),
(N'Hủ Tiếu Thái Lan Gò Vấp 20K', N'945/28B Lê Đức Thọ, P. 16, Gò Vấp, TP. HCM', 10.849977, 106.662570, 4.8, 60000, '06:00', '22:00', N'thai, bình dân'),
(N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 255 Lê Văn Thọ Gò Vấp', N'255 Lê Văn Thọ, P. 11, Gò Vấp, TP. HCM', 10.844037, 106.656997, 4.6, 50000, '09:00', '22:00', N'fastfood, bình dân'),
(N'Xôi Ghẹ Chính Gốc - Gò Vấp', N'250 Lê Văn Thọ, P. 11, Gò Vấp, TP. HCM', 10.843908, 106.657161, 4.2, 85000, '06:30', '21:30', N'vietnamese, bình dân'),
(N'Hiếu Hàu Gò Vấp - Lê Đức Thọ', N'530 Lê Đức Thọ, P. 17, Gò Vấp, TP. HCM', 10.843703, 106.674091, 4.7, 60000, '15:00', '23:30', N'seafood, bình dân'),
(N'Mì Cay Đại Hàn - Đường Số 19, Gò Vấp', N'42/11 Đường Số 19, P. 8, Gò Vấp, TP. HCM', 10.840670, 106.655234, 4.1, 65000, '09:00', '22:30', N'korean, bình dân'),
(N'QUÁN ĂN HÀN QUỐC SEUON KIM NEKO - Gò Vấp', N'496/99/17A Dương Quảng Hàm, P. 16, Gò Vấp, TP. HCM', 10.840428, 106.687070, 4.8, 75000, '09:00', '22:00', N'korean, bình dân'),
(N'Bếp Mẹ Shin Will - Chân Gà Sốt Thái Cay 5 Cấp Độ Và Trà Sữa, Ăn Vặt', N'102/5 Đường Số 20, P. 5, Gò Vấp, TP. HCM', 10.833508, 106.686570, 4.2, 100000, '10:00', '23:00', N'asian, nhậu'),
(N'Lẩu Khổ Qua Cá Thác Lác - Chợ Gò Vấp', N'Đối Diện 120 Nguyễn Văn Nghi, P. 5, Gò Vấp, TP. HCM', 10.823430, 106.687650, 4.9, 150000, '16:00', '23:30', N'vietnamese, gia đình'),
(N'Bún Bò Huế Cô Tuyết - Gò Vấp', N'152/2/48 Nguyễn Văn Khối, P. 9, Gò Vấp, TP. HCM', 10.843507, 106.655744, 4.1, 50000, '06:00', '13:00', N'vietnamese, bình dân'),
(N'Cháo Ếch Geylang Gia Bảo - Gò Vấp', N'43 Nguyễn Bỉnh Khiêm, P. 1, Gò Vấp, TP. HCM', 10.816743, 106.687488, 3.8, 80000, '16:00', '23:30', N'asian, bình dân'),
(N'Snow Bingsu & Tea Gò Vấp', N'78/11 Nguyễn Văn Khối, P. 11, Gò Vấp, TP. HCM', 10.843163, 106.659271, 4.6, 65000, '10:00', '22:30', N'dessert, bình dân'),
(N'Hân Gia Ký Gò Vấp - Mì Xào Giòn & Hủ Tiếu Xào - Lê Quang Định', N'583 Lê Quang Định, P. 1, Gò Vấp, TP. HCM', 10.820228, 106.689656, 4.2, 90000, '10:00', '22:00', N'vietnamese, gia đình'),
(N'Tiramisu - Gò vấp', N'Lô No1 Chung Cư K26 Dương Quảng Hàm, P. 7, Gò Vấp, TP. HCM', 10.827879, 106.690064, 4.3, 70000, '09:00', '22:00', N'dessert, bình dân'),
(N'Hạt Dẻ Gò Vấp', N'29/7/22 Lê Đức Thọ, P. 7, Gò Vấp, TP. HCM', 10.830518, 106.681254, 4.7, 100000, '08:00', '22:00', N'asian, bình dân'),
(N'Bánh Tráng Chấm & Xiên Que Gò Vấp', N'Số 45/2 Thông Tây Hội, P. 10, Gò Vấp, TP. HCM', 10.832716, 106.668333, 4.2, 35000, '14:00', '23:00', N'asian, bình dân'),
(N'Hủ Tiếu Mực - Bún Thái Tí Nị - Gò Vấp', N'166 Đường Số 20, P. 5, Gò Vấp, TP. HCM', 10.835565, 106.688210, 4.6, 75000, '06:30', '22:00', N'vietnamese, bình dân'),
(N'BÁNH TRÁNG & ĂN VẶT - MỸ HẰNG - GÒ VẤP', N'259/6 Đường Số 6, P. 7, Gò Vấp, TP. HCM', 10.850476, 106.670027, 4.1, 35000, '09:00', '22:00', N'asian, bình dân'),
(N'Trạm Cơm Gà & Bánh Mì 24H - Gò Vấp', N'237 Lê Văn Thọ, P. 8, Gò Vấp, TP. HCM', 10.843658, 106.656926, 4.8, 65000, '00:00', '23:59', N'vietnamese, bình dân'),
(N'Quán Ốc Tự Chọn Gò Vấp - Lê Hoàng Phái', N'77/48/1 Lê Hoàng Phái, P. 17, Gò Vấp, TP. HCM', 10.840397, 106.674218, 4.0, 60000, '15:00', '23:30', N'seafood, nhậu'),
(N'Delica - Mỳ Ý & Pizza - Phan Văn Trị', N'558 Phan Văn Trị, P. 7, Gò Vấp, TP. HCM', 10.830155, 106.779981, 4.7, 90000, '09:00', '22:30', N'italian, hẹn hò'),
(N'Bê Tươi Quyết Thắng Gò Vấp', N'102 Đường 28, P. 6, Gò Vấp, TP. HCM', 10.844218, 106.680783, 4.2, 150000, '10:00', '23:00', N'vietnamese, nhậu'),
(N'Delica - Mỳ ý & Pizza - Nguyễn Văn Khối', N'329 Nguyễn Văn Khối, P. 8, Gò Vấp, TP. HCM', 10.843480, 106.650031, 4.9, 90000, '09:00', '22:30', N'italian, hẹn hò');
GO

DECLARE @IdChaoHau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Hàu Ngọc Béo Gò Vấp');
DECLARE @IdGhienAnVat INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ghiền Ăn Vặt - Bánh Tráng Nướng - Gò Vấp');
DECLARE @IdBanhTrangCham INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp');
DECLARE @IdHuTieuThai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Thái Lan Gò Vấp 20K');
DECLARE @IdJimamaGV INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 255 Lê Văn Thọ Gò Vấp');
DECLARE @IdXoiGhe INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Xôi Ghẹ Chính Gốc - Gò Vấp');
DECLARE @IdHieuHau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hiếu Hàu Gò Vấp - Lê Đức Thọ');
DECLARE @IdMiCayDaiHan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Cay Đại Hàn - Đường Số 19, Gò Vấp');
DECLARE @IdSeuonKimNeko INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'QUÁN ĂN HÀN QUỐC SEUON KIM NEKO - Gò Vấp');
DECLARE @IdBepMeShin INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Mẹ Shin Will - Chân Gà Sốt Thái Cay 5 Cấp Độ Và Trà Sữa, Ăn Vặt');
DECLARE @IdLauKhoQua INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Khổ Qua Cá Thác Lác - Chợ Gò Vấp');
DECLARE @IdBunBoTuyet INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò Huế Cô Tuyết - Gò Vấp');
DECLARE @IdChaoEchGiaBao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Ếch Geylang Gia Bảo - Gò Vấp');
DECLARE @IdSnowBingsu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Snow Bingsu & Tea Gò Vấp');
DECLARE @IdHanGiaKy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hân Gia Ký Gò Vấp - Mì Xào Giòn & Hủ Tiếu Xào - Lê Quang Định');
DECLARE @IdTiramisuGV INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiramisu - Gò vấp');
DECLARE @IdHatDeGV INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hạt Dẻ Gò Vấp');
DECLARE @IdBanhTrangXienQue INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Chấm & Xiên Que Gò Vấp');
DECLARE @IdHuTieuMuc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Mực - Bún Thái Tí Nị - Gò Vấp');
DECLARE @IdMyHang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'BÁNH TRÁNG & ĂN VẶT - MỸ HẰNG - GÒ VẤP');
DECLARE @IdTramComGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Trạm Cơm Gà & Bánh Mì 24H - Gò Vấp');
DECLARE @IdOcTuChon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Ốc Tự Chọn Gò Vấp - Lê Hoàng Phái');
DECLARE @IdDelicaPVT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Delica - Mỳ Ý & Pizza - Phan Văn Trị');
DECLARE @IdBeTuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bê Tươi Quyết Thắng Gò Vấp');
DECLARE @IdDelicaNVK INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Delica - Mỳ ý & Pizza - Nguyễn Văn Khối');

-- ==========================================
-- CHÈN MENU (4 món ngẫu nhiên mỗi quán)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdChaoHau, N'Cháo hàu', N'Cháo và 1 phần hàu', 50000, 'vietnamese', 'porridge, oyster'),
(@IdChaoHau, N'Cháo hàu + bò', N'Cháo + 1 phần hàu + bò', 71000, 'vietnamese', 'porridge, oyster, beef'),
(@IdChaoHau, N'Hàu xào mỡ hành', N'Hàu xào với hành thêm chút mỡ cùng 1 quả trứng gà ăn cùng bánh đa', 58000, 'vietnamese', 'oyster, scallion oil, egg, rice paper'),
(@IdChaoHau, N'Trứng lộn', N'', 13000, 'vietnamese', 'balut'),

(@IdGhienAnVat, N'Bánh tráng mắm ruốc', N'Trứng chín, bánh mì chiên, hành lá', 14000, 'snack', 'rice paper, shrimp paste, egg, fried bread'),
(@IdGhienAnVat, N'Combo thèm món quê', N'Gồm 1 nem chua, 1 bánh tráng nướng đặc biệt', 45000, 'snack', 'fermented pork roll, grilled rice paper'),
(@IdGhienAnVat, N'Bánh tráng lụi sốt me', N'8 cuộn kèm xoài, sốt me thơm ngon', 30000, 'snack', 'rice paper roll, mango, tamarind sauce'),
(@IdGhienAnVat, N'Trà tắc thái xanh', N'', 25000, 'beverage', 'thai green tea, kumquat'),

(@IdBanhTrangCham, N'Bánh Tráng Chấm', N'Không trứng - size lớn', 24800, 'snack', 'rice paper'),
(@IdBanhTrangCham, N'Bánh Tráng Muối Nhuyễn', N'bánh tráng + muối nhuyễn + hành phi + tắc', 17600, 'snack', 'rice paper, salt, fried onion, kumquat'),
(@IdBanhTrangCham, N'Bánh Tráng Tỏi xike', N'mặn mặn kèm vị thơm của tỏi phi cay xè', 16000, 'snack', 'rice paper, garlic'),
(@IdBanhTrangCham, N'Mỡ Hành KHÔNG CAY - TRỘn SẵN', N'Gồm 2 trứng cút + xoài + sốt + rau răm + mỡ hành', 29600, 'snack', 'rice paper, quail egg, mango, scallion oil'),

(@IdHuTieuThai, N'HỦ TIẾU TOMYUM THÁI FULL TOPPING', N'Topping có: 2 miếng huyết, 1 trứng cút, 2 chả cá chiên, thịt hoặc xương.', 65000, 'thai', 'rice noodles, tomyum broth, quail egg, fish cake, pork'),
(@IdHuTieuThai, N'HỦ TIẾU ĐẶC BIỆT', N'Gồm: 1 tôm nhỏ, 1 thịt nạt, 1 xương, 2 lát bò viên, 2 lát mọc, 2 lát gan, 1 trứng cút', 73000, 'vietnamese', 'rice noodles, shrimp, pork, meatballs, quail egg, pork liver'),
(@IdHuTieuThai, N'MÌ TRỘN KHÔ NUỚC SỐT ĐẶC BIỆT', N'Gồm: tôm, thịt nạt, xương, bò viên, mọc, gan, trứng cút', 73000, 'vietnamese', 'noodles, shrimp, pork, meatballs, quail egg'),
(@IdHuTieuThai, N'HỦ TIẾU BÒ VIÊN', N'Bò viên dai đậm vị bò, nước dùng thanh ngọt', 55000, 'vietnamese', 'rice noodles, beef balls, broth'),

(@IdJimamaGV, N'Combo Gà Rán (Pep)', N'1 đùi gà + 1 cánh gà + 1 khoai + 1 nước', 110000, 'fastfood', 'fried chicken, french fries, pepsi'),
(@IdJimamaGV, N'Mỳ Ý Sinh Viên', N'Xoắn xuýt sợi Mì, sốt cà hết Ý!', 27800, 'italian', 'spaghetti, tomato sauce'),
(@IdJimamaGV, N'Cơm tôm chiên Tempura (New)', N'', 59000, 'asian', 'rice, tempura shrimp'),
(@IdJimamaGV, N'Combo Mỳ Ý Lạp Xưởng', N'1 Mỳ ý cà chua + 1 Lạp xưởng Đài Loan + 1 Nước ngọt', 53800, 'italian', 'spaghetti, tomato sauce, sausage, pepsi'),

(@IdXoiGhe, N'Xôi Ghẹ Vỏ Giòn M', N'Xôi nếp nương thơm dẻo, mỡ hành, hành phi, chà bông, ghẹ tươi', 73000, 'vietnamese', 'sticky rice, crab meat, scallion oil, pork floss'),
(@IdXoiGhe, N'Xôi Gà Xối Mỡ ( Góc Tư )', N'', 95000, 'vietnamese', 'sticky rice, fried chicken'),
(@IdXoiGhe, N'Cơm Chiên Gà Viên Trứng Ốp La', N'Cơm chiên + 3 gà viên + ốp la + dưa leo + bắp cải', 58000, 'vietnamese', 'fried rice, chicken balls, fried egg'),
(@IdXoiGhe, N'Xôi Ba Chỉ Khâu Nhục', N'', 87000, 'vietnamese', 'sticky rice, braised pork belly'),

(@IdHieuHau, N'Hàu nướng phô mai', N'Phần 5 con', 55000, 'seafood', 'oyster, cheese'),
(@IdHieuHau, N'Hàu hấp', N'1 túi hấp (15-20con)', 85000, 'seafood', 'steamed oyster'),
(@IdHieuHau, N'Hàu nướng mọi', N'Phần 5 con', 35000, 'seafood', 'grilled oyster'),
(@IdHieuHau, N'Hàu nướng phô mai trứng cút', N'Phần 5 con', 59000, 'seafood', 'oyster, cheese, quail egg'),

(@IdMiCayDaiHan, N'Mì Kimchi - Hải Sản', N'Khẩu phần: 2 tôm, 2 mực nang, 5 cá viên, 1 thanh cua', 71100, 'korean', 'noodles, kimchi, shrimp, squid, fish balls, crab stick'),
(@IdMiCayDaiHan, N'Mì Ramyun - Bò, Xúc xích, cá viên', N'Bò mỹ, xúc xích đức, cá viên', 58500, 'korean', 'ramyun, beef, sausage, fish balls'),
(@IdMiCayDaiHan, N'Mì Cay Khô - Xúc Xích, Cá Viên', N'Xúc xích đức, cá viên ngon', 49500, 'korean', 'noodles, sausage, fish balls'),
(@IdMiCayDaiHan, N'Mandu chiên', N'', 31200, 'korean', 'fried mandu'),

(@IdSeuonKimNeko, N'CƠM TRỘN HÀN QUỐC BA CHỈ BÒ PHI LÊ', N'Cơm + ba chỉ bò + trứng + rau củ + kim chi', 85000, 'korean', 'rice, beef belly, egg, kimchi, vegetables'),
(@IdSeuonKimNeko, N'CƠM TRỘN HÀN QUỐC XÚC XÍCH & CHẢ CÁ HQ', N'Cơm + xúc xích + chả cá + trứng + rau củ', 72000, 'korean', 'rice, sausage, fish cake, egg, vegetables'),
(@IdSeuonKimNeko, N'CƠM TRỘN HÀN QUỐC MỰC VÒNG', N'Cơm + mực vòng tẩm bột + trứng + kim chi', 75000, 'korean', 'rice, squid, egg, kimchi'),
(@IdSeuonKimNeko, N'MÌ TRỘN TƯƠNG ĐEN & MAMU NHÂN TÔM THỊT', N'Mì tương đen + mandu chiên giòn', 85000, 'korean', 'jajangmyeon, mandu, egg, kimchi'),

(@IdBepMeShin, N'Sứa Sốt Thái', N'200gr Sứa biển mát mix sốt thái', 105000, 'seafood', 'jellyfish, thai sauce'),
(@IdBepMeShin, N'Chân gà rút xương sốt Thái 5 cấp độ', N'11 - 13 chân. Có rau ngò thơm', 139000, 'vietnamese', 'boneless chicken feet, thai sauce'),
(@IdBepMeShin, N'Chân gà rút xương Hàn Quốc Cay', N'11 - 13 chân. Mặc định cay', 145000, 'korean', 'boneless chicken feet, korean spicy sauce'),
(@IdBepMeShin, N'Chân gà nguyên Xương sốt Thái', N'8 - 10 chân. Sốt thái chua cay', 99000, 'vietnamese', 'chicken feet, thai sauce'),

(@IdLauKhoQua, N'Cá thác lác', N'', 100000, 'hotpot', 'fish paste'),
(@IdLauKhoQua, N'Xí quách', N'3 cục', 65000, 'hotpot', 'pork bone'),
(@IdLauKhoQua, N'Đầu cá hồi', N'', 75000, 'hotpot', 'salmon head'),
(@IdLauKhoQua, N'Bạch tuột', N'', 100000, 'hotpot', 'octopus'),

(@IdBunBoTuyet, N'Bún bò đặc biệt', N'', 58000, 'vietnamese', 'rice noodles, beef, pork sausage'),
(@IdBunBoTuyet, N'Bún nạm gân', N'', 45000, 'vietnamese', 'rice noodles, beef flank, beef tendon'),
(@IdBunBoTuyet, N'Bún Giò', N'', 41000, 'vietnamese', 'rice noodles, pork knuckle'),
(@IdBunBoTuyet, N'Nước sâm nhà làm', N'', 13000, 'beverage', 'herbal drink'),

(@IdChaoEchGiaBao, N'Cháo Ếch Singapore 2 Con', N'Phần bình thường 1 người ăn (bán chạy)', 98000, 'asian', 'porridge, frog'),
(@IdChaoEchGiaBao, N'Cơm ếch 1 con', N'', 64000, 'asian', 'rice, frog'),
(@IdChaoEchGiaBao, N'Cháo bò sốt tiêu xanh đặc biệt 300g', N'Hai người ăn', 135000, 'asian', 'porridge, beef, green pepper'),
(@IdChaoEchGiaBao, N'Cháo lá dứa', N'', 10000, 'asian', 'pandan porridge'),

(@IdSnowBingsu, N'SMOOTHIE CHUỐI', N'', 70000, 'dessert', 'banana smoothie'),
(@IdSnowBingsu, N'HỒNG TRÀ SỮA PHOMAI DẦM', N'', 55000, 'beverage', 'black milk tea, cheese'),
(@IdSnowBingsu, N'BINGSU DÂU XOÀI', N'(Dâu, Xoài, Kiwi, Kem Matcha, Dừa, Sốt Sữa)', 145000, 'dessert', 'bingsu, strawberry, mango, ice cream, coconut'),
(@IdSnowBingsu, N'BINGSU MATCHA ĐẬU ĐỎ', N'', 175000, 'dessert', 'bingsu, matcha, red bean'),

(@IdHanGiaKy, N'Mì xào giòn thập cẩm', N'', 90000, 'vietnamese', 'crispy fried noodles, mixed meat, seafood'),
(@IdHanGiaKy, N'Mì xào mềm hải sản', N'', 90000, 'vietnamese', 'fried noodles, seafood'),
(@IdHanGiaKy, N'Mì gói xào bò', N'', 90000, 'vietnamese', 'fried noodles, beef'),
(@IdHanGiaKy, N'Hủ tiếu xào hải sản', N'', 90000, 'vietnamese', 'stir-fried rice noodles, seafood'),

(@IdTiramisuGV, N'Tiramisu Nhãn', N'', 80000, 'dessert', 'tiramisu, longan'),
(@IdTiramisuGV, N'Tiramisu Cacao', N'', 80000, 'dessert', 'tiramisu, cacao'),
(@IdTiramisuGV, N'Tiramisu Dâu tây', N'', 80000, 'dessert', 'tiramisu, strawberry'),
(@IdTiramisuGV, N'Khúc Bạch Sầu Riêng', N'Khúc Bạch', 50000, 'dessert', 'khuc bach, durian'),

(@IdHatDeGV, N'Chè hạt dẻ táo đỏ', N'Thành phần: hạt dẻ, táo đỏ, nấm tuyết, đường phèn.', 25000, 'dessert', 'chestnut, jujube, snow fungus'),
(@IdHatDeGV, N'Hạt dẻ tươi (chưa rang) - 500gr', N'Hạt dẻ sống chưa qua chế biến', 95000, 'snack', 'raw chestnut'),
(@IdHatDeGV, N'Hạt dẻ rang - 500gr', N'Hạt dẻ rang nguyên vỏ.', 135000, 'snack', 'roasted chestnut'),
(@IdHatDeGV, N'Hạt dẻ chín bóc vỏ - 200gr', N'Hạt dẻ đã bóc vỏ, hấp nóng', 75000, 'snack', 'peeled roasted chestnut'),

(@IdBanhTrangXienQue, N'Cơm Cháy Thập Cẩm Giòn Rụm', N'3 miếng', 15000, 'snack', 'scorched rice'),
(@IdBanhTrangXienQue, N'Xoài Sống Sốt Thái', N'xoài keo, xoài chua', 37000, 'snack', 'mango, thai sauce'),
(@IdBanhTrangXienQue, N'Bánh tráng trộn chả + trà tắc', N'', 33000, 'snack', 'rice paper, pork sausage, kumquat tea'),
(@IdBanhTrangXienQue, N'Bánh Tráng Sa Tế Mỡ Hành', N'Bánh tráng dẻo + mỡ hành + sa tế + hành phi', 22000, 'snack', 'rice paper, sate sauce, scallion oil'),

(@IdHuTieuMuc, N'Bún Thái Hải Sản', N'Mực, tôm, bò, trứng, chả cá, đậu hủ, rau', 95000, 'thai', 'rice noodles, squid, shrimp, beef, egg, fish cake'),
(@IdHuTieuMuc, N'Bún Thái Tí Nị', N'Tôm Mực Đậu Hũ Chả Cá Trứng Gà', 59000, 'thai', 'rice noodles, shrimp, squid, tofu, egg'),
(@IdHuTieuMuc, N'Hủ Tiếu Mực', N'Mực, Thịt Viên, Trứng Cút, Cá Viên', 70000, 'vietnamese', 'hu tieu noodles, squid, meatballs, quail egg'),
(@IdHuTieuMuc, N'Hủ Tiếu Thái Đặc Biệt', N'Tôm Mực Chả Cá Ớt Nấm Trứng Gà Bò Viên Bò Tái', 95000, 'thai', 'hu tieu noodles, shrimp, squid, beef, egg'),

(@IdMyHang, N'BÁNH TRÁNG TÚI ZIP', N'1 BỊCH CÓ KÈM THEO RAU RĂM + XOÀI BÀO', 16000, 'snack', 'rice paper, mango, herbs'),
(@IdMyHang, N'Bánh tráng dẻo trộn trứng gà', N'Bánh tráng dẻo ăn cùng trứng gà', 30000, 'snack', 'rice paper, egg'),
(@IdMyHang, N'BÁNH TRÁNG DẺO MỠ HÀNH TRỨNG GÀ TÓP MỠ', N'2 TRỨNG GÀ GIỮA + TÓP MỠ GIÒN GIÒN', 40000, 'snack', 'rice paper, egg, pork crackling, scallion oil'),
(@IdMyHang, N'Bánh Tráng Cuốn Đỏ Sốt Me', N'4 CUỐN ĂN CÙNG TRỨNG CÚT + 1 TRỨNG GÀ', 35000, 'snack', 'rice paper roll, quail egg, tamarind sauce'),

(@IdTramComGa, N'Cơm Chiên Gà Trứng Lòng Đào', N'Cơm chiên + 3 gà viên + trứng lòng đào + dưa leo', 58000, 'vietnamese', 'fried rice, chicken balls, soft-boiled egg'),
(@IdTramComGa, N'Cơm Gà Xối Mỡ Đùi Tỏi - Siêu Ngon', N'Cơm chiên vàng óng + gà tươi đùi', 69000, 'vietnamese', 'fried rice, fried chicken leg'),
(@IdTramComGa, N'Cơm Chiên Khâu Nhục Quảng Đông', N'Cơm chiên vàng óng + khâu nhục 100gr', 79000, 'vietnamese', 'fried rice, braised pork belly'),
(@IdTramComGa, N'Xôi Ghẹ Vỏ Giòn M', N'xôi nếp nương + thịt ghẹ + mai ghẹ + hành phi + chà bông', 72000, 'vietnamese', 'sticky rice, crab meat, pork floss'),

(@IdOcTuChon, N'ỐC LEN XÀO DỪA', N'', 59000, 'seafood', 'mud creeper, coconut milk'),
(@IdOcTuChon, N'NGHÊU HẤP THÁI', N'', 49000, 'seafood', 'clam, thai sauce'),
(@IdOcTuChon, N'ỐC MỠ XÀO ME', N'', 59000, 'seafood', 'snail, tamarind sauce'),
(@IdOcTuChon, N'Càng ghẹ xào me', N'', 59000, 'seafood', 'crab claw, tamarind sauce'),

(@IdDelicaPVT, N'Pizza Xốt Phô Mai Xúc Xích Bacon', N'Đậm vị, thơm béo. Pizza kiểu Ý', 71200, 'italian', 'pizza, sausage, bacon, cheese sauce'),
(@IdDelicaPVT, N'COMBO 13: Combo Pizza + Burger + Món Ăn Kèm + Nước Uống', N'Bao gồm: 1 Pizza, 1 Burger, 1 phần ăn kèm', 124000, 'italian', 'pizza, burger, snacks, drink'),
(@IdDelicaPVT, N'Gà Rán Sốt Mắm Tỏi Ớt', N'', 33600, 'fastfood', 'fried chicken, garlic fish sauce'),
(@IdDelicaPVT, N'[BEST SELLER] Mì Ý Tôm Tỏi Sốt Bơ Cay', N'', 71200, 'italian', 'spaghetti, shrimp, garlic, spicy butter'),

(@IdBeTuoi, N'Lẩu Xí Quách', N'Lẩu gồm xương, da và khoai, rau, mì ăn kèm', 250000, 'vietnamese', 'pork bone hotpot, vegetables, noodles'),
(@IdBeTuoi, N'Dựng bò chiên nước mắm', N'', 139000, 'vietnamese', 'fried beef tendon, fish sauce'),
(@IdBeTuoi, N'Bê thui', N'', 220000, 'vietnamese', 'roasted veal'),
(@IdBeTuoi, N'Bò hấp tía tô', N'Phần', 150000, 'vietnamese', 'steamed beef, perilla leaves'),

(@IdDelicaNVK, N'Box Chạm Đam Mê: Gà Viên + Khoai Tây', N'', 78000, 'fastfood', 'chicken balls, french fries'),
(@IdDelicaNVK, N'COMBO 5: Combo Mì Ý + Món Ăn Kèm + Nước Uống', N'Bao gồm: 1 Mì Ý tự chọn, 1 phần ăn kèm, nước', 92000, 'italian', 'spaghetti, snacks, drink'),
(@IdDelicaNVK, N'Pizza Hải Sản Sốt Pesto', N'', 89000, 'italian', 'pizza, seafood, pesto sauce'),
(@IdDelicaNVK, N'Box Kimbap + Bánh Gạo Lắc Phô Mai', N'Gồm 1 cuộn kimbap + 12v bánh gạo lắc phô mai', 59000, 'korean', 'kimbap, tteokbokki, cheese');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdChaoHau, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmg15u4k6neoaf', 1),
(@IdGhienAnVat, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr0gw1ytcj2x54', 1),
(@IdBanhTrangCham, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr5qerp3i4zo6c', 1),
(@IdHuTieuThai, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m864h0hl3sea2d', 1),
(@IdJimamaGV, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjthb4fijt38bf', 1),
(@IdXoiGhe, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mk2fgncptpmtaf', 1),
(@IdHieuHau, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ltf6y5xl6sy2ef', 1),
(@IdMiCayDaiHan, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnlcv9jsgrnkd1', 1),
(@IdSeuonKimNeko, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlfz94gi445rf5', 1),
(@IdBepMeShin, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mfwseijszzt522', 1),
(@IdLauKhoQua, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnr85eak2nlwf8', 1),
(@IdBunBoTuyet, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgnit3mygz6369', 1),
(@IdChaoEchGiaBao, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnfnkd8zwdmt1e', 1),
(@IdSnowBingsu, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mizeza45ckjnf6', 1),
(@IdHanGiaKy, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mf2l42i0smbs2d', 1),
(@IdTiramisuGV, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mljewbngvo5ra7', 1),
(@IdHatDeGV, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqx6i3cihac996', 1),
(@IdBanhTrangXienQue, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqy1qf353ic924', 1),
(@IdHuTieuMuc, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lx8d6ytvk3q1d2', 1),
(@IdMyHang, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmu8rncq85j4c5', 1),
(@IdTramComGa, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjvge6kzbnr978', 1),
(@IdOcTuChon, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlxurc80bt362b', 1),
(@IdDelicaPVT, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbr6sqbwjydec', 1),
(@IdBeTuoi, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m69tllokx1vce6', 1),
(@IdDelicaNVK, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnb8qll18mbq68', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Cháo Hàu Ngọc Béo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmg15u4k6neoaf' FROM MenuItems WHERE restaurant_id = @IdChaoHau AND name = N'Cháo hàu' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmg1y9g8x9tv76' FROM MenuItems WHERE restaurant_id = @IdChaoHau AND name = N'Cháo hàu + bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmg262x0tvd030' FROM MenuItems WHERE restaurant_id = @IdChaoHau AND name = N'Hàu xào mỡ hành' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmg2fuo6v9j4f5' FROM MenuItems WHERE restaurant_id = @IdChaoHau AND name = N'Trứng lộn' UNION ALL

-- Ghiền Ăn Vặt
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr0gw1ytcj2x54' FROM MenuItems WHERE restaurant_id = @IdGhienAnVat AND name = N'Bánh tráng mắm ruốc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr794uh6lpz899' FROM MenuItems WHERE restaurant_id = @IdGhienAnVat AND name = N'Combo thèm món quê' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgoolr9t9wy0f2' FROM MenuItems WHERE restaurant_id = @IdGhienAnVat AND name = N'Bánh tráng lụi sốt me' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lrvdzk8ck4p0cd' FROM MenuItems WHERE restaurant_id = @IdGhienAnVat AND name = N'Trà tắc thái xanh' UNION ALL

-- Bánh Tráng Chấm & Tráng Trộn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr5qerp3i4zo6c' FROM MenuItems WHERE restaurant_id = @IdBanhTrangCham AND name = N'Bánh Tráng Chấm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr30bgm8l8yh9c' FROM MenuItems WHERE restaurant_id = @IdBanhTrangCham AND name = N'Bánh Tráng Muối Nhuyễn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mbfmltixneis6b' FROM MenuItems WHERE restaurant_id = @IdBanhTrangCham AND name = N'Bánh Tráng Tỏi xike' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mm6xqr1mk6iq61' FROM MenuItems WHERE restaurant_id = @IdBanhTrangCham AND name = N'Mỡ Hành KHÔNG CAY - TRỘn SẵN' UNION ALL

-- Hủ Tiếu Thái Lan 20K
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m864h0hl3sea2d' FROM MenuItems WHERE restaurant_id = @IdHuTieuThai AND name = N'HỦ TIẾU TOMYUM THÁI FULL TOPPING' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdaavjnrk75r15' FROM MenuItems WHERE restaurant_id = @IdHuTieuThai AND name = N'HỦ TIẾU ĐẶC BIỆT' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mdabxeetatuka8' FROM MenuItems WHERE restaurant_id = @IdHuTieuThai AND name = N'MÌ TRỘN KHÔ NUỚC SỐT ĐẶC BIỆT' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m94lwyydgsxuc6' FROM MenuItems WHERE restaurant_id = @IdHuTieuThai AND name = N'HỦ TIẾU BÒ VIÊN' UNION ALL

-- Jimama Gò Vấp
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjthb4fijt38bf' FROM MenuItems WHERE restaurant_id = @IdJimamaGV AND name = N'Combo Gà Rán (Pep)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjthgr03n2mef9' FROM MenuItems WHERE restaurant_id = @IdJimamaGV AND name = N'Mỳ Ý Sinh Viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjthjcmmc2yp91' FROM MenuItems WHERE restaurant_id = @IdJimamaGV AND name = N'Cơm tôm chiên Tempura (New)' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjthikvo0gldef' FROM MenuItems WHERE restaurant_id = @IdJimamaGV AND name = N'Combo Mỳ Ý Lạp Xưởng' UNION ALL

-- Xôi Ghẹ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-7ras8-mdmr2gxboii910' FROM MenuItems WHERE restaurant_id = @IdXoiGhe AND name = N'Xôi Ghẹ Vỏ Giòn M' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-7ras8-mdoaqo7kl1gsdd' FROM MenuItems WHERE restaurant_id = @IdXoiGhe AND name = N'Xôi Gà Xối Mỡ ( Góc Tư )' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-820l4-mjz9fpxdfz0nf5' FROM MenuItems WHERE restaurant_id = @IdXoiGhe AND name = N'Cơm Chiên Gà Viên Trứng Ốp La' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-7ras8-mdoaulopju85a7' FROM MenuItems WHERE restaurant_id = @IdXoiGhe AND name = N'Xôi Ba Chỉ Khâu Nhục' UNION ALL

-- Hiếu Hàu
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ltf6y5xl6sy2ef' FROM MenuItems WHERE restaurant_id = @IdHieuHau AND name = N'Hàu nướng phô mai' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ltf79lev1de26f' FROM MenuItems WHERE restaurant_id = @IdHieuHau AND name = N'Hàu hấp' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ltf7bektoc961a' FROM MenuItems WHERE restaurant_id = @IdHieuHau AND name = N'Hàu nướng mọi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-ltf7608u24nhd8' FROM MenuItems WHERE restaurant_id = @IdHieuHau AND name = N'Hàu nướng trứng cút' UNION ALL

-- Mì Cay Đại Hàn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnlcv9jsgrnkd1' FROM MenuItems WHERE restaurant_id = @IdMiCayDaiHan AND name = N'Mì Kimchi - Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmxazaf14sua39' FROM MenuItems WHERE restaurant_id = @IdMiCayDaiHan AND name = N'Mì Ramyun - Bò, Xúc xích, cá viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmxb08x34x6o40' FROM MenuItems WHERE restaurant_id = @IdMiCayDaiHan AND name = N'Mì Cay Khô - Xúc Xích, Cá Viên' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m9h2mq0pbiiqde' FROM MenuItems WHERE restaurant_id = @IdMiCayDaiHan AND name = N'Mandu chiên' UNION ALL

-- Seuon Kim Neko
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlfz94gi445rf5' FROM MenuItems WHERE restaurant_id = @IdSeuonKimNeko AND name = N'CƠM TRỘN HÀN QUỐC BA CHỈ BÒ PHI LÊ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlfz9j296j9h5e' FROM MenuItems WHERE restaurant_id = @IdSeuonKimNeko AND name = N'CƠM TRỘN HÀN QUỐC XÚC XÍCH & CHẢ CÁ HQ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlfz8p8zhbm0d0' FROM MenuItems WHERE restaurant_id = @IdSeuonKimNeko AND name = N'CƠM TRỘN HÀN QUỐC MỰC VÒNG' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlfzchu3m8lre8' FROM MenuItems WHERE restaurant_id = @IdSeuonKimNeko AND name = N'MÌ TRỘN TƯƠNG ĐEN & MAMU NHÂN TÔM THỊT' UNION ALL

-- Bếp Mẹ Shin Will
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m92q5w583lhe4e' FROM MenuItems WHERE restaurant_id = @IdBepMeShin AND name = N'Sứa Sốt Thái' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlj2rirtsyrz27' FROM MenuItems WHERE restaurant_id = @IdBepMeShin AND name = N'Chân gà rút xương sốt Thái 5 cấp độ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlq51pwlixoj22' FROM MenuItems WHERE restaurant_id = @IdBepMeShin AND name = N'Chân gà rút xương Hàn Quốc Cay' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m4hooyzo3bzk59' FROM MenuItems WHERE restaurant_id = @IdBepMeShin AND name = N'Chân gà nguyên Xương sốt Thái' UNION ALL

-- Lẩu Khổ Qua Cá Thác Lác
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnr85eak2nlwf8' FROM MenuItems WHERE restaurant_id = @IdLauKhoQua AND name = N'Cá thác lác' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmy673r2x2bna8' FROM MenuItems WHERE restaurant_id = @IdLauKhoQua AND name = N'Xí quách' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmy6g4622cxxff' FROM MenuItems WHERE restaurant_id = @IdLauKhoQua AND name = N'Đầu cá hồi' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmy62isa8ohy31' FROM MenuItems WHERE restaurant_id = @IdLauKhoQua AND name = N'Bạch tuột' UNION ALL

-- Bún Bò Tuyết
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgnit3mygz6369' FROM MenuItems WHERE restaurant_id = @IdBunBoTuyet AND name = N'Bún bò đặc biệt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgnit3mye617af' FROM MenuItems WHERE restaurant_id = @IdBunBoTuyet AND name = N'Bún nạm gân' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgnit3my5qmjfa' FROM MenuItems WHERE restaurant_id = @IdBunBoTuyet AND name = N'Bún Giò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mgnit3myidqj52' FROM MenuItems WHERE restaurant_id = @IdBunBoTuyet AND name = N'Nước sâm nhà làm' UNION ALL

-- Cháo Ếch Gia Bảo
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnfnkd8zwdmt1e' FROM MenuItems WHERE restaurant_id = @IdChaoEchGiaBao AND name = N'Cháo Ếch Singapore 2 Con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnfns21d02ys9e' FROM MenuItems WHERE restaurant_id = @IdChaoEchGiaBao AND name = N'Cơm ếch 1 con' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnfnxgh1bls30d' FROM MenuItems WHERE restaurant_id = @IdChaoEchGiaBao AND name = N'Cháo bò sốt tiêu xanh  đặc biệt  300g' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mmzjhfq0jvuw1f' FROM MenuItems WHERE restaurant_id = @IdChaoEchGiaBao AND name = N'Cháo lá dứa' UNION ALL

-- Snow Bingsu & Tea
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mizey9mtc4qo69' FROM MenuItems WHERE restaurant_id = @IdSnowBingsu AND name = N'SMOOTHIE CHUỐI' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miep3jmm1mv8d1' FROM MenuItems WHERE restaurant_id = @IdSnowBingsu AND name = N'HỒNG TRÀ SỮA PHOMAI DẦM' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-micl0719io7af0' FROM MenuItems WHERE restaurant_id = @IdSnowBingsu AND name = N'BINGSU DÂU XOÀI' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-miclerqwbbpc6a' FROM MenuItems WHERE restaurant_id = @IdSnowBingsu AND name = N'BINGSU MATCHA ĐẬU ĐỎ' UNION ALL

-- Hân Gia Ký
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mf2l42i0smbs2d' FROM MenuItems WHERE restaurant_id = @IdHanGiaKy AND name = N'Mì xào giòn thập cẩm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mf2l4xyvyn0q50' FROM MenuItems WHERE restaurant_id = @IdHanGiaKy AND name = N'Mì xào mềm hải sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mf2l4ibgt7nyee' FROM MenuItems WHERE restaurant_id = @IdHanGiaKy AND name = N'Mì gói xào bò' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mf2lbvjheoela1' FROM MenuItems WHERE restaurant_id = @IdHanGiaKy AND name = N'Hủ tiếu xào hải sản' UNION ALL

-- Tiramisu GV
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mljewbngvo5ra7' FROM MenuItems WHERE restaurant_id = @IdTiramisuGV AND name = N'Tiramisu Nhãn' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mljezmojdgjnd5' FROM MenuItems WHERE restaurant_id = @IdTiramisuGV AND name = N'Tiramisu Cacao' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdTiramisuGV AND name = N'Tiramisu Dâu tây' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-moe3ameckkcs08' FROM MenuItems WHERE restaurant_id = @IdTiramisuGV AND name = N'Khúc Bạch Sầu Riêng' UNION ALL

-- Hạt Dẻ
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqx6i3cihac996' FROM MenuItems WHERE restaurant_id = @IdHatDeGV AND name = N'Chè hạt dẻ táo đỏ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-m1co8xm7wy1k39' FROM MenuItems WHERE restaurant_id = @IdHatDeGV AND name = N'Hạt dẻ tươi (chưa rang) - 500gr' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqx6i7og3ow458' FROM MenuItems WHERE restaurant_id = @IdHatDeGV AND name = N'Hạt dẻ rang - 500gr' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-mampp97rt41tdf' FROM MenuItems WHERE restaurant_id = @IdHatDeGV AND name = N'Hạt dẻ chín bóc vỏ - 200gr' UNION ALL

-- Bánh Tráng Chấm
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqy1qf353ic924' FROM MenuItems WHERE restaurant_id = @IdBanhTrangXienQue AND name = N'Cơm Cháy Thập Cẩm Giòn Rụm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lr5p6erkgibo50' FROM MenuItems WHERE restaurant_id = @IdBanhTrangXienQue AND name = N'Xoài Sống Sốt Thái' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mia7f6n0ii2pf3' FROM MenuItems WHERE restaurant_id = @IdBanhTrangXienQue AND name = N'Bánh tráng trộn chả + trà tắc' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqxk88wvkdl01b' FROM MenuItems WHERE restaurant_id = @IdBanhTrangXienQue AND name = N'Bánh Tráng Sa Tế Mỡ Hành' UNION ALL

-- Hủ Tiếu Mực
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lx8d6ytvk3q1d2' FROM MenuItems WHERE restaurant_id = @IdHuTieuMuc AND name = N'Bún Thái Hải Sản' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjnk0whsn6dc36' FROM MenuItems WHERE restaurant_id = @IdHuTieuMuc AND name = N'Bún Thái Tí Nị' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjnk28gjt7uv8c' FROM MenuItems WHERE restaurant_id = @IdHuTieuMuc AND name = N'Hủ Tiếu Mực' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjnk3wwemebk1f' FROM MenuItems WHERE restaurant_id = @IdHuTieuMuc AND name = N'Hủ Tiếu Thái Đặc Biệt' UNION ALL

-- Mỹ Hằng
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmu8rncq85j4c5' FROM MenuItems WHERE restaurant_id = @IdMyHang AND name = N'BÁNH TRÁNG TÚI ZIP' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmu5mwm6hsec82' FROM MenuItems WHERE restaurant_id = @IdMyHang AND name = N'Bánh tráng dẻo trộn trứng gà' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmu5x2w47x8ocd' FROM MenuItems WHERE restaurant_id = @IdMyHang AND name = N'BÁNH TRÁNG DẺO MỠ HÀNH TRỨNG GÀ TÓP MỠ' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmu7c9zqoutfe4' FROM MenuItems WHERE restaurant_id = @IdMyHang AND name = N'Bánh Tráng Cuốn Đỏ Sốt Me' UNION ALL

-- Trạm Cơm Gà
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-820l4-mjvge6kzbnr978' FROM MenuItems WHERE restaurant_id = @IdTramComGa AND name = N'Cơm Chiên Gà Trứng Lòng Đào' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-7ras8-mbrb6e5zemwa92' FROM MenuItems WHERE restaurant_id = @IdTramComGa AND name = N'Cơm Gà Xối Mỡ Đùi Tỏi - Siêu Ngon' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-7ras8-mbrbqdw669hq90' FROM MenuItems WHERE restaurant_id = @IdTramComGa AND name = N'Cơm Chiên Khâu Nhục Quảng Đông' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-820l4-mk0q04v5axag02' FROM MenuItems WHERE restaurant_id = @IdTramComGa AND name = N'Xôi Ghẹ Vỏ Giòn M' UNION ALL

-- Ốc Tự Chọn
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlxurc80bt362b' FROM MenuItems WHERE restaurant_id = @IdOcTuChon AND name = N'ỐC LEN XÀO DỪA' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134505-81ztc-mmfyqif6xqtc3b' FROM MenuItems WHERE restaurant_id = @IdOcTuChon AND name = N'NGHÊU HẤP THÁI' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mlxurc808zya45' FROM MenuItems WHERE restaurant_id = @IdOcTuChon AND name = N'ỐC MỠ XÀO ME' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmhtiwuw07wk22' FROM MenuItems WHERE restaurant_id = @IdOcTuChon AND name = N'Càng ghẹ xào me' UNION ALL

-- Delica Phan Văn Trị
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mmbr6sqbwjydec' FROM MenuItems WHERE restaurant_id = @IdDelicaPVT AND name = N'Pizza Xốt Phô Mai Xúc Xích Bacon' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqz801wux41wac' FROM MenuItems WHERE restaurant_id = @IdDelicaPVT AND name = N'COMBO 13: Combo Pizza + Burger + Món Ăn Kèm + Nước Uống' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mn4jpmj1yio51a' FROM MenuItems WHERE restaurant_id = @IdDelicaPVT AND name = N'Gà Rán Sốt Mắm Tỏi Ớt' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzeea3m5sck47' FROM MenuItems WHERE restaurant_id = @IdDelicaPVT AND name = N'[BEST SELLER] Mì Ý Tôm Tỏi Sốt Bơ Cay' UNION ALL

-- Bê Tươi Quyết Thắng
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m69tllokx1vce6' FROM MenuItems WHERE restaurant_id = @IdBeTuoi AND name = N'Lẩu Xí Quách' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m767p4xs59p48b' FROM MenuItems WHERE restaurant_id = @IdBeTuoi AND name = N'Dựng bò chiên nước mắm' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m6aotxsj155j67' FROM MenuItems WHERE restaurant_id = @IdBeTuoi AND name = N'Bê thui' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ra0g-m69sxrhqrw1va3' FROM MenuItems WHERE restaurant_id = @IdBeTuoi AND name = N'Bò hấp tía tô' UNION ALL

-- Delica Nguyễn Văn Khối
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mnb8qll18mbq68' FROM MenuItems WHERE restaurant_id = @IdDelicaNVK AND name = N'Box Chạm Đam Mê: Gà Viên + Khoai Tây' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7r98o-lqzg2ayxzlj8c2' FROM MenuItems WHERE restaurant_id = @IdDelicaNVK AND name = N'COMBO 5: Combo Mì Ý + Món Ăn Kèm + Nước Uống' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-81ztc-mn9qyjzq7s3qcc' FROM MenuItems WHERE restaurant_id = @IdDelicaNVK AND name = N'Pizza Hải Sản Sốt Pesto' UNION ALL
SELECT id, 'https://down-zl-vn.img.susercontent.com/vn-11134517-7ras8-maz0cma0r1zs93' FROM MenuItems WHERE restaurant_id = @IdDelicaNVK AND name = N'Box Kimbap + Bánh Gạo Lắc Phô Mai';