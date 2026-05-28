USE travel_food_db;
GO

BEGIN TRANSACTION;

-- ==========================================
-- 1. THÊM DỮ LIỆU QUÁN
-- ==========================================
INSERT INTO Restaurants (name, address, lat, lng, rating, price_range, open_time, close_time, type) VALUES
(N'Mì Quảng Cô Hoa - Thủ Đức', N'Đ. Quảng Trường Sáng Tạo, Đông Hòa, TP. Hồ Chí Minh', 10.873919, 106.799769, 4.9, 40000, '07:00', '18:00', N'vietnamese, bình dân'),
(N'Bánh Mì PewPew - Gò Vấp', N'Đường Quang Trung, Phường 10, Quận Gò Vấp, TP. Hồ Chí Minh', 10.832910, 106.666920, 4.6, 35000, '06:00', '22:00', N'vietnamese, bình dân'),
(N'Út Cà Mau', N'215 Điện Biên Phủ, Phường 6, Quận 3, TP. Hồ Chí Minh', 10.781210, 106.690120, 4.8, 150000, '10:00', '23:00', N'vietnamese, hải sản');

-- ==========================================
-- KHAI BÁO BIẾN LẤY ID CỦA 3 QUÁN
-- ==========================================
DECLARE @IdMiQuang INT = (SELECT id FROM Restaurants WHERE name = N'Mì Quảng Cô Hoa - Thủ Đức');
DECLARE @IdPewPew INT = (SELECT id FROM Restaurants WHERE name = N'Bánh Mì PewPew - Gò Vấp');
DECLARE @IdUtCaMau INT = (SELECT id FROM Restaurants WHERE name = N'Út Cà Mau');

-- ==========================================
-- 2. THÊM MÓN ĂN VÀO MENU
-- ==========================================
INSERT INTO MenuItems (restaurant_id, name, description, price, food_type, ingredients) VALUES
-- Menu Mì Quảng Cô Hoa
(@IdMiQuang, N'Mì Quảng Tôm Thịt', N'Mì quảng truyền thống với tôm đất và thịt heo', 30000, 'vietnamese', 'noodle,shrimp,pork,herbs'),
(@IdMiQuang, N'Mì Quảng Gà', N'Mì quảng gà ta thả vườn đậm vị', 35000, 'vietnamese', 'noodle,chicken,herbs'),
(@IdMiQuang, N'Mì Quảng Thập Cẩm', N'Mì quảng đặc biệt đầy đủ topping', 45000, 'vietnamese', 'noodle,shrimp,pork,chicken,egg,herbs'),

-- Menu Bánh Mì PewPew
(@IdPewPew, N'Bánh Mì Thập Cẩm', N'Bánh mì thập cẩm đặc biệt với chả, xíu mại, thịt nguội, pate', 35000, 'vietnamese', 'bread,pork,pate,cucumber,herbs'),
(@IdPewPew, N'Bánh Mì Gà Xá Xíu', N'Bánh mì nhân gà xá xíu đậm đà, nước sốt đặc biệt', 30000, 'vietnamese', 'bread,chicken,sauce,cucumber,herbs'),
(@IdPewPew, N'Bánh Mì Bò Tiêu Đen', N'Bánh mì bò xốt tiêu đen thơm lừng, thịt mềm ngọt', 40000, 'vietnamese', 'bread,beef,black pepper sauce,herbs'),

-- Menu Út Cà Mau
(@IdUtCaMau, N'Lẩu Cua Bầu', N'Nước lẩu thanh ngọt từ bầu kết hợp với cua Cà Mau gạch chắc nịch, tạo nên hương vị đặc trưng miền Tây.', 350000, 'vietnamese', 'crab,gourd,broth,vegetables,herbs'),
(@IdUtCaMau, N'Cua Sốt Trứng Muối', N'Cua nguyên con chiên giòn rụm áo đều lớp sốt trứng muối mặn ngọt, béo ngậy cực kỳ bắt miệng.', 250000, 'vietnamese', 'crab,salted egg yolk,butter,garlic'),
(@IdUtCaMau, N'Miến Xào Cua', N'Miến xào tơi xốp, không bị nát, quyện cùng thớ thịt cua biển tươi ngọt và rau củ thanh mát.', 150000, 'vietnamese', 'glass noodle,crab,vegetables,soy sauce');

-- ==========================================
-- 3. THÊM ẢNH MÓN ĂN
-- ==========================================
INSERT INTO DishImages (menu_item_id, image_url)
-- Ảnh Mì Quảng Cô Hoa
SELECT id, 'https://www.bing.com/images/search?view=detailV2&ccid=PAXvKG2t&id=2887ED48909B0DB3001FCF3F6D105B7C864DE307&thid=OIP.PAXvKG2tiEQzJmJ-qIWRzQHaEK&mediaurl=https%3A%2F%2Fhelenrecipes.com%2Fwp-content%2Fuploads%2F2021%2F05%2FScreenshot-2021-05-31-142423-1200x675.png&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.3c05ef286dad88443326627ea88591cd%3Frik%3DB%252bNNhnxbEG0%252fzw%26pid%3DImgRaw%26r%3D0&exph=675&expw=1200&q=M%C3%AC+Qu%E1%BA%A3ng+T%C3%B4m+Th%E1%BB%8Bt+Tr%E1%BB%A9ng&form=IRPRST&ck=A1FCDAE19C350CE94DBB274F175CF56D&selectedindex=0&itb=0&cw=786&ch=359&ajaxhist=0&ajaxserp=0&vt=0&sim=11' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Tôm Thịt' UNION ALL
SELECT id, 'https://www.bing.com/images/search?view=detailV2&ccid=WlTNq4am&id=5A01DC130C2EBD2BD090A7C21FE3EA81717786A4&thid=OIP.WlTNq4am-xbCBq9AdMcSjgHaEK&mediaurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fg3V_oNeMdHs%2Fmaxresdefault.jpg&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.5a54cdab86a6fb16c206af4074c7128e%3Frik%3DpIZ3cYHq4x%252fCpw%26pid%3DImgRaw%26r%3D0&exph=720&expw=1280&q=M%C3%AC+Qu%E1%BA%A3ng+g%C3%A0&FORM=IRPRST&ck=D36C329C0CE5E3989C2A5CAD57865700&selectedIndex=0&itb=0&cw=786&ch=359&ajaxhist=0&ajaxserp=0' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Gà' UNION ALL
SELECT id, 'https://www.cooking-therapy.com/wp-content/uploads/2023/08/Bun-Thit-Nuong-14-1024x1536.jpg' FROM MenuItems WHERE restaurant_id = @IdMiQuang AND name = N'Mì Quảng Thập Cẩm' UNION ALL

-- Ảnh Bánh Mì PewPew
SELECT id, 'https://tse1.mm.bing.net/th/id/OIP.etFgfIBEqNCRGIIdqA49zwHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3' FROM MenuItems WHERE restaurant_id = @IdPewPew AND name = N'Bánh Mì Thập Cẩm' UNION ALL
SELECT id, 'https://tse3.mm.bing.net/th/id/OIP.8OJQFlykTi70sd8Za5wWRAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3' FROM MenuItems WHERE restaurant_id = @IdPewPew AND name = N'Bánh Mì Gà Xá Xíu' UNION ALL
SELECT id, 'https://chandat.net/wp-content/uploads/2018/11/Banh-mi-Bo-Tieu-Den-1.jpg' FROM MenuItems WHERE restaurant_id = @IdPewPew AND name = N'Bánh Mì Bò Tiêu Đen' UNION ALL

-- Ảnh Út Cà Mau
SELECT id, 'https://hieuhaisan.com/contents_hieuhaisan/uploads/images/lau-cua-nau-bau.jpg' FROM MenuItems WHERE restaurant_id = @IdUtCaMau AND name = N'Lẩu Cua Bầu' UNION ALL
SELECT id, 'https://tse2.mm.bing.net/th/id/OIP.iK52SFC5KbiTkO-iNZ_VowHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3' FROM MenuItems WHERE restaurant_id = @IdUtCaMau AND name = N'Cua Sốt Trứng Muối' UNION ALL
SELECT id, 'https://th.bing.com/th/id/OIP.9_g75naKDa7xUMd1JcOkTgHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3' FROM MenuItems WHERE restaurant_id = @IdUtCaMau AND name = N'Miến Xào Cua';

-- ==========================================
-- 4. THÊM CÂU CHUYỆN QUÁN (STORIES)
-- ==========================================
INSERT INTO RestaurantStories (restaurant_id, story, updated_at) VALUES 
(@IdMiQuang, N'Quán ăn được cô Hoa, người dân miền Trung mở với mong muốn mang hương vị mì quảng đích thực đến với Sài Gòn, đặc biệt là các bạn sinh viên Làng Đại Học. Quán là lựa chọn đông đảo vào giờ trưa của các bạn sinh viên trường ĐH KHTN.', GETDATE()),
(@IdPewPew, N'Từ một streamer đình đám với những buổi livestream bùng nổ, PewPew đã rẽ hướng để theo đuổi đam mê ẩm thực. "Bánh Mì PewPew" ra đời từ tâm huyết của anh chàng muốn nâng tầm món ăn đường phố. Không còn ngồi sau màn hình, PewPew giờ đây dành trọn sự tỉ mỉ cho từng ổ bánh giòn rụm cùng phần nhân đậm đà. Thưởng thức bánh mì ở đây, thực khách không chỉ nếm trọn hương vị tuyệt hảo mà còn cảm nhận được sự nhiệt thành, gần gũi, chân chất y hệt phong cách của chính anh trên sóng trực tiếp.', GETDATE()),
(@IdUtCaMau, N'Nhắc đến cua biển ngon tại Sài Gòn, Út Cà Mau từ lâu đã là một biểu tượng bảo chứng cho chất lượng. Quán tự hào mang trọn vẹn tinh hoa ẩm thực miền Tây Nam Bộ lên bàn tiệc với nguồn nguyên liệu cua chính gốc Cà Mau, được tuyển chọn khắt khe mỗi ngày. Điểm nhấn làm nên tên tuổi của quán chính là món Lẩu Cua Bầu thanh mát, ngọt vị tự nhiên, cùng Cua Sốt Trứng Muối béo ngậy. Với không gian rộng rãi, mộc mạc và phong cách phục vụ chu đáo, Út Cà Mau là điểm hẹn lý tưởng để gia đình và bạn bè cùng quây quần thưởng thức những bữa tiệc hải sản tươi ngon, đậm đà tình quê.', GETDATE());

COMMIT TRANSACTION;
GO