USE travel_food_db
GO

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
-- Tân Bình --
(N'Cơm niêu Thiên Lý', N'373 Đ.Cộng Hòa, Phường 13, Quận Tân Bình', 10.802257, 106.641842, 4.6, 150000, '10:00, 16:00', '14:30, 21:00', 'vietnamese'),
(N'iSushi Trường Sơn Tân Bình', N'18 Đ.Trường Sơn, Phường 2, Tân Sơn Hòa, Quận Tân Bình', 10.808194033231693, 106.66480797597542, 4.4, 500000, '11:00', '22:00', 'japanese'),
(N'Hẻm Fast Food', N'187 Đ.Bàu Cát, Phường 14, Quận Tân Bình', 10.79217224706147, 106.64363287116386, 4.6, 200000, '10:00', '21:30', 'korean'),
(N'King BBQ', N'347 Đ.Lê Văn Sỹ, Phường Tân, Tân Sơn Hòa, Quận Tân Bình', 10.796333195434507, 106.66548922907884, 4.3, 400000, '10:00', '22:00', 'bbq'),
(N'Bún thịt nướng Hải Đăng', N'149 Đ.Chấn Hưng, Phường 6, Quận Tân Bình', 10.785231582547814, 106.66231272138896, 4.1, 100000, '8:00', '22:00', 'vietnamese'),
(N'Papaxốt Đồng Đen', N'106-108-110 Đ.Đồng Đen, Phường 14, Quận Tân Bình', 10.793276124599712, 106.64432849507915, 4.0, 200000, '10:00', '22:00', 'vietnamese'),
(N'Đậu Homemade - Bún đậu mắm tôm', N'241 đ.Đồng Đen, Phường 11, Quận Tân Bình', 10.787120249540788, 106.64364927857592, 4.3, 200000, '10:00', '21:00', 'vietnamese'),
(N'Nem Nướng Nha Trang BÉ THẢO', N'1237/31 Đ.Hoàng Sa, Phường 5, Quận Tân Bình', 10.790369334825298, 106.66394877116385, 3.5, 100000, '10:30', '21:30', 'vietnamese'),
(N'I LOVE KEM', N'355 Đ.Lê Văn Sỹ, Phường 1, Quận Tân Bình', 10.79643347945519, 106.66513820391683, 4.3, 100000, '10:00', '23:00', 'vietnamese'),
(N'Lẩu Dê Lâm Ký', N'47 Đ.Nguyễn Thị Nhỏ, Phường 9, Quận Tân Bình', 10.7700343924685, 106.65241699064585, 3.9, 220000, '15:00', '22:00', 'vietnamese'),

-- Tân Phú --
(N'Quán Nướng Yaki', N'375 Đ.Tân Sơn Nhì, Phường Tân Thành, Quận Tân Phú', 10.794101390074331, 106.62891908836144, 3.9, 500000, '9:00', '23:30', 'japanese,bbq'),
(N'The Pizza Company', N'Tầng trệt, Aeon Mall Tân Phú Celadon, 30 Đ.Bờ Bao Tân Thắng, Phường Sơn Kỳ, Quận Tân Phú', 10.801544031808016, 106.61854110789773, 4.0, 1000000, '10:00', '22:00', 'italian'),
(N'Nhà hàng Vườn Treo MansonPark', N'2 Đ.Đô Đốc Long, Phường Tân Quý, Quận Tân Phú', 10.791732577331674, 106.63012289762649, 4.8, 500000, '17:00', '23:00', 'vietnamese'),
(N'Lẩu Khổ Qua Rừng Mạ Tôi-HCM', N'30 Đ.Hà Thị Đát, Phường Tân Quý, Quận Tân Phú', 10.800281937204717, 106.62764047615723, 4.2, 200000, '10:00', '22:00', 'vietnamese'),
(N'Cháo Sá Sùng', N'104/22B Đ.Trịnh Đình Trọng, Phường Phú Trung, Quận Tân Phú', 10.776036433048082, 106.64430689478084, 4.6, 100000, '6:00,15:00', '11:00,21:00', 'vietnamese'),
(N'Quán ỐC CỒ', N'117 Đ.Lê Thúc Hoạch, Phường Phú Thọ Hòa, Quận Tân Phú', 10.788376435243597, 106.62078491537218, 4.7, 200000, '16:00', '2:00', 'vietnamese'),
(N'Thế Giới Steak', N'456 Đ.Tân Sơn Nhì, Phường Tân Quý, Quận Tân Phú', 10.793944952597693, 106.62822475022517, 4.2, 200000, '9:00', '22:00', 'western'),
(N'Quán Xôi gà 56', N'56 Đ.Trịnh Đình Trọng, Phường Phú Trung, Quận Tân Phú', 10.775543450174464, 106.64610721905063, 3.8, 100000, '00:00', '24:00', 'vietnamese'),
(N'Cơm LAM', N'27A Đ.Dân Tộc, Phường Tân Thành, Quận Tân Phú', 10.793875956053066, 106.635772415373, 4.5, 40000, '10:00', '15:00', 'vietnamese'),
(N'Gà Ta Quê Nhà', N'346 Đ.Tân Sơn Nhì, Phường Tân Sơn Nhì, Quận Tân Phú', 10.796486089237955, 106.63052064973978, 4.0, 200000, '9:00', '21:00', 'vietnamese'),

-- Gò Vấp --
(N'Bánh Mì Chảo Cô 3 Hậu', N'36 Đ.Số 18, Phường 8, Quận Gò Vấp', 10.839127888133964, 106.65608512746944, 3.9, 145000, '7:30', '22:00', 'vietnamese'),
(N'Nhà hàng Những Người Bạn', N'14 Đ.Phan Văn Trị, Phường 7, Quận Gò Vấp', 10.827900821419712, 106.68817812086925, 4.2, 300000, '10:00', '23:00', 'vietnamese'),
(N'Mì Gà Da Giòn', N'108 Đ.Phan Văn Trị, Phường 7, Quận Gò Vấp', 10.828765996342408, 106.68533412694875, 4.0, 100000, '8:00', '21:00', 'vietnamese'),
(N'Bánh canh cá lóc Cường Đô La', N'42 Đ.Lê Thị Hồng, Phường 7, Quận Gò Vấp', 10.834276599998116, 106.67798380372126, 3.7, 100000, '6:30', '21:30', 'vietnamese'),
(N'Bánh mì cóc Cô Bích', N'112a Đ.Nguyễn Thái Sơn, Phường 3, Quận Gò Vấp', 10.818568136240945, 106.68282062087455, 4.1, 100000, '00:00', '24:00', 'vietnamese'),
(N'Quán Ăn Núi Ngự', N'25 Đ.số 20, Phường 5, Quận Gò Vấp', 10.837585289004465, 106.68901605393206, 4.1, 500000, '9:00', '23:00', 'vietnamese'),
(N'BBQ GARDEN | LẨU - NƯỚNG KHÔNG KHÓI GÒ VẤP', N'108/4 Đ.Cây Trâm, Phường 9, Quận Gò Vấp', 10.844071330175217, 106.65940997422162, 4.9, 400000, '11:00', '23:00', 'vietnamese'),
(N'Phá Lấu Bò Cây Trâm', N'208 Đ.Cây Trâm, Phường 8, Quận Gò Vấp', 10.84305544862629, 106.65343168276826, 4.3, 20000, '15:00', '21:00', 'vietnamese'),
(N'The Chill Buffet', N'769 Đ.Quang Trung, Phường 12, Quận Gò Vấp', 10.841600797524448, 106.64484846505027, 4.9, 300000, '16:30', '23:00', 'vietnamese'),
(N'Nhi Nhi Quán', N'164 Đ.số 20, Phường 5, Quận Gò Vấp', 10.835668415398922, 106.68819332509588, 4.1, 100000, '15:00', '22:00', 'vietnamese'),

-- Quận 12 --
(N'Bánh Canh Bà Tám Chợ Cầu', N'115A Đ.Tô Ký, Phường Đông Hưng Thuận, Quận 12', 10.84892318766624, 106.63316405135988, 4.5, 50000, '7:00', '23:00', 'vietnamese'),
(N'Cơm chay Thiện Nhẫn', N' 63 Đ.Dương Thị Mười, Quận 12', 10.859297803304672, 106.63026367483619, 4.5, 50000, '6:00', '21:00', 'vietnamese'),
(N'Bánh canh cá lóc Cường Đô La', N'27, Đ.Hiệp Thành, Tân Thới Hiệp, Quận 12', 10.871723069711631, 106.64392920975205, 3.6, 100000, '6:30', '21:30', 'vietnamese'),
(N'Khu du lịch Bến Xưa', N'Số 39A Đ.Hà Huy Giáp, Phường Thạnh Lộc, Quận 12', 10.852581319661217, 106.67768597606594, 4.3, 500000, '7:00', '22:00', 'vietnamese'),
(N'Bún đậu mắm tôm Mẹt Quán', N'689B đ.Nguyễn Văn Quá, Quận 12', 10.851342729235236, 106.63720725207932, 3.4, 100000, '8:00', '21:00', 'vietnamese'),
(N'MÌ QUẢNG HƯƠNG QUÊ', N'80, Đ.Phan Văn Hớn, Quận 12', 10.838854125808442, 106.64429060422606, 4.0, 50000, '6:00,16:30', '13:00, 21:00', 'vietnamese'),
(N'Lẩu bò Phú Gia', N'154/3 Đ.Trường Chinh, Đông Hưng Thuận, Quận 12', 10.835172450118302, 106.63413678140662, 4.1, 200000, '10:00', '21:00', 'vietnamese'),
(N'Nhà hàng Đại Phú', N'56 Đ.Nguyễn Văn Quá, Phường Đông Hưng Thuận, Quận 12', 10.829071966700353, 106.62713830741203, 4.1, 500000, '9:00', '23:00', 'vietnamese'),
(N'Bún Mọc Hùng Mập', N'329 Đ.Nguyễn Văn Quá, Phường Đông Hưng Thuận, Quận 12', 10.836017252350604, 106.62906345763807, 4.2, 100000, '6:00', '22:00', 'vietnamese'),
(N'ỐC NHỚ SÀI GÒN', N'118/4 Đ.Nguyễn Thị Đặng, Phường Tân Thới Hiệp, Quận 12', 10.878202669239759, 106.64896437876618, 3.9, 200000, '16:00', '00:00', 'vietnamese');

GO

DECLARE @IdThienLy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm niêu Thiên Lý');
DECLARE @IdiSushi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'iSushi Trường Sơn Tân Bình');
DECLARE @IdHemFF INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hẻm Fast Food');
DECLARE @IdKingBBQ INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'King BBQ');
DECLARE @IdBunHaiDang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún thịt nướng Hải Đăng');
DECLARE @IdPapaxot INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Papaxốt Đồng Đen');
DECLARE @IdBunHomemade INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Đậu Homemade - Bún đậu mắm tôm');
DECLARE @IdNemNuongBeThao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nem Nướng Nha Trang BÉ THẢO');
DECLARE @IdILOVEKEM INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'I LOVE KEM');
DECLARE @IdDeLamLy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Dê Lâm Ký');

DECLARE @IdNuongYaki INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Nướng Yaki');
DECLARE @IdPizzaCompany INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'The Pizza Company');
DECLARE @IdMansonPark INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà hàng Vườn Treo MansonPark');
DECLARE @IdLauMaToi INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Khổ Qua Rừng Mạ Tôi-HCM');
DECLARE @IdChaoSaSung INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Sá Sùng');
DECLARE @IdOcCo INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán ỐC CỒ');
DECLARE @IdTGSteak INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Thế Giới Steak');
DECLARE @IdXoi56 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Xôi gà 56');
DECLARE @IdComLAM INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm LAM');
DECLARE @IdGaTaQN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Ta Quê Nhà');

DECLARE @IdBanhMiChao INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Mì Chảo Cô 3 Hậu');
DECLARE @IdNhaHangNNB INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà hàng Những Người Bạn');
DECLARE @IdMiGa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Mì Gà Da Giòn');
DECLARE @IdBanhCanhCaLoc_1 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh canh cá lóc Cường Đô La');
DECLARE @IdBanhMiCoBich INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh mì cóc Cô Bích');
DECLARE @IdQuanNuiNgu INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Ăn Núi Ngự');
DECLARE @IdBBQGarden INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'BBQ GARDEN | LẨU - NƯỚNG KHÔNG KHÓI GÒ VẤP');
DECLARE @IdPhaLauCT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phá Lấu Bò Cây Trâm');
DECLARE @IdTheChillBF INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'The Chill Buffet');
DECLARE @IdNNQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhi Nhi Quán');

DECLARE @IdBanhCanhBaTam INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Canh Bà Tám Chợ Cầu');
DECLARE @IdComChayTN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm chay Thiện Nhẫn');
DECLARE @IdBanhCanhCaLoc_2 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh canh cá lóc Cường Đô La');
DECLARE @IdKDLBenXua INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Khu du lịch Bến Xưa');
DECLARE @IdBunDauMetQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún đậu mắm tôm Mẹt Quán');
DECLARE @IdMiQuangHQ INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'MÌ QUẢNG HƯƠNG QUÊ');
DECLARE @IdLauBoPG INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu bò Phú Gia');
DECLARE @IdNhaHangĐP INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà hàng Đại Phú');
DECLARE @IdBunMocHM INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Mọc Hùng Mập');
DECLARE @IdOcNho INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'ỐC NHỚ SÀI GÒN');

INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES
-- Cơm niêu Thiên Lý --
(@IdThienLy, N'Rau Muống Xào Tỏi', N'Rau muống tươi giòn xào với tỏi thơm nồng', 25000, 'vegetable', 'water spinach,garlic'),
(@IdThienLy, N'Bông Bí Xào Tỏi', N'Bông bí đặc sản xào tỏi, vị ngọt thanh', 35000, 'vegetable', 'pumpkin flower,garlic'),
(@IdThienLy, N'Đậu Hũ Tứ Xuyên', N'Đậu hũ non sốt thịt bằm cay nồng kiểu Hoa', 45000, 'chinese', 'tofu,pork,chili'),
(@IdThienLy, N'Trứng Chiên Hàu', N'Trứng chiên vàng ươm cùng hàu sữa béo ngậy', 45000, 'vietnamese', 'egg,oyster'),
(@IdThienLy, N'Cá Kho Tộ', N'Cá tươi kho tộ đậm đà, chuẩn vị cơm nhà', 65000, 'vietnamese', 'fish,pork fat,chili'),
(@IdThienLy, N'Gà Kho Sả Ớt', N'Thịt gà dai ngọt kho cùng sả ớt cay thơm', 55000, 'vietnamese', 'chicken,lemongrass,chili'),
(@IdThienLy, N'Canh Chua Tôm', N'Canh chua kiểu miền Tây với tôm tươi và rau thơm', 45000, 'vietnamese', 'shrimp,pineapple,tomato,tamarind'),
(@IdThienLy, N'Canh Khổ Qua Thác Lác', N'Canh khổ qua thanh nhiệt nhồi chả cá thác lác dai ngon', 40000, 'vietnamese', 'bitter melon,fish cake'),
(@IdThienLy, N'Canh Rong Biển Thịt Bằm', N'Canh rong biển tươi mát nấu cùng thịt bằm', 35000, 'vietnamese', 'seaweed,pork'),
(@IdThienLy, N'Nước Cam Tươi', N'Nước cam nguyên chất giàu vitamin C', 30000, 'drink', 'orange'),
(@IdThienLy, N'Trà Đá', N'Trà xanh ướp lạnh giải nhiệt', 5000, 'drink', 'tea'),

-- iSushi Trường Sơn Tân Bình', N'18 Đ.Trường Sơn --
(@IdiSushi, N'Set Sashimi Tổng Hợp', N'Sashimi cao cấp: Cá hồi, Bạch tuộc, Cá ngừ, Sò đỏ, Lườn cá kiếm', 329000, 'japanese', 'salmon,octopus,tuna,surf clam,swordfish'),
(@IdiSushi, N'Saba Ngâm Dấm', N'Cá saba tươi ngâm dấm chua thanh, chuẩn vị Nhật', 99000, 'japanese', 'mackerel,vinegar'),
(@IdiSushi, N'Sashimi Tôm', N'Tôm sú tươi ngọt lịm, dùng kèm mù tạt và gừng hồng', 119000, 'japanese', 'shrimp'),
(@IdiSushi, N'Sashimi Cá Ngừ', N'Thịt cá ngừ tươi đỏ mọng, giàu dinh dưỡng', 119000, 'japanese', 'tuna'),
(@IdiSushi, N'Sashimi Cá Hồi', N'Cá hồi tươi béo ngậy, cắt lát dày mọng nước', 129000, 'japanese', 'salmon'),
(@IdiSushi, N'Sashimi Cá Trích Vàng', N'Cá trích ép trứng giòn tan, vị béo bùi đặc trưng', 129000, 'japanese', 'herring,fish egg'),

-- Hẻm Fast Food --
(@IdHemFF, N'Gà chiên sốt cay nhúng phô mai', N'Gà chiên giòn rụm với sốt cay Hàn Quốc và phô mai kéo sợi', 164000, 'korean', 'chicken,cheese,chili,flour'),
(@IdHemFF, N'Gà chua ngọt nhúng phô mai', N'Gà chiên sốt chua ngọt đậm đà nhúng phô mai béo ngậy', 84000, 'korean', 'chicken,cheese,sugar,vinegar,flour'),
(@IdHemFF, N'Udon gà cay phô mai', N'Mì Udon dai ngon kết hợp gà cay và lớp phủ phô mai', 174000, 'korean', 'udon,chicken,cheese,chili'),
(@IdHemFF, N'Miến dai gà phô mai', N'Miến Hàn Quốc xào gà cay cùng phô mai tan chảy', 184000, 'korean', 'glass noodles,chicken,cheese,chili'),
(@IdHemFF, N'Steak kem sữa phô mai', N'Steak bò áp chảo mềm mọng kèm sốt kem sữa phô mai bùi béo', 122000, 'western', 'beef,milk,cream,cheese'),
(@IdHemFF, N'Steak sốt BBQ', N'Bít tết bò rưới sốt BBQ đậm đà hương vị khói', 164000, 'western', 'beef,bbq sauce,pepper'),
(@IdHemFF, N'Steak kem trứng muối', N'Steak bò kết hợp sốt kem trứng muối béo ngậy đặc trưng', 159000, 'western', 'beef,salted egg,cream'),
(@IdHemFF, N'Thịt ba chỉ nướng tương Hàn', N'Ba chỉ heo nướng thơm lừng với sốt tương đậu Hàn Quốc', 134000, 'korean', 'pork,korean sauce,garlic'),

-- King BBQ --
(@IdKingBBQ, N'Nạc vai heo sốt tỏi', N'Thịt nạc vai heo tươi ngon thấm đẫm sốt tỏi thơm nồng', 169000, 'bbq', 'pork,garlic'),
(@IdKingBBQ, N'Ba chỉ heo sốt King', N'Thịt ba chỉ heo xen kẽ nạc mỡ với nước sốt King độc quyền', 129000, 'bbq', 'pork,king sauce'),
(@IdKingBBQ, N'Ba chỉ heo cuộn phô mai', N'Ba chỉ heo thái lát mỏng cuộn lớp phô mai béo ngậy', 159000, 'bbq', 'pork,cheese'),
(@IdKingBBQ, N'Bạch tuộc sốt cay', N'Bạch tuộc tươi giòn quyện sốt cay Hàn Quốc đậm đà', 149000, 'bbq', 'octopus,chili'),
(@IdKingBBQ, N'Cá basa nướng giấy bạc', N'Cá basa mềm ngọt nướng giấy bạc giữ trọn hương vị', 129000, 'bbq', 'basa fish,foil,onion'),
(@IdKingBBQ, N'Canh sườn bò', N'Canh sườn bò hầm kỹ, nước dùng thanh ngọt bổ dưỡng', 119000, 'korean', 'beef rib,radish,onion'),
(@IdKingBBQ, N'Canh Kimchi', N'Canh Kimchi chua cay truyền thống với thịt ba chỉ và đậu hũ', 89000, 'korean', 'kimchi,pork,tofu,chili'),
(@IdKingBBQ, N'Canh rong biển', N'Canh rong biển thanh mát, nhẹ nhàng chuẩn vị Hàn', 69000, 'korean', 'seaweed,garlic'),
(@IdKingBBQ, N'Canh măng bò Mỹ', N'Sự kết hợp độc đáo giữa măng tươi và thịt bò Mỹ', 99000, 'korean', 'beef,bamboo shoot,chili'),

-- Bún thịt nướng hải Đăng --
(@IdBunHaiDang, N'Tô Đặc Biệt', N'Bún thịt nướng đặc biệt: nhiều thịt, chả giò và nem nướng', 70000, 'vietnamese', 'pork,spring roll,sausage,noodle'),
(@IdBunHaiDang, N'Tô Thập Cẩm', N'Bún thịt nướng thập cẩm đầy đủ: thịt, chả giò và nem', 50000, 'vietnamese', 'pork,spring roll,sausage,noodle'),
(@IdBunHaiDang, N'Tô Thịt + Chả Giò', N'Sự kết hợp giữa thịt nướng thơm lừng và chả giò giòn rụm', 50000, 'vietnamese', 'pork,spring roll,noodle'),
(@IdBunHaiDang, N'Tô Thịt + Nem', N'Bún thịt nướng ăn kèm nem nướng đậm đà', 50000, 'vietnamese', 'pork,sausage,noodle'),
(@IdBunHaiDang, N'Tô Chả Giò + Nem', N'Lựa chọn không thịt nướng với chả giò và nem nướng', 50000, 'vietnamese', 'spring roll,sausage,noodle'),
(@IdBunHaiDang, N'Tô Thịt Không', N'Bún thịt nướng thuần túy', 50000, 'vietnamese', 'pork,noodle'),
(@IdBunHaiDang, N'Tô Chả Giò Không', N'Bún ăn kèm chả giò chiên giòn', 50000, 'vietnamese', 'spring roll,noodle'),

-- Papaxốt --
(@IdPapaxot, N'Cơm Xèo Bò Đặc Biệt', N'Cơm nóng trên chảo xèo xèo cùng thịt bò, trứng ốp la và ngô hạt', 97000, 'vietnamese', 'beef,egg,corn,rice'),
(@IdPapaxot, N'Cơm Xèo Bò Nấm', N'Sự kết hợp giữa thịt bò tươi và nấm hương thơm bùi trên chảo nóng', 85000, 'vietnamese', 'beef,mushroom,rice'),
(@IdPapaxot, N'Cơm Bò Hầm Bashi (Phủ 1 Trứng)', N'Thịt bò hầm mềm mọng theo công thức Bashi kèm trứng ốp la', 68000, 'vietnamese', 'beef,egg,rice'),
(@IdPapaxot, N'Cơm Xèo Bò Nướng (Sốt Papa)', N'Thịt bò nướng thơm lừng quyện sốt Papa độc quyền của quán', 79000, 'vietnamese', 'beef,papa sauce,rice'),
(@IdPapaxot, N'Cơm Xèo Bò', N'Món cơm xèo bò truyền thống đơn giản nhưng đậm đà', 79000, 'vietnamese', 'beef,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Đặc Biệt', N'Cơm gà chảo nóng với trứng và các loại topping đặc biệt', 85000, 'vietnamese', 'chicken,egg,corn,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Trứng Muối', N'Thịt gà áp chảo kết hợp sốt trứng muối béo ngậy', 79000, 'vietnamese', 'chicken,salted egg,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Nấm', N'Gà áp chảo cùng nấm tươi thanh ngọt', 75000, 'vietnamese', 'chicken,mushroom,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Phi Lê', N'Phần ức gà phi lê mềm, ít béo dành cho người ăn kiêng', 69000, 'vietnamese', 'chicken,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Xúc Xắc (Sốt Teriyaki)', N'Gà cắt viên xúc xắc thấm sốt Teriyaki Nhật Bản', 59000, 'vietnamese', 'chicken,sausage,teriyaki sauce,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Áp Chảo', N'Gà áp chảo giòn da, thịt bên trong vẫn giữ được độ ẩm', 59000, 'vietnamese', 'chicken,rice'),
(@IdPapaxot, N'Cơm Xèo Gà Hải Sản', N'Sự kết hợp độc đáo giữa gà và hải sản trên chảo xèo xèo', 85000, 'vietnamese', 'chicken,seafood,rice'),

-- Bún đậu Homemade --
(@IdBunHomemade, N'Bún Đậu No Nê (1-2 người)', N'Phiên bản nâng cấp gồm: bún lá, đậu mơ, chả cốm, thịt chân giò, ba rọi riềng mẻ, dồi sụn', 189000, 'vietnamese', 'noodle,tofu,pork,spring roll,shrimp paste'),
(@IdBunHomemade, N'Bún Đậu Homemade (1 người)', N'Phần bún đậu đặc trưng gồm: bún lá, đậu mơ, chả cốm, thịt chân giò hấp và ba rọi riềng mẻ', 109000, 'vietnamese', 'noodle,tofu,pork,spring roll,shrimp paste'),
(@IdBunHomemade, N'Lòng Rán', N'Lòng rán dai giòn sần sật, dùng kèm mắm tôm và các loại rau thơm Hà Nội', 175000, 'appetizer', 'pork intestine,shrimp paste,herb'),
(@IdBunHomemade, N'Ba Rọi Riềng Mẻ', N'Thịt ba rọi tẩm ướp riềng mẻ 24h, chiên cháy xém, ngoài giòn trong ngọt', 179000, 'appetizer', 'pork belly,galangal,fermented rice,shrimp paste'),
(@IdBunHomemade, N'Đậu Mắm Hành Mỡ', N'Đậu hũ chiên vàng nhúng mắm hành mỡ thơm nồng, béo ngậy', 55000, 'vietnamese', 'tofu,onion,fish sauce'),
(@IdBunHomemade, N'Đậu Tay Cầm', N'Đậu hũ nấu tay cầm cùng nấm và rau củ, giữ độ nóng lâu', 82000, 'vietnamese', 'tofu,mushroom,vegetable'),
(@IdBunHomemade, N'Đậu Hũ Tươi Muối Tiêu Kim Hoa', N'Đậu hũ tươi mềm mịn chấm muối tiêu đặc sản', 42000, 'vietnamese', 'tofu,salt,pepper'),
(@IdBunHomemade, N'Bún Giả Cầy', N'Chân giò heo nấu riềng sả mẻ mắm tôm đậm đà đúng chất Bắc', 115000, 'vietnamese', 'pork trotter,galangal,fermented rice,shrimp paste,noodle'),
(@IdBunHomemade, N'Bún Ốc Chuối Đậu', N'Sự kết hợp giữa ốc, chuối xanh và đậu hũ trong nước dùng chua thanh', 125000, 'vietnamese', 'snail,green banana,tofu,shrimp paste,noodle'),

-- Nem Nướng Nha Trang BÉ THẢO --
(@IdNemNuongBeThao, N'Nem nướng (Phần)', N'Suất nem nướng đầy đủ kèm bánh tráng, rau sống, bún và ram giòn', 42000, 'vietnamese', 'pork,rice paper,vegetable,noodle,ram'),
(@IdNemNuongBeThao, N'Nem thêm', N'Nem nướng gọi thêm cho suất ăn', 5000, 'vietnamese', 'pork'),
(@IdNemNuongBeThao, N'Nem chua', N'Nem chua đặc sản ăn kèm', 4000, 'vietnamese', 'pork,garlic,chili'),
(@IdNemNuongBeThao, N'Nem chua nướng', N'Nem chua nướng nóng hổi, thơm nồng', 5000, 'vietnamese', 'pork,garlic,chili'),
(@IdNemNuongBeThao, N'Phụ thu thêm đồ', N'Thêm ram, rau, bún, bánh tráng hoặc đồ chua', 5000, 'vietnamese', 'vegetable,noodle,rice paper'),
(@IdNemNuongBeThao, N'Tiger beer', N'Bia Tiger lon ướp lạnh', 18000, 'drink', 'beer'),
(@IdNemNuongBeThao, N'Nước ngọt', N'Các loại nước giải khát đóng chai', 12000, 'drink', 'soda'),
(@IdNemNuongBeThao, N'Nước suối', N'Nước suối đóng chai tinh khiết', 10000, 'drink', 'water'),
(@IdNemNuongBeThao, N'Trà đá', N'Ly trà đá giải nhiệt', 2000, 'drink', 'tea'),

-- I LOVE KEM --
(@IdILOVEKEM, N'Sữa chua trân châu', N'Sữa chua dẻo mịn kết hợp cùng trân châu cốt dừa đặc trưng', 29000, 'dessert', 'yogurt,pearl,coconut milk'),
(@IdILOVEKEM, N'Sữa chua dưa hấu', N'Sữa chua dẻo ăn kèm dưa hấu tươi mát', 35000, 'dessert', 'yogurt,watermelon'),
(@IdILOVEKEM, N'Sữa chua Kiwi', N'Sữa chua dẻo kết hợp vị kiwi chua ngọt', 35000, 'dessert', 'yogurt,kiwi'),
(@IdILOVEKEM, N'Sữa chua xoài', N'Sữa chua dẻo ăn kèm xoài chín thơm ngọt', 35000, 'dessert', 'yogurt,mango'),
(@IdILOVEKEM, N'Sữa chua mít', N'Sữa chua dẻo hòa quyện cùng mít tươi giòn', 35000, 'dessert', 'yogurt,jackfruit'),
(@IdILOVEKEM, N'Sữa chua việt quất', N'Sữa chua dẻo rưới sốt việt quất đậm đà', 35000, 'dessert', 'yogurt,blueberry'),
(@IdILOVEKEM, N'Kem cam đậu', N'Sự kết hợp độc đáo giữa kem vị cam và đậu', 35000, 'dessert', 'ice cream,orange,bean'),
(@IdILOVEKEM, N'Kem tự chọn (100gram)', N'Khách hàng tự chọn các vị kem yêu thích: Sầu riêng, Trà xanh, Dưa lưới, Dâu, Bạc hà...', 29000, 'dessert', 'ice cream,topping,fruit'),

-- Lẩu dê Lâm ký --
(@IdDeLamLy, N'Lẩu Dê (Nhỏ)', N'Lẩu dê tươi nấu kiểu truyền thống, nước dùng thanh ngọt', 320000, 'goat', 'goat meat,herb,tofu,vegetable'),
(@IdDeLamLy, N'Thịt Dê Nướng', N'Thịt dê tươi tẩm ướp gia vị đậm đà nướng than hồng', 175000, 'goat', 'goat meat,garlic,chili'),
(@IdDeLamLy, N'Lòng Dê', N'Lòng dê tươi chế biến sạch, dai giòn sần sật', 160000, 'goat', 'goat intestine'),
(@IdDeLamLy, N'Cháo Dê', N'Cháo gạo thơm nấu cùng thịt dê bằm bổ dưỡng', 45000, 'goat', 'goat meat,rice,ginger'),
(@IdDeLamLy, N'Tiết Canh Dê', N'Món tiết canh dê tươi đặc sản', 40000, 'goat', 'goat blood,peanut,herb'),
(@IdDeLamLy, N'Dê Tiềm Thuốc Bắc (Đặt trước)', N'Dê hầm các vị thuốc bắc quý hiếm, bồi bổ sức khỏe (Thố lớn)', 1000000, 'goat', 'goat meat,chinese medicine,herb'),
(@IdDeLamLy, N'Mì Thêm', N'Mì trứng ăn kèm lẩu', 17000, 'side_dish', 'egg noodle'),
(@IdDeLamLy, N'Bánh Phở Thêm', N'Bánh phở tươi ăn kèm lẩu', 17000, 'side_dish', 'rice noodle'),
(@IdDeLamLy, N'Bún Thêm', N'Bún tươi ăn kèm lẩu', 14000, 'side_dish', 'noodle'),
(@IdDeLamLy, N'Đậu Hũ Chiên', N'Đậu hũ chiên vàng giòn', 17000, 'side_dish', 'tofu'),
(@IdDeLamLy, N'Rau Thêm', N'Các loại rau ăn kèm lẩu dê', 14000, 'side_dish', 'vegetable'),
(@IdDeLamLy, N'Bia Heineken (Lon)', N'Bia Heineken lon ướp lạnh', 25000, 'drink', 'beer'),
(@IdDeLamLy, N'Bia Tiger (Lon)', N'Bia Tiger lon ướp lạnh', 22000, 'drink', 'beer'),
(@IdDeLamLy, N'Soda Chanh', N'Nước soda chanh đường giải nhiệt', 15000, 'drink', 'soda,lemon'),
(@IdDeLamLy, N'Nước Suối', N'Nước suối đóng chai', 10000, 'drink', 'water'),
(@IdDeLamLy, N'Trà Đá', N'Ly trà đá mát lạnh', 2000, 'drink', 'tea'),

-- Quán nướng Yaki --
(@IdNuongYaki, N'Sashimi Cá Hồi', N'Cá hồi tươi thái lát, vị béo ngậy tự nhiên', 175000, 'japanese', 'salmon'),
(@IdNuongYaki, N'Sashimi Cá Trích Ép Trứng', N'Cá trích tươi ép trứng giòn tan, vị béo bùi', 235000, 'japanese', 'herring,fish egg'),
(@IdNuongYaki, N'Sashimi Cá Ngừ', N'Thịt cá ngừ tươi đỏ mọng, giàu dinh dưỡng', 425000, 'japanese', 'tuna'),
(@IdNuongYaki, N'Bò Wagyu A5 Nướng', N'Thịt bò Wagyu cấp độ A5 cao cấp nhất với vân mỡ tuyệt đẹp', 325000, 'japanese', 'wagyu beef'),
(@IdNuongYaki, N'Tôm Hùm Cuộn Phô Mai', N'Tôm hùm tươi cuộn phô mai béo ngậy nướng thơm lừng', 255000, 'seafood', 'lobster,cheese'),
(@IdNuongYaki, N'Bò Wagyu A4 Nướng', N'Bò Wagyu A4 nướng mềm mọng, hương vị đậm đà', 300000, 'japanese', 'wagyu beef'),
(@IdNuongYaki, N'Bò Nhật Đất Sét', N'Thịt bò Nhật nướng trên đá muối/đất sét giữ trọn độ ngọt', 658000, 'japanese', 'beef'),
(@IdNuongYaki, N'Lưỡi Bò Nướng Muối', N'Lưỡi bò giòn dai nướng muối tiêu đơn giản mà tinh tế', 148000, 'western', 'beef tongue'),
(@IdNuongYaki, N'Cánh Gà Nướng Teriyaki', N'Cánh gà nướng sốt Teriyaki Nhật Bản ngọt thơm', 125000, 'japanese', 'chicken,teriyaki sauce'),

-- The Pizza Company
(@IdPizzaCompany, N'Pizza Hải Sản Pesto Xanh', N'Tôm, thanh cua, mực và bông cải tươi ngon trên nền xốt Pesto Xanh.', 189000, 'pizza', 'shrimp,crab stick,squid,broccoli,pesto sauce'),
(@IdPizzaCompany, N'Pizza Hải Sản Pesto Xanh Full Topping', N'Tôm, thanh cua, mực full topping và bông cải tươi ngon trên nền xốt Pesto Xanh.', 209000, 'pizza', 'shrimp,crab stick,squid,broccoli,pesto sauce'),
(@IdPizzaCompany, N'Pizza Cá Hồi Hạt Sen', N'Sự kết hợp độc đáo giữa cá hồi tươi và hạt sen bùi béo trên nền phô mai', 199000, 'pizza', 'salmon,lotus seed,cheese'),
(@IdPizzaCompany, N'Pizza Gà Hạt Sen', N'Gà nướng thơm ngon kết hợp cùng hạt sen bổ dưỡng', 179000, 'pizza', 'chicken,lotus seed,cheese'),
(@IdPizzaCompany, N'Pizza 4 Cheese Dừa Non Tôm Nõn - Mật Hoa Dừa', N'Tôm, 4 loại phô mai trứ danh kết hợp cùng Dừa Việt Nam, dùng kèm với Mật Hoa Dừa.', 189000, 'pizza', 'shrimp,cheese,coconut,coconut nectar'),
(@IdPizzaCompany, N'Pizza 4 Cheese Dừa Non - Mật Hoa Dừa', N'4 loại phô mai trứ danh kết hợp cùng Dừa Việt Nam, dùng kèm với Mật Hoa Dừa.', 189000, 'pizza', 'cheese,coconut,coconut nectar'),

-- Nhà hàng Vườn Treo MansonPark --
(@IdMansonPark, N'Bò tùng xẻng nướng sốt tiêu đen', N'Thịt bò nướng thơm lừng kèm xốt tiêu đen, bắp, bơ, nấm, khoai tây và bánh mì', 310000, 'western', 'beef,black pepper sauce,corn,butter,mushroom,potato,bread'),
(@IdMansonPark, N'Cá hồi áp chảo sốt trứng muối', N'Cá hồi tươi áp chảo kết hợp sốt trứng muối béo ngậy', 150000, 'seafood', 'salmon,salted egg sauce'),
(@IdMansonPark, N'Tôm sốt Hoàng Kim', N'Tôm tươi chiên giòn quyện xốt trứng muối vàng óng', 230000, 'seafood', 'shrimp,salted egg sauce'),
(@IdMansonPark, N'Cánh gà sốt Sambal Chili Singapore', N'Cánh gà chiên thấm sốt Sambal cay nồng đặc trưng Singapore', 135000, 'fastfood', 'chicken,sambal sauce,chili'),
(@IdMansonPark, N'Cơm Thái xốt Sambal', N'Cơm chiên kiểu Thái với xốt Sambal cay thơm', 110000, 'rice', 'rice,sambal sauce,chili'),
(@IdMansonPark, N'Cá lóc quay me nguyên con', N'Cá lóc chiên xù quay me chua ngọt', 240000, 'vietnamese', 'snakehead fish,tamarind sauce'),
(@IdMansonPark, N'Mỳ Spaghetti (L)', N'Mỳ Ý sốt bò băm truyền thống', 85000, 'western', 'spaghetti,beef,tomato sauce'),
(@IdMansonPark, N'Mỳ xào hải sản (L)', N'Mỳ xào cùng tôm, mực và rau củ tươi', 125000, 'western', 'noodle,shrimp,squid,vegetable'),
(@IdMansonPark, N'Nui xào Hong Kong (L)', N'Nui xào kiểu Hong Kong đậm đà', 165000, 'western', 'macaroni,beef,pork,soy sauce'),
(@IdMansonPark, N'Cơm chiên cá mặn (L)', N'Cơm chiên tơi xốp cùng cá mặn thơm nồng', 165000, 'rice', 'rice,salted fish,egg'),
(@IdMansonPark, N'Cơm chiên gà xé (L)', N'Cơm chiên cùng thịt gà xé phay bùi béo', 125000, 'rice', 'rice,chicken,egg'),
(@IdMansonPark, N'Lẩu hải sản (L)', N'Lẩu hải sản thập cẩm tươi ngon cho nhóm đông người', 355000, 'hotpot', 'shrimp,squid,fish,vegetable,noodle'),
(@IdMansonPark, N'Lẩu đầu cá hồi măng chua (L)', N'Lẩu đầu cá hồi nấu măng chua thanh nhiệt', 235000, 'hotpot', 'salmon head,sour bamboo,herb'),
(@IdMansonPark, N'Lẩu gà lá giang (L)', N'Lẩu gà nấu lá giang chua cay chuẩn vị vườn', 315000, 'hotpot', 'chicken,giang leaf,chili'),

-- Lẩu Khổ Qua Rừng Mạ Tôi-HCM --
(@IdLauMaToi, N'Lẩu sườn chiên đặc biệt', N'Phần lẩu đặc biệt gồm khổ qua rừng, cá thác lác và sườn chiên giòn', 349000, 'hotpot', 'bitter melon,fish cake,pork rib,vegetable'),
(@IdLauMaToi, N'Lẩu sườn chiên nhỏ', N'Phần lẩu sườn chiên cỡ nhỏ cho nhóm ít người', 199000, 'hotpot', 'bitter melon,fish cake,pork rib,vegetable'),
(@IdLauMaToi, N'Lẩu xí quách đặc biệt', N'Phần lẩu đặc biệt kết hợp khổ qua rừng, cá thác lác và xí quách hầm', 399000, 'hotpot', 'bitter melon,fish cake,pork bone,vegetable'),
(@IdLauMaToi, N'Lẩu xí quách lớn', N'Lẩu xí quách cỡ lớn phù hợp cho nhóm 3-4 người', 279000, 'hotpot', 'bitter melon,fish cake,pork bone,vegetable'),
(@IdLauMaToi, N'Lẩu xí quách nhỏ', N'Lẩu xí quách cỡ nhỏ thanh ngọt, bổ dưỡng', 189000, 'hotpot', 'bitter melon,fish cake,pork bone,vegetable'),
(@IdLauMaToi, N'Chả cá chiên', N'Chả cá thác lác chiên vàng giòn rụm', 80000, 'side_dish', 'fish cake'),
(@IdLauMaToi, N'Cá thác lác viên', N'Cá thác lác tươi quết nhuyễn viên tròn', 80000, 'side_dish', 'fish cake'),
(@IdLauMaToi, N'Sườn chiên (thanh)', N'Sườn heo chiên thơm ngon ăn kèm', 55000, 'side_dish', 'pork rib'),
(@IdLauMaToi, N'Xí quách thêm', N'Thêm xí quách hầm mềm cho lẩu', 60000, 'side_dish', 'pork bone'),
(@IdLauMaToi, N'Khổ qua rừng nhồi', N'Khổ qua rừng tươi nhồi thịt bằm', 50000, 'side_dish', 'bitter melon,pork'),
(@IdLauMaToi, N'Đọt khổ qua rừng', N'Đọt non khổ qua rừng tươi xanh', 30000, 'side_dish', 'bitter melon leaf'),
(@IdLauMaToi, N'Nước sâm', N'Nước sâm thảo mộc thanh nhiệt, tự nấu', 12000, 'drink', 'herbal tea'),
(@IdLauMaToi, N'Nước suối', N'Nước suối đóng chai', 10000, 'drink', 'water'),
(@IdLauMaToi, N'Coca / Sprite', N'Nước giải khát đóng lon', 15000, 'drink', 'soda'),

-- Cháo Sá Sùng --
(@IdChaoSaSung, N'Cháo Sá Sùng Đặc Biệt', N'Cháo thập cẩm đặc biệt gồm: sá sùng (trùng biến), tôm, cá, cật, gan, phèo, bao tử và thịt', 70000, 'porridge', 'sa sung,shrimp,fish,pork,offal'),
(@IdChaoSaSung, N'Cháo Thập Cẩm (Tô thường)', N'Cháo đầy đủ topping: cật, gan, phèo, bao tử, thịt, cá và trứng', 60000, 'porridge', 'pork,offal,fish,egg'),
(@IdChaoSaSung, N'Cháo Thập Cẩm (Tô nhỏ)', N'Phần cháo nhỏ gồm: cật, gan, phèo, bao tử và thịt', 50000, 'porridge', 'pork,offal'),
(@IdChaoSaSung, N'Cháo thịt bò bằm + trứng bắc thảo', N'Cháo thịt bò bằm kết hợp cùng trứng bắc thảo bùi béo', 60000, 'porridge', 'beef,century egg'),
(@IdChaoSaSung, N'Gà ác tiềm thuốc bắc', N'Gà ác nguyên con hầm cùng các vị thuốc bắc bổ dưỡng', 65000, 'soup', 'black chicken,chinese medicine,herb'),
(@IdChaoSaSung, N'Óc heo tiềm thuốc bắc', N'Óc heo tươi hầm thuốc bắc giúp bổ não, tăng cường sức khỏe', 55000, 'soup', 'pig brain,chinese medicine,herb'),
(@IdChaoSaSung, N'Pín bò tiềm thuốc bắc', N'Pín bò hầm thuốc bắc bồi bổ sinh lực', 80000, 'soup', 'beef penis,chinese medicine,herb'),
(@IdChaoSaSung, N'Móng bò tiềm thuốc bắc', N'Móng bò hầm thuốc bắc giàu collagen và dưỡng chất', 80000, 'soup', 'beef hooves,chinese medicine,herb'),
(@IdChaoSaSung, N'Trà đào', N'Trà đào thơm ngọt giải nhiệt', 15000, 'drink', 'tea,peach'),
(@IdChaoSaSung, N'Trà tắc / Cam vắt', N'Nước trái cây tươi giàu vitamin C', 15000, 'drink', 'tea,kumquat,orange'),

-- Quán Ốc Cồ --
(@IdOcCo, N'Ốc Hương Sốt Trứng Muối', N'Ốc hương tươi giòn quyện sốt trứng muối béo ngậy đặc trưng', 84000, 'seafood', 'snails,salted egg,butter'),
(@IdOcCo, N'Ốc Hương Rang Muối Tuyết', N'Ốc hương rang muối tuyết mặn ngọt, cay nhẹ hài hòa', 79000, 'seafood', 'snails,salt,chili'),
(@IdOcCo, N'Ốc Mỡ Sốt Phô Mai', N'Ốc mỡ xào sốt phô mai tan chảy, béo ngậy khó cưỡng', 84000, 'seafood', 'snails,cheese,butter'),
(@IdOcCo, N'Ốc Mỡ Xào Bơ Bắp', N'Ốc mỡ xào bơ thơm lừng kết hợp bắp hạt ngọt thanh', 84000, 'seafood', 'snails,butter,corn'),
(@IdOcCo, N'Sò Huyết Lacoste (La cốt)', N'Sò huyết tái kiểu La-cốt giữ trọn vị ngọt tự nhiên và độ tươi', 88000, 'seafood', 'blood cockle,chili'),
(@IdOcCo, N'Sò Huyết Rang Me', N'Sò huyết xào sốt me chua ngọt đậm đà, chuẩn vị quán nhậu', 88000, 'seafood', 'blood cockle,tamarind,chili'),
(@IdOcCo, N'Sò Huyết Xào Rau Muống', N'Sò huyết xào cùng rau muống giòn ngon và tỏi phi', 88000, 'seafood', 'blood cockle,morning glory,garlic'),
(@IdOcCo, N'Ốc Tỏi Nướng Tiêu Xanh', N'Ốc tỏi con lớn nướng tiêu xanh cay nồng kích thích vị giác', 45000, 'seafood', 'snails,pepper,garlic'),
(@IdOcCo, N'Ốc Tỏi Nướng Mỡ Hành', N'Ốc tỏi nướng mỡ hành thơm béo, ăn kèm đậu phộng rang', 45000, 'seafood', 'snails,onion,peanut'),
(@IdOcCo, N'Ốc Móng Tay Cồ Xào Rau Muống', N'Ốc móng tay loại lớn xào rau muống tỏi giòn rụm', 49000, 'seafood', 'snails,morning glory,garlic'),
(@IdOcCo, N'Ốc Bươu Nướng Tiêu Xanh', N'Ốc bươu nướng tiêu xanh thơm nồng, đậm đà vị quê', 49000, 'seafood', 'snails,pepper,lemongrass'),
(@IdOcCo, N'Ốc Bươu Hấp Thái', N'Ốc bươu hấp nước dùng Thái chua cay, sả thơm lừng', 49000, 'seafood', 'snails,lemongrass,chili,lime leaf'),

-- Thế giới Steak --
(@IdTGSteak, N'Bò Wagyu', N'Thịt bò Wagyu cao cấp, vân mỡ đều, cực kỳ mềm và mọng nước', 255000, 'western', 'wagyu beef,salad,potato,bread'),
(@IdTGSteak, N'Bò Mỹ', N'Steak bò Mỹ nướng thơm lừng, lựa chọn yêu thích nhất của khách hàng', 195000, 'western', 'beef,salad,potato,bread'),
(@IdTGSteak, N'Bò Úc', N'Steak bò Úc nạc mềm, hương vị đậm đà truyền thống', 165000, 'western', 'beef,salad,potato,bread'),
(@IdTGSteak, N'Bò Cừu (Úc)', N'Thịt cừu Úc đặc sản, nướng kèm các loại xốt tự chọn', 115000, 'western', 'lamb,salad,potato,bread'),
(@IdTGSteak, N'Lườn ngỗng', N'Lườn ngỗng xông khói áp chảo, lớp da giòn rụm và thịt thơm ngậy', 175000, 'western', 'goose breast,salad,potato,bread'),
(@IdTGSteak, N'Bò Lắc Lắc', N'Bò cắt khối vuông lắc chảo cùng hành tây và ớt chuông', 95000, 'western', 'beef,onion,bell pepper,rice'),
(@IdTGSteak, N'Đà Điểu', N'Thịt đà điểu nướng, ít béo, giàu dinh dưỡng', 145000, 'western', 'ostrich meat,salad,potato,bread'),
(@IdTGSteak, N'Mỳ Ý Bò Bằm', N'Mỳ Ý sốt cà chua thịt bò bằm truyền thống', 85000, 'western', 'spaghetti,beef,tomato sauce'),
(@IdTGSteak, N'Mỳ Ý Cá Hồi Sốt Kem', N'Sự kết hợp giữa cá hồi tươi và sốt kem béo ngậy', 105000, 'western', 'spaghetti,salmon,cream sauce'),
(@IdTGSteak, N'Mỳ Ý Hải Sản Sốt Kem Trứng Muối', N'Hải sản tươi quyện cùng sốt kem trứng muối đặc biệt của quán', 125000, 'western', 'spaghetti,seafood,salted egg,cream'),

-- Quán Xôi 56 --
(@IdXoi56, N'Xôi gà xé', N'Xôi dẻo thơm ăn kèm thịt gà xé sợi đậm đà', 30000, 'vietnamese', 'sticky rice,chicken'),
(@IdXoi56, N'Xôi da gà', N'Xôi ăn kèm da gà chiên giòn rụm', 30000, 'vietnamese', 'sticky rice,chicken skin'),
(@IdXoi56, N'Xôi mặn', N'Xôi mặn thập cẩm truyền thống với lạp xưởng, chà bông', 30000, 'vietnamese', 'sticky rice,pork,sausage,pork floss'),
(@IdXoi56, N'Xôi phá lấu', N'Xôi ăn kèm phá lấu khìa nước dừa đậm đà', 30000, 'vietnamese', 'sticky rice,pork offal'),
(@IdXoi56, N'Xôi xá xíu', N'Xôi thịt xá xíu mềm mại, sốt đặc trưng', 30000, 'vietnamese', 'sticky rice,char siu pork'),
(@IdXoi56, N'Xôi trứng gà non', N'Xôi ăn kèm trứng gà non béo ngậy, bùi bùi', 50000, 'vietnamese', 'sticky rice,young chicken egg'),
(@IdXoi56, N'Xôi thập cẩm', N'Xôi đầy đủ topping gà xé, da gà, lạp xưởng, trứng cút', 40000, 'vietnamese', 'sticky rice,chicken,pork,egg'),
(@IdXoi56, N'Xôi đùi gà tỏi', N'Xôi ăn kèm đùi gà tỏi chiên vàng', 40000, 'vietnamese', 'sticky rice,chicken drumstick'),
(@IdXoi56, N'Xôi đặc biệt + Đùi gà', N'Phần xôi siêu đầy đặn kết hợp đùi gà lớn', 85000, 'vietnamese', 'sticky rice,chicken,egg,pork'),
(@IdXoi56, N'Bánh mì gà xé', N'Bánh mì giòn kẹp gà xé và bơ sáp', 20000, 'street_food', 'bread,chicken,butter'),
(@IdXoi56, N'Bánh mì phá lấu', N'Bánh mì kẹp phá lấu đậm vị', 20000, 'street_food', 'bread,pork offal'),
(@IdXoi56, N'Bánh mì heo chiên', N'Bánh mì thịt heo chiên giòn tan', 25000, 'street_food', 'bread,pork'),
(@IdXoi56, N'Bánh mì xíu mại', N'Bánh mì kèm viên xíu mại sốt cà chua', 20000, 'street_food', 'bread,meatball,tomato sauce'),

-- Quán cơm LAM --
(@IdComLAM, N'Cơm Niêu Nấu', N'Cơm trắng được nấu trong niêu đất, giữ trọn độ dẻo và thơm', 30000, 'vietnamese', 'rice'),
(@IdComLAM, N'Cá Kho Tộ', N'Cá kho tộ đậm đà, chuẩn vị cơm mẹ nấu', 35000, 'vietnamese', 'fish,chili,pork fat'),
(@IdComLAM, N'Thịt Kho Trứng', N'Thịt heo kho cùng trứng vịt, nước dùng đậm đà đưa cơm', 30000, 'vietnamese', 'pork,egg'),
(@IdComLAM, N'Tôm Rim', N'Tôm tươi rim mặn ngọt, món ăn dân dã đặc trưng', 35000, 'vietnamese', 'shrimp'),
(@IdComLAM, N'Đùi Gà Chiên', N'Đùi gà chiên vàng giòn, tẩm ướp gia vị đậm đà', 30000, 'vietnamese', 'chicken'),
(@IdComLAM, N'Xíu Mại', N'Viên xíu mại sốt cà chua mềm mại, bùi béo', 25000, 'vietnamese', 'pork,tomato sauce'),
(@IdComLAM, N'Món Xào (Đồng giá)', N'Các loại rau củ xào tươi ngon theo mùa', 20000, 'vietnamese', 'vegetable'),
(@IdComLAM, N'Đậu Hũ Kho/Chiên', N'Đậu hũ chiên hoặc kho tương thanh đạm', 20000, 'vietnamese', 'tofu'),

-- Gà ta Quê Nhà --
(@IdGaTaQN, N'Lẩu Gà Hầm Sả (Nguyên con)', N'Thịt gà ta tươi hầm cùng sả thơm nồng, nước dùng thanh ngọt', 325000, 'hotpot', 'chicken,lemongrass,vegetable,noodle'),
(@IdGaTaQN, N'Lẩu Gà Lá Giang (Nguyên con)', N'Vị chua đặc trưng của lá giang kết hợp thịt gà ta dai ngọt', 325000, 'hotpot', 'chicken,giang leaf,chili,noodle'),
(@IdGaTaQN, N'Lẩu Gà Campuchia (Nguyên con)', N'Món lẩu gà nấu theo phong cách Campuchia lạ miệng', 325000, 'hotpot', 'chicken,kmer spices,vegetable'),
(@IdGaTaQN, N'Lẩu Gà Nấu Nấm (Nguyên con)', N'Lẩu gà kết hợp cùng nhiều loại nấm tươi bổ dưỡng', 329000, 'hotpot', 'chicken,mushroom,vegetable'),
(@IdGaTaQN, N'Lẩu Gà Riêu Cua (Nguyên con)', N'Sự kết hợp độc đáo giữa gà ta và riêu cua đồng béo ngậy', 329000, 'hotpot', 'chicken,crab,tofu,vegetable'),
(@IdGaTaQN, N'Lẩu Gà Tiềm Ớt Hiểm (Nguyên con)', N'Gà ta tiềm cùng ớt hiểm cay nồng và các loại thảo mộc', 329000, 'hotpot', 'chicken,chili,herb,vegetable'),
(@IdGaTaQN, N'Lẩu Gà Hấp Hèm (Nguyên con)', N'Gà hấp hèm chua thanh, món ăn đặc sản dân dã', 329000, 'hotpot', 'chicken,fermented rice,vegetable'),
(@IdGaTaQN, N'Gà Nướng Mật Ong', N'Gà nướng lớp vỏ vàng óng, thấm đẫm vị mật hoa rừng ngọt dịu', 325000, 'chicken', 'chicken,honey'),
(@IdGaTaQN, N'Gà Nướng Lá Chanh', N'Gà nướng thơm mùi lá chanh đặc trưng của ẩm thực Việt', 325000, 'chicken', 'chicken,lime leaf'),
(@IdGaTaQN, N'Gà Nướng Ngũ Vị', N'Gà nướng thấm đều 5 loại gia vị thảo mộc đậm đà', 325000, 'chicken', 'chicken,five spice'),
(@IdGaTaQN, N'Gà Nướng Muối Ớt', N'Gà nướng vị cay nồng của ớt kết hợp muối biển đậm đà', 325000, 'chicken', 'chicken,chili,salt'),
(@IdGaTaQN, N'Gà Ngồi Lu', N'Gà được nướng trong lu gốm, giữ trọn độ ngọt và mùi thơm khói', 325000, 'chicken', 'chicken,charcoal'),

-- Bánh mì chảo --
(@IdBanhMiChao, N'Chảo Bò 1', N'Bánh mì, rau xà lách trộn, bít tết bò, 01 trứng ốp la, xúc xích', 65000, 'vietnamese', 'beef,egg,sausage,bread,salad'),
(@IdBanhMiChao, N'Chảo Bò 2', N'Bánh mì, rau xà lách trộn, bít tết bò, pate, trứng ốp la, chả, xúc xích, thịt xông khói', 75000, 'vietnamese', 'beef,egg,sausage,pate,bacon,bread,salad'),
(@IdBanhMiChao, N'Chảo Bò 3 (Đặc biệt)', N'Bánh mì, rau xà lách trộn, bít tết bò, pate, trứng, chả, xúc xích, thịt xông khói, phô mai', 89000, 'vietnamese', 'beef,egg,sausage,pate,bacon,cheese,bread,salad'),
(@IdBanhMiChao, N'Chảo Bò 4 (Set 2 người)', N'02 Bánh mì, rau xà lách trộn, phần bò lớn kèm đầy đủ topping đặc biệt', 165000, 'vietnamese', 'beef,egg,sausage,pate,bacon,cheese,bread,salad'),
(@IdBanhMiChao, N'Thịt nướng xôi truyền thống', N'Thịt nướng, xôi, bánh mì chiên, rau xà lách trộn dầu giấm', 45000, 'vietnamese', 'pork,sticky rice,bread,salad'),
(@IdBanhMiChao, N'Chảo thịt nướng 1', N'Bánh mì, thịt nướng, pate, 01 trứng ốp la, xúc xích, rau xà lách trộn dầu giấm', 65000, 'vietnamese', 'pork,egg,sausage,pate,bread,salad'),
(@IdBanhMiChao, N'Chảo thịt nướng 2 (7 món)', N'Bánh mì, thịt nướng, pate, trứng, jambon, chả, xúc xích, thịt xông khói', 75000, 'vietnamese', 'pork,egg,sausage,pate,jambon,bacon,bread'),
(@IdBanhMiChao, N'Chảo thịt nướng 3', N'Bánh mì, thịt nướng, pate, trứng, jambon, chả, xúc xích phô mai, thịt xông khói', 89000, 'vietnamese', 'pork,egg,sausage,pate,jambon,bacon,cheese,bread'),
(@IdBanhMiChao, N'Chảo thịt nướng 4 (Set 2 người)', N'02 Bánh mì, thịt nướng phần lớn kèm đầy đủ 7 món topping', 145000, 'vietnamese', 'pork,egg,sausage,pate,jambon,bacon,bread'),

-- Nhà hàng Những Người Bạn --
(@IdNhaHangNNB, N'Mề gà chiên nước mắm', N'Mề gà giòn sần sật chiên cùng nước mắm thượng hạng đậm đà', 115000, 'vietnamese', 'chicken gizzard,fish sauce,garlic'),
(@IdNhaHangNNB, N'Sụn gà rang muối ớt', N'Sụn gà ta giòn rụm rang cùng muối biển và ớt cay nồng', 135000, 'vietnamese', 'chicken cartilage,salt,chili'),
(@IdNhaHangNNB, N'Sụn gà xào muối cay', N'Sụn gà xào cùng muối cay đặc trưng, kích thích vị giác', 135000, 'vietnamese', 'chicken cartilage,salt,chili,garlic'),
(@IdNhaHangNNB, N'Sụn gà chiên bơ tỏi', N'Sụn gà chiên vàng óng, thơm lừng vị bơ và tỏi phi', 145000, 'vietnamese', 'chicken cartilage,butter,garlic'),
(@IdNhaHangNNB, N'Dồi sụn', N'Dồi sụn nướng thơm lừng, nhân thịt và sụn giòn sần sật', 175000, 'vietnamese', 'pork,cartilage,herb'),
(@IdNhaHangNNB, N'Bắp bò xào măng tây', N'Thịt bắp bò mềm ngọt xào cùng măng tây xanh giòn tươi', 245000, 'vietnamese', 'beef,asparagus,garlic'),
(@IdNhaHangNNB, N'Lưỡi vịt muối tiêu', N'Lưỡi vịt chiên giòn, xóc muối tiêu đậm đà chuẩn vị lai rai', 195000, 'vietnamese', 'duck tongue,salt,pepper'),
(@IdNhaHangNNB, N'Chả cá Lã Vọng (mới)', N'Cá lăng nướng vàng, ăn kèm bún, mắm tôm và rau thì là', 225000, 'vietnamese', 'fish,turmeric,dill,shrimp paste,noodle'),
(@IdNhaHangNNB, N'Khổ qua mắm ruốc', N'Khổ qua tươi thái lát mỏng chấm cùng mắm ruốc đặc sản', 115000, 'vietnamese', 'bitter melon,shrimp paste,pork fat'),
(@IdNhaHangNNB, N'Gà tre rim dừa', N'Gà tre thịt chắc, thơm ngọt được rim cùng nước cốt dừa béo ngậy', 489000, 'vietnamese', 'chicken,coconut,garlic'),
(@IdNhaHangNNB, N'Tôm sống sốt dừa', N'Tôm tươi sống giữ trọn vị ngọt, kết hợp cùng sốt dừa độc đáo', 279000, 'seafood', 'shrimp,coconut,lime,chili'),

-- Mì gà da giòn --
(@IdMiGa, N'Bò Né 1', N'Thịt bò bít tết né chảo, trứng ốp la, pate béo ngậy kèm bánh mì', 35000, 'vietnamese', 'beef,egg,pate,bread'),
(@IdMiGa, N'Bò Né 2', N'Bò né đầy đủ với thịt bò, trứng, xúc xích và pate kèm bánh mì', 40000, 'vietnamese', 'beef,egg,sausage,pate,bread'),
(@IdMiGa, N'Bò Né 3 (Thập cẩm)', N'Phần bò né đặc biệt gồm: bò, trứng, xúc xích, pate, chả lụa và cá', 45000, 'vietnamese', 'beef,egg,sausage,pate,pork roll,fish,bread'),
(@IdMiGa, N'Bò Không', N'Thịt bò né truyền thống giữ trọn vị ngọt kèm bánh mì', 25000, 'vietnamese', 'beef,bread'),
(@IdMiGa, N'Mì Gà Da Giòn Đặc Biệt', N'Mì gà da giòn kèm topping: trứng, xúc xích, phô mai và chả', 35000, 'noodle', 'chicken,egg,sausage,cheese,pork roll,noodle'),
(@IdMiGa, N'Phở Tái Nam', N'Phở bò tái nam truyền thống, nước dùng thanh ngọt', 45000, 'noodle', 'beef,noodle'),
(@IdMiGa, N'Phở Tái Gầu', N'Phở bò với phần gầu giòn béo đặc trưng', 45000, 'noodle', 'beef,noodle'),
(@IdMiGa, N'Phở Tái Gân', N'Phở bò tái kèm gân bò dai giòn sần sật', 45000, 'noodle', 'beef,noodle'),
(@IdMiGa, N'Phở Tái Viên', N'Phở bò tái viên thơm ngon, chuẩn vị', 45000, 'noodle', 'beef,noodle'),
(@IdMiGa, N'Phở Đặc Biệt (Bò + Lòng)', N'Tô phở đặc biệt kết hợp thịt bò tươi và lòng bò bổ dưỡng', 55000, 'noodle', 'beef,offal,noodle'),

-- Bánh canh cá lóc --
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Lóc Chiên (Thường)', N'Bánh canh ăn kèm thịt cá lóc chiên giòn, nước dùng đậm đà', 38000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Lóc Chiên (Đặc biệt)', N'Phần đặc biệt với lượng cá lóc chiên nhiều hơn', 45000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Lóc Hấp (Thường)', N'Bánh canh với thịt cá lóc hấp thanh ngọt, giữ trọn vị tự nhiên', 38000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Lóc Hấp (Đặc biệt)', N'Phần đặc biệt với cá lóc hấp đầy đặn', 45000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Đầu Cá Lóc (Thường)', N'Bánh canh ăn kèm đầu cá lóc béo ngậy, ngọt thịt', 50000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Đầu Cá Lóc (Đặc biệt)', N'Phần đặc biệt với đầu cá lớn và nhiều topping hơn', 55000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Ruột Cá Lóc (Thường)', N'Bánh canh với ruột cá lóc giòn sần sật, vị béo bùi đặc trưng', 50000, 'vietnamese', 'snakehead fish offal,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Ruột Cá Lóc (Đặc biệt)', N'Phần ruột cá lóc đặc biệt dành cho người sành ăn', 55000, 'vietnamese', 'snakehead fish offal,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Ngừ (Thường)', N'Bánh canh cá ngừ tươi ngon, hương vị đậm đà miền Trung', 38000, 'vietnamese', 'tuna,noodle'),
(@IdBanhCanhCaLoc_1, N'Bánh Canh Cá Ngừ (Đặc biệt)', N'Phần đặc biệt với nhiều lát cá ngừ tươi và nước dùng đặc sắc', 45000, 'vietnamese', 'tuna,noodle'),

-- Banh mi Co Bich --
(@IdBanhMiCoBich, N'Bánh tráng mắm ruốc', N'Bánh tráng giòn tan kết hợp vị mắm ruốc đậm đà đặc trưng', 25000, 'snack', 'rice paper,shrimp paste'),
(@IdBanhMiCoBich, N'Bánh tráng khô bò', N'Bánh tráng trộn hoặc nướng kèm khô bò cay ngọt hấp dẫn', 30000, 'snack', 'rice paper,dried beef,chili'),
(@IdBanhMiCoBich, N'Bánh tráng chuối', N'Bánh tráng ngọt vị chuối thơm dẻo, món ăn vặt dân dã', 20000, 'snack', 'rice paper,banana'),
(@IdBanhMiCoBich, N'Cơm cháy chà bông (250gr)', N'Cơm cháy chiên giòn phủ lớp chà bông mặn ngọt (gói 250gr)', 55000, 'snack', 'rice,pork floss'),
(@IdBanhMiCoBich, N'Cơm cháy chà bông (500gr)', N'Cơm cháy chiên giòn phủ lớp chà bông mặn ngọt (gói 500gr)', 110000, 'snack', 'rice,pork floss'),
(@IdBanhMiCoBich, N'Khô gà lá chanh', N'Khô gà xé cay nồng hương lá chanh, món nhắm đặc sản', 250000, 'snack', 'chicken,lime leaf,chili'),

-- Quán ăn Núi Ngự --
(@IdQuanNuiNgu, N'Lẩu gà chanh dây', N'Hương vị lẩu gà mới lạ với nước dùng chanh dây chua ngọt, thơm mát', 189000, 'hotpot', 'chicken,passion fruit'),
(@IdQuanNuiNgu, N'Lẩu gà tre', N'Thịt gà tre dai ngon, chắc thịt trong nước lẩu đậm đà chuẩn vị', 250000, 'hotpot', 'chicken'),
(@IdQuanNuiNgu, N'Lẩu gà lá giang', N'Vị chua thanh đặc trưng của lá giang quyện cùng thịt gà ta ngọt dai', 189000, 'hotpot', 'chicken,giang leaf'),
(@IdQuanNuiNgu, N'Lẩu gà tiềm ớt hiểm', N'Gà tiềm ớt hiểm cay nồng kích thích, thơm mùi thảo mộc bồi bổ', 189000, 'hotpot', 'chicken,chili,herb'),
(@IdQuanNuiNgu, N'Lẩu gà tiềm ớt hiểm (Nguyên con)', N'Phần gà nguyên con tiềm ớt hiểm bổ dưỡng, phù hợp cho nhóm đông', 319000, 'hotpot', 'chicken,chili,herb'),
(@IdQuanNuiNgu, N'Đầu cá hồi măng chua', N'Đầu cá hồi béo ngậy nấu cùng măng chua thanh nhiệt, giải độc', 119000, 'hotpot', 'salmon head,sour bamboo'),
(@IdQuanNuiNgu, N'Cá kèo lá giang', N'Cá kèo tươi sống nấu lá giang chua cay chuẩn vị miền Tây sông nước', 189000, 'hotpot', 'climbing perch,giang leaf'),
(@IdQuanNuiNgu, N'Cá cá lóc chua cay', N'Cá lóc đồng tươi ngon trong nước dùng chua cay đậm đà', 159000, 'hotpot', 'snakehead fish,chili'),
(@IdQuanNuiNgu, N'Cá diêu hồng nấu Thái', N'Cá diêu hồng thịt trắng ngọt nấu kiểu lẩu Thái chua cay', 159000, 'hotpot', 'tilapia,thai spices,chili'),
(@IdQuanNuiNgu, N'Lẩu nấm cua đồng hải sản', N'Sự kết hợp giữa vị ngọt cua đồng, các loại nấm và hải sản tươi', 219000, 'hotpot', 'field crab,mushroom,seafood'),
(@IdQuanNuiNgu, N'Lẩu nấm thịt gà', N'Lẩu nấm thanh đạm kết hợp cùng thịt gà ta ngọt dai', 229000, 'hotpot', 'mushroom,chicken'),
(@IdQuanNuiNgu, N'Lẩu nấm hải sản', N'Nước lẩu nấm thanh ngọt tự nhiên dùng kèm các loại hải sản phong phú', 229000, 'hotpot', 'mushroom,seafood'),
(@IdQuanNuiNgu, N'Lẩu riêu cua đồng hải sản', N'Lẩu riêu cua đồng béo ngậy, topping hải sản đa dạng đậm vị quê', 189000, 'hotpot', 'field crab,seafood'),

-- BBQ Garden --
(@IdBBQGarden, N'Ba chỉ bò Mỹ', N'Thịt ba chỉ bò Mỹ với lớp mỡ nạc xen kẽ, nướng thơm ngậy', 75000, 'bbq', 'beef'),
(@IdBBQGarden, N'Bò Mỹ cuộn nấm kim châm', N'Ba chỉ bò Mỹ cuộn nấm kim châm giòn ngọt', 75000, 'bbq', 'beef,mushroom'),
(@IdBBQGarden, N'Ba chỉ bò Mỹ cuộn phô mai', N'Ba chỉ bò Mỹ cuộn phô mai béo ngậy tan chảy', 99000, 'bbq', 'beef,cheese'),
(@IdBBQGarden, N'Lõi vai bò Mỹ', N'Phần thịt lõi vai bò Mỹ mềm mại, ít mỡ', 85000, 'bbq', 'beef'),
(@IdBBQGarden, N'Dẻ sườn bò Mỹ', N'Dẻ sườn bò Mỹ nướng đậm đà, giòn sần sật', 99000, 'bbq', 'beef'),
(@IdBBQGarden, N'Sườn bò Mỹ không xương', N'Thịt sườn bò Mỹ cao cấp đã rút xương, mềm mọng', 120000, 'bbq', 'beef'),
(@IdBBQGarden, N'Sườn cừu nướng sốt BBQ', N'Sườn cừu nướng cùng sốt BBQ đậm đà, hương vị đặc trưng', 79000, 'bbq', 'lamb,bbq sauce'),
(@IdBBQGarden, N'Đùi cừu nướng muối ớt', N'Thịt đùi cừu nướng muối ớt cay nồng kích thích', 89000, 'bbq', 'lamb,chili'),
(@IdBBQGarden, N'Thăn ngoại bò Úc (Nguyên tảng)', N'Thăn ngoại bò Úc nướng nguyên tảng giữ trọn độ ngọt của thịt', 109000, 'bbq', 'beef'),
(@IdBBQGarden, N'Rib-Eye Hokubee', N'Thịt bò Hokubee thượng hạng với vân mỡ hình cẩm thạch tan chảy', 225000, 'bbq', 'beef'),
(@IdBBQGarden, N'Tim bò nướng ngũ vị', N'Tim bò tươi nướng ngũ vị thơm nồng, giòn dai', 55000, 'bbq', 'beef,five spice'),
(@IdBBQGarden, N'Ba chỉ heo nướng sốt Bulgogi', N'Thịt ba chỉ heo thấm đẫm sốt Bulgogi Hàn Quốc ngọt thanh', 65000, 'bbq', 'pork,bulgogi sauce'),
(@IdBBQGarden, N'Má heo đen Tây Ban Nha sốt BBQ', N'Thịt má heo Iberico cực kỳ mềm và thơm ngậy', 85000, 'bbq', 'pork,bbq sauce'),
(@IdBBQGarden, N'Bạch tuộc nướng sa tế', N'Bạch tuộc tươi giòn cay nồng vị sa tế', 69000, 'seafood', 'octopus,chili'),
(@IdBBQGarden, N'Tôm càng nướng mọi', N'Tôm càng xanh tươi sống nướng mọi giữ trọn vị ngọt tự nhiên', 109000, 'seafood', 'shrimp'),
(@IdBBQGarden, N'Lẩu Thái Tomyum', N'Nước lẩu Thái chua cay đậm đà, dùng kèm hải sản và thịt bò', 259000, 'hotpot', 'shrimp,beef,chili,thai spices'),
(@IdBBQGarden, N'Lẩu Kim chi ba chỉ bò', N'Lẩu Kim chi chua cay chuẩn vị Hàn cùng ba chỉ bò Mỹ', 259000, 'hotpot', 'beef,kimchi,chili'),
(@IdBBQGarden, N'Lẩu tôm càng Nam Bộ (Nhỏ)', N'Lẩu tôm càng với nước dùng thanh ngọt kiểu miền Tây', 139000, 'hotpot', 'shrimp,vegetable'),

-- Phá Lấu Bò Cây Trâm --
(@IdPhaLauCT, N'Phá lấu nhỏ', N'Phần phá lấu bò truyền thống cỡ nhỏ, nước dùng béo ngậy vị nước cốt dừa', 27000, 'snack', 'beef offal,coconut milk'),
(@IdPhaLauCT, N'Phá lấu lớn', N'Phần phá lấu bò đầy đặn, ăn kèm nước chấm tắc chua cay', 33000, 'snack', 'beef offal,coconut milk'),
(@IdPhaLauCT, N'Mì gói phá lấu', N'Mì gói nấu cùng phá lấu bò, món ăn no tiện lợi', 33000, 'noodle', 'beef offal,instant noodle,coconut milk'),
(@IdPhaLauCT, N'Gỏi khô bò', N'Đu đủ bào giòn rụm kết hợp cùng khô bò đen, đậu phộng và nước mắm chua ngọt', 25000, 'snack', 'dried beef,papaya,peanut'),
(@IdPhaLauCT, N'Bánh mì', N'Bánh mì đặc ruột ăn kèm phá lấu', 3000, 'extra', 'bread'),
(@IdPhaLauCT, N'Rong biển', N'Nước rong biển thanh mát, giải nhiệt', 10000, 'drink', 'seaweed'),
(@IdPhaLauCT, N'Sâm dứa', N'Nước sâm dứa thơm lừng, vị ngọt dịu', 10000, 'drink', 'pandan'),
(@IdPhaLauCT, N'Nha đam', N'Nước nha đam tươi giòn, ít đường', 10000, 'drink', 'aloe vera'),
(@IdPhaLauCT, N'Coca - Cola', N'Nước giải khát Coca-Cola đóng chai/lon', 12000, 'drink', 'soda'),
(@IdPhaLauCT, N'Sting', N'Nước tăng lực Sting dâu đỏ', 12000, 'drink', 'energy drink'),
(@IdPhaLauCT, N'Trà đá', N'Ly trà đá giải nhiệt truyền thống', 2000, 'drink', 'tea'),

-- The Chill --
(@IdTheChillBF, N'Buffet Nướng Tự Chọn', N'Đại tiệc buffet hơn 40 món nướng: Bò tảng, hải sản, thịt heo, lòng bò, lườn ngỗng và món ăn sẵn', 139000, 'buffet', 'beef,pork,chicken,seafood,vegetable'),
(@IdTheChillBF, N'Buffet Nước', N'Gói buffet nước ngọt và nước lọc thoải mái', 25000, 'buffet', 'soda,water'),

-- Nhi Nhi Quán --
(@IdNNQuan, N'Chén trứng nướng', N'Chén trứng nướng Phan Rang truyền thống thơm mùi hành lá', 7000, 'snack', 'egg,green onion'),
(@IdNNQuan, N'Chén phô mai', N'Trứng nướng chén kết hợp phô mai béo ngậy', 9000, 'snack', 'egg,cheese'),
(@IdNNQuan, N'Chén tóp mỡ', N'Trứng nướng chén thêm tóp mỡ giòn rụm', 12000, 'snack', 'egg,pork fat'),
(@IdNNQuan, N'Chén sốt thịt băm', N'Trứng nướng chén rưới sốt thịt băm đậm đà', 12000, 'snack', 'egg,pork'),
(@IdNNQuan, N'Chén phô mai kéo sợi', N'Phiên bản trứng nướng chén với phô mai mozzarella kéo sợi cực cuốn', 15000, 'snack', 'egg,mozzarella'),
(@IdNNQuan, N'Chén sốt trứng muối', N'Trứng nướng chén quyện cùng sốt trứng muối vàng óng, bùi béo', 15000, 'snack', 'egg,salted egg'),
(@IdNNQuan, N'Chén đặc biệt', N'Trứng nướng chén đầy đủ topping cao cấp nhất của quán', 18000, 'snack', 'egg,cheese,pork,salted egg'),
(@IdNNQuan, N'Bánh tráng nướng không', N'Bánh tráng nướng mỡ hành giòn tan', 5000, 'snack', 'rice paper,green onion'),
(@IdNNQuan, N'Bánh tráng trứng', N'Bánh tráng nướng trứng gà/cút truyền thống', 7000, 'snack', 'rice paper,egg'),
(@IdNNQuan, N'Bánh tráng trứng muối', N'Bánh tráng nướng kết hợp vị mặn bùi của trứng muối', 12000, 'snack', 'rice paper,egg,salted egg'),
(@IdNNQuan, N'Bánh tráng trứng tóp mỡ', N'Bánh tráng nướng trứng và tóp mỡ giòn sần sật', 15000, 'snack', 'rice paper,egg,pork fat'),
(@IdNNQuan, N'Bánh tráng đặc biệt', N'Siêu phẩm bánh tráng nướng với tất cả topping đặc sản Phan Rang', 20000, 'snack', 'rice paper,egg,cheese,dried beef,sausage'),
(@IdNNQuan, N'Nem chua nướng', N'Nem chua Phan Rang nướng thơm nồng, ăn kèm nước chấm đặc trưng', 28000, 'snack', 'pork,nem chua'),
(@IdNNQuan, N'Chả cuốn', N'Chả cuốn Phan Rang nhân cá và trứng đậm vị', 16000, 'snack', 'fish cake,egg,rice paper'),
(@IdNNQuan, N'Bún mắm nêm', N'Bún mắm nêm chuẩn vị Ninh Thuận với chả cá đặc sản', 28000, 'vietnamese', 'noodle,shrimp paste,fish cake'),
(@IdNNQuan, N'Chả cá Nhi Nhi', N'Phần chả cá đặc sản do quán tự làm, dai ngon tự nhiên', 25000, 'snack', 'fish cake'),
(@IdNNQuan, N'Bánh hỏi hành', N'Bánh hỏi lá dứa thoảng hương, ăn cùng mỡ hành béo thơm', 12000, 'vietnamese', 'rice noodle,green onion'),
(@IdNNQuan, N'Bắp xào bơ ruốc', N'Bắp hạt xào bơ thơm lừng cùng ruốc mặn ngọt hài hòa', 25000, 'snack', 'corn,butter,dried shrimp'),

-- Bánh Canh Bà Tám Chợ Cầu --
(@IdBanhCanhBaTam, N'Bánh Canh Thịt', N'Bánh canh bột gạo/lọc ăn kèm thịt heo nạc thái lát', 25000, 'vietnamese', 'pork,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Mọc', N'Bánh canh ăn kèm mọc (giò sống viên) thơm dai', 25000, 'vietnamese', 'pork paste,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Chả Cá', N'Bánh canh kết hợp chả cá chiên đặc sản', 30000, 'vietnamese', 'fish cake,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Thịt, Mọc', N'Sự kết hợp giữa thịt nạc và mọc viên trong tô bánh canh nóng hổi', 30000, 'vietnamese', 'pork,pork paste,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Thịt, Mọc, Chả', N'Tô bánh canh đầy đặn với thịt, mọc và chả lụa/chả quế', 35000, 'vietnamese', 'pork,pork paste,sausage,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Thịt, Mọc, Giò', N'Phần bánh canh bổ dưỡng với thịt, mọc và khoanh giò heo béo ngậy', 45000, 'vietnamese', 'pork,pork paste,pork leg,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Thập Cẩm (Thịt, Mọc, Chả, Giò)', N'Tô đặc biệt đầy đủ topping: thịt, mọc, chả và giò heo', 50000, 'vietnamese', 'pork,pork paste,sausage,pork leg,noodle'),
(@IdBanhCanhBaTam, N'Bánh Canh Thập Cẩm (Thịt, Mọc, Chả, Gà)', N'Lựa chọn đặc biệt kết hợp thịt heo, mọc, chả và thịt gà xé', 50000, 'vietnamese', 'pork,pork paste,sausage,chicken,noodle'),

-- Cơm chay Thiện Nhẫn --
(@IdComChayTN, N'Phở chay', N'Phở chay thanh đạm với nước dùng rau củ, đậu hũ và nấm', 15000, 'vegetarian', 'tofu,mushroom,noodle,vegetable'),
(@IdComChayTN, N'Bún chả cá chay', N'Bún ăn kèm chả cá làm từ đạm đậu nành, nước dùng chua thanh', 15000, 'vegetarian', 'soy protein,tofu,noodle,vegetable'),
(@IdComChayTN, N'Bún nem nướng chay', N'Bún nem nướng chay thơm nồng, ăn kèm rau sống và nước chấm', 20000, 'vegetarian', 'soy protein,noodle,vegetable,peanut'),
(@IdComChayTN, N'Bì cuốn chay (3 cuốn)', N'Bì cuốn chay từ khoai lang và bún tàu, ăn kèm nước mắm chay', 10000, 'vegetarian', 'sweet potato,tofu,rice paper,vegetable'),
(@IdComChayTN, N'Cà ri chay', N'Cà ri chay béo ngậy nước cốt dừa cùng khoai tây và đậu hũ', 15000, 'vegetarian', 'tofu,potato,carrot,coconut milk,bread'),
(@IdComChayTN, N'Bún xào chay (Buổi chiều)', N'Món bún xào chay đặc trưng chỉ phục vụ vào buổi chiều', 15000, 'vegetarian', 'tofu,mushroom,noodle,vegetable'),
(@IdComChayTN, N'Lẩu chay (Nhỏ)', N'Lẩu chay thập cẩm với các loại nấm, đậu hũ và rau xanh', 80000, 'hotpot', 'tofu,mushroom,vegetable,noodle'),

-- Bánh canh cá lóc --
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Lóc Chiên (Thường)', N'Bánh canh ăn kèm thịt cá lóc chiên giòn, nước dùng đậm đà', 38000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Lóc Chiên (Đặc biệt)', N'Phần đặc biệt với lượng cá lóc chiên nhiều hơn', 45000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Lóc Hấp (Thường)', N'Bánh canh với thịt cá lóc hấp thanh ngọt, giữ trọn vị tự nhiên', 38000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Lóc Hấp (Đặc biệt)', N'Phần đặc biệt với cá lóc hấp đầy đặn', 45000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Đầu Cá Lóc (Thường)', N'Bánh canh ăn kèm đầu cá lóc béo ngậy, ngọt thịt', 50000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Đầu Cá Lóc (Đặc biệt)', N'Phần đặc biệt với đầu cá lớn và nhiều topping hơn', 55000, 'vietnamese', 'snakehead fish,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Ruột Cá Lóc (Thường)', N'Bánh canh với ruột cá lóc giòn sần sật, vị béo bùi đặc trưng', 50000, 'vietnamese', 'snakehead fish offal,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Ruột Cá Lóc (Đặc biệt)', N'Phần ruột cá lóc đặc biệt dành cho người sành ăn', 55000, 'vietnamese', 'snakehead fish offal,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Ngừ (Thường)', N'Bánh canh cá ngừ tươi ngon, hương vị đậm đà miền Trung', 38000, 'vietnamese', 'tuna,noodle'),
(@IdBanhCanhCaLoc_2, N'Bánh Canh Cá Ngừ (Đặc biệt)', N'Phần đặc biệt với nhiều lát cá ngừ tươi và nước dùng đặc sắc', 45000, 'vietnamese', 'tuna,noodle'),

-- KDL Bến Xưa --
(@IdKDLBenXua, N'Giò Heo Nướng', N'Giò heo nướng giòn rụm, lớp da thơm lừng đậm đà đặc sản Bến Xưa', 178000, 'vietnamese', 'pork trotter'),
(@IdKDLBenXua, N'Heo Tộc Nướng Giả Chồn', N'Thịt heo tộc nướng theo phong cách giả chồn thơm nồng gia vị', 178000, 'vietnamese', 'high land pork,galangal,lemongrass'),
(@IdKDLBenXua, N'Gà Nướng Mật Ong Nguyên Con', N'Gà ta nguyên con nướng mật ong vàng óng, thịt ngọt dai', 288000, 'vietnamese', 'chicken,honey'),
(@IdKDLBenXua, N'Xôi Chiên Ăn Kèm', N'Xôi chiên vàng giòn, món ăn kèm tuyệt vời cho các món nướng đặc sản', 28000, 'vietnamese', 'sticky rice'),
(@IdKDLBenXua, N'Lẩu Cua Đồng (Cho 4 người)', N'Lẩu cua đồng đậm đà béo ngậy, khẩu phần lớn dành cho nhóm 4 người', 278000, 'hotpot', 'field crab,vegetable,noodle'),
(@IdKDLBenXua, N'Lẩu Nấm Bến Xưa', N'Lẩu nấm thập cẩm bổ dưỡng, thanh đạm theo phong cách riêng của Bến Xưa', 378000, 'hotpot', 'mixed mushroom,vegetable,noodle'),

-- Bún đậu mắm tôm Mẹt Quán --
(@IdBunDauMetQuan, N'Bún đậu mắm tôm', N'Phần cơ bản gồm bún lá, đậu hũ chiên giòn và mắm tôm pha theo công thức riêng', 25000, 'vietnamese', 'vermicelli,tofu,shrimp paste,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Thịt', N'Bún đậu kèm thịt heo luộc thái lát mềm thơm', 45000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Lưỡi', N'Bún đậu kèm lưỡi heo luộc giòn sần sật', 45000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork tongue,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Chả cốm', N'Bún đậu kết hợp chả cốm chiên vàng, thơm mùi cốm mới', 45000, 'vietnamese', 'vermicelli,tofu,shrimp paste,green rice cake,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Thịt, Lưỡi', N'Sự kết hợp giữa thịt heo luộc và lưỡi heo luộc trong mẹt bún đậu', 55000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork,pork tongue,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Thịt, Chả cốm', N'Mẹt bún đậu đầy đặn với thịt heo luộc và chả cốm chiên', 55000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork,green rice cake,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu - Lưỡi, Chả cốm', N'Mẹt bún đậu kết hợp lưỡi heo và chả cốm', 55000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork tongue,green rice cake,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu đặc biệt 1 người', N'Phần mẹt bún đậu đặc biệt đầy đủ thịt, lưỡi và chả cốm dành cho 1 người', 65000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork,pork tongue,green rice cake,cucumber,herbs'),
(@IdBunDauMetQuan, N'Bún đậu đặc biệt 2 người', N'Mẹt bún đậu khổng lồ đầy đủ topping dành cho 2 người ăn no nê', 120000, 'vietnamese', 'vermicelli,tofu,shrimp paste,pork,pork tongue,green rice cake,cucumber,herbs'),

-- Mì Quảng Hương Quê --
(@IdMiQuangHQ, N'Mì Quảng Thập Cẩm', N'Mì Quảng đầy đủ topping tôm, thịt, trứng cút và đậu phộng', 35000, 'noodle', 'rice noodle,shrimp,pork,quail egg,peanut,vegetable'),
(@IdMiQuangHQ, N'Mì Quảng Gà Ta', N'Mì Quảng với thịt gà ta dai ngọt, thơm mùi củ nén', 35000, 'noodle', 'rice noodle,chicken,peanut,vegetable'),
(@IdMiQuangHQ, N'Mì Quảng Tôm Thịt', N'Mì Quảng tôm thịt truyền thống đậm đà vị miền Trung', 35000, 'noodle', 'rice noodle,shrimp,pork,peanut,vegetable'),
(@IdMiQuangHQ, N'Mì Quảng Sườn Non', N'Mì Quảng sườn non hầm mềm, thấm vị', 35000, 'noodle', 'rice noodle,pork ribs,peanut,vegetable'),
(@IdMiQuangHQ, N'Bún mắm nêm', N'Bún mắm nêm đậm đà với thịt heo luộc, chả và rau sống', 35000, 'vietnamese', 'vermicelli,pork,fermented fish sauce,vegetable'),
(@IdMiQuangHQ, N'Bánh tráng cuốn thịt heo', N'Thịt heo luộc cuốn bánh tráng đại lộc, ăn kèm mắm nêm đặc sản', 60000, 'vietnamese', 'pork,rice paper,fermented fish sauce,vegetable'),
(@IdMiQuangHQ, N'Hến xào', N'Hến xào sả ớt xúc bánh tráng giòn, món lai rai đặc trưng', 40000, 'vietnamese', 'baby clams,lemongrass,chili,rice cracker'),
(@IdMiQuangHQ, N'Mít trộn', N'Mít non trộn tôm thịt, đậu phộng và rau thơm', 40000, 'vietnamese', 'jackfruit,shrimp,pork,peanut'),
(@IdMiQuangHQ, N'Sữa đậu nành', N'Sữa đậu nành nguyên chất, thanh mát', 12000, 'drink', 'soybean'),
(@IdMiQuangHQ, N'Sữa đậu xanh', N'Sữa đậu xanh bùi béo, giàu dinh dưỡng', 12000, 'drink', 'mung bean'),
(@IdMiQuangHQ, N'Sữa hạt sen', N'Sữa hạt sen thơm dịu, giúp ngủ ngon', 12000, 'drink', 'lotus seed'),
(@IdMiQuangHQ, N'Sữa bắp', N'Sữa bắp ngọt thanh, thơm hương bắp mới', 12000, 'drink', 'corn'),
(@IdMiQuangHQ, N'Nha đam mủ trôm / hạt sen', N'Thức uống nha đam giải nhiệt, làm đẹp da', 15000, 'drink', 'aloe vera,lotus seed'),
(@IdMiQuangHQ, N'Sâm rong biển / hoa cúc', N'Nước sâm thảo mộc thanh lọc cơ thể', 12000, 'drink', 'herbal tea'),

-- Lẩu bò Phú Gia --
(@IdLauBoPG, N'Lẩu bím hầm thuốc bắc', N'Món lẩu đặc sản bồi bổ với pím bò hầm cùng các vị thuốc bắc thơm nồng', 250000, 'hotpot', 'beef penis,chinese medicine,herb'),
(@IdLauBoPG, N'Lẩu thập cẩm (Hầm thuốc bắc)', N'Lẩu thập cẩm đầy đủ topping hầm thuốc bắc bổ dưỡng', 220000, 'hotpot', 'beef offal,chinese medicine,herb'),
(@IdLauBoPG, N'Cháo đuôi tủy bò bằm', N'Cháo đuôi bò và tủy bổ dưỡng, nấu cùng thịt bò bằm đậm đà', 200000, 'porridge', 'beef tail,beef marrow,minced beef'),
(@IdLauBoPG, N'Lẩu đuôi bò', N'Lẩu đuôi bò hầm mềm, nước dùng thanh ngọt tự nhiên', 250000, 'hotpot', 'beef tail,vegetable'),
(@IdLauBoPG, N'Lẩu nạc gân lưỡi', N'Sự kết hợp giữa thịt nạc, gân giòn và lưỡi bò mềm mại', 220000, 'hotpot', 'beef,beef tendon,beef tongue'),
(@IdLauBoPG, N'Lẩu thập cẩm', N'Lẩu đầy đủ các phần: gân, lưỡi, nạm và ba rọi bò', 200000, 'hotpot', 'beef tendon,beef tongue,beef brisket,beef belly'),
(@IdLauBoPG, N'Lẩu móng đeo', N'Món lẩu độc đáo với phần móng đeo bò dai giòn sần sật', 200000, 'hotpot', 'beef trotter'),
(@IdLauBoPG, N'Lẩu pím bò', N'Lẩu pím bò dai giòn, món ăn đặc trưng giúp tăng cường sức khỏe', 200000, 'hotpot', 'beef penis'),
(@IdLauBoPG, N'Lẩu gân bò', N'Lẩu chuyên phần gân bò hầm vừa tới, giữ độ giòn sần sật', 200000, 'hotpot', 'beef tendon'),
(@IdLauBoPG, N'Lẩu lưỡi bò', N'Lẩu chuyên phần lưỡi bò làm sạch, thịt mềm và ngọt', 200000, 'hotpot', 'beef tongue'),
(@IdLauBoPG, N'Lẩu nạc bò', N'Lẩu thịt nạc bò tươi, phù hợp cho người thích ăn thịt thuần túy', 200000, 'hotpot', 'beef'),

-- Nhà hàng Phú Đại --
(@IdNhaHangĐP, N'Salad Nga', N'Salad khoai tây, cà rốt, trứng và sốt mayonnaise kiểu Nga truyền thống', 135000, 'western', 'potato,carrot,egg,mayonnaise'),
(@IdNhaHangĐP, N'Salad dầu giấm trứng', N'Rau xà lách tươi trộn sốt dầu giấm chua ngọt và trứng luộc', 115000, 'vietnamese', 'salad,egg,vinegar'),
(@IdNhaHangĐP, N'Salad trộn thịt bò', N'Salad rau mầm và xà lách trộn cùng thịt bò áp chảo đậm vị', 175000, 'vietnamese', 'beef,salad,onion'),
(@IdNhaHangĐP, N'Gỏi xoài cá sặc', N'Xoài xanh bằm trộn cùng cá sặc khô chiên giòn, vị chua mặn hài hòa', 145000, 'vietnamese', 'mango,dried fish,herb'),
(@IdNhaHangĐP, N'Gỏi bò bóp thấu', N'Thịt bò tái chanh trộn cùng chuối chát, khế chua và rau thơm', 195000, 'vietnamese', 'beef,banana blossom,star fruit,herb'),
(@IdNhaHangĐP, N'Gỏi bắp bò rau mầm', N'Bắp bò mềm thái mỏng trộn cùng rau mầm giàu dinh dưỡng', 195000, 'vietnamese', 'beef,sprouts,onion'),
(@IdNhaHangĐP, N'Gỏi bò hành hương', N'Sự kết hợp giữa thịt bò tươi và hành tây, rau thơm đặc trưng', 195000, 'vietnamese', 'beef,onion,herb'),
(@IdNhaHangĐP, N'Gỏi sứa Đại Phú', N'Món gỏi sứa đặc sản của nhà hàng với sứa giòn sần sật và nước sốt riêng', 195000, 'vietnamese', 'jellyfish,shrimp,pork,herb'),
(@IdNhaHangĐP, N'Gỏi rau tiến vua tôm thịt', N'Rau tiến vua giòn ngọt trộn cùng tôm tươi và thịt ba chỉ', 195000, 'vietnamese', 'dried vegetable,shrimp,pork'),
(@IdNhaHangĐP, N'Gỏi ngó sen tôm thịt', N'Ngó sen trắng giòn trộn cùng tôm thịt truyền thống', 195000, 'vietnamese', 'lotus root,shrimp,pork'),
(@IdNhaHangĐP, N'Gỏi củ hủ dừa tôm thịt', N'Củ hủ dừa giòn ngọt lịm trộn tôm thịt chuẩn vị miền Tây', 195000, 'vietnamese', 'coconut heart,shrimp,pork'),
(@IdNhaHangĐP, N'Gỏi bưởi tôm thịt', N'Tép bưởi mọng nước trộn cùng tôm thịt, món khai vị thanh mát', 195000, 'vietnamese', 'pomelo,shrimp,pork'),
(@IdNhaHangĐP, N'Gỏi hải sản Thái Lan', N'Hải sản tươi sống trộn sốt Thái chua cay nồng nàn', 195000, 'seafood', 'shrimp,squid,chili,thai spices'),
(@IdNhaHangĐP, N'Gỏi mực Thái Lan', N'Mực tươi xắt khoanh trộn cùng sốt Thái chua cay', 195000, 'seafood', 'squid,chili,thai spices'),
(@IdNhaHangĐP, N'Gỏi tuyết nhĩ hải sản', N'Nấm tuyết trắng giòn trộn cùng các loại hải sản phong phú', 195000, 'seafood', 'white fungus,shrimp,squid'),

-- Bún Mọc Hùng Mập --
(@IdBunMocHM, N'Bún mọc chả', N'Bún mọc truyền thống kết hợp mọc tươi và chả lụa/chả quế', 60000, 'noodle', 'pork paste,pork roll,noodle'),
(@IdBunMocHM, N'Bún mọc không', N'Bún mọc thanh đạm với mọc tươi viên tròn', 60000, 'noodle', 'pork paste,noodle'),
(@IdBunMocHM, N'Bún chả không', N'Bún ăn kèm các loại chả lụa, chả quế thơm ngon', 60000, 'noodle', 'pork roll,noodle'),
(@IdBunMocHM, N'Bún sườn mọc chả', N'Tô bún đầy đặn với sườn non hầm, mọc và chả', 65000, 'noodle', 'pork ribs,pork paste,pork roll,noodle'),
(@IdBunMocHM, N'Bún sườn mọc', N'Sự kết hợp giữa sườn non và mọc tươi viên', 65000, 'noodle', 'pork ribs,pork paste,noodle'),
(@IdBunMocHM, N'Bún sườn chả', N'Bún sườn non hầm mềm ăn cùng các loại chả đặc sản', 65000, 'noodle', 'pork ribs,pork roll,noodle'),
(@IdBunMocHM, N'Bún sườn không', N'Bún sườn non hầm vừa tới, nước dùng thanh ngọt', 65000, 'noodle', 'pork ribs,noodle'),
(@IdBunMocHM, N'Bún giò không', N'Bún giò heo béo ngậy, giàu collagen', 65000, 'noodle', 'pork trotter,noodle'),
(@IdBunMocHM, N'Bún giò heo mọc chả', N'Tô bún đặc biệt với giò heo lớn, mọc và chả đầy đủ', 80000, 'noodle', 'pork trotter,pork paste,pork roll,noodle'),
(@IdBunMocHM, N'Bún giò mọc', N'Bún giò heo ăn kèm mọc tươi viên', 80000, 'noodle', 'pork trotter,pork paste,noodle'),
(@IdBunMocHM, N'Bún giò chả', N'Bún giò heo ăn kèm chả lụa/chả quế', 80000, 'noodle', 'pork trotter,pork roll,noodle'),
(@IdBunMocHM, N'Bún giò sườn', N'Sự kết hợp bồi bổ giữa giò heo và sườn non', 90000, 'noodle', 'pork trotter,pork ribs,noodle'),
(@IdBunMocHM, N'Bún giò sườn mọc chả (Đặc biệt)', N'Tô bún khổng lồ với đầy đủ tất cả các loại topping của quán', 100000, 'noodle', 'pork trotter,pork ribs,pork paste,pork roll,noodle'),

-- ỐC NHỚ SÀI GÒN --
(@IdOcNho, N'Ốc mỡ sốt trứng muối', N'Ốc mỡ béo ngậy quyện cùng sốt trứng muối vàng óng, bùi béo', 90000, 'seafood', 'snails,salted egg,butter'),
(@IdOcNho, N'Ốc mỡ xào bơ chanh', N'Ốc mỡ xào bơ thơm lừng, điểm thêm vị chua thanh từ chanh tươi', 85000, 'seafood', 'snails,butter,lemon'),
(@IdOcNho, N'Ốc mỡ sốt Cajun', N'Ốc mỡ mang phong cách Âu Mỹ với sốt Cajun cay nồng, đậm đà', 105000, 'seafood', 'snails,cajun spices,chili'),
(@IdOcNho, N'Ốc bông xào phô mai', N'Ốc bông giòn ngọt kết hợp xốt phô mai tan chảy béo ngậy', 75000, 'seafood', 'snails,cheese,butter'),
(@IdOcNho, N'Ốc bông rang muối phô mai HQ', N'Sự kết hợp độc đáo giữa muối và bột phô mai phong cách Hàn Quốc', 70000, 'seafood', 'snails,cheese powder,chili'),
(@IdOcNho, N'Ốc bông xào muối tắc', N'Vị mặn của muối kết hợp hương tắc thơm nồng, kích thích vị giác', 65000, 'seafood', 'snails,kumquat,salt'),
(@IdOcNho, N'Ốc cà na xào tỏi', N'Ốc cà na xào cùng tỏi phi vàng thơm nức mũi', 60000, 'seafood', 'snails,garlic,butter'),
(@IdOcNho, N'Ốc cà na hấp sả', N'Món ốc cà na hấp sả giữ trọn vị ngọt tự nhiên, thanh nhẹ', 60000, 'seafood', 'snails,lemongrass'),
(@IdOcNho, N'Sò huyết xào me', N'Sò huyết tươi ngon quyện sốt me chua ngọt đậm đà', 60000, 'seafood', 'blood cockle,tamarind,chili'),
(@IdOcNho, N'Sò huyết nướng mọi', N'Sò huyết nướng mọi giữ nguyên độ tươi ngọt và mọng nước', 60000, 'seafood', 'blood cockle'),
(@IdOcNho, N'Sò huyết xào sa tế', N'Sò huyết xào sa tế cay nồng, cực kỳ kích thích vị giác', 60000, 'seafood', 'blood cockle,chili,garlic');
GO