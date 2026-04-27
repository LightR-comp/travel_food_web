USE travel_food_db
GO	

INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES 
-- Quận 1 --
(N'Phở Hòa Pasteur', N'260C Đ.Pasteur, Phường 8, Quận 3', 10.776800, 106.690200, 4.5, 100000, '6:00', '21:00', 'vietnamese'),
(N'Cơm Tấm Thuận Kiều', N'190 Đ.Calmette, Phường Nguyễn Thái Bình, Quận 1', 10.767300, 106.700100, 4.3, 80000, '6:00', '22:00', 'vietnamese'),
(N'Nhà hàng Ngon', N'160 Đ.Pasteur, Phường 6, Quận 3', 10.779300, 106.691500, 4.6, 300000, '7:00', '22:00', 'vietnamese'),
(N'The Racha Room', N'59 Đ.Mạc Thị Bưởi, Phường Bến Nghé, Quận 1', 10.779700, 106.704000, 4.4, 500000, '11:30', '22:30', 'thai'),
(N'Secret Garden', N'Tầng 5, 158 Đ.Pasteur, Phường Võ Thị Sáu, Quận 3', 10.779200, 106.691200, 4.5, 200000, '10:00', '22:00', 'vietnamese'),
(N'Bún Bò Huế Bà Tuyết', N'28 Đ.Thái Văn Lung, Phường Bến Nghé, Quận 1', 10.781200, 106.703800, 4.2, 80000, '6:00', '14:00', 'vietnamese'),
(N'Pizza 4P''s Lê Thánh Tôn', N'8/15 Đ.Lê Thánh Tôn, Phường Bến Nghé, Quận 1', 10.779100, 106.703100, 4.7, 400000, '11:00', '22:00', 'italian'),
(N'Quán Bụi', N'17A Đ.Ngô Văn Năm, Phường Bến Nghé, Quận 1', 10.778500, 106.703600, 4.4, 300000, '11:00', '22:30', 'vietnamese'),
(N'Dim Tu Tac', N'78 Đ.Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1', 10.771200, 106.703900, 4.3, 200000, '10:00', '22:00', 'chinese'),
(N'Hải Sản Sáu Hiên', N'23 Đ.Thi Sách, Phường Bến Nghé, Quận 1', 10.778800, 106.706200, 4.1, 400000, '10:00', '22:00', 'seafood'),

-- Quận 3 --
(N'Phở 24 Võ Văn Tần', N'5 Đ.Võ Văn Tần, Phường 6, Quận 3', 10.776200, 106.686500, 4.1, 100000, '6:00', '22:00', 'vietnamese'),
(N'Lẩu Nấm Kăn Eang', N'36 Đ.Hoàng Diệu, Phường 9, Quận 4', 10.760400, 106.703000, 4.4, 250000, '10:00', '22:00', 'vegetarian'),
(N'Cơm Gà Phú Yên Sáng', N'64 Đ.Lê Quý Đôn, Phường 7, Quận 3', 10.773600, 106.686700, 4.3, 80000, '10:00', '21:00', 'vietnamese'),
(N'Sushi Tei Phú Nhuận', N'Tầng 3, 192 Đ.Hoàng Văn Thụ, Phường 9, Quận Phú Nhuận', 10.795600, 106.678700, 4.2, 400000, '11:00', '21:30', 'japanese'),
(N'Quán Ốc Như Ý', N'18 Đ.Trần Quý Khoách, Phường Tân Định, Quận 1', 10.789400, 106.695300, 4.0, 150000, '16:00', '23:00', 'seafood'),
(N'Bếp Nhà', N'31 Đ.Trương Định, Phường 6, Quận 3', 10.771200, 106.685300, 4.5, 150000, '10:00', '21:30', 'vietnamese'),
(N'Bánh Xèo Mười Xiềm', N'204 Đ.Đinh Tiên Hoàng, Phường 3, Quận Bình Thạnh', 10.798200, 106.713100, 4.3, 120000, '10:00', '21:00', 'vietnamese'),
(N'Bún Đậu Cây Xoài', N'6A Đ.Nguyễn Thượng Hiền, Phường 5, Quận 3', 10.770300, 106.680700, 4.0, 100000, '10:00', '21:00', 'vietnamese'),
(N'Nhà Hàng Triều Châu', N'89 Đ.Trần Quốc Thảo, Phường 7, Quận 3', 10.772900, 106.684100, 4.2, 300000, '10:00', '22:00', 'chinese'),
(N'Steak & Shake Quận 3', N'56 Đ.Lê Quý Đôn, Phường 9, Quận 3', 10.774500, 106.685900, 4.1, 200000, '10:00', '22:00', 'western'),

-- Quận 5 --
(N'Há Cảo Dimsum Đồng Khánh', N'59 Đ.Huỳnh Mẫn Đạt, Phường 1, Quận 5', 10.754200, 106.664300, 4.4, 200000, '6:00', '14:00', 'chinese'),
(N'Cháo Quảng Triều Ký', N'151 Đ.Châu Văn Liêm, Phường 11, Quận 5', 10.749300, 106.660500, 4.3, 100000, '7:00', '22:00', 'chinese'),
(N'Lẩu Dê Sơn Ca', N'39 Đ.Nguyễn Trãi, Phường 3, Quận 5', 10.754700, 106.661700, 4.0, 250000, '10:00', '22:00', 'vietnamese'),
(N'Hủ Tiếu Nam Vang Thanh Xuân', N'264 Đ.Trần Hưng Đạo, Phường 11, Quận 5', 10.752100, 106.666900, 4.5, 80000, '6:00', '14:00', 'vietnamese'),
(N'Quán Chè Hiển Khánh', N'36 Đ.Hải Thượng Lãn Ông, Phường 11, Quận 5', 10.752500, 106.657200, 4.2, 50000, '10:00', '22:00', 'dessert'),
(N'Bánh Cuốn Tây Hồ', N'28 Đ.Đinh Công Tráng, Phường 9, Quận 1', 10.783600, 106.697100, 4.3, 60000, '6:30', '22:00', 'vietnamese'),
(N'Lẩu Thái Tân Hương', N'72 Đ.An Dương Vương, Phường 9, Quận 5', 10.746300, 106.659400, 4.1, 200000, '10:00', '22:00', 'thai'),
(N'Kim Thanh Quán', N'119 Đ.Lương Nhữ Học, Phường 11, Quận 5', 10.751200, 106.658300, 4.0, 100000, '10:00', '21:00', 'chinese'),
(N'Phá Lấu Cô Loan', N'Đ.Nguyễn Trãi, Phường 3, Quận 5', 10.754100, 106.660800, 4.4, 50000, '14:00', '22:00', 'vietnamese'),
(N'Dimsum 99 Quận 5', N'99 Đ.Triệu Quang Phục, Phường 11, Quận 5', 10.750600, 106.658100, 4.2, 150000, '6:00', '14:00', 'chinese'),

-- Bình Thạnh --
(N'Cơm Tấm Ba Ghiền', N'84 Đ.Đặng Văn Bi, Phường Bình Thọ, Quận Thủ Đức', 10.834500, 106.763200, 4.6, 80000, '6:00', '22:00', 'vietnamese'),
(N'Lẩu Cua Đồng Bà Thúy', N'122 Đ.Xô Viết Nghệ Tĩnh, Phường 26, Quận Bình Thạnh', 10.809200, 106.715300, 4.3, 200000, '10:00', '22:00', 'vietnamese'),
(N'Nhà Hàng Bên Sông', N'38 Đ.Bạch Đằng, Phường 2, Quận Bình Thạnh', 10.802100, 106.718600, 4.5, 400000, '11:00', '23:00', 'vietnamese'),
(N'Bún Bò Bà Tám Bình Thạnh', N'87 Đ.Nơ Trang Long, Phường 14, Quận Bình Thạnh', 10.813700, 106.710200, 4.2, 70000, '6:00', '13:00', 'vietnamese'),
(N'Quán Nhậu Sân Vườn Thảo Điền', N'15 Đ.Nguyễn Văn Hưởng, Phường Thảo Điền, Quận 2', 10.800400, 106.737200, 4.4, 500000, '16:00', '23:00', 'vietnamese'),
(N'Gà Nướng Lu Bình Thạnh', N'193 Đ.Bình Lợi, Phường 13, Quận Bình Thạnh', 10.829300, 106.720100, 4.1, 200000, '10:00', '22:00', 'vietnamese'),
(N'Bánh Xèo Bà Hạnh', N'47 Đ.Phan Đình Phùng, Phường 2, Quận Phú Nhuận', 10.796400, 106.678400, 4.3, 100000, '10:00', '21:00', 'vietnamese'),
(N'Lẩu Bò Tư Đức', N'120 Đ.Bùi Hữu Nghĩa, Phường 2, Quận Bình Thạnh', 10.796500, 106.722100, 4.0, 200000, '16:00', '23:00', 'vietnamese'),
(N'Nhà Hàng Seoul Bình Thạnh', N'216 Đ.Đinh Bộ Lĩnh, Phường 26, Quận Bình Thạnh', 10.813200, 106.716200, 4.2, 350000, '10:00', '22:00', 'korean'),
(N'Pizza Home Bình Thạnh', N'58 Đ.Ngô Tất Tố, Phường 19, Quận Bình Thạnh', 10.800700, 106.715800, 4.1, 200000, '10:00', '22:00', 'italian'),

-- Phú Nhuận --
(N'Cơm Niêu Sài Gòn', N'2C Đ.D2, Phường 25, Quận Bình Thạnh', 10.804100, 106.715200, 4.6, 300000, '10:00', '22:00', 'vietnamese'),
(N'Bún Thịt Nướng Cô Hạnh', N'48 Đ.Đặng Văn Ngữ, Phường 14, Quận Phú Nhuận', 10.800300, 106.674200, 4.4, 60000, '6:00', '21:00', 'vietnamese'),
(N'Lẩu Dê Phú Nhuận', N'166 Đ.Huỳnh Văn Bánh, Phường 12, Quận Phú Nhuận', 10.797600, 106.672400, 4.1, 250000, '15:00', '23:00', 'vietnamese'),
(N'Nhà Hàng Gà Ri Núi', N'74 Đ.Trần Huy Liệu, Phường 12, Quận Phú Nhuận', 10.796800, 106.671300, 4.3, 300000, '10:00', '22:00', 'vietnamese'),
(N'Quán Bún Mắm Phú Nhuận', N'19 Đ.Phan Xích Long, Phường 7, Quận Phú Nhuận', 10.800100, 106.677900, 4.2, 80000, '10:00', '21:00', 'vietnamese'),
(N'Bánh Canh Ghẹ Phú Nhuận', N'32 Đ.Nguyễn Trọng Tuyển, Phường 10, Quận Phú Nhuận', 10.798200, 106.673800, 4.3, 150000, '10:00', '22:00', 'vietnamese'),
(N'Chay Garden Phú Nhuận', N'53 Đ.Hoàng Văn Thụ, Phường 8, Quận Phú Nhuận', 10.795400, 106.673100, 4.4, 150000, '10:00', '21:00', 'vegetarian'),
(N'Bò Né Phú Nhuận', N'9 Đ.Trần Huy Liệu, Phường 9, Quận Phú Nhuận', 10.796900, 106.672600, 4.0, 70000, '5:30', '13:00', 'vietnamese'),
(N'Nhà Hàng Nhật Fuji Phú Nhuận', N'110 Đ.Hoàng Văn Thụ, Phường 9, Quận Phú Nhuận', 10.795900, 106.675100, 4.2, 350000, '11:00', '22:00', 'japanese'),
(N'Hải Sản Tân Phú Nhuận', N'81 Đ.Phan Xích Long, Phường 3, Quận Phú Nhuận', 10.803200, 106.676300, 4.1, 300000, '10:00', '22:00', 'seafood');

GO

-- Khai báo biến ID
-- Quận 1
DECLARE @IdPhoHoa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở Hòa Pasteur');
DECLARE @IdComTamTK INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Thuận Kiều');
DECLARE @IdNhaHangNgon INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà hàng Ngon');
DECLARE @IdRachaRoom INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'The Racha Room');
DECLARE @IdSecretGarden INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Secret Garden');
DECLARE @IdBunBoHueBaTuyet INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò Huế Bà Tuyết');
DECLARE @IdPizza4Ps INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Pizza 4P''s Lê Thánh Tôn');
DECLARE @IdQuanBui INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Bụi');
DECLARE @IdDimTuTac INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Dim Tu Tac');
DECLARE @IdHaiSanSauHien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hải Sản Sáu Hiên');

-- Quận 3
DECLARE @IdPho24 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phở 24 Võ Văn Tần');
DECLARE @IdLauNamKanEang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Nấm Kăn Eang');
DECLARE @IdComGaPY INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Gà Phú Yên Sáng');
DECLARE @IdSushiTei INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Sushi Tei Phú Nhuận');
DECLARE @IdOcNhuY INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Ốc Như Ý');
DECLARE @IdBepNha INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bếp Nhà');
DECLARE @IdBanhXeoMuoiXiem INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Xèo Mười Xiềm');
DECLARE @IdBunDauCayXoai INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Đậu Cây Xoài');
DECLARE @IdTrieuChau INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Hàng Triều Châu');
DECLARE @IdSteakQ3 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Steak & Shake Quận 3');

-- Quận 5
DECLARE @IdHaCaoDimsum INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Há Cảo Dimsum Đồng Khánh');
DECLARE @IdChaoQuang INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cháo Quảng Triều Ký');
DECLARE @IdLauDeSonCa INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Dê Sơn Ca');
DECLARE @IdHuTieuNV INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hủ Tiếu Nam Vang Thanh Xuân');
DECLARE @IdCheHienKhanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Chè Hiển Khánh');
DECLARE @IdBanhCuonTH INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Cuốn Tây Hồ');
DECLARE @IdLauThaiQ5 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Thái Tân Hương');
DECLARE @IdKimThanhQuan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Kim Thanh Quán');
DECLARE @IdPhaLauCoLoan INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Phá Lấu Cô Loan');
DECLARE @IdDimsum99 INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Dimsum 99 Quận 5');

-- Bình Thạnh
DECLARE @IdComTamBaGhien INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Tấm Ba Ghiền');
DECLARE @IdLauCuaBaThuy INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Cua Đồng Bà Thúy');
DECLARE @IdNHBenSong INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Hàng Bên Sông');
DECLARE @IdBunBoBaTamBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Bò Bà Tám Bình Thạnh');
DECLARE @IdSanVuonTD INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Nhậu Sân Vườn Thảo Điền');
DECLARE @IdGaNuongLuBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Gà Nướng Lu Bình Thạnh');
DECLARE @IdBanhXeoBaHanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Xèo Bà Hạnh');
DECLARE @IdLauBoTuDuc INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Bò Tư Đức');
DECLARE @IdSeoulBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Hàng Seoul Bình Thạnh');
DECLARE @IdPizzaHomeBT INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Pizza Home Bình Thạnh');

-- Phú Nhuận
DECLARE @IdComNieuSG INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Cơm Niêu Sài Gòn');
DECLARE @IdBunThitNuongCoHanh INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bún Thịt Nướng Cô Hạnh');
DECLARE @IdLauDePN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Lẩu Dê Phú Nhuận');
DECLARE @IdGaRiNui INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Hàng Gà Ri Núi');
DECLARE @IdBunMamPN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Quán Bún Mắm Phú Nhuận');
DECLARE @IdBanhCanhGhePN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bánh Canh Ghẹ Phú Nhuận');
DECLARE @IdChayGardenPN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Chay Garden Phú Nhuận');
DECLARE @IdBoNePN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Bò Né Phú Nhuận');
DECLARE @IdFujiPN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Nhà Hàng Nhật Fuji Phú Nhuận');
DECLARE @IdHaiSanPN INT = (SELECT TOP 1 id FROM Restaurants WHERE name = N'Hải Sản Tân Phú Nhuận');

INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES
-- Phở Hòa Pasteur --
(@IdPhoHoa, N'Phở Tái', N'Phở bò tái thịt mềm, nước dùng trong thanh ngọt chuẩn vị Sài Gòn', 75000, 'vietnamese', 'beef,noodle,onion,herb'),
(@IdPhoHoa, N'Phở Tái Gầu', N'Phở bò tái kết hợp gầu béo ngậy đặc trưng', 80000, 'vietnamese', 'beef,noodle,onion,herb'),
(@IdPhoHoa, N'Phở Tái Gân', N'Phở bò tái với gân bò giòn dai sần sật', 80000, 'vietnamese', 'beef,noodle,onion,herb'),
(@IdPhoHoa, N'Phở Đặc Biệt', N'Tô phở đầy đủ: tái, gầu, gân, nạm và bò viên', 95000, 'vietnamese', 'beef,noodle,onion,herb'),
(@IdPhoHoa, N'Phở Bò Viên', N'Phở với bò viên tươi dai giòn', 70000, 'vietnamese', 'beef,noodle,onion,herb'),

-- Cơm Tấm Thuận Kiều --
(@IdComTamTK, N'Cơm Tấm Sườn Bì Chả', N'Cơm tấm đặc biệt gồm sườn nướng, bì và chả trứng hấp', 55000, 'vietnamese', 'pork rib,pork skin,steamed egg,rice'),
(@IdComTamTK, N'Cơm Tấm Sườn', N'Cơm tấm sườn nướng thơm lừng đậm đà gia vị', 45000, 'vietnamese', 'pork rib,rice'),
(@IdComTamTK, N'Cơm Tấm Bì', N'Cơm tấm bì heo giòn sần sật', 40000, 'vietnamese', 'pork skin,rice'),
(@IdComTamTK, N'Cơm Tấm Chả', N'Cơm tấm chả trứng hấp mềm mịn', 40000, 'vietnamese', 'steamed egg,pork,rice'),
(@IdComTamTK, N'Nước Mía', N'Nước mía tươi ép nguyên chất giải nhiệt', 15000, 'drink', 'sugarcane'),

-- Nhà hàng Ngon --
(@IdNhaHangNgon, N'Gỏi Cuốn Tôm Thịt', N'Gỏi cuốn tươi với tôm và thịt heo luộc, ăn kèm nước chấm đặc biệt', 65000, 'vietnamese', 'shrimp,pork,rice paper,herb,rice noodle'),
(@IdNhaHangNgon, N'Bún Chả Hà Nội', N'Chả nướng thơm lừng ăn kèm bún và nước chấm', 95000, 'vietnamese', 'pork,noodle,herb'),
(@IdNhaHangNgon, N'Bánh Xèo Miền Nam', N'Bánh xèo giòn rụm nhân tôm thịt giá đỗ', 85000, 'vietnamese', 'shrimp,pork,bean sprout,egg,flour'),
(@IdNhaHangNgon, N'Cơm Chiên Dương Châu', N'Cơm chiên đặc sản với tôm, trứng và rau củ', 85000, 'vietnamese', 'rice,shrimp,egg,vegetable'),
(@IdNhaHangNgon, N'Chè Ba Màu', N'Chè ba màu đặc trưng miền Nam mát lạnh', 35000, 'dessert', 'bean,coconut milk,jelly'),

-- The Racha Room --
(@IdRachaRoom, N'Tom Yum Goong', N'Canh Tom Yum tôm chua cay đặc trưng Thái Lan', 185000, 'thai', 'shrimp,lemongrass,galangal,lime leaf,chili'),
(@IdRachaRoom, N'Pad Thai Gà', N'Mì Pad Thai xào gà truyền thống Thái', 145000, 'thai', 'rice noodle,chicken,egg,bean sprout,peanut'),
(@IdRachaRoom, N'Green Curry Bò', N'Cà ri xanh bò nước cốt dừa đậm đà', 165000, 'thai', 'beef,green curry paste,coconut milk,vegetable'),
(@IdRachaRoom, N'Som Tum', N'Gỏi đu đủ xanh chua cay chuẩn vị Thái', 95000, 'thai', 'green papaya,tomato,peanut,chili,lime'),
(@IdRachaRoom, N'Mango Sticky Rice', N'Xôi nếp cẩm ăn kèm xoài chín và nước cốt dừa', 85000, 'dessert', 'sticky rice,mango,coconut milk'),

-- Secret Garden --
(@IdSecretGarden, N'Bún Bò Nam Bộ', N'Bún bò tươi giòn, vị chua ngọt đặc trưng miền Nam', 85000, 'vietnamese', 'beef,noodle,peanut,herb'),
(@IdSecretGarden, N'Bánh Mì Chảo', N'Bánh mì chảo kiểu Sài Gòn với trứng, thịt và pate', 75000, 'vietnamese', 'bread,egg,pork,pate'),
(@IdSecretGarden, N'Kem Dừa Tươi', N'Kem dừa nguyên chất phục vụ trong trái dừa tươi', 55000, 'dessert', 'coconut,ice cream'),
(@IdSecretGarden, N'Nước Ép Rau Má', N'Nước rau má mát lạnh giải nhiệt cơ thể', 35000, 'drink', 'pennywort'),
(@IdSecretGarden, N'Chè Thái', N'Chè Thái đặc biệt với các loại thạch và trái cây', 45000, 'dessert', 'coconut milk,jelly,fruit'),

-- Bún Bò Huế Bà Tuyết --
(@IdBunBoHueBaTuyet, N'Bún Bò Huế Đặc Biệt', N'Tô bún bò đặc biệt với giò heo, huyết và chả cua', 75000, 'vietnamese', 'beef,pork trotter,blood cake,crab paste,noodle,lemongrass'),
(@IdBunBoHueBaTuyet, N'Bún Bò Huế Thường', N'Bún bò Huế truyền thống thơm mùi sả và mắm ruốc', 55000, 'vietnamese', 'beef,noodle,lemongrass,shrimp paste'),
(@IdBunBoHueBaTuyet, N'Bún Bò Giò Heo', N'Bún bò với giò heo hầm mềm béo ngậy', 65000, 'vietnamese', 'beef,pork trotter,noodle,lemongrass'),
(@IdBunBoHueBaTuyet, N'Trà Đá', N'Trà đá giải nhiệt', 5000, 'drink', 'tea'),
(@IdBunBoHueBaTuyet, N'Nước Ngọt', N'Nước giải khát đóng lon', 15000, 'drink', 'soda'),

-- Pizza 4P''s --
(@IdPizza4Ps, N'Pizza Cá Hồi Phô Mai Kem', N'Cá hồi tươi trên nền phô mai kem béo ngậy, viền bánh giòn', 325000, 'pizza', 'salmon,cream cheese,mozzarella'),
(@IdPizza4Ps, N'Pizza Margherita', N'Pizza truyền thống Ý với sốt cà chua, phô mai mozzarella và húng quế', 245000, 'pizza', 'tomato sauce,mozzarella,basil'),
(@IdPizza4Ps, N'Pizza Bò Wagyu', N'Pizza cao cấp với thịt bò Wagyu vân mỡ đẹp', 425000, 'pizza', 'wagyu beef,onion,mozzarella'),
(@IdPizza4Ps, N'Pasta Cá Hồi Sốt Kem', N'Pasta linguine cá hồi sốt kem béo ngậy', 285000, 'italian', 'pasta,salmon,cream,cheese'),
(@IdPizza4Ps, N'Tiramisu', N'Tiramisu Ý truyền thống với mascarpone và cà phê', 145000, 'dessert', 'mascarpone,coffee,ladyfinger'),

-- Quán Bụi --
(@IdQuanBui, N'Gà Nướng Lá Chanh', N'Gà ta nướng thơm mùi lá chanh, da giòn thịt ngọt', 195000, 'vietnamese', 'chicken,lime leaf,lemongrass'),
(@IdQuanBui, N'Ốc Len Xào Dừa', N'Ốc len xào nước cốt dừa béo thơm', 125000, 'seafood', 'snails,coconut milk,lemongrass'),
(@IdQuanBui, N'Mực Nướng Sa Tế', N'Mực tươi nướng sa tế cay nồng', 165000, 'seafood', 'squid,chili,lemongrass'),
(@IdQuanBui, N'Bò Lúc Lắc', N'Bò cắt vuông lắc chảo cùng hành tây và ớt chuông', 195000, 'vietnamese', 'beef,onion,bell pepper'),
(@IdQuanBui, N'Dừa Tươi', N'Dừa xiêm tươi mát lạnh', 35000, 'drink', 'coconut'),

-- Dim Tu Tac --
(@IdDimTuTac, N'Há Cảo Tôm', N'Há cảo nhân tôm tươi hấp mềm', 75000, 'chinese', 'shrimp,flour'),
(@IdDimTuTac, N'Xíu Mại Hấp', N'Xíu mại heo tươi hấp đặc sản', 70000, 'chinese', 'pork,flour'),
(@IdDimTuTac, N'Bánh Cuốn Chiên', N'Bánh cuốn chiên giòn nhân thịt băm', 65000, 'chinese', 'pork,flour,egg'),
(@IdDimTuTac, N'Chân Gà Hấp Đậu Đen', N'Chân gà hấp cùng đậu đen mềm ngọt', 80000, 'chinese', 'chicken feet,black bean'),
(@IdDimTuTac, N'Trà Pu-erh', N'Trà Pu-erh Vân Nam thơm nồng', 25000, 'drink', 'tea'),

-- Hải Sản Sáu Hiên --
(@IdHaiSanSauHien, N'Tôm Hùm Hấp', N'Tôm hùm tươi hấp nguyên con giữ trọn vị ngọt tự nhiên', 850000, 'seafood', 'lobster'),
(@IdHaiSanSauHien, N'Cua Rang Muối', N'Cua biển tươi rang muối ớt thơm nồng', 450000, 'seafood', 'crab,salt,chili'),
(@IdHaiSanSauHien, N'Ghẹ Hấp Sả', N'Ghẹ tươi hấp sả giữ vị ngọt tự nhiên', 350000, 'seafood', 'blue crab,lemongrass'),
(@IdHaiSanSauHien, N'Nghêu Hấp Xả Ớt', N'Nghêu tươi hấp sả ớt thơm cay', 120000, 'seafood', 'clam,lemongrass,chili'),
(@IdHaiSanSauHien, N'Cơm Trắng', N'Cơm trắng dẻo ăn kèm hải sản', 15000, 'side_dish', 'rice'),

-- Phở 24 --
(@IdPho24, N'Phở Tái Bò Viên', N'Kết hợp phở tái và bò viên dai giòn', 75000, 'vietnamese', 'beef,noodle,herb'),
(@IdPho24, N'Phở Gà', N'Phở gà nước dùng thanh ngọt', 70000, 'vietnamese', 'chicken,noodle,herb'),
(@IdPho24, N'Phở Đặc Biệt', N'Tô phở đặc biệt đầy đủ topping', 90000, 'vietnamese', 'beef,noodle,herb'),
(@IdPho24, N'Quẩy', N'Quẩy chiên giòn ăn kèm phở', 15000, 'side_dish', 'flour'),
(@IdPho24, N'Nước Cam', N'Nước cam vắt tươi', 30000, 'drink', 'orange'),

-- Lẩu Nấm Kăn Eang --
(@IdLauNamKanEang, N'Lẩu Nấm Thập Cẩm', N'Lẩu 10 loại nấm tươi bổ dưỡng với nước dùng thanh ngọt', 280000, 'vegetarian', 'mixed mushroom,tofu,vegetable,noodle'),
(@IdLauNamKanEang, N'Lẩu Nấm Hải Sản', N'Lẩu nấm kết hợp các loại hải sản tươi', 350000, 'seafood', 'mushroom,shrimp,squid,fish,noodle'),
(@IdLauNamKanEang, N'Nấm Chiên Bơ', N'Nấm tươi chiên bơ thơm lừng', 85000, 'vegetarian', 'mushroom,butter,garlic'),
(@IdLauNamKanEang, N'Đậu Hũ Non Sốt Nấm', N'Đậu hũ non mềm mịn rưới sốt nấm đặc biệt', 75000, 'vegetarian', 'tofu,mushroom'),
(@IdLauNamKanEang, N'Nước Ép Táo', N'Nước ép táo tươi nguyên chất', 45000, 'drink', 'apple'),

-- Cơm Gà Phú Yên Sáng --
(@IdComGaPY, N'Cơm Gà Phú Yên', N'Cơm gà đặc sản Phú Yên với gà ta da vàng, ăn kèm nước chấm gừng', 65000, 'vietnamese', 'chicken,rice,ginger'),
(@IdComGaPY, N'Cháo Gà', N'Cháo gà nấu với gạo nếp thơm bổ dưỡng', 50000, 'vietnamese', 'chicken,rice,ginger,herb'),
(@IdComGaPY, N'Gà Chiên Mắm', N'Gà chiên giòn sốt mắm hành đặc trưng miền Trung', 75000, 'vietnamese', 'chicken,fish sauce,garlic'),
(@IdComGaPY, N'Trà Đá', N'Trà đá giải nhiệt', 5000, 'drink', 'tea'),
(@IdComGaPY, N'Nước Suối', N'Nước suối đóng chai', 10000, 'drink', 'water'),

-- Sushi Tei --
(@IdSushiTei, N'Set Sashimi 12 món', N'12 lát sashimi đa dạng: cá hồi, cá ngừ, tôm, bạch tuộc', 385000, 'japanese', 'salmon,tuna,shrimp,octopus'),
(@IdSushiTei, N'Ramen Tonkotsu', N'Ramen nước dùng xương heo đậm đà, trứng lòng đào', 185000, 'japanese', 'pork bone broth,ramen noodle,egg,pork'),
(@IdSushiTei, N'Gyoza', N'Bánh xếp nhân thịt chiên giòn chuẩn vị Nhật', 95000, 'japanese', 'pork,cabbage,garlic,flour'),
(@IdSushiTei, N'Karaage Gà', N'Gà chiên kiểu Nhật giòn rụm', 125000, 'japanese', 'chicken,soy sauce,ginger'),
(@IdSushiTei, N'Mochi Kem', N'Mochi nhân kem các vị: trà xanh, dâu, vani', 65000, 'dessert', 'rice cake,ice cream'),

-- Quán Ốc Như Ý --
(@IdOcNhuY, N'Ốc Hương Xào Bơ Tỏi', N'Ốc hương tươi xào bơ tỏi thơm lừng', 120000, 'seafood', 'snails,butter,garlic'),
(@IdOcNhuY, N'Sò Điệp Nướng Mỡ Hành', N'Sò điệp to nướng mỡ hành thơm béo', 145000, 'seafood', 'scallop,green onion,pork fat'),
(@IdOcNhuY, N'Ốc Len Xào Dừa', N'Ốc len xào nước cốt dừa béo thơm', 95000, 'seafood', 'snails,coconut milk'),
(@IdOcNhuY, N'Bạch Tuộc Nướng', N'Bạch tuộc tươi nướng than hồng', 135000, 'seafood', 'octopus,chili,lemongrass'),
(@IdOcNhuY, N'Bia Sài Gòn', N'Bia Sài Gòn lon ướp lạnh', 20000, 'drink', 'beer'),

-- Bếp Nhà --
(@IdBepNha, N'Canh Chua Cá Lóc', N'Canh chua miền Nam với cá lóc tươi và rau thơm', 95000, 'vietnamese', 'snakehead fish,pineapple,tomato,bean sprout,tamarind'),
(@IdBepNha, N'Thịt Kho Tàu', N'Thịt ba chỉ kho cùng trứng vịt trong nước dừa đậm đà', 85000, 'vietnamese', 'pork belly,egg,coconut water'),
(@IdBepNha, N'Rau Muống Xào Tỏi', N'Rau muống xào tỏi giòn ngon', 40000, 'vegetable', 'water spinach,garlic'),
(@IdBepNha, N'Cơm Trắng', N'Cơm trắng dẻo thơm', 15000, 'side_dish', 'rice'),
(@IdBepNha, N'Nước Dừa', N'Nước dừa tươi mát lạnh', 25000, 'drink', 'coconut'),

-- Bánh Xèo Mười Xiềm --
(@IdBanhXeoMuoiXiem, N'Bánh Xèo Đặc Biệt', N'Bánh xèo giòn lớn nhân tôm, thịt, nấm và giá đỗ', 85000, 'vietnamese', 'shrimp,pork,mushroom,bean sprout,egg,flour'),
(@IdBanhXeoMuoiXiem, N'Bánh Khọt', N'Bánh khọt chiên giòn nhân tôm tươi truyền thống', 75000, 'vietnamese', 'shrimp,flour,coconut milk'),
(@IdBanhXeoMuoiXiem, N'Gỏi Cuốn Tôm Thịt', N'Cuốn tươi nhân tôm thịt ăn kèm nước chấm đậu phộng', 65000, 'vietnamese', 'shrimp,pork,rice paper,herb'),
(@IdBanhXeoMuoiXiem, N'Nem Lụi', N'Nem lụi nướng thơm lừng ăn kèm bánh tráng và rau', 85000, 'vietnamese', 'pork,lemongrass,rice paper,vegetable'),
(@IdBanhXeoMuoiXiem, N'Nước Sâm Bí Đao', N'Nước sâm bí đao thanh nhiệt giải độc', 20000, 'drink', 'herbal tea,winter melon'),

-- Bún Đậu Cây Xoài --
(@IdBunDauCayXoai, N'Bún Đậu Đặc Biệt', N'Mẹt bún đậu đầy đủ: đậu chiên, thịt luộc, dồi và mắm tôm', 95000, 'vietnamese', 'tofu,pork,sausage,noodle,shrimp paste'),
(@IdBunDauCayXoai, N'Bún Đậu Chay', N'Bún đậu chay với đậu hũ và nước chấm chay', 65000, 'vegetarian', 'tofu,noodle,vegetable'),
(@IdBunDauCayXoai, N'Chả Cốm Chiên', N'Chả cốm xanh chiên vàng thơm', 45000, 'vietnamese', 'green rice cake,pork'),
(@IdBunDauCayXoai, N'Trà Chanh', N'Trà chanh mát lạnh', 20000, 'drink', 'tea,lemon'),
(@IdBunDauCayXoai, N'Nước Ép Dưa Hấu', N'Nước ép dưa hấu tươi mát', 30000, 'drink', 'watermelon'),

-- Nhà Hàng Triều Châu --
(@IdTrieuChau, N'Vịt Quay Triều Châu', N'Vịt quay da giòn vàng ươm, thịt mềm đậm vị Triều Châu', 350000, 'chinese', 'duck,five spice,soy sauce'),
(@IdTrieuChau, N'Heo Quay', N'Heo sữa quay giòn da, thịt mềm thơm', 280000, 'chinese', 'pork,five spice'),
(@IdTrieuChau, N'Cháo Vịt', N'Cháo vịt nấu gạo tấm thơm ngon bổ dưỡng', 75000, 'chinese', 'duck,rice,ginger'),
(@IdTrieuChau, N'Há Cảo Chiên', N'Há cảo chiên giòn nhân tôm thịt', 85000, 'chinese', 'shrimp,pork,flour'),
(@IdTrieuChau, N'Trà Ô Long', N'Trà Ô Long thơm dịu', 25000, 'drink', 'tea'),

-- Steak & Shake Q3 --
(@IdSteakQ3, N'Ribeye Steak Bò Mỹ', N'Ribeye bò Mỹ áp chảo vừa chín, juicy mọng nước', 285000, 'western', 'beef,potato,salad'),
(@IdSteakQ3, N'Sirloin Bò Úc', N'Sirloin bò Úc mềm ngon với nước sốt tiêu đen', 225000, 'western', 'beef,potato,salad,black pepper sauce'),
(@IdSteakQ3, N'Burger Bò Phô Mai', N'Burger bò 200g kèm phô mai chảy và rau tươi', 155000, 'western', 'beef,cheese,bread,lettuce,tomato'),
(@IdSteakQ3, N'Mì Ý Sốt Bò Bằm', N'Spaghetti sốt bò bằm cà chua truyền thống', 125000, 'western', 'spaghetti,beef,tomato sauce'),
(@IdSteakQ3, N'Milkshake Socola', N'Milkshake socola kem béo ngọt', 65000, 'drink', 'milk,chocolate,ice cream'),

-- Há Cảo Dimsum Đồng Khánh --
(@IdHaCaoDimsum, N'Há Cảo Tôm Hấp', N'Há cảo nhân tôm tươi hấp trong lá chuối', 85000, 'chinese', 'shrimp,flour'),
(@IdHaCaoDimsum, N'Xíu Mại Tôm Thịt', N'Xíu mại nhân tôm và thịt heo bằm', 80000, 'chinese', 'shrimp,pork,flour'),
(@IdHaCaoDimsum, N'Bánh Tổ Ong', N'Bánh tổ ong mềm xốp ngọt nhẹ', 65000, 'chinese', 'egg,flour,honey'),
(@IdHaCaoDimsum, N'Chân Gà Tiềm', N'Chân gà hầm nước sốt ngũ vị hương', 75000, 'chinese', 'chicken feet,five spice,soy sauce'),
(@IdHaCaoDimsum, N'Bánh Tiêu', N'Bánh tiêu chiên vàng giòn rỗng ruột', 30000, 'chinese', 'flour,sesame'),

-- Cháo Quảng Triều Ký --
(@IdChaoQuang, N'Cháo Cá Lóc', N'Cháo cá lóc tươi nấu gừng thơm bổ dưỡng', 65000, 'chinese', 'snakehead fish,rice,ginger'),
(@IdChaoQuang, N'Cháo Thịt Heo Bằm', N'Cháo thịt heo bằm truyền thống kiểu Hoa', 55000, 'chinese', 'pork,rice,ginger'),
(@IdChaoQuang, N'Cháo Sườn Non', N'Cháo sườn non hầm mềm ngọt thanh', 65000, 'chinese', 'pork rib,rice,ginger'),
(@IdChaoQuang, N'Dầu Cháo Quẩy', N'Quẩy chiên giòn ăn kèm cháo', 10000, 'side_dish', 'flour'),
(@IdChaoQuang, N'Sữa Đậu Nành', N'Sữa đậu nành nóng/lạnh', 15000, 'drink', 'soybean'),

-- Lẩu Dê Sơn Ca --
(@IdLauDeSonCa, N'Lẩu Dê Sả Ớt', N'Lẩu dê tươi nấu sả ớt cay nồng đặc trưng', 350000, 'goat', 'goat,lemongrass,chili,herb'),
(@IdLauDeSonCa, N'Dê Nướng Mọi', N'Dê nướng than hồng giữ trọn vị ngọt tự nhiên', 195000, 'goat', 'goat,salt,pepper'),
(@IdLauDeSonCa, N'Cháo Dê', N'Cháo dê bằm gừng thơm bổ dưỡng', 55000, 'goat', 'goat,rice,ginger'),
(@IdLauDeSonCa, N'Bia Heineken', N'Bia Heineken lon ướp lạnh', 25000, 'drink', 'beer'),
(@IdLauDeSonCa, N'Rau Ăn Kèm', N'Các loại rau tươi ăn kèm lẩu', 35000, 'side_dish', 'vegetable'),

-- Hủ Tiếu Nam Vang --
(@IdHuTieuNV, N'Hủ Tiếu Nam Vang Đặc Biệt', N'Hủ tiếu đặc biệt: tôm, thịt, bò viên và lòng heo', 80000, 'vietnamese', 'pork,shrimp,beef ball,offal,noodle'),
(@IdHuTieuNV, N'Hủ Tiếu Khô', N'Hủ tiếu khô trộn sốt đặc biệt kèm nước lèo riêng', 70000, 'vietnamese', 'pork,shrimp,noodle'),
(@IdHuTieuNV, N'Hủ Tiếu Bò Viên', N'Hủ tiếu nước trong với bò viên dai giòn', 65000, 'vietnamese', 'beef ball,noodle'),
(@IdHuTieuNV, N'Phá Lấu', N'Phá lấu bò nước dừa béo ngậy', 45000, 'vietnamese', 'beef offal,coconut milk'),
(@IdHuTieuNV, N'Trà Đá', N'Trà đá giải nhiệt', 5000, 'drink', 'tea'),

-- Quán Chè Hiển Khánh --
(@IdCheHienKhanh, N'Chè Ba Màu', N'Chè đậu xanh, đậu đỏ và thạch đường thốt nốt', 30000, 'dessert', 'mung bean,red bean,jelly,coconut milk'),
(@IdCheHienKhanh, N'Chè Sầu Riêng', N'Chè sầu riêng béo ngậy nước cốt dừa thơm lừng', 45000, 'dessert', 'durian,coconut milk,sugar'),
(@IdCheHienKhanh, N'Chè Thái', N'Chè Thái đa sắc màu với các loại thạch và trái cây', 35000, 'dessert', 'coconut milk,jelly,fruit,palm sugar'),
(@IdCheHienKhanh, N'Chè Đậu Xanh Bánh Lọt', N'Chè đậu xanh nước dừa kèm bánh lọt lá dứa', 30000, 'dessert', 'mung bean,coconut milk,pandan jelly'),
(@IdCheHienKhanh, N'Nước Dừa Tươi', N'Dừa xiêm tươi mát', 20000, 'drink', 'coconut'),

-- Bánh Cuốn Tây Hồ --
(@IdBanhCuonTH, N'Bánh Cuốn Thịt', N'Bánh cuốn nóng nhân thịt băm và mộc nhĩ', 55000, 'vietnamese', 'pork,wood ear mushroom,rice flour,herb'),
(@IdBanhCuonTH, N'Bánh Cuốn Trứng', N'Bánh cuốn trứng gà nóng hổi thơm béo', 55000, 'vietnamese', 'egg,rice flour,pork,herb'),
(@IdBanhCuonTH, N'Bánh Cuốn Chay', N'Bánh cuốn chay nhân nấm và đậu hũ', 50000, 'vegetarian', 'tofu,mushroom,rice flour'),
(@IdBanhCuonTH, N'Chả Lụa', N'Chả lụa ăn kèm bánh cuốn', 20000, 'side_dish', 'pork'),
(@IdBanhCuonTH, N'Nước Chấm Đặc Biệt', N'Nước chấm pha sẵn chua ngọt mặn hài hòa', 5000, 'side_dish', 'fish sauce,lime,chili'),

-- Lẩu Thái Q5 --
(@IdLauThaiQ5, N'Lẩu Tom Yum Hải Sản', N'Lẩu Thái chua cay với hải sản tươi thập cẩm', 350000, 'thai', 'shrimp,squid,fish,lemongrass,galangal,chili'),
(@IdLauThaiQ5, N'Lẩu Tom Kha Gà', N'Lẩu gà nấu nước cốt dừa kiểu Thái béo thơm', 280000, 'thai', 'chicken,coconut milk,galangal,lime leaf'),
(@IdLauThaiQ5, N'Pad See Ew', N'Mì xào sốt đen kiểu Thái với trứng và cải xanh', 135000, 'thai', 'rice noodle,egg,broccoli,soy sauce'),
(@IdLauThaiQ5, N'Som Tum Hải Sản', N'Gỏi đu đủ xanh kết hợp hải sản tươi chua cay', 125000, 'thai', 'green papaya,shrimp,squid,peanut,lime,chili'),
(@IdLauThaiQ5, N'Thai Milk Tea', N'Trà sữa Thái đặc trưng cam đậm màu', 45000, 'drink', 'thai tea,milk,sugar'),

-- Kim Thanh Quán --
(@IdKimThanhQuan, N'Bò Kho Bánh Mì', N'Bò kho sốt đặc biệt ăn kèm bánh mì giòn', 75000, 'vietnamese', 'beef,lemongrass,bread'),
(@IdKimThanhQuan, N'Cơm Chiên Hải Sản', N'Cơm chiên với tôm, mực và trứng', 85000, 'chinese', 'rice,shrimp,squid,egg'),
(@IdKimThanhQuan, N'Mì Xào Bò', N'Mì xào cùng thịt bò tươi và rau củ', 80000, 'chinese', 'noodle,beef,vegetable'),
(@IdKimThanhQuan, N'Gà Xào Hạt Điều', N'Gà xào hạt điều giòn thơm kiểu Hoa', 95000, 'chinese', 'chicken,cashew nut,vegetable'),
(@IdKimThanhQuan, N'Trà Chrysanthemum', N'Trà cúc vàng thơm dịu thanh nhiệt', 20000, 'drink', 'chrysanthemum tea'),

-- Phá Lấu Cô Loan --
(@IdPhaLauCoLoan, N'Phá Lấu Heo', N'Phá lấu heo nước dừa béo ngậy đậm đà', 35000, 'snack', 'pork offal,coconut milk,five spice'),
(@IdPhaLauCoLoan, N'Phá Lấu Bò', N'Phá lấu bò vị khác biệt', 40000, 'snack', 'beef offal,coconut milk,five spice'),
(@IdPhaLauCoLoan, N'Bánh Mì Ăn Kèm', N'Bánh mì giòn ăn kèm phá lấu', 5000, 'side_dish', 'bread'),
(@IdPhaLauCoLoan, N'Mì Gói Phá Lấu', N'Mì gói nấu cùng phá lấu đặc', 35000, 'noodle', 'instant noodle,pork offal,coconut milk'),
(@IdPhaLauCoLoan, N'Nước Sâm', N'Nước sâm thảo mộc mát lạnh', 10000, 'drink', 'herbal tea'),

-- Dimsum 99 --
(@IdDimsum99, N'Set Dimsum 6 món', N'6 món dimsum đa dạng hấp và chiên', 165000, 'chinese', 'shrimp,pork,flour'),
(@IdDimsum99, N'Bánh Bao Xá Xíu', N'Bánh bao nhân xá xíu ngọt đậm đà', 35000, 'chinese', 'char siu pork,flour'),
(@IdDimsum99, N'Sủi Cảo Luộc', N'Sủi cảo nhân tôm thịt luộc chín tới', 75000, 'chinese', 'shrimp,pork,flour'),
(@IdDimsum99, N'Trứng Tráng Hàu', N'Trứng tráng hàu sữa chiên vàng', 95000, 'chinese', 'egg,oyster'),
(@IdDimsum99, N'Sữa Đậu Nành', N'Sữa đậu nành nóng hoặc lạnh', 15000, 'drink', 'soybean'),

-- Cơm Tấm Ba Ghiền --
(@IdComTamBaGhien, N'Cơm Tấm Sườn Bì Chả Đặc Biệt', N'Cơm tấm siêu đầy đặn với sườn nướng, bì, chả trứng và đồ chua', 75000, 'vietnamese', 'pork rib,pork skin,steamed egg,rice,pickled vegetable'),
(@IdComTamBaGhien, N'Cơm Tấm Sườn Nướng', N'Sườn heo nướng thơm lừng trên cơm tấm hạt nhỏ', 55000, 'vietnamese', 'pork rib,rice'),
(@IdComTamBaGhien, N'Cơm Tấm Gà Nướng', N'Gà ta nướng thay thế sườn heo', 60000, 'vietnamese', 'chicken,rice'),
(@IdComTamBaGhien, N'Nước Mía Tươi', N'Nước mía vắt tươi ướp lạnh', 15000, 'drink', 'sugarcane'),
(@IdComTamBaGhien, N'Trà Đá', N'Trà đá miễn phí ăn kèm', 5000, 'drink', 'tea'),

-- Lẩu Cua Đồng Bà Thúy --
(@IdLauCuaBaThuy, N'Lẩu Cua Đồng Riêu', N'Lẩu riêu cua đồng béo ngậy, cà chua và đậu hũ', 280000, 'vietnamese', 'field crab,tofu,tomato,vegetable,noodle'),
(@IdLauCuaBaThuy, N'Lẩu Cua Đồng Mắm', N'Lẩu cua đồng nấu mắm tôm đậm đà chuẩn miền Bắc', 280000, 'vietnamese', 'field crab,shrimp paste,vegetable,noodle'),
(@IdLauCuaBaThuy, N'Bún Riêu Cua', N'Bún riêu cua đồng đặc sản', 65000, 'vietnamese', 'field crab,noodle,tofu,tomato'),
(@IdLauCuaBaThuy, N'Chả Cua', N'Chả cua đồng chiên vàng', 55000, 'side_dish', 'crab,egg'),
(@IdLauCuaBaThuy, N'Rau Sống', N'Đĩa rau sống ăn kèm lẩu', 30000, 'side_dish', 'vegetable'),

-- Nhà Hàng Bên Sông --
(@IdNHBenSong, N'Cá Lóc Nướng Trui', N'Cá lóc đồng nướng trui nguyên con, ăn kèm bánh tráng và rau sống', 285000, 'vietnamese', 'snakehead fish,rice paper,herb'),
(@IdNHBenSong, N'Tôm Sú Nướng Muối Ớt', N'Tôm sú tươi nướng muối ớt thơm nồng', 320000, 'seafood', 'shrimp,salt,chili'),
(@IdNHBenSong, N'Lẩu Mắm Miền Tây', N'Lẩu mắm đặc sản miền Tây với các loại hải sản và rau rừng', 450000, 'vietnamese', 'fermented fish,seafood,herb,vegetable,noodle'),
(@IdNHBenSong, N'Gỏi Ngó Sen Tôm Thịt', N'Ngó sen trắng giòn trộn tôm thịt chuẩn vị', 155000, 'vietnamese', 'lotus root,shrimp,pork,peanut'),
(@IdNHBenSong, N'Bia Tiger', N'Bia Tiger lon ướp lạnh', 25000, 'drink', 'beer'),

-- Bún Bò Bà Tám BT --
(@IdBunBoBaTamBT, N'Bún Bò Huế Đặc Biệt', N'Bún bò đặc biệt với giò heo, huyết và chả cua to', 75000, 'vietnamese', 'beef,pork trotter,blood cake,noodle,lemongrass'),
(@IdBunBoBaTamBT, N'Bún Bò Thường', N'Bún bò Huế truyền thống thơm mùi sả mắm ruốc', 55000, 'vietnamese', 'beef,noodle,lemongrass,shrimp paste'),
(@IdBunBoBaTamBT, N'Giò Heo', N'Thêm giò heo cho tô bún', 30000, 'side_dish', 'pork trotter'),
(@IdBunBoBaTamBT, N'Trà Đá', N'Trà đá mát lạnh', 5000, 'drink', 'tea'),
(@IdBunBoBaTamBT, N'Nước Ngọt', N'Nước giải khát đóng lon', 15000, 'drink', 'soda'),

-- Quán Nhậu Sân Vườn Thảo Điền --
(@IdSanVuonTD, N'Mực Nướng Muối Ớt', N'Mực ống tươi nướng muối ớt thơm nồng', 215000, 'seafood', 'squid,salt,chili'),
(@IdSanVuonTD, N'Bò Một Nắng Xào Lá Lốt', N'Bò một nắng đặc sản xào lá lốt thơm nồng', 245000, 'vietnamese', 'dried beef,betel leaf,garlic'),
(@IdSanVuonTD, N'Gà Đốt Muối Ớt', N'Gà ta đốt than hồng với muối ớt đặc trưng', 295000, 'vietnamese', 'chicken,salt,chili'),
(@IdSanVuonTD, N'Đậu Hũ Chiên Sả Ớt', N'Đậu hũ chiên giòn xào sả ớt thơm lừng', 85000, 'vietnamese', 'tofu,lemongrass,chili'),
(@IdSanVuonTD, N'Bia Heineken Chai', N'Bia Heineken chai lớn', 35000, 'drink', 'beer'),

-- Gà Nướng Lu BT --
(@IdGaNuongLuBT, N'Gà Ngồi Lu Nguyên Con', N'Gà ta nướng trong lu gốm, da giòn thịt thơm khói', 350000, 'vietnamese', 'chicken,charcoal,herb'),
(@IdGaNuongLuBT, N'Gà Nướng Nửa Con', N'Nửa con gà ta nướng lu thơm lừng', 185000, 'vietnamese', 'chicken,charcoal,herb'),
(@IdGaNuongLuBT, N'Gỏi Gà Bắp Chuối', N'Gỏi gà ta xé phay cùng bắp chuối và đậu phộng', 95000, 'vietnamese', 'chicken,banana blossom,peanut,herb'),
(@IdGaNuongLuBT, N'Cháo Gà', N'Cháo gà thơm ngon bổ dưỡng', 55000, 'vietnamese', 'chicken,rice,ginger'),
(@IdGaNuongLuBT, N'Nước Sâm Bí Đao', N'Nước sâm bí đao thanh nhiệt', 20000, 'drink', 'herbal tea'),

-- Bánh Xèo Bà Hạnh --
(@IdBanhXeoBaHanh, N'Bánh Xèo Tôm Thịt', N'Bánh xèo giòn rụm nhân tôm và thịt heo', 75000, 'vietnamese', 'shrimp,pork,bean sprout,egg,flour'),
(@IdBanhXeoBaHanh, N'Bánh Xèo Hải Sản', N'Bánh xèo nhân hải sản phong phú', 95000, 'vietnamese', 'shrimp,squid,scallop,egg,flour'),
(@IdBanhXeoBaHanh, N'Nem Nướng', N'Nem nướng ăn kèm bánh tráng và rau sống', 75000, 'vietnamese', 'pork,rice paper,vegetable'),
(@IdBanhXeoBaHanh, N'Gỏi Cuốn Chay', N'Gỏi cuốn chay nhân rau củ và đậu hũ', 55000, 'vegetarian', 'tofu,vegetable,rice paper'),
(@IdBanhXeoBaHanh, N'Nước Chanh Muối', N'Nước chanh muối giải nhiệt', 20000, 'drink', 'lemon,salt'),

-- Lẩu Bò Tư Đức --
(@IdLauBoTuDuc, N'Lẩu Bò Nhúng Dấm', N'Lẩu bò nhúng dấm chua thanh đặc trưng', 350000, 'vietnamese', 'beef,vinegar,lemongrass,vegetable,noodle'),
(@IdLauBoTuDuc, N'Lẩu Bò Sa Tế', N'Lẩu bò sa tế cay nồng kích thích', 320000, 'vietnamese', 'beef,chili,lemongrass,vegetable,noodle'),
(@IdLauBoTuDuc, N'Bò Nướng Lá Lốt', N'Thịt bò bằm cuộn lá lốt nướng thơm lừng', 125000, 'vietnamese', 'beef,betel leaf,garlic'),
(@IdLauBoTuDuc, N'Bò Một Nắng', N'Bò một nắng đặc sản khô thơm', 155000, 'vietnamese', 'dried beef,lemongrass'),
(@IdLauBoTuDuc, N'Bia Saigon', N'Bia Sài Gòn lon lạnh', 20000, 'drink', 'beer'),

-- Nhà Hàng Seoul BT --
(@IdSeoulBT, N'Bulgogi Bò', N'Thịt bò bulgogi tẩm ướp nướng trên bàn, vị ngọt đậm đà', 195000, 'korean', 'beef,bulgogi sauce,onion,sesame'),
(@IdSeoulBT, N'Samgyupsal', N'Ba chỉ heo nướng bàn ăn kèm kimchi và rau cuốn', 225000, 'korean', 'pork belly,kimchi,lettuce,garlic'),
(@IdSeoulBT, N'Bibimbap', N'Cơm trộn đa sắc màu với rau và trứng ốp la', 145000, 'korean', 'rice,vegetable,egg,gochujang'),
(@IdSeoulBT, N'Canh Kim Chi', N'Canh kim chi chua cay đặc trưng Hàn Quốc', 95000, 'korean', 'kimchi,pork,tofu,chili'),
(@IdSeoulBT, N'Soju', N'Rượu Soju Hàn Quốc', 55000, 'drink', 'soju'),

-- Pizza Home BT --
(@IdPizzaHomeBT, N'Pizza Hải Sản', N'Pizza hải sản với tôm, mực và sốt cà chua', 195000, 'pizza', 'shrimp,squid,tomato sauce,mozzarella'),
(@IdPizzaHomeBT, N'Pizza BBQ Gà', N'Pizza gà nướng sốt BBQ ngọt đậm đà', 185000, 'pizza', 'chicken,bbq sauce,mozzarella,onion'),
(@IdPizzaHomeBT, N'Pizza Margherita', N'Pizza thuần Ý với phô mai và húng quế tươi', 165000, 'pizza', 'tomato sauce,mozzarella,basil'),
(@IdPizzaHomeBT, N'Pasta Carbonara', N'Pasta sốt kem trứng và bacon kiểu Ý', 145000, 'italian', 'pasta,egg,bacon,cream,cheese'),
(@IdPizzaHomeBT, N'Nước Ngọt', N'Nước giải khát đóng lon', 20000, 'drink', 'soda'),

-- Cơm Niêu Sài Gòn --
(@IdComNieuSG, N'Cơm Niêu Cá Kho', N'Cơm niêu đất thơm dẻo ăn kèm cá kho tộ đậm đà', 115000, 'vietnamese', 'rice,fish,chili'),
(@IdComNieuSG, N'Cơm Niêu Sườn Non', N'Cơm niêu với sườn non hầm mềm bổ dưỡng', 135000, 'vietnamese', 'rice,pork rib'),
(@IdComNieuSG, N'Canh Chua Tôm', N'Canh chua tôm tươi chuẩn miền Nam', 85000, 'vietnamese', 'shrimp,pineapple,tomato,tamarind'),
(@IdComNieuSG, N'Rau Muống Xào Tỏi', N'Rau muống xào tỏi giòn ngon', 45000, 'vegetable', 'water spinach,garlic'),
(@IdComNieuSG, N'Trà Đá', N'Trà đá mát lạnh', 10000, 'drink', 'tea'),

-- Bún Thịt Nướng Cô Hạnh --
(@IdBunThitNuongCoHanh, N'Bún Thịt Nướng Đặc Biệt', N'Bún thịt nướng đặc biệt với chả giò và nem nướng', 65000, 'vietnamese', 'pork,spring roll,sausage,noodle,peanut'),
(@IdBunThitNuongCoHanh, N'Bún Thịt Nướng', N'Bún thịt nướng truyền thống thơm lừng', 50000, 'vietnamese', 'pork,noodle,peanut'),
(@IdBunThitNuongCoHanh, N'Chả Giò', N'Chả giò chiên giòn', 20000, 'side_dish', 'pork,vegetable,flour'),
(@IdBunThitNuongCoHanh, N'Nem Nướng', N'Nem nướng thơm đặc trưng', 20000, 'side_dish', 'pork,lemongrass'),
(@IdBunThitNuongCoHanh, N'Trà Đá', N'Trà đá miễn phí', 5000, 'drink', 'tea'),

-- Lẩu Dê Phú Nhuận --
(@IdLauDePN, N'Lẩu Dê Sả Ớt', N'Lẩu dê sả ớt cay nồng thơm đặc trưng', 380000, 'goat', 'goat,lemongrass,chili,herb,noodle'),
(@IdLauDePN, N'Dê Hấp Gừng', N'Dê tươi hấp gừng thanh ngọt tự nhiên', 220000, 'goat', 'goat,ginger,herb'),
(@IdLauDePN, N'Dê Xào Lăn', N'Dê xào sả ớt với 9 vị thơm đặc trưng', 195000, 'goat', 'goat,lemongrass,chili,spices'),
(@IdLauDePN, N'Cháo Dê', N'Cháo dê bằm gừng thơm bổ', 55000, 'goat', 'goat,rice,ginger'),
(@IdLauDePN, N'Bia Tiger', N'Bia Tiger lon lạnh', 22000, 'drink', 'beer'),

-- Nhà Hàng Gà Ri Núi --
(@IdGaRiNui, N'Gà Ri Núi Nướng Nguyên Con', N'Gà ri núi thịt chắc thơm ngon nướng nguyên con', 450000, 'vietnamese', 'chicken,herb,lemongrass'),
(@IdGaRiNui, N'Lẩu Gà Ri Núi Lá Giang', N'Lẩu gà ri núi nấu lá giang chua cay đặc sắc', 380000, 'hotpot', 'chicken,giang leaf,chili,noodle'),
(@IdGaRiNui, N'Gà Xé Phay Bắp Chuối', N'Gà ta xé phay trộn bắp chuối và đậu phộng', 135000, 'vietnamese', 'chicken,banana blossom,peanut,herb'),
(@IdGaRiNui, N'Cháo Gà Ri', N'Cháo gà ri núi thơm bổ dưỡng', 75000, 'vietnamese', 'chicken,rice,ginger'),
(@IdGaRiNui, N'Nước Sâm Thảo Mộc', N'Nước sâm thảo mộc thanh nhiệt', 25000, 'drink', 'herbal tea'),

-- Quán Bún Mắm PN --
(@IdBunMamPN, N'Bún Mắm Đặc Biệt', N'Bún mắm đặc biệt với tôm, mực, cá và heo quay', 85000, 'vietnamese', 'fermented fish,shrimp,squid,fish,pork,noodle,vegetable'),
(@IdBunMamPN, N'Bún Mắm Hải Sản', N'Bún mắm hải sản thập cẩm tươi ngon', 95000, 'vietnamese', 'fermented fish,shrimp,squid,fish,noodle'),
(@IdBunMamPN, N'Bún Mắm Chay', N'Bún mắm chay với đậu hũ và rau củ', 65000, 'vegetarian', 'tofu,vegetable,noodle'),
(@IdBunMamPN, N'Rau Sống', N'Đĩa rau sống ăn kèm bún mắm', 20000, 'side_dish', 'vegetable'),
(@IdBunMamPN, N'Nước Sâm', N'Nước sâm thảo mộc thanh mát', 15000, 'drink', 'herbal tea'),

-- Bánh Canh Ghẹ PN --
(@IdBanhCanhGhePN, N'Bánh Canh Ghẹ Đặc Biệt', N'Bánh canh ghẹ đặc biệt với tôm, mực và chả cá', 95000, 'vietnamese', 'blue crab,shrimp,squid,fish cake,noodle'),
(@IdBanhCanhGhePN, N'Bánh Canh Ghẹ Thường', N'Bánh canh ghẹ truyền thống đậm đà', 75000, 'vietnamese', 'blue crab,noodle'),
(@IdBanhCanhGhePN, N'Bánh Canh Tôm', N'Bánh canh tôm sú tươi ngọt', 75000, 'vietnamese', 'shrimp,noodle'),
(@IdBanhCanhGhePN, N'Chả Cá', N'Chả cá chiên vàng giòn ăn kèm', 35000, 'side_dish', 'fish cake'),
(@IdBanhCanhGhePN, N'Trà Đá', N'Trà đá giải nhiệt', 5000, 'drink', 'tea'),

-- Chay Garden PN --
(@IdChayGardenPN, N'Cơm Chay Thập Cẩm', N'Cơm chay đầy đủ các món: canh, xào, kho và đồ chiên', 75000, 'vegetarian', 'tofu,mushroom,vegetable,rice'),
(@IdChayGardenPN, N'Bún Bò Chay', N'Bún bò chay với chả chay và đậu hũ', 65000, 'vegetarian', 'tofu,mushroom,noodle,lemongrass'),
(@IdChayGardenPN, N'Lẩu Chay Nấm', N'Lẩu chay nấm thập cẩm bổ dưỡng', 185000, 'hotpot', 'mushroom,tofu,vegetable,noodle'),
(@IdChayGardenPN, N'Sinh Tố Bơ', N'Sinh tố bơ béo ngậy', 45000, 'drink', 'avocado,milk,sugar'),
(@IdChayGardenPN, N'Nước Ép Rau Củ', N'Nước ép rau củ hỗn hợp giàu vitamin', 40000, 'drink', 'vegetable,fruit'),

-- Bò Né PN --
(@IdBoNePN, N'Bò Né Đặc Biệt', N'Bò né chảo: bò, trứng ốp la, pate, xúc xích và bánh mì', 65000, 'vietnamese', 'beef,egg,pate,sausage,bread'),
(@IdBoNePN, N'Bò Né Thường', N'Bò né truyền thống với trứng và bánh mì', 50000, 'vietnamese', 'beef,egg,bread'),
(@IdBoNePN, N'Trứng Ốp La', N'Thêm trứng ốp la cho bữa sáng', 15000, 'side_dish', 'egg'),
(@IdBoNePN, N'Cà Phê Sữa', N'Cà phê sữa đá truyền thống Việt Nam', 25000, 'drink', 'coffee,condensed milk'),
(@IdBoNePN, N'Nước Cam', N'Nước cam vắt tươi', 25000, 'drink', 'orange'),

-- Nhà Hàng Nhật Fuji PN --
(@IdFujiPN, N'Sashimi Cá Hồi', N'Cá hồi Na Uy tươi thái lát dày', 185000, 'japanese', 'salmon'),
(@IdFujiPN, N'Tempura Tôm', N'Tôm sú tươi bọc bột chiên giòn kiểu Nhật', 165000, 'japanese', 'shrimp,flour,egg'),
(@IdFujiPN, N'Ramen Shoyu', N'Ramen sốt shoyu trứng lòng đào và thịt char siu', 175000, 'japanese', 'pork,ramen noodle,egg,soy sauce'),
(@IdFujiPN, N'Takoyaki', N'Bánh bạch tuộc tròn truyền thống Osaka', 85000, 'japanese', 'octopus,flour,bonito,mayo'),
(@IdFujiPN, N'Matcha Latte', N'Trà xanh matcha pha sữa tươi', 65000, 'drink', 'matcha,milk'),

-- Hải Sản Tân Phú Nhuận --
(@IdHaiSanPN, N'Lẩu Hải Sản Thập Cẩm', N'Lẩu hải sản với tôm, cua, mực và nghêu', 450000, 'seafood', 'shrimp,crab,squid,clam,vegetable,noodle'),
(@IdHaiSanPN, N'Tôm Sú Hấp Bia', N'Tôm sú tươi hấp bia giữ nguyên vị ngọt tự nhiên', 320000, 'seafood', 'shrimp,beer,lemongrass'),
(@IdHaiSanPN, N'Cá Mú Hấp Xì Dầu', N'Cá mú tươi hấp xì dầu gừng hành kiểu Hoa', 450000, 'seafood', 'grouper,soy sauce,ginger,onion'),
(@IdHaiSanPN, N'Nghêu Xào Sả Ớt', N'Nghêu tươi xào sả ớt thơm cay', 125000, 'seafood', 'clam,lemongrass,chili'),
(@IdHaiSanPN, N'Cơm Trắng', N'Cơm trắng dẻo ăn kèm hải sản', 15000, 'side_dish', 'rice');

GO