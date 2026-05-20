USE travel_food_db
GO

-- ==========================================
-- PHÚ NHUẬN
-- ==========================================

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
(N'Bò Lá Lốt & Mỡ Chài - Phú Nhuận', N'491/189 Huỳnh Văn Bánh, Phú Nhuận, TP. HCM', 10.789294, 106.668633, 4.8, 50000, '15:00', '22:00', N'vietnamese, bình dân'),
(N'Mì Indomie & Ăn Vặt Phú Nhuận - Phú Nhuận Food', N'127/1 Cô Giang, P. 1, Phú Nhuận, TP. HCM', 10.797627, 106.684071, 4.7, 45000, '08:00', '22:30', N'asian, bình dân'),
(N'Hủ Tiếu Xào & Mì Xào Giòn - Phong Ký Phú Nhuận', N'63 Phan Đình Phùng, P. 17, Phú Nhuận, TP. HCM', 10.793680, 106.684524, 4.2, 80000, '10:00', '22:00', N'vietnamese, bình dân'),
(N'BÒ BÍA PHÚ NHUẬN HẺM 96 - PHAN ĐÌNH PHÙNG', N'96/1 Phan Đình Phùng, P. 2, Phú Nhuận, TP. HCM', 10.795178, 106.684095, 4.9, 20000, '14:00', '22:00', N'vietnamese, bình dân'),
(N'EmmyHappy - Box Ăn Vặt - Phú Nhuận', N'20E Cầm Bá Thước, Phú Nhuận, TP. HCM', 10.802528, 106.685441, 4.3, 55000, '09:00', '21:30', N'korean, bình dân'),
(N'Bento Delichi (by Cooky) - Cơm Gà Mắm Tỏi, Xối Mỡ - Quận Phú Nhuận', N'166/12L Thích Quảng Đức, P. 4, Phú Nhuận, TP. HCM', 10.807943, 106.679599, 4.6, 65000, '09:00', '21:00', N'vietnamese, bình dân'),
(N'Ốc Trứng Muối - Chi Nhánh 1 Phú Nhuận', N'11 Hoa Sữa, P. 7, Phú Nhuận, TP. HCM', 10.798261, 106.691317, 4.2, 100000, '15:00', '23:30', N'seafood, nhậu'),
(N'A Mìn Quán - Phú Nhuận', N'1B Lê Quý Đôn, P. 11, Phú Nhuận, TP. HCM', 10.792355, 106.679757, 4.8, 85000, '08:00', '22:00', N'chinese, bình dân'),
(N'Thie Macaron Bakery Phú Nhuận', N'20/2H Cô Bắc, P. 1, Phú Nhuận, TP. HCM', 10.796046, 106.682741, 4.1, 150000, '09:00', '21:00', N'bakery, quà tặng'),
(N'Truyền Thuyết Champong - Phú Nhuận', N'450/1 Phan Xích Long, P. 2, Phú Nhuận, TP. HCM', 10.800957, 106.684273, 4.4, 250000, '10:00', '22:00', N'korean, gia đình'),
(N'KIM SINH - Mỳ Vịt Tiềm - Trường Sa, Phú Nhuận', N'522 Trường Sa, P. 2, Phú Nhuận, TP. HCM', 10.795102, 106.684600, 4.8, 90000, '16:00', '23:00', N'chinese, gia đình'),
(N'Sushi Story HCM - Sushi & Sashimi Ngon Phú Nhuận', N'85 Hoa Hồng, P. 2, Phú Nhuận, TP. HCM', 10.796966, 106.689562, 4.6, 300000, '11:00', '22:00', N'japanese, hẹn hò'),
(N'Bánh Tráng Vò Tây Ninh - CN Phú Nhuận', N'525/75 Huỳnh Văn Bánh, P. 14, Phú Nhuận, TP. HCM', 10.790322, 106.668060, 4.8, 40000, '10:00', '22:00', N'asian, bình dân'),
(N'TAKOYAKI TKY - Phú Nhuận', N'78 Thích Quảng Đức, P. 5, Phú Nhuận, TP. HCM', 10.805144, 106.682583, 4.2, 45000, '15:00', '22:00', N'japanese, bình dân'),
(N'Zin Zin - Cà Phê & Tea - Phú Nhuận', N'21 Bùi Văn Thêm, P. 9, Phú Nhuận, TP. HCM', 10.807796, 106.677911, 4.4, 30000, '07:00', '22:30', N'cafe, bình dân'),
(N'Tiệm Hải Sản The Spicy Crab - Miến, Cơm & Mì - Phú Nhuận', N'170 Phan Đình Phùng, P. 1, Phú Nhuận, TP. HCM', 10.795400, 106.682682, 4.7, 200000, '16:00', '23:00', N'seafood, gia đình'),
(N'Bánh Mì Huynh Hoa - Phan Xích Long', N'Số 220 Đường Phan Xích Long, P. 7, Phú Nhuận, TP. HCM', 10.797350, 106.690024, 4.1, 70000, '06:00', '21:00', N'vietnamese, bình dân'),
(N'Cơm Tấm Ba Ghiền Không Chi Nhánh - 84 Đặng Văn Ngữ', N'84 Đặng Văn Ngữ, P. 10, Phú Nhuận, TP. HCM', 10.794432, 106.669389, 4.9, 100000, '07:00', '21:00', N'vietnamese, gia đình'),
(N'Cơm Mì MaLai - Phú Nhuận', N'80/12 Đặng Văn Ngữ, P. 10, Phú Nhuận, TP. HCM', 10.794712, 106.668959, 4.3, 75000, '09:00', '21:30', N'asian, bình dân'),
(N'Cháo Ếch Geylang A Bảo - Chợ Phú Nhuận', N'1 Cao Thắng, P. 17, Phú Nhuận, TP. HCM', 10.794613, 106.683242, 4.2, 90000, '16:00', '23:30', N'asian, bình dân'),
(N'Chivago Chicken - Gà Rán Hàn Quốc & Bia - Phú Nhuận', N'Số 8 Đường Hoa Đào, P. 7, Phú Nhuận, TP. HCM', 10.797564, 106.688120, 4.8, 180000, '10:00', '23:00', N'korean, nhậu');
GO

DECLARE @IdBoLaLot INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bò Lá Lốt & Mỡ Chài - Phú Nhuận');
DECLARE @IdIndomie INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Indomie & Ăn Vặt Phú Nhuận - Phú Nhuận Food');
DECLARE @IdHuTieuXao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Xào & Mì Xào Giòn - Phong Ký Phú Nhuận');
DECLARE @IdBoBia INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'BÒ BÍA PHÚ NHUẬN HẺM 96 - PHAN ĐÌNH PHÙNG');
DECLARE @IdEmmyHappy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'EmmyHappy - Box Ăn Vặt - Phú Nhuận');
DECLARE @IdBentoDelichi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bento Delichi (by Cooky) - Cơm Gà Mắm Tỏi, Xối Mỡ - Quận Phú Nhuận');
DECLARE @IdOcTrungMuoi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Ốc Trứng Muối - Chi Nhánh 1 Phú Nhuận');
DECLARE @IdAMinQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'A Mìn Quán - Phú Nhuận');
DECLARE @IdThieMacaron INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thie Macaron Bakery Phú Nhuận');
DECLARE @IdChampong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Truyền Thuyết Champong - Phú Nhuận');
DECLARE @IdKimSinh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'KIM SINH - Mỳ Vịt Tiềm - Trường Sa, Phú Nhuận');
DECLARE @IdSushiStory INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sushi Story HCM - Sushi & Sashimi Ngon Phú Nhuận');
DECLARE @IdBanhTrang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Tráng Vò Tây Ninh - CN Phú Nhuận');
DECLARE @IdTakoyaki INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'TAKOYAKI TKY - Phú Nhuận');
DECLARE @IdZinZin INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Zin Zin - Cà Phê & Tea - Phú Nhuận');
DECLARE @IdTheSpicyCrab INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Tiệm Hải Sản The Spicy Crab - Miến, Cơm & Mì - Phú Nhuận');
DECLARE @IdHuynhHoa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Huynh Hoa - Phan Xích Long');
DECLARE @IdBaGhien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Ba Ghiền Không Chi Nhánh - 84 Đặng Văn Ngữ');
DECLARE @IdComMiMaLai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Mì MaLai - Phú Nhuận');
DECLARE @IdChaoEch INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Ếch Geylang A Bảo - Chợ Phú Nhuận');
DECLARE @IdChivago INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chivago Chicken - Gà Rán Hàn Quốc & Bia - Phú Nhuận');

-- ==========================================
-- CHÈN MENU (Lấy ngẫu nhiên 4 món)
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES 
(@IdBoLaLot, N'Mắm thêm', N'', 10000, 'vietnamese', 'fermented fish sauce'),
(@IdBoLaLot, N'Bún thêm', N'', 10000, 'vietnamese', 'rice noodles'),
(@IdBoLaLot, N'Rau thêm', N'', 15000, 'vietnamese', 'vegetables'),
(@IdBoLaLot, N'Bò Lá Lốt Nướng', N'Bò lá lốt kèm rau, bún, bánh tráng và mắm nêm', 65000, 'vietnamese', 'grilled beef in lolot leaves,vegetables,rice noodles,rice paper'),

(@IdIndomie, N'Khoai tây chiên - 150gr', N'', 49000, 'snack', 'french fries'),
(@IdIndomie, N'Mì Trộn Indomie Tôm', N'Mì Indomie trộn sốt đậm đà + 3 con tôm thẻ', 75050, 'snack', 'indomie noodles,shrimp'),
(@IdIndomie, N'Mì Trộn Indomie Thịt Cua Phủ Trứng', N'Mì Indomie trộn sốt đậm đà, sợi dai ngon', 75050, 'snack', 'indomie noodles,crab meat,egg'),
(@IdIndomie, N'Combo nhỏ', N'4 cá 4 bò 4 tôm', 37050, 'snack', 'fish balls,beef balls,shrimp balls'),

(@IdHuTieuXao, N'Mì xào giòn', N'', 100000, 'vietnamese', 'crispy fried noodles'),
(@IdHuTieuXao, N'Mì xào giòn mực', N'', 100000, 'vietnamese', 'crispy fried noodles,squid'),
(@IdHuTieuXao, N'Hủ tiếu xào bò', N'', 100000, 'vietnamese', 'stir-fried rice noodles,beef'),
(@IdHuTieuXao, N'Bún gạo xào thập cẩm', N'', 100000, 'vietnamese', 'stir-fried rice vermicelli,mixed meat,seafood'),

(@IdBoBia, N'Bò bía mặn', N'Quán cuốn rau quế và xà lách', 8000, 'vietnamese', 'jicama,dried shrimp,chinese sausage,vegetables'),
(@IdBoBia, N'Combo 5 gỏi cuốn tôm thit', N'', 65000, 'vietnamese', 'spring rolls,shrimp,pork'),
(@IdBoBia, N'Bún mắm nêm tai heo', N'', 55000, 'vietnamese', 'rice noodles,pig ear,fermented fish sauce'),
(@IdBoBia, N'Combo 10 cuon goi cuốn tai heo', N'', 130000, 'vietnamese', 'spring rolls,pig ear'),

(@IdEmmyHappy, N'Kimbap Truyền Thống', N'Kimbap trứng xúc xích cà rốt dưa leo', 40000, 'korean', 'kimbap,egg,sausage,carrot,cucumber'),
(@IdEmmyHappy, N'Trứng cuộn rong biển', N'Trứng cuộn rong biển. Có sốt chấm', 40000, 'korean', 'egg,seaweed'),
(@IdEmmyHappy, N'Bibimbap trứng xúc xích', N'Cơm trộn ốp la xúc xích dưa leo cà rốt', 40000, 'korean', 'rice,egg,sausage,cucumber,carrot'),
(@IdEmmyHappy, N'Mì trộn Gà viên Phô mai', N'Mì Indomie trộn với gà viên sốt phô mai', 40000, 'korean', 'indomie noodles,chicken balls,cheese'),

(@IdBentoDelichi, N'Cơm Gà Mắm Tỏi (Đùi Lớn Góc Tư)', N'Gà tươi, Đùi Góc Tư, được xốt thấm vị', 74000, 'vietnamese', 'rice,chicken leg,garlic fish sauce'),
(@IdBentoDelichi, N'Cơm Gà Xối Mỡ (Đùi Tỏi/Má Đùi)', N'Gà tươi được xốt thấm vị', 55000, 'vietnamese', 'rice,fried chicken'),
(@IdBentoDelichi, N'Combo 1 Người Vừa Đủ', N'Gà tươi, Đùi Góc Tư và 1 phần Canh', 87000, 'vietnamese', 'rice,chicken leg,soup'),
(@IdBentoDelichi, N'Trà Tắc Thảo Mộc', N'Trà Tắc được ủ thảo mộc', 19000, 'beverage', 'kumquat tea,herbs'),

(@IdOcTrungMuoi, N'Ốc Bươu nướng tiêu', N'Cay cay tiêu xanh nước sốt nướng', 59000, 'seafood', 'apple snail,green pepper'),
(@IdOcTrungMuoi, N'Mì xào HẢI SẢN', N'Tôm mực mì mềm vừa', 79000, 'seafood', 'noodles,shrimp,squid'),
(@IdOcTrungMuoi, N'Hàu 7 Vị', N'Gồm 7 chén hàu nướng kết hợp với 7 gia vị khác nhau', 85000, 'seafood', 'oyster,mixed sauces'),
(@IdOcTrungMuoi, N'Hàu né phô mai', N'Vị béo hào kết hợp phomai tan chảy', 99000, 'seafood', 'oyster,cheese,egg,bread'),

(@IdAMinQuan, N'Cơm Thập Cẩm Quay + 1 Pepsi', N'', 85500, 'chinese', 'rice,roasted meat,pepsi'),
(@IdAMinQuan, N'Cơm Gà Xối Mỡ', N'Cơm gà xối mỡ A Mìn Quán', 70000, 'vietnamese', 'rice,fried chicken'),
(@IdAMinQuan, N'Mì Vịt Tiềm 1/4 Đùi', N'1 phần mì 2 vắt, 1/4 đùi vịt tiềm', 129000, 'chinese', 'egg noodles,roasted duck,herbs'),
(@IdAMinQuan, N'Gà Ác Tiềm Thuốc Bắc', N'Gà ác ngon được hầm với các vị thuốc Bắc', 104000, 'chinese', 'black chicken,herbs'),

(@IdThieMacaron, N'Cup 20 viên nhỏ mix 15 vị', N'', 65000, 'bakery', 'macaron'),
(@IdThieMacaron, N'Hộp quà 36 viên nhỏ mix 15 vị', N'', 125000, 'bakery', 'macaron'),
(@IdThieMacaron, N'Hộp 6 bánh to mix 6 vị random', N'', 85000, 'bakery', 'macaron'),
(@IdThieMacaron, N'Hộp 12 bánh to mix 12 vị', N'', 160000, 'bakery', 'macaron'),

(@IdChampong, N'Thịt Heo Sốt Chua Ngọt Size Mini', N'', 180000, 'korean', 'pork,sweet and sour sauce'),
(@IdChampong, N'Mì Tương Đen Xào Cay', N'', 150000, 'korean', 'jajangmyeon,spicy sauce'),
(@IdChampong, N'Mỳ Champong Hải sản', N'', 200000, 'korean', 'jjamppong,seafood'),
(@IdChampong, N'Cơm Rang Tôm Trứng', N'', 170000, 'korean', 'fried rice,shrimp,egg'),

(@IdKimSinh, N'Mỳ vịt tiềm góc tư đùi', N'', 115000, 'chinese', 'egg noodles,duck,herbs'),
(@IdKimSinh, N'Óc heo tiềm thuốc bắc', N'', 95000, 'chinese', 'pig brain,herbs'),
(@IdKimSinh, N'Gà ác tiềm thuốc bắc', N'', 95000, 'chinese', 'black chicken,herbs'),
(@IdKimSinh, N'Mỳ cật heo tiềm', N'', 95000, 'chinese', 'egg noodles,pork kidney,herbs'),

(@IdSushiStory, N'SET HEALTHY 1 NGƯỜI ĂN NO', N'ssm cá hồi 3pcs, sushi tôm sốt', 188100, 'japanese', 'salmon sashimi,shrimp sushi,eel sushi,cod roe sushi'),
(@IdSushiStory, N'SASHIMI HÀU NHẬT TRỨNG CÁ CHUỒN', N'Hàu tươi, trứng cá chuồn béo ngậy', 151200, 'japanese', 'oyster,flying fish roe'),
(@IdSushiStory, N'SALAD CÁ TRÍCH (sốt mè rang)', N'Salad cá trích tươi, sốt mè rang thơm ngon', 113050, 'japanese', 'herring,salad,sesame sauce'),
(@IdSushiStory, N'CÂU CHUYỆN CHÚNG MÌNH', N'ssm cá hồi 5pcs, ssm bụng cá hồi 5pcs', 615450, 'japanese', 'salmon sashimi,herring sashimi,roll'),

(@IdBanhTrang, N'Trộn mỡ hành trứng', N'', 35000, 'snack', 'rice paper,scallion oil,egg'),
(@IdBanhTrang, N'Trộn sate me cay trứng', N'', 42000, 'snack', 'rice paper,sate sauce,tamarind,egg'),
(@IdBanhTrang, N'Cuốn lòng đào chấm sốt me', N'Bánh tráng cuốn trứng cút lòng đào', 48000, 'snack', 'rice paper,quail egg,tamarind sauce'),
(@IdBanhTrang, N'Cuốn gà vừa xóc muối hành', N'Bánh tráng cuốn trứng gà vữa xốc muối hành', 43000, 'snack', 'rice paper,egg,salt,scallion'),

(@IdTakoyaki, N'(4 cái) Bạch Tuộc', N'4 viên', 30000, 'japanese', 'takoyaki,octopus'),
(@IdTakoyaki, N'(4 cái) Phô Mai', N'4 viên', 30000, 'japanese', 'takoyaki,cheese'),
(@IdTakoyaki, N'(4 cái) Đặc Biệt', N'', 35000, 'japanese', 'takoyaki,mixed filling'),
(@IdTakoyaki, N'(hộp lớn) Bạch Tuộc', N'8 viên', 55000, 'japanese', 'takoyaki,octopus'),

(@IdZinZin, N'Cafe Sữa Sài Gòn', N'', 17100, 'cafe', 'coffee,milk'),
(@IdZinZin, N'Bạc Xỉu Muối', N'', 20700, 'cafe', 'coffee,milk,salt'),
(@IdZinZin, N'Matcha Kem Muối', N'size M', 27900, 'cafe', 'matcha,milk,salt cream'),
(@IdZinZin, N'Sữa Dâu Phô Mai', N'Size 700ml', 33000, 'beverage', 'strawberry milk,cheese'),

(@IdTheSpicyCrab, N'Mì trộn tôm sò điệp', N'2 gói mì indomie + 2 tôm 3 điệp', 79000, 'seafood', 'indomie noodles,shrimp,scallop'),
(@IdTheSpicyCrab, N'Tôm sống sốt thái', N'Sốt thái mặc định cay sẵn ạ', 169000, 'seafood', 'raw shrimp,thai sauce'),
(@IdTheSpicyCrab, N'Mix Ốc Hương 5 Món', N'Cua, ốc hương, tôm thẻ, bào ngư, sò điệp', 550000, 'seafood', 'sweet snail,crab,shrimp,abalone,scallop'),
(@IdTheSpicyCrab, N'Tôm Hùm Đất / crawfish ( 500gram )', N'sốt cajun & bơ tỏi', 750000, 'seafood', 'crawfish,cajun sauce,garlic butter'),

(@IdHuynhHoa, N'Bánh Mì Truyền Thống - size L (Đặc biệt)', N'Topping: 2 lát chả, 3 lát thủ, thịt nguội...', 78000, 'vietnamese', 'bread,pork sausage,ham,pate,butter,pork floss'),
(@IdHuynhHoa, N'Bánh Mì Truyền Thống - size M', N'Topping: 1 lát chả lụa, 2 lát giò thủ trắng...', 61000, 'vietnamese', 'bread,pork sausage,ham,pate,butter,pork floss'),
(@IdHuynhHoa, N'Combo 1: 1 Bánh mì truyền thống sz L; 1 Bịch cơm cháy mắm; 1 Bánh bao', N'', 147000, 'vietnamese', 'bread,scorched rice,bao bun'),
(@IdHuynhHoa, N'Combo Size M: 1 Bánh mì truyền thống (M)+ 1 CoCa 300ml', N'', 67000, 'vietnamese', 'bread,coke'),

(@IdBaGhien, N'Cơm Sườn', N'', 112000, 'vietnamese', 'broken rice,pork ribs'),
(@IdBaGhien, N'Cơm sườn chả', N'', 124000, 'vietnamese', 'broken rice,pork ribs,meatloaf'),
(@IdBaGhien, N'Combo 2: Cơm sườn bì chả + 1 cơm thêm', N'', 151000, 'vietnamese', 'broken rice,pork ribs,shredded pork skin,meatloaf'),
(@IdBaGhien, N'Rau Má Đậu Xanh Nhà Làm', N'', 20000, 'beverage', 'pennywort juice,mung bean'),

(@IdComMiMaLai, N'Cơm MaLai Gà Sốt Teriyaki - Sâm La Hán Quả', N'', 75000, 'asian', 'rice,chicken,teriyaki sauce,herbal drink'),
(@IdComMiMaLai, N'Cơm Bò Mỹ Sốt Teriyaki trứng trần', N'Bò áp chảo cùng với sốt Teriyaki', 115000, 'asian', 'rice,beef,teriyaki sauce,poached egg'),
(@IdComMiMaLai, N'Cơm Chiên SaLai Sườn Sốt Me Cay', N'Sườn non ăn kèm sốt me chua cay.', 68000, 'asian', 'fried rice,pork ribs,spicy tamarind sauce'),
(@IdComMiMaLai, N'Mì Xào SaLai Gà Sốt Teriyaki', N'Mì xào dùng kèm với gà', 60000, 'asian', 'fried noodles,chicken,teriyaki sauce'),

(@IdChaoEch, N'Cháo Ếch Singapore 2 Con', N'Phần bình thường 1 người ăn', 108000, 'asian', 'porridge,frog'),
(@IdChaoEch, N'Cháo Ếch Singapore 1 Con', N'', 69000, 'asian', 'porridge,frog'),
(@IdChaoEch, N'Cháo bò sốt tiêu xanh phần lớn 200g', N'1 phần cháo + 1 phần bò 200g', 119000, 'asian', 'porridge,beef,green pepper'),
(@IdChaoEch, N'Cơm bò phần lớn 200g', N'Phần cơm +200g bò sốt tiêu xanh', 119000, 'asian', 'rice,beef,green pepper'),

(@IdChivago, N'Bánh gạo cay Hàn Quốc', N'', 113400, 'korean', 'tteokbokki,spicy sauce'),
(@IdChivago, N'Gà rán giòn đặc biệt Chivago', N'Chivago chicken', 183600, 'korean', 'fried chicken'),
(@IdChivago, N'Gà rán rút xương xốt galbi', N'', 205200, 'korean', 'boneless fried chicken,galbi sauce'),
(@IdChivago, N'Gà rán rút xương xốt Sriracha Mayo', N'', 205200, 'korean', 'boneless fried chicken,sriracha mayo');

-- ==========================================
-- CHÈN ẢNH ĐẠI DIỆN CHO NHÀ HÀNG (Thumbnail)
-- ==========================================
INSERT INTO RestaurantImages (restaurant_id, image_url, is_thumbnail) VALUES
(@IdBoLaLot, 'https://down-bs-vn.img.susercontent.com/vn-11134259-81ztc-mncczoo71d6rd7@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdIndomie, 'https://down-bs-vn.img.susercontent.com/vn-11134513-81ztc-mnnz46q4sruuf3@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdHuTieuXao, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lw2ldj42jba34d@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBoBia, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lvsqi6b58ct626@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdEmmyHappy, 'https://down-bs-vn.img.susercontent.com/vn-11134513-820l4-me7feie3olxe35@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBentoDelichi, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7ra0g-m8zqhn5pae7i5b@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdOcTrungMuoi, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lsv52p1xon9gd9@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdAMinQuan, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lsuafmq0y0t57c@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdThieMacaron, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7ras8-mbcdqyz7c0qbdc@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChampong, 'https://down-bs-vn.img.susercontent.com/vn-11134259-820l4-mgyvcll6iwp741@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdKimSinh, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lsvf393qyapwda@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdSushiStory, 'https://down-bs-vn.img.susercontent.com/vn-11134513-81ztc-mm1qru9ejfnlff@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBanhTrang, 'https://down-bs-vn.img.susercontent.com/vn-11134513-81ztc-mo2kia6ejzeqcb@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTakoyaki, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lstzpxylm210b9@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdZinZin, 'https://down-bs-vn.img.susercontent.com/vn-11134259-81ztc-mnwnbqemxgjm05@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdTheSpicyCrab, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7ra0g-m8rcsb8s0txj60@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdHuynhHoa, 'https://down-bs-vn.img.susercontent.com/vn-11134259-7ra0g-mac8t61iyal329@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdBaGhien, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lstpo51e0cece4@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdComMiMaLai, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lsv3aj6dwpzt42@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChaoEch, 'https://down-bs-vn.img.susercontent.com/vn-11134259-7ras8-m1qttd8h1l1be5@resize_ss280x175!@crop_w280_h175_cT', 1),
(@IdChivago, 'https://down-bs-vn.img.susercontent.com/vn-11134259-820l4-mh8ppm9xgnin9c@resize_ss280x175!@crop_w280_h175_cT', 1);

-- ==========================================
-- CHÈN ẢNH TỪNG MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Bò Lá Lốt
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnipi5ydo7b421' FROM MenuItems WHERE restaurant_id = @IdBoLaLot AND name = N'Mắm thêm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnipf16rslqc19' FROM MenuItems WHERE restaurant_id = @IdBoLaLot AND name = N'Bún thêm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnipj3jm5p1h00' FROM MenuItems WHERE restaurant_id = @IdBoLaLot AND name = N'Rau thêm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnf7omlhiz9dbf' FROM MenuItems WHERE restaurant_id = @IdBoLaLot AND name = N'Bò Lá Lốt Nướng' UNION ALL

-- Indomie Phú Nhuận
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnow4pobfnk6dc' FROM MenuItems WHERE restaurant_id = @IdIndomie AND name = N'Khoai tây chiên - 150gr' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnnwzvf1e5fo46' FROM MenuItems WHERE restaurant_id = @IdIndomie AND name = N'Mì Trộn Indomie Tôm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnnx46slyfi87d' FROM MenuItems WHERE restaurant_id = @IdIndomie AND name = N'Mì Trộn Indomie Thịt Cua Phủ Trứng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnnxomxqa29v3a' FROM MenuItems WHERE restaurant_id = @IdIndomie AND name = N'Combo nhỏ' UNION ALL

-- Phong Ký
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lw30jyv7b26x51' FROM MenuItems WHERE restaurant_id = @IdHuTieuXao AND name = N'Mì xào giòn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lw310k33ckpl2c' FROM MenuItems WHERE restaurant_id = @IdHuTieuXao AND name = N'Mì xào giòn mực' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lw3222u4rljv9c' FROM MenuItems WHERE restaurant_id = @IdHuTieuXao AND name = N'Hủ tiếu xào bò' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lw31k6wj099745' FROM MenuItems WHERE restaurant_id = @IdHuTieuXao AND name = N'Bún gạo xào thập cẩm' UNION ALL

-- Bò Bía 96
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lvsuk5hiwzizf4' FROM MenuItems WHERE restaurant_id = @IdBoBia AND name = N'Bò bía mặn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-m01uyskmflrh1b' FROM MenuItems WHERE restaurant_id = @IdBoBia AND name = N'Combo 5 gỏi cuốn tôm thit' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lvsuws6tii8r86' FROM MenuItems WHERE restaurant_id = @IdBoBia AND name = N'Bún mắm nêm tai heo' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-m01v3zzq61lb5a' FROM MenuItems WHERE restaurant_id = @IdBoBia AND name = N'Combo 10 cuon goi cuốn tai heo' UNION ALL

-- EmmyHappy
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-me5uomw3d0qv7f' FROM MenuItems WHERE restaurant_id = @IdEmmyHappy AND name = N'Kimbap Truyền Thống' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-me61ecxq0ema21' FROM MenuItems WHERE restaurant_id = @IdEmmyHappy AND name = N'Trứng cuộn rong biển' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-me627nw7qltycc' FROM MenuItems WHERE restaurant_id = @IdEmmyHappy AND name = N'Bibimbap trứng xúc xích' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mf8dc5qbjv9keb' FROM MenuItems WHERE restaurant_id = @IdEmmyHappy AND name = N'Mì trộn Gà viên Phô mai' UNION ALL

-- Bento Delichi
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqz7fiu8gon8b4' FROM MenuItems WHERE restaurant_id = @IdBentoDelichi AND name = N'Cơm Gà Mắm Tỏi (Đùi Lớn Góc Tư)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxjtesv68qs4e' FROM MenuItems WHERE restaurant_id = @IdBentoDelichi AND name = N'Cơm Gà Xối Mỡ (Đùi Tỏi/Má Đùi)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ra0g-m8em9nvhdrno65' FROM MenuItems WHERE restaurant_id = @IdBentoDelichi AND name = N'Combo 1 Người Vừa Đủ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lt3sublen9aca2' FROM MenuItems WHERE restaurant_id = @IdBentoDelichi AND name = N'Trà Tắc Thảo Mộc' UNION ALL

-- Ốc Trứng Muối
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Ốc Bươu nướng tiêu' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Mì xào HẢI SẢN' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Hàu 7 Vị' UNION ALL
SELECT id, 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqn24i7chcfw9c@resize_ss120x120!@crop_w120_h120_cT' FROM MenuItems WHERE restaurant_id = @IdOcTrungMuoi AND name = N'Hàu né phô mai' UNION ALL

-- A Mìn Quán
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lvwy4x7ngul799' FROM MenuItems WHERE restaurant_id = @IdAMinQuan AND name = N'Cơm Thập Cẩm Quay + 1 Pepsi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-luugqc7ickcy63' FROM MenuItems WHERE restaurant_id = @IdAMinQuan AND name = N'Cơm Gà Xối Mỡ' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-luugq16ghm3p7a' FROM MenuItems WHERE restaurant_id = @IdAMinQuan AND name = N'Mì Vịt Tiềm 1/4 Đùi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-luugqp7bc011bf' FROM MenuItems WHERE restaurant_id = @IdAMinQuan AND name = N'Gà Ác Tiềm Thuốc Bắc' UNION ALL

-- Thie Macaron
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lx3me00p84pl3b' FROM MenuItems WHERE restaurant_id = @IdThieMacaron AND name = N'Cup 20 viên nhỏ mix 15 vị' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lx3mhymmj93t14' FROM MenuItems WHERE restaurant_id = @IdThieMacaron AND name = N'Hộp quà 36 viên nhỏ mix 15 vị' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmbt6ehcv7k2bd' FROM MenuItems WHERE restaurant_id = @IdThieMacaron AND name = N'Hộp 6 bánh to mix 6 vị random' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lx3nlwpc32zf3b' FROM MenuItems WHERE restaurant_id = @IdThieMacaron AND name = N'Hộp 12 bánh to mix 12 vị' UNION ALL

-- Champong
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh1me8mnrb4988' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Thịt Heo Sốt Chua Ngọt Size Mini' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh1meio38mq7c9' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mì Tương Đen Xào Cay' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh1m2r5w3j7y4f' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Mỳ Champong Hải sản' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh1m2zly7oy458' FROM MenuItems WHERE restaurant_id = @IdChampong AND name = N'Cơm Rang Tôm Trứng' UNION ALL

-- Kim Sinh
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr3hw157skas0c' FROM MenuItems WHERE restaurant_id = @IdKimSinh AND name = N'Mỳ vịt tiềm góc tư đùi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr3igeisjna154' FROM MenuItems WHERE restaurant_id = @IdKimSinh AND name = N'Óc heo tiềm thuốc bắc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqyp6ehaoibo8a' FROM MenuItems WHERE restaurant_id = @IdKimSinh AND name = N'Gà ác tiềm thuốc bắc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqyp6f0zvohw33' FROM MenuItems WHERE restaurant_id = @IdKimSinh AND name = N'Mỳ cật heo tiềm' UNION ALL

-- Sushi Story
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mm4d5kpcb5dx17' FROM MenuItems WHERE restaurant_id = @IdSushiStory AND name = N'SET HEALTHY 1 NGƯỜI ĂN NO' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mm6fh5y0c5qc70' FROM MenuItems WHERE restaurant_id = @IdSushiStory AND name = N'SASHIMI HÀU NHẬT TRỨNG CÁ CHUỒN' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mm1sgbxzebd159' FROM MenuItems WHERE restaurant_id = @IdSushiStory AND name = N'SALAD CÁ TRÍCH (sốt mè rang)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mm7gu61q06ps9c' FROM MenuItems WHERE restaurant_id = @IdSushiStory AND name = N'CÂU CHUYỆN CHÚNG MÌNH' UNION ALL

-- Bánh Tráng
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo16l2omemme95' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trộn mỡ hành trứng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo16mnnm0ow485' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Trộn sate me cay trứng' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo16ahl7ev4642' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Cuốn lòng đào chấm sốt me' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mo1688lepmh2e5' FROM MenuItems WHERE restaurant_id = @IdBanhTrang AND name = N'Cuốn gà vừa xóc muối hành' UNION ALL

-- Takoyaki
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ly3ibd1hquo327' FROM MenuItems WHERE restaurant_id = @IdTakoyaki AND name = N'(4 cái) Bạch Tuộc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ly3ibsoqulkz83' FROM MenuItems WHERE restaurant_id = @IdTakoyaki AND name = N'(4 cái) Phô Mai' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ly3icbvcrz5v7c' FROM MenuItems WHERE restaurant_id = @IdTakoyaki AND name = N'(4 cái) Đặc Biệt' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-ly3ie0j00gwga5' FROM MenuItems WHERE restaurant_id = @IdTakoyaki AND name = N'(hộp lớn) Bạch Tuộc' UNION ALL

-- Zin Zin
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mny0lfp1pipx1b' FROM MenuItems WHERE restaurant_id = @IdZinZin AND name = N'Cafe Sữa Sài Gòn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mny0m9j5or2af8' FROM MenuItems WHERE restaurant_id = @IdZinZin AND name = N'Bạc Xỉu Muối' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mny0g3z6ap6p6e' FROM MenuItems WHERE restaurant_id = @IdZinZin AND name = N'Matcha Kem Muối' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mocjme97pxc037' FROM MenuItems WHERE restaurant_id = @IdZinZin AND name = N'Sữa Dâu Phô Mai' UNION ALL

-- The Spicy Crab
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mn9t65b2xjpcfc' FROM MenuItems WHERE restaurant_id = @IdTheSpicyCrab AND name = N'Mì trộn tôm sò điệp' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnhmx6feb6km26' FROM MenuItems WHERE restaurant_id = @IdTheSpicyCrab AND name = N'Tôm sống sốt thái' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mh6c4i2bf1fy5d' FROM MenuItems WHERE restaurant_id = @IdTheSpicyCrab AND name = N'Mix Ốc Hương 5 Món' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mmkaaxd9zsi79d' FROM MenuItems WHERE restaurant_id = @IdTheSpicyCrab AND name = N'Tôm Hùm Đất / crawfish ( 500gram )' UNION ALL

-- Huynh Hoa
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mmfvxoaonklh7b' FROM MenuItems WHERE restaurant_id = @IdHuynhHoa AND name = N'Bánh Mì Truyền Thống - size L (Đặc biệt)' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mm1qcqcyr5s810' FROM MenuItems WHERE restaurant_id = @IdHuynhHoa AND name = N'Bánh Mì Truyền Thống - size M' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mm1pjmwxhq82de' FROM MenuItems WHERE restaurant_id = @IdHuynhHoa AND name = N'Combo 1: 1 Bánh mì truyền thống sz L; 1 Bịch cơm cháy mắm; 1 Bánh bao' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134505-81ztc-mmfxwqfgt2wx67' FROM MenuItems WHERE restaurant_id = @IdHuynhHoa AND name = N'Combo Size M: 1 Bánh mì truyền thống (M)+ 1 CoCa 300ml' UNION ALL

-- Ba Ghiền
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqy1s02zovix59' FROM MenuItems WHERE restaurant_id = @IdBaGhien AND name = N'Cơm Sườn' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqy0qklvk3a1f3' FROM MenuItems WHERE restaurant_id = @IdBaGhien AND name = N'Cơm sườn chả' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr5xki97xaysab' FROM MenuItems WHERE restaurant_id = @IdBaGhien AND name = N'Combo 2: Cơm sườn bì chả + 1 cơm thêm' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqy46okl8ejd7f' FROM MenuItems WHERE restaurant_id = @IdBaGhien AND name = N'Rau Má Đậu Xanh Nhà Làm' UNION ALL

-- Cơm Mì MaLai
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr62dpm4ri5506' FROM MenuItems WHERE restaurant_id = @IdComMiMaLai AND name = N'Cơm MaLai Gà Sốt Teriyaki - Sâm La Hán Quả' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lr3g0jsetlms75' FROM MenuItems WHERE restaurant_id = @IdComMiMaLai AND name = N'Cơm Bò Mỹ Sốt Teriyaki trứng trần' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxi4fk1ncm1cd' FROM MenuItems WHERE restaurant_id = @IdComMiMaLai AND name = N'Cơm Chiên SaLai Sườn Sốt Me Cay' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqy23arojzyc3d' FROM MenuItems WHERE restaurant_id = @IdComMiMaLai AND name = N'Mì Xào SaLai Gà Sốt Teriyaki' UNION ALL

-- Cháo Ếch
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m29kb5fgy3786d' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cháo Ếch Singapore 2 Con' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7ras8-m29kbljddh2se4' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cháo Ếch Singapore 1 Con' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnvn95zyyn7oa3' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cháo bò sốt tiêu xanh phần lớn 200g' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mnvnlqeqf6de46' FROM MenuItems WHERE restaurant_id = @IdChaoEch AND name = N'Cơm bò phần lớn 200g' UNION ALL

-- Chivago
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-7r98o-lqxp8z00p0w468' FROM MenuItems WHERE restaurant_id = @IdChivago AND name = N'Bánh gạo cay Hàn Quốc' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-820l4-mglwj6sgw6bw81' FROM MenuItems WHERE restaurant_id = @IdChivago AND name = N'Gà rán giòn đặc biệt Chivago' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mk26xb5ort3cea' FROM MenuItems WHERE restaurant_id = @IdChivago AND name = N'Gà rán rút xương xốt galbi' UNION ALL
SELECT id, 'https://down-bs-vn.img.susercontent.com/vn-11134517-81ztc-mk26xb5oozyg7f' FROM MenuItems WHERE restaurant_id = @IdChivago AND name = N'Gà rán rút xương xốt Sriracha Mayo';