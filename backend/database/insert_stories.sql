-- File SQL backup dữ liệu câu chuyện quán ăn (RestaurantStories)
-- Tự động giải quyết lệch ID giữa các máy thành viên bằng cách dò theo [name]
-- Tạo tự động bằng tool Go nâng cấp

BEGIN TRANSACTION;

-- Câu chuyện cho quán: Cháo Sườn Cô Giang - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Quận 1 tấp nập, Cháo Sườn Cô Giang là điểm dừng chân ấm áp, nơi hương vị truyền thống được gìn giữ vẹn nguyên. Mỗi tô cháo sườn sánh mịn, ngọt xương hầm, hòa quyện thịt bằm và trứng bách thảo đều được Cô Giang nấu bằng tất cả tấm lòng. Đây là món quà giản dị mà thân thương, khơi gợi ký ức tuổi thơ và mang đến trải nghiệm ẩm thực Sài Gòn đậm đà. Hãy ghé 15bis Đinh Tiên Hoàng để cảm nhận sự đặc biệt đã làm nên tên tuổi Cháo Sườn Cô Giang.' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Sườn Cô Giang - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nem Nướng Nha Trang - Since 1982 - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Từ năm 1982, Nem Nướng Nha Trang đã lặng lẽ ẩn mình trong con hẻm Quận 1, gìn giữ hương vị tinh túy qua bao thế hệ. Mỗi xiên nem nướng thơm lừng, vàng óng, giòn rụm hòa quyện cùng nước chấm "bí truyền" đậm đà chính là cả tấm lòng người đầu bếp. Ghé quán, bạn không chỉ thưởng thức món ăn trứ danh mà còn cảm nhận sự ấm áp, gần gũi như trở về nhà. Hãy để Nem Nướng Nha Trang kể câu chuyện ẩm thực đầy hoài niệm cho vị giác của bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Phủ Trứng Sốt Sệt - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Cơm Phủ Trứng Sốt Sệt Quận 1, nơi hương vị Á Đông quen thuộc được nâng tầm với lớp trứng sốt sệt vàng ươm, béo ngậy tan chảy trên từng hạt cơm dẻo thơm. Từ cá hồi béo ngậy đến bạch tuộc giòn sần sật, mỗi suất cơm là một bản giao hưởng vị giác khó quên. Tại số 7B Tôn Thất Tùng, chúng tôi mang đến bữa ăn ấm lòng, ngon miệng chuẩn bình dân nhưng chất lượng chẳng thua kém. Ghé thăm để tận hưởng sự giao thoa độc đáo này nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Phủ Trứng Sốt Sệt - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Ốc Sườn Cô Sáu - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bún Ốc Sườn Cô Sáu, mỗi tô bún là cả tâm huyết của người đầu bếp. Nước lèo chua cay mặn ngọt hài hòa, thơm lừng vị ốc to giòn sần sật, sườn mềm tan và bò tươi ngon, hứa hẹn đánh thức mọi giác quan. Một góc bình yên giữa lòng Quận 1 sôi động, nơi hương vị truyền thống được gìn giữ và yêu thương, mang đến trải nghiệm ẩm thực ấm áp như nhà làm.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Ốc Sườn Cô Sáu - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì 1 Phút 30 Giây - Lạc Long Quân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Mì 1 Phút 30 Giây - Lạc Long Quân là địa chỉ quen thuộc cho những ai yêu thích sự nhanh gọn mà vẫn tròn vị. Chỉ trong tích tắc, bạn đã có ngay các combo Hamburger, Hotdog hay Pita Tôm nóng hổi, giòn tan, chuẩn bị tỉ mỉ để mỗi miếng đều là một trải nghiệm đáng nhớ. Chúng tôi mang đến hương vị tuyệt hảo cùng thức uống sảng khoái, xua tan mọi mệt mỏi. Đừng quên ghé 219 Lạc Long Quân để tận hưởng bữa ăn chất lượng giữa lòng Sài Gòn bận rộn!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì 1 Phút 30 Giây - Lạc Long Quân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Kem Phương Loan Quận 1 - Cống Quỳnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Nằm giữa lòng Quận 1 sôi động, Bánh Kem Phương Loan 185F Cống Quỳnh là điểm hẹn ngọt ngào với hương vị 4.9 sao được yêu mến. Từ những chiếc Pannacotta thanh mát, bùng nổ vị giác, đến Bông lan cuộn kem mềm mịn quen thuộc, và Bánh kem Hàn Quốc tinh tế cho mọi dịp đặc biệt. Mỗi chiếc bánh đều gói trọn tâm huyết, mang đến niềm vui trọn vẹn và khó quên cho thực khách. Hãy ghé Phương Loan để tìm thấy vị ngọt của hạnh phúc ngay hôm nay!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Kem Phương Loan Quận 1 - Cống Quỳnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trà Sữa Thế Giới - Nguyễn Du
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Sài Gòn sôi động, Trà Sữa Thế Giới - Nguyễn Du mời bạn ghé chân thưởng thức một "thế giới" hương vị thật riêng. Từ Trà Sữa Lài Mật Ong thơm dịu đến Trà Việt Quất hay Trà Đào Trân Châu tươi mát, mỗi ly trà đều được ủ ấp sự tận tâm. Nơi đây là điểm dừng chân lý tưởng để nạp năng lượng và tận hưởng khoảnh khắc bình yên.' AS story 
    FROM Restaurants 
    WHERE name = N'Trà Sữa Thế Giới - Nguyễn Du'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Chay Diệu Hạnh - Tân Thới Nhất 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại 75/6Bis Tân Thới Nhất, Quán Chay Diệu Hạnh là một góc nhỏ bình yên, nơi những món chay thuần Việt được nấu bằng cả tấm lòng. Từ đĩa cơm rau tươi xanh mướt, đậu hũ kho đậm đà đến chiếc bánh bao chay mềm thơm, mỗi hương vị đều gói trọn sự mộc mạc và chân thành. Hãy ghé Diệu Hạnh để cảm nhận bữa chay ấm áp, chuẩn vị nhà làm, tiếp thêm năng lượng cho ngày dài.' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Chay Diệu Hạnh - Tân Thới Nhất 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Mắm Nêm Chị Linh Quận 1 - 15 Lê Thánh Tôn
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bún Mắm Nêm Chị Linh Quận 1 tại 15 Lê Thánh Tôn là nơi lưu giữ hồn Việt trong từng món ăn bình dị, chuẩn vị. Đến đây, bạn sẽ được thưởng thức những hương vị đặc trưng, từ gỏi đu đủ thanh mát đến combo bánh hỏi heo quay đậm đà, được Chị Linh gửi gắm trọn vẹn cái tâm. Không gian ấm cúng, thân quen hứa hẹn mang đến trải nghiệm ẩm thực như bữa cơm nhà đầy ắp tình cảm.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Mắm Nêm Chị Linh Quận 1 - 15 Lê Thánh Tôn'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Vua Gà Tần - Since 1999 - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Vua Gà Tần - Since 1999, hơn hai thập kỷ qua đã tận tâm giữ trọn tinh hoa gà tần truyền thống ngay giữa lòng Quận 1. Tại đây, bạn sẽ được thưởng thức món gà hầm bổ dưỡng, thấm đẫm hương vị đặc trưng, được chế biến từ tâm huyết và công thức gia truyền. Cùng với rau ngải cứu hầm mềm mại, măng chua ngâm ớt giòn cay và bánh mì nóng giòn, tất cả hòa quyện tạo nên một trải nghiệm ẩm thực Việt ấm cúng và khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Vua Gà Tần - Since 1999 - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Tần Gia Bảo - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình tại con hẻm nhỏ TK24/9 Nguyễn Cảnh Chân, Gà Tần Gia Bảo - Quận 1 là điểm hẹn cho hương vị gà tiềm thuốc bắc, ngải cứu chuẩn vị gia truyền. Mỗi phần gà ta tươi ngon, được hầm tỉ mỉ cùng thảo mộc quý, chắt chiu nên món ăn bổ dưỡng, thơm lừng nức mũi, ấm lòng thực khách. Với 4.8/5 sao từ hàng ngàn lời khen, chúng tôi tự hào mang đến bữa ăn chất lượng như nhà làm. Mời bạn ghé và cảm nhận tinh hoa ẩm thực ''Gia Bảo'' của Sài Gòn!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Tần Gia Bảo - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về một góc nhỏ 42/2 Trần Đình Xu, Cô Thảo Tôm Cá mang đến bí quyết "ngâm tương" chuẩn Hàn đầy lôi cuốn ngay tại Quận 1. Từng lát cá hồi Nauy tươi rói, tôm và trứng ngấm trọn vị nước tương độc quyền, tạo nên hương vị đậm đà khó cưỡng. Dù là cơm gạo lứt bổ dưỡng hay set tôm cá hấp dẫn, mỗi suất ăn mang về đều gói trọn cái tâm của Cô Thảo. Hứa hẹn một bữa ăn trọn vị, ấm lòng và khó quên cho bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Xôi Mềm - CN Nguyễn Trãi Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tiệm Xôi Mềm Nguyễn Trãi là nơi chúng tôi gói trọn tinh hoa ẩm thực đường phố vào một không gian thanh lịch, đầy tinh tế. Từng hạt nếp được chọn lựa kỹ lưỡng tạo nên độ mềm dẻo đặc trưng, hòa quyện hoàn hảo với thịt kho trứng kho đậm đà hay chà bông, chả mỡ thơm lừng. Mỗi phần xôi không chỉ là món ăn, mà còn là cả tấm lòng và ký ức tuổi thơ ấm áp, mời bạn ghé và cảm nhận.' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Xôi Mềm - CN Nguyễn Trãi Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: BẾP LÀNH QUẬN 1 - COFFEE, TEA & CƠM VĂN PHÒNG
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Trong con hẻm nhỏ yên bình giữa lòng Quận 1, Bếp Lành Quận 1 chào đón bạn với bữa trưa ngon miệng và đầy tâm huyết. Mỗi phần cơm văn phòng đều được chế biến kỹ lưỡng, mang hương vị quen thuộc và tốt cho sức khỏe. Đừng quên thử Matcha Latte Dâu đặc trưng, một sự kết hợp độc đáo mang lại sự sảng khoái bất ngờ. Hãy để Bếp Lành là nơi bạn tìm thấy năng lượng tích cực cho một ngày dài.' AS story 
    FROM Restaurants 
    WHERE name = N'BẾP LÀNH QUẬN 1 - COFFEE, TEA & CƠM VĂN PHÒNG'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Highlands Coffee - Trà, Cà Phê & Bánh - 46 Bùi Thị Xuân - Quận 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Highlands Coffee Bùi Thị Xuân, giữa nhịp sống hối hả Quận 1, bạn sẽ tìm thấy một không gian sang trọng và ấm cúng để thư thái. Thưởng thức ly Trà Sen Vàng trứ danh, với hương sen thanh tao quyện trong vị trà đậm đà, khơi gợi xúc cảm khó quên. Nơi đây là điểm đến lý tưởng để bạn gác lại lo toan, tận hưởng những khoảnh khắc an yên và chất lượng.' AS story 
    FROM Restaurants 
    WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - 46 Bùi Thị Xuân - Quận 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hủ Tiếu Cô Tám Quận 1 - Nguyễn Thái Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Hủ Tiếu Cô Tám Quận 1 để tìm lại hương vị Sài Gòn thân thương, nơi mỗi tô hủ tiếu là cả một tâm huyết được gửi gắm. Nước lèo ngọt thanh từ xương hầm kỹ, sợi hủ tiếu dai mềm cùng topping chất lượng tạo nên món ăn chuẩn vị, ấm lòng. Với rating 4.8 sao, quán bình dân đối diện 81 Nguyễn Thái Bình luôn là điểm đến lý tưởng cho bữa ăn ngon, đậm đà.' AS story 
    FROM Restaurants 
    WHERE name = N'Hủ Tiếu Cô Tám Quận 1 - Nguyễn Thái Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Bò Sa Tế Sả Quận 3 - Nguyễn Thông
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé 37B Nguyễn Thông, bạn sẽ tìm thấy hương vị Bún Bò Sa Tế Sả trứ danh, nơi mỗi tô bún là một câu chuyện thấm đượm gia vị truyền thống. Điểm nhấn chính là sự kết hợp độc đáo của sa tế thơm lừng cùng sả cay nồng, tạo nên tô Bún Bò Khô hay Nước đậm đà khó quên, chuẩn vị bình dân mà tinh tế. Thêm chén Bánh Mì Xíu Mại nóng hổi, bạn sẽ có một bữa ăn tròn vị, đậm chất Sài Gòn. Hãy đến và trải nghiệm hương vị đã làm nên 4.3 sao của chúng tôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Bò Sa Tế Sả Quận 3 - Nguyễn Thông'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Big Feet - Chân Gà Đông Tảo Hấp Hành - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Big Feet, nơi Chân Gà Đông Tảo Hưng Yên trứ danh được nâng tầm thành những món nhậu khó quên. Từ chân gà hấp mắm nhĩ đậm đà lôi cuốn đến món hầm táo đỏ hạt sen thơm lừng bổ dưỡng, mỗi hương vị đều là tâm huyết chúng tôi gửi gắm. Ghé 52/3 Lý Chính Thắng, Quận 3 để cùng bạn bè tận hưởng không gian ấm cúng và những bữa tiệc vị giác thật sự đặc biệt.' AS story 
    FROM Restaurants 
    WHERE name = N'Big Feet - Chân Gà Đông Tảo Hấp Hành - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tre Tre - Gà Nướng Ống Tre Tây Bắc - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tre Tre - Gà Nướng Ống Tre Tây Bắc mang cả hương vị núi rừng Tây Bắc về giữa lòng Sài Gòn tại Quận 3. Đến đây, bạn sẽ được thưởng thức những chú gà, vịt tuyển chọn được nướng chậm trong ống tre, từng thớ thịt mọng nước đượm mùi thơm đặc trưng khó cưỡng. Với không gian ấm cúng và món ăn độc đáo, Tre Tre hứa hẹn mang đến trải nghiệm ẩm thực gia đình khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Tre Tre - Gà Nướng Ống Tre Tây Bắc - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hanyang - Gà Tre Hầm Sâm Hàn Quốc - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Hanyang, chúng tôi tin rằng mỗi món ăn là một câu chuyện về sự tận tâm. Nổi tiếng với nồi gà hầm sâm Hàn Quốc nguyên con, từ gà vườn cho đến gà đen Sa Pa, mỗi phần đều được ủ vị kỹ lưỡng, mang đến hương thơm ấm nồng và dưỡng chất phục hồi. Bước vào Hanyang, bạn sẽ tìm thấy một không gian ấm cúng để thưởng thức những tinh hoa ẩm thực, đậm đà tình cảm giữa lòng Quận 3.' AS story 
    FROM Restaurants 
    WHERE name = N'Hanyang - Gà Tre Hầm Sâm Hàn Quốc - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lão Trư - Chân Gà Hấp Tàu Xì - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Lão Trư và khám phá một góc nhỏ ấm cúng giữa lòng Quận 3, nơi tụ hội những món nhậu Á Đông thấm đượm hương vị tuổi thơ và tình bằng hữu. Đặc biệt, những đôi chân gà Đông Tảo trứ danh tại đây được chế biến thủ công, từ hương tàu xì đậm đà đến mắm nhĩ thơm lừng hay trộn thính giòn rụm, mỗi món đều mang một nét riêng khó quên. Chúng tôi tin rằng, cái tâm tỉ mỉ trong từng món ăn sẽ chạm đến trái tim bạn. Hãy đến Lão Trư để cùng sẻ chia khoảnh khắc và tạo nên những kỷ niệm đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Lão Trư - Chân Gà Hấp Tàu Xì - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Thằng Bờm - Gà Lam Ống Nứa Tây Nguyên - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Thằng Bờm, bạn sẽ tìm thấy một phần hồn Tây Nguyên ấm áp giữa lòng Sài Gòn. Mỗi món gà vườn hay vịt cherry lam ống nứa đều được nướng cẩn thận, thấm đẫm hương tre nứa tự nhiên, cho thịt mềm mọng và vị ngọt khó quên. Đây là nơi lý tưởng để gia đình quây quần, cùng nhau tận hưởng bữa ăn đậm đà bản sắc và tràn đầy tình cảm. Hãy đến và để Thằng Bờm kể câu chuyện hương vị riêng cho bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Thằng Bờm - Gà Lam Ống Nứa Tây Nguyên - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Thìn - Bà Huyện Thanh Quan
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Phở Thìn - Bà Huyện Thanh Quan mang trọn vẹn hương vị phở Hà Nội chuẩn mực đến giữa lòng Sài Gòn sôi động. Từng tô phở tái lăn đặc trưng hay phở sốt vang lạ miệng đều được nấu bằng cái tâm, từ nước dùng ninh xương công phu đến miếng thịt thơm lừng. Ghé Phở Thìn, bạn không chỉ thưởng thức món ngon mà còn tìm thấy một góc bình yên, ấm cúng và đậm đà bản sắc Việt.' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Thìn - Bà Huyện Thanh Quan'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: GÀ ĐẤT - Gà Đất Sét Ôm Xôi & Gà Nướng Nồi Đất - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại GÀ ĐẤT, chúng tôi gói trọn tinh hoa ẩm thực Việt trong từng món gà được ủ đất sét hay nướng nồi đất đầy tâm huyết. Từ gà đen Tây Bắc ôm xôi trắng mộc mạc đến gà Đông Tảo Hưng Yên trứ danh, mỗi nguyên liệu được chọn lọc kỹ càng và chế biến theo bí quyết gia truyền. Hãy tìm đến con hẻm nhỏ 52/1/1 Lý Chính Thắng để thưởng thức hương vị độc đáo, ấm áp như bữa cơm nhà, nơi mọi khoảnh khắc đều trở nên thật đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'GÀ ĐẤT - Gà Đất Sét Ôm Xôi & Gà Nướng Nồi Đất - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Đốt Kampot - Đặc Sản Hà Tiên - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gà Đốt Kampot là nơi hội tụ tinh hoa ẩm thực độc lạ từ Hà Tiên, mang đến trải nghiệm vị giác khó quên ngay giữa lòng Quận 3. Từng con gà vườn, vịt Cherry hay gà H''Mông quý hiếm đều được tẩm ướp và đốt thủ công theo công thức gia truyền, dậy mùi thơm nức mũi và giữ trọn vị ngọt tự nhiên. Ghé 52/1 Lý Chính Thắng để thưởng thức hương vị đặc trưng, đánh thức mọi giác quan và cảm nhận sự tâm huyết trong từng món ăn. Chắc chắn bạn sẽ tìm thấy một "đặc sản" của riêng mình tại đây!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Đốt Kampot - Đặc Sản Hà Tiên - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Vịt Khói - Đặc Sản Xôi Vịt Trời Tây Bắc - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình tại con hẻm Quận 3, Vịt Khói là chốn dừng chân cho những ai mê mẩn hương vị Tây Bắc nguyên bản. Nơi đây, vịt trời được tuyển chọn và hun khói thủ công, tạo nên vị ngon độc đáo thấm đẫm từng thớ thịt. Từ đĩa xôi vịt trời áp chảo giòn rụm đến mẹt vịt 5 món sum vầy, mỗi món là câu chuyện về cái tâm người đầu bếp. Mời gọi bạn cùng gia đình khám phá bữa ăn ấm cúng, đậm đà khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Vịt Khói - Đặc Sản Xôi Vịt Trời Tây Bắc - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: O Thum - Gà Không Lối Thoát & Gà Đốt Lá Chúc - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại O Thum, chúng tôi tự hào mang đến trải nghiệm ẩm thực độc đáo khó quên với món Gà Không Lối Thoát trứ danh. Mỗi con gà vườn, gà H''Mông hay chân gà Đông Tảo được bao bọc khéo léo trong lớp xôi giòn rụm, từ truyền thống đến ngũ sắc Tây Bắc thấm đượm hương vị đậm đà khó cưỡng. Đây không chỉ là món ăn, mà còn là tâm huyết chúng tôi gửi gắm. Mời bạn ghé O Thum để khám phá hương vị có một không hai!' AS story 
    FROM Restaurants 
    WHERE name = N'O Thum - Gà Không Lối Thoát & Gà Đốt Lá Chúc - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Ủ Muối Deli - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gà Ủ Muối Deli - Quận 3 mời bạn khám phá một hành trình hương vị Việt Nam chân thật, đậm đà ngay giữa lòng thành phố. Từ Gà Đông Tảo Hưng Yên ủ muối thảo mộc công phu đến Gà vườn nướng ống tre Tây Bắc thơm lừng, mỗi món là cả tâm huyết và bí quyết riêng biệt. Thưởng thức miếng thịt mềm ngọt, da giòn thơm, thấm đượm gia vị, bạn sẽ cảm nhận được sự ấm áp và hài lòng trong từng thớ thịt. Ghé Deli để mang về món ngon chuẩn vị, biến bữa ăn tại nhà thêm phần đặc sắc!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Ủ Muối Deli - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: GUTA CAFE - 8 Bà Huyện Thanh Quan
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Với 4.8 sao, GUTA CAFE - 8 Bà Huyện Thanh Quan tự hào là điểm đến quen thuộc, nơi bạn tìm thấy năng lượng và sự thoải mái mỗi ngày. Từng giọt Trà sữa Oolong đặc biệt, Matcha Latte thanh mát hay chiếc Bánh Mì Que Pate Chà Bông giòn rụm đều được chuẩn bị với tất cả tâm huyết. Ghé GUTA, để mỗi khoảnh khắc đều trở nên ấm áp và ngon miệng khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'GUTA CAFE - 8 Bà Huyện Thanh Quan'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: A Phủ - Gà Hấp Nước Tương - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về A Phủ trong con hẻm yên bình 52/3 Lý Chính Thắng, bạn sẽ khám phá bí quyết của món Gà Hấp Nước Tương làm nên tên tuổi. Chúng tôi tỉ mẩn chọn lọc từng loại gà, từ truyền thống đến H''Mông, Đông Tảo, rồi công phu hấp cùng công thức nước tương độc đáo để thịt gà thấm đẫm, dậy mùi thơm nức. Thưởng thức miếng gà đậm đà cùng xôi tam sắc, gỏi thanh mát, mọi cuộc vui bỗng thêm phần tròn vị, ấm cúng. A Phủ – chuẩn vị nhậu Việt, gói trọn hương vị tình thân.' AS story 
    FROM Restaurants 
    WHERE name = N'A Phủ - Gà Hấp Nước Tương - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Xanh - Hủ Tiếu Ngon Quận 3 & Hủ Tiếu Mực Bào Ngư
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bếp Xanh, mỗi tô hủ tiếu là cả một câu chuyện vị giác truyền thống thấm đượm cái hồn ẩm thực Quận 3. Nước lèo trong veo, ngọt thanh được ninh nấu tỉ mỉ, kết hợp cùng những nguyên liệu tươi ngon chọn lọc như gà trứng non béo ngậy hay mực bào ngư trứ danh. Ghé Bếp Xanh để thưởng thức sự giao thoa hài hòa giữa hương vị bình dân ấm áp và những món đặc sắc, mang đến trải nghiệm khó quên cho thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Xanh - Hủ Tiếu Ngon Quận 3 & Hủ Tiếu Mực Bào Ngư'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Vịt Bamboo - Vịt Lam Ống Tre Tây Bắc - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Vịt Bamboo, chúng tôi tự hào mang cả tinh hoa ẩm thực Tây Bắc về lòng Sài Gòn qua món Vịt Lam Ống Tre độc đáo. Hương vị thịt vịt đồng hay vịt cherry thấm đẫm gia vị núi rừng, được nướng chậm trong ống tre, tạo nên bản giao hưởng khó quên cho vị giác. Bên cạnh Gà Mẹt 7 món hay Gà Đông Tảo bó xôi truyền thống, mỗi bữa ăn tại đây là sự hội tụ của tâm huyết, mang đến những khoảnh khắc gia đình ấm cúng. Khám phá hương vị 4.6 sao được yêu thích tại 52/1 Lý Chính Thắng, Quận 3 ngay hôm nay.' AS story 
    FROM Restaurants 
    WHERE name = N'Vịt Bamboo - Vịt Lam Ống Tre Tây Bắc - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nam Phương Quán - Cá Lóc Đồng Quay Me Cuốn Bánh Tráng - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giấu mình trong con hẻm yên bình Quận 3, Nam Phương Quán là chốn dừng chân ấm cúng cho tâm hồn ẩm thực. Nơi đây, cá lóc đồng tươi rói được biến tấu đầy tinh tế: từ quay me chua ngọt cuốn bánh tráng mềm dẻo đến nướng muối ớt đậm đà, nướng lá chuối thơm lừng. Mỗi món ăn là một bản giao hưởng hương vị miền Tây chân chất, mang đến những giây phút "nhậu" sum vầy, đáng nhớ. Mời bạn ghé Nam Phương để cảm nhận trọn vẹn sự giao thoa độc đáo này!' AS story 
    FROM Restaurants 
    WHERE name = N'Nam Phương Quán - Cá Lóc Đồng Quay Me Cuốn Bánh Tráng - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Bản Đôn - Gà Nướng Sa Lửa & Gà Nướng Cơm Lam Tây Nguyên - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Gà Bản Đôn - Gà Nướng Sa Lửa tại 52/3 Lý Chính Thắng, nơi chúng tôi mang trọn vẹn tinh hoa ẩm thực Tây Nguyên về giữa lòng Quận 3. Những chú gà bản được tuyển chọn tỉ mỉ, tẩm ướp gia vị núi rừng đặc trưng rồi nướng sa lửa nguyên con, cho lớp da vàng giòn, thịt ngọt mọng nước khó cưỡng. Kèm theo ống cơm lam dẻo thơm, đây chính là hương vị ấm cúng, đậm đà của bữa cơm gia đình, một trải nghiệm vị giác khó quên đang chờ đón bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Bản Đôn - Gà Nướng Sa Lửa & Gà Nướng Cơm Lam Tây Nguyên - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Út Lục Lâm - Ốc Hấp Tiêu Xanh - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Út Lục Lâm nép mình trong con hẻm nhỏ Quận 3, nơi những món ốc hấp nóng hổi chờ đón bạn. Điểm nhấn không thể bỏ qua là Ốc Bươu Hấp Tiêu Xanh trứ danh, với vị cay nồng đặc trưng của tiêu xanh quyện cùng hương sả thanh mát, đánh thức mọi giác quan. Mỗi con ốc tươi rói, mỗi món ăn đều được gửi gắm cái tâm của Út, mang đến bữa ăn bình dị mà ấm áp, đậm đà tình người. Hãy ghé Út Lục Lâm để cảm nhận và tìm về hương vị thân quen!' AS story 
    FROM Restaurants 
    WHERE name = N'Út Lục Lâm - Ốc Hấp Tiêu Xanh - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Đất Phương Nam - Vịt Nướng Muối Ớt - Quận 3
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đất Phương Nam mời bạn ghé lại con hẻm nhỏ Quận 3, khám phá hương vị Vịt Nướng Muối Ớt độc đáo làm say lòng bao thực khách. Từng miếng vịt thấm đẫm gia vị cay nồng, thơm lừng trên bếp than hồng, mang đến trải nghiệm nhậu chuẩn vị miền Nam. Hãy cùng bạn bè sẻ chia khoảnh khắc sum vầy ấm áp và thưởng thức những món vịt nướng đặc sắc của chúng tôi.' AS story 
    FROM Restaurants 
    WHERE name = N'Đất Phương Nam - Vịt Nướng Muối Ớt - Quận 3'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Tấm Sườn Nướng, Trà Sữa & Ăn Vặt Quận 5 - Phùng Hưng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Phùng Hưng, Quận 5, Cơm Tấm Sườn Nướng không chỉ là một bữa ăn mà là hành trình về với hương vị Sài Gòn bình dị, ấm áp. Miếng sườn nướng thơm lừng trên hạt cơm tấm dẻo mềm, thêm chút trứng ốp la béo ngậy, hay Cơm Ba Rọi Xào Ruốc đậm đà, mỗi món đều được chế biến bằng cả tấm lòng. Nơi đây, bạn sẽ tìm thấy không gian thân quen, cùng trà sữa và ăn vặt hấp dẫn để mọi khoảnh khắc đều trở nên ngon miệng và thư giãn.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Tấm Sườn Nướng, Trà Sữa & Ăn Vặt Quận 5 - Phùng Hưng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lẩu Bò Hân Quận 5 - Nguyễn Biểu
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Lẩu Bò Hân Quận 5 Nguyễn Biểu là điểm đến không thể bỏ qua cho những tín đồ ẩm thực mê bò hấp trứ danh. Mỗi phần bắp, đuôi, gù bò đều được chọn lọc kỹ càng và hấp khéo léo, giữ trọn vị ngọt tự nhiên, dai mềm tan chảy. Hương vị đậm đà cùng không khí nhậu chất Sài Gòn ấm cúng chắc chắn sẽ mang đến những phút giây sum vầy khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Lẩu Bò Hân Quận 5 - Nguyễn Biểu'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5, bạn sẽ tìm thấy một góc nhỏ bình yên, nơi những chiếc bánh ngọt ngào được gửi gắm cả tấm lòng. Từ su kem mềm tan, bánh kem bắp thơm lừng đến bông lan cuộn dâu dịu ngọt, mỗi hương vị đều gợi nhớ ký ức tuổi thơ thân thương. Hãy để chúng tôi mang đến cho bạn niềm vui giản dị và những khoảnh khắc ngọt ngào mỗi ngày.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Sầu Riêng 9 Sạch - Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Sầu Riêng 9 Sạch - Quận 5 mời bạn ghé thăm để khám phá thế giới sầu riêng tươi ngon, chuẩn vị. Mỗi chiếc bánh là sự hòa quyện tinh tế của sầu Ri6 nguyên chất cùng những sáng tạo độc đáo như ngàn lớp siêu sầu, phô mai than tre hay choco hạnh nhân. Chúng tôi gửi gắm cả tâm huyết vào từng hương vị, mang đến món quà ngọt ngào, khó quên cho bạn và người thân.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Sầu Riêng 9 Sạch - Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 5 Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ốc Trứng Muối - Chi Nhánh 5 là điểm đến lý tưởng cho những tín đồ hải sản bình dân, chất lượng ngay tại Quận 5. Từng con ốc bươu mập ú thấm đẫm sốt tiêu cay nồng hay tôm càng xanh nướng phô mai thơm lừng, béo ngậy đều được chế biến bằng cả tâm huyết. Ghé ngay để cảm nhận hương vị đặc trưng khó quên và tận hưởng không gian ấm cúng, gần gũi nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 5 Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Domoto Saigon Quận 5 - Quán Cơm Nhật Bình Dân - Trần Hưng Đạo
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Domoto Saigon Quận 5 là điểm hẹn lý tưởng cho những tâm hồn yêu ẩm thực Nhật Bản bình dân, ấm cúng giữa lòng Sài Gòn. Mỗi phần cơm tại đây, từ Cơm Lươn truyền thống đến Cơm bò Hamburger phô mai độc đáo, đều được chế biến bằng cả sự tỉ mỉ và tâm huyết. Ghé Domoto để thưởng thức hương vị chuẩn Nhật, cảm nhận sự gần gũi như bữa cơm nhà, với mức giá vô cùng phải chăng nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Domoto Saigon Quận 5 - Quán Cơm Nhật Bình Dân - Trần Hưng Đạo'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối - Chi Nhánh Quận 5, nơi mỗi bữa ăn là một trải nghiệm vị giác đầy bất ngờ. Chúng tôi tự hào mang đến những hương vị hải sản độc đáo, khởi đầu với combo hàu sữa tươi rói, được hấp sả thơm lừng, giữ trọn vẹn sự tinh khiết của biển cả. Từng con hàu căng mọng, ngọt lành sẽ đánh thức mọi giác quan của bạn. Ghé thăm không gian bình dân, ấm cúng trên đường Trần Phú để cùng bạn bè, gia đình tận hưởng những khoảnh khắc ngon miệng và tràn đầy niềm vui.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Truyền Thuyết Champong - Nguyễn Trãi Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Truyền Thuyết Champong mời bạn khám phá không gian ấm cúng, nơi hương vị Hàn Quốc đích thực gói trọn trong từng món ăn chuẩn vị gia đình. Từ những đĩa Tteokbokki nồng đượm đến Mì Tương Đen đậm đà, mỗi món đều là một "truyền thuyết" được tạo nên bằng cả tâm huyết và bí quyết riêng. Hãy đến và viết thêm câu chuyện ẩm thực của riêng bạn cùng chúng tôi tại 197 Nguyễn Trãi, Quận 5.' AS story 
    FROM Restaurants 
    WHERE name = N'Truyền Thuyết Champong - Nguyễn Trãi Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: An Lạc - Ăn Chay - Quận 5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Quận 5 sôi động, An Lạc - Ăn Chay mang đến một không gian yên bình cùng những món chay thuần túy, đậm đà hương vị Á Châu. Chúng tôi gửi gắm cả tấm lòng vào từng nguyên liệu tươi ngon, để mỗi bữa ăn là một trải nghiệm an lành. Đừng quên thử Bánh Mì Nấm hay Bánh Mì Xúc Xích Chay Best Seller giòn thơm, bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'An Lạc - Ăn Chay - Quận 5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải, chúng tôi tỉ mỉ gửi gắm cả tấm lòng vào từng chén tàu hũ tươi Co Vang thanh mát. Từng muỗng mềm tan, ngọt dịu sẽ đưa bạn vào không gian thư thái, nhẹ nhàng ngay giữa lòng Sài Gòn sôi động. Ghé 159 Trần Tuấn Khải để tận hưởng món tráng miệng ngọt lành, ấm áp cho tâm hồn.' AS story 
    FROM Restaurants 
    WHERE name = N'Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn, Bánh Tráng Trộn & Cuốn Trứng Cút Lòng Đào - Ăn Vặt Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Ăn Vặt Quận 6 để khám phá hương vị tuổi thơ được nâng tầm! Nơi đây, mỗi cuộn bánh tráng phơi sương dẻo dai là một bản giao hưởng vị giác: từ mỡ hành thơm lừng, satế cay nồng đến tỏi phi giòn rụm và trứng cút béo ngậy. Với 4.5 sao từ thực khách, chúng tôi tự hào mang đến những món ăn vặt độc đáo, chuẩn vị và đậm đà tình Sài Gòn. Ghé ngay 444/1 Phạm Văn Chí để thưởng thức sự mê hoặc này nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn, Bánh Tráng Trộn & Cuốn Trứng Cút Lòng Đào - Ăn Vặt Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6, những tô mì trộn Indomie quen thuộc bỗng trở thành "ngôi sao 5 sao" được đánh giá cao. Với chút tâm huyết và bí quyết riêng, mì được trộn đều cùng xúc xích chiên giòn, trứng ốp la béo ngậy và các topping thập cẩm tươi ngon, tạo nên hương vị đậm đà khó cưỡng. Mỗi suất ăn là một sự kết hợp hoàn hảo, mang đến bữa ăn ấm lòng, thơm ngon đúng điệu vị giác của người Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Tấm 279
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cơm Tấm 279 tại Hậu Giang đã trở thành điểm hẹn thân quen cho những ai yêu mến hương vị Sài Gòn. Nơi đây, bạn có thể thưởng thức dĩa cơm sườn bì ốp la truyền thống hay khám phá vị lạ miệng của Cơm Mắm Chưng, Khổ Qua Cà Chớn. Mỗi món ăn đều chứa đựng cái tâm, mang đến bữa cơm bình dị nhưng đậm đà và ấm áp như nhà làm.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Tấm 279'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mến - Bún Chả Cá Sứa Nha Trang - Hậu Giang
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Mến - Bún Chả Cá Sứa Nha Trang, bạn sẽ cảm nhận ngay tấm lòng của cô chủ Hậu Giang gửi gắm trong từng tô bún. Hương vị biển Nha Trang tinh túy với chả cá thơm dai, sứa giòn sần sật quyện trong nước lèo thanh ngọt bí truyền, làm nức lòng thực khách. Hãy ghé Mến để tự mình khám phá tô Bún Đầy Đủ "có cả thế giới", nơi ẩm thực bình dân chạm đến trái tim bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Mến - Bún Chả Cá Sứa Nha Trang - Hậu Giang'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Tấm 3 Chị Em
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cơm Tấm 3 Chị Em, mỗi đĩa cơm tấm không chỉ là món ăn mà còn là cả một câu chuyện về tình yêu và niềm đam mê ẩm thực được ba chị em gửi gắm. Miếng sườn nướng thơm lừng, bì dai giòn, chả trứng mềm mượt hòa quyện cùng nước mắm bí truyền, mang đến hương vị thân quen như cơm mẹ nấu. Ghé 733 Lò Gốm để thưởng thức bữa cơm ấm lòng, chuẩn vị Sài Gòn, nơi những hương vị truyền thống được trân trọng mỗi ngày!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Tấm 3 Chị Em'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt Quận 6 là điểm hẹn lý tưởng cho những tín đồ ẩm thực đường phố. Tại đây, mỗi sợi mì trộn dai ngon, mỗi xiên cá con giòn rụm đều gói trọn hương vị đặc trưng và tâm huyết của người làm bếp. Ghé 151 Bãi Sậy để thưởng thức ngay các COMBO TIẾT KIỆM, NO NÊ đầy ắp, và khám phá bữa ăn vặt ngon chuẩn vị, giá cả phải chăng!' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Cuốn & Bánh Ướt Phú Lâm
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Bánh Cuốn & Bánh Ướt Phú Lâm, bạn sẽ được đánh thức vị giác bởi những cuốn bánh nóng hổi mang đậm hương vị truyền thống. Đặc biệt, đừng bỏ lỡ bánh cuốn trứng lá dứa xanh tươi hay hoa đậu biếc tím biếc, vừa đẹp mắt vừa gói trọn cái tâm của người làm bếp. Mỗi suất bánh ướt đặc biệt hay bánh dày thơm lừng tại 1/1A Tân Hòa Đông đều là lời mời gọi chân thành, mang đến bữa ăn bình dị mà ấm áp cho mọi thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Cuốn & Bánh Ướt Phú Lâm'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Thắng - Phở Bò - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Phở Thắng - Quận 6 từ lâu đã là điểm hẹn quen thuộc cho những ai yêu mến hương vị phở bò truyền thống. Nước dùng ninh xương cô đọng, trong vắt cùng lát thịt tươi rói, mềm tan sẽ đánh thức mọi giác quan của bạn. Đến 224 Minh Phụng, thưởng thức tô phở ấm nóng, thơm lừng và cảm nhận trọn vẹn sự tinh túy của ẩm thực Việt Nam.' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Thắng - Phở Bò - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối Quận 6 – điểm hẹn lý tưởng cho những buổi nhâm nhi ấm cúng. Tại đây, mỗi đĩa trứng gà non sốt mắm tắc chua cay hay răng mực cháy tỏi tóp mỡ giòn thơm đều là sự kết hợp hoàn hảo của hương vị đậm đà và nguyên liệu tươi ngon. Chúng tôi gửi gắm cả tâm huyết vào từng món ăn, mang đến trải nghiệm ẩm thực đường phố Sài Gòn đặc sắc, khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Neko Izakaya Bar Nhậu Kiểu Nhật - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Neko Izakaya Bar Quận 6, nơi phong vị Nhật Bản giao thoa cùng sự phóng khoáng của ẩm thực nhậu. Thưởng thức Cua Cà Mau sốt phô mai độc đáo hay Cá bò da nướng muối ớt đậm đà, mỗi món đều được chế biến từ hải sản tươi rói và cái tâm của người đầu bếp. Hãy cùng nhau nâng ly, sẻ chia khoảnh khắc vui vẻ trong không gian ấm cúng, để Neko Izakaya trở thành điểm đến lý tưởng cho những buổi tối đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Neko Izakaya Bar Nhậu Kiểu Nhật - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt 3 Chị Em - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Trong con hẻm nhỏ thân thương Quận 6, Ăn Vặt 3 Chị Em là điểm hẹn của những tâm hồn mê đồ chiên. Nơi đây, từng chiếc Chân Gà Rút Xương giòn rụm, từng miếng khoai tây hay gà viên lắc phô mai thơm lừng đều gói trọn tình yêu và bí quyết gia truyền. Hãy đến để cảm nhận hương vị tuổi thơ ấm áp và niềm vui sẻ chia không thể chối từ!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt 3 Chị Em - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Ếch Singapore Geylang SD88 - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cháo Ếch Singapore Geylang SD88 là điểm đến quen thuộc của thực khách Quận 6 để thưởng thức hương vị cháo ếch chuẩn Singapore trứ danh. Từng thố cháo nóng hổi quyện cùng thịt ếch ú nu thấm đẫm sốt, mang đến trải nghiệm vị giác khó quên. Đây không chỉ là bữa ăn ngon mà còn là không gian ấm cúng, chan chứa tình thân, nơi các gia đình tìm thấy niềm vui ẩm thực. Với 4.5 sao đánh giá, chúng tôi tự hào mang đến chất lượng và sự hài lòng trọn vẹn.' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Ếch Singapore Geylang SD88 - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cà Ri Vịt - Bạc Liêu - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình tại Quận 6, Cà Ri Vịt Bạc Liêu mang đến một góc nhỏ bình yên, nơi hương vị miền Tây sông nước được tái hiện trọn vẹn. Nồi cà ri vịt vàng óng, thơm lừng mùi sả và nước cốt dừa béo ngậy, từng miếng thịt vịt tươi ngon thấm đẫm gia vị độc đáo của xứ Bạc Liêu. Đây chính là món ăn ấm lòng, đậm đà khó quên mà bạn không thể bỏ lỡ. Mời bạn ghé 496/34 Hậu Giang để thưởng thức và cảm nhận!' AS story 
    FROM Restaurants 
    WHERE name = N'Cà Ri Vịt - Bạc Liêu - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Và Mì Ý - Jollibee EC Hậu Giang Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa nhịp sống hối hả của Quận 6, Gà Rán Và Mì Ý - Jollibee EC Hậu Giang mời gọi bạn ghé thăm để tận hưởng hương vị khó quên. Nơi đây, bạn sẽ khám phá sự hòa quyện tuyệt vời giữa gà rán giòn rụm và món Mì Ý sốt cay vừa đặc trưng, đủ sức lay động mọi giác quan. Với không gian ấm cúng và sự phục vụ tận tâm, chúng tôi mong muốn mang đến những bữa ăn ngon miệng, tràn đầy niềm vui, xứng đáng với đánh giá 4.5 sao từ thực khách thân yêu.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Và Mì Ý - Jollibee EC Hậu Giang Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Thắng Lợi Mì Gia - Mì Vịt Tiềm & Dimsum - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Thắng Lợi Mì Gia, chúng tôi gói trọn tinh hoa ẩm thực Hoa trong từng bát mì và chiếc dimsum. Mì Vịt Tiềm danh tiếng với nước dùng tiềm bí truyền cùng thịt vịt mềm tan, hay những chiếc bánh bao xá xíu nóng hổi, đều được làm từ cái tâm của người đầu bếp. Hãy đến để cảm nhận không gian ấm cúng và thưởng thức hương vị đặc trưng đã làm nên thương hiệu 4.5 sao của chúng tôi suốt bao năm qua.' AS story 
    FROM Restaurants 
    WHERE name = N'Thắng Lợi Mì Gia - Mì Vịt Tiềm & Dimsum - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến SOI THAI, nơi bạn tìm thấy một góc Thái Lan thu nhỏ ấm áp giữa lòng Quận 6. Mỗi món ăn đều được chế biến với cả tâm huyết, mang đến hương vị chua cay mặn ngọt hài hòa, đánh thức mọi giác quan. Từ những combo độc đáo như "Gác Lại Âu Lo" đến ly trà sữa thơm lừng, chúng tôi mời bạn cùng gia đình tận hưởng những khoảnh khắc ẩm thực trọn vẹn và đầy cảm xúc tại 79 Kinh Dương Vương.' AS story 
    FROM Restaurants 
    WHERE name = N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Xôi Ghẹ 192 Quận 6 - Phạm Văn Chí
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Xôi Ghẹ 192 Quận 6 hân hoan chào đón bạn đến khám phá sự kết hợp độc đáo, nơi hạt xôi dẻo thơm hòa quyện cùng ghẹ tươi rói và hải sản vỏ giòn rụm. Mỗi suất ăn là tổng hòa của nguyên liệu tươi ngon chọn lọc và bí quyết gia truyền, mang đến hương vị đậm đà khó cưỡng. Ghé 200 Phạm Văn Chí để tận hưởng món xôi ghẹ chuẩn vị, bình dị mà ấm lòng, chắc chắn sẽ làm hài lòng cả những thực khách khó tính nhất.' AS story 
    FROM Restaurants 
    WHERE name = N'Xôi Ghẹ 192 Quận 6 - Phạm Văn Chí'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cô Điệp - Nem Nướng Nha Trang - Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cô Điệp, mỗi cuốn nem nướng Nha Trang là cả tâm huyết, chắt lọc tinh hoa biển cả mang về giữa lòng Quận 6. Hương vị nem vàng ruộm, thơm lừng cùng nước chấm bí truyền đã làm say lòng bao thực khách suốt bao năm qua. Ghé D36 Cư Xá Phú Lâm B để tận hưởng không gian ấm cúng và trải nghiệm ẩm thực Việt bình dị, đậm đà, chuẩn vị quê nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Cô Điệp - Nem Nướng Nha Trang - Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Gà Hải Nam Tam Kỳ 142 - Cháo, Gỏi & Miến Gà Trộn - 34 Bình Phú, Quận 6
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến với Cơm Gà Hải Nam Tam Kỳ 142, nơi hương vị trứ danh Tam Kỳ được tái hiện trọn vẹn tại Quận 6. Từng đĩa cơm gà xé gỏi tươi ngon, miến trộn đậm đà hay cháo gà sánh mịn đều là kết tinh của nguyên liệu tuyển chọn và bí quyết gia truyền. Hãy ghé thăm để tận hưởng bữa ăn ấm cúng, đậm chất Việt và cảm nhận sự chân thành trong từng món ăn.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Gà Hải Nam Tam Kỳ 142 - Cháo, Gỏi & Miến Gà Trộn - 34 Bình Phú, Quận 6'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Texas Chicken - PARC  Mall Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Texas Chicken PARC Mall Quận 8, mỗi bữa ăn là một hành trình vị giác đầy hứng khởi. Thưởng thức miếng gà sốt bơ tỏi thảo mộc thơm lừng, cảm nhận khoai tây phô mai béo ngậy tan chảy, và kết thúc ngọt ngào với bánh quy bơ mật ong. Chúng tôi tỉ mỉ chế biến từng món ăn với tâm huyết, mong muốn mang lại niềm vui và những khoảnh khắc sum vầy cho cả gia đình bạn. Hãy ghé thăm để cùng sẻ chia vị ngon trong không gian ấm cúng, thân thiện!' AS story 
    FROM Restaurants 
    WHERE name = N'Texas Chicken - PARC  Mall Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Matcha Khum? Phố Tây Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Matcha Khum? Phố Tây Quận 8 là chốn bình yên hiếm có, nơi hương matcha thơm lừng và vị ngọt dịu của Dâu Mộng Mơ kể câu chuyện về sự tỉ mỉ. Mỗi ly thức uống, từ Matcha latte Premium chuẩn vị đến Matcha Coco Cloud độc đáo, đều được pha chế bằng cả tâm huyết, mang đến trải nghiệm vị giác khó quên. Hãy ghé để tìm một góc riêng, thưởng thức và cảm nhận sự khác biệt giữa lòng Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Matcha Khum? Phố Tây Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Mỡ Mỡ - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình tại con hẻm Tám Danh quen thuộc, Ăn Vặt Mỡ Mỡ là chốn dừng chân lý tưởng cho những tín đồ ẩm thực Á Đông bình dân. Nơi đây, mỗi món ăn như Khô Gà Lá Chanh đậm đà hay Cơm Cháy Chà Bông Tiến Vua giòn rụm đều được chúng tôi gửi gắm cả cái tâm, tỉ mỉ trong từng công đoạn. Để rồi khi thưởng thức, bạn sẽ cảm nhận trọn vẹn hương vị "mỡ màng" khó cưỡng, ngon chuẩn vị nhà làm. Ghé Ăn Vặt Mỡ Mỡ để vị giác dẫn lối bạn khám phá những bất ngờ thú vị, ấm áp như trở về nhà!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Mỡ Mỡ - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - Liên Tỉnh 5 Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gà Rán Jimama Liên Tỉnh 5 - nơi những món ăn quen thuộc được nâng tầm với tất cả cái tâm của người đầu bếp. Từ miếng gà giòn rụm vàng ươm, đĩa mì Ý sốt béo ngậy đến cơm gà đậm đà, mỗi phần ăn đều là sự kết hợp hoàn hảo giữa hương vị đặc trưng và nguyên liệu tươi ngon. Ghé Jimama, bạn sẽ tìm thấy bữa ăn ngon miệng, ấm lòng và giá cả phải chăng, xứng đáng với điểm 4.6 sao mà thực khách tin chọn.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - Liên Tỉnh 5 Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn Tóp Mỡ & Sa Tế Tôm Hồng Kông - LAI GIA - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Lai Gia Quận 8, mỗi tô mì trộn không chỉ là món ăn mà còn là câu chuyện về hương vị đặc sắc. Nơi tóp mỡ giòn tan hòa quyện cùng sa tế tôm Hồng Kông bí truyền, tạo nên trải nghiệm ẩm thực đậm đà khó quên. Từ mì tươi đến hủ tiếu trộn xá xíu, hải sản, mỗi nguyên liệu đều được chọn lựa kỹ càng và chế biến bằng tất cả tâm huyết, mang đến bữa ăn ấm áp như về nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn Tóp Mỡ & Sa Tế Tôm Hồng Kông - LAI GIA - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hello Linh Quận 8 - Bánh Tráng Mỡ Hành - 46 Đinh Hoà
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hello Linh Quận 8 mời bạn ghé thăm thế giới bánh tráng giòn rụm, đậm đà hương vị tuổi thơ! Mỗi miếng bánh là sự kết hợp tinh tế của mỡ hành thơm lừng, muối tắc chua cay hay ớt rim nồng nàn, được trộn đều bằng cả tấm lòng. Ghé 46 Đinh Hoà để trải nghiệm món ăn vặt bình dị mà cuốn hút, ngon đúng điệu đã làm nên tên tuổi của quán nhé. Bạn sẽ luôn được chào đón tại đây.' AS story 
    FROM Restaurants 
    WHERE name = N'Hello Linh Quận 8 - Bánh Tráng Mỡ Hành - 46 Đinh Hoà'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: ĂN VẶT TÁ LẢ - QUẬN 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến ĂN VẶT TÁ LẢ - QUẬN 8 tại Tuy Lý Vương để tìm lại hương vị tuổi thơ và khám phá những món ăn đường phố bình dị, thân thuộc. Từ hột vịt lộn nóng hổi, cút lộn xào me chua ngọt đến cá viên, khô mực chiên nước mắm giòn rụm, mỗi món là một bản hòa tấu vị giác đặc trưng. Chúng tôi gói ghém cái tâm vào từng nguyên liệu, mong mang đến những trải nghiệm ngon miệng, khó quên. Ghé ngay để cảm nhận sự ấm áp và hương vị chuẩn Sài Gòn, thân thương như nhà!' AS story 
    FROM Restaurants 
    WHERE name = N'ĂN VẶT TÁ LẢ - QUẬN 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Seoul - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Seoul - Quận 8 tại 90 Dương Quang Đông là nơi hội tụ hương vị Hàn Quốc bình dị mà say đắm. Mỗi tô mì kim chi bùng vị hay phần gà cay phô mai nóng hổi đều được chế biến bằng cả trái tim, mang đến trải nghiệm ẩm thực chuẩn Seoul. Tự hào với 4.9/5 sao, chúng tôi mời bạn ghé thăm để cảm nhận sự ấm áp và hương vị đặc trưng khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Cay Seoul - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Đậu Em Thuỷ - Các Món Ăn Hà Nội - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bún Đậu Em Thuỷ, chúng tôi mang hương vị Hà Nội nồng nàn về ngay trung tâm Quận 8. Mỗi mẹt bún đậu nóng hổi, giòn rụm với chả cốm thơm lừng hay nem chua rán vàng ươm đều được chuẩn bị bằng cả tâm huyết, tái hiện trọn vẹn tinh hoa ẩm thực đất Bắc. Hãy ghé Em Thuỷ để tìm thấy một góc nhỏ thân thương, nơi vị giác được đánh thức và lòng người thêm ấm áp.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Đậu Em Thuỷ - Các Món Ăn Hà Nội - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Đậu Hũ Co Vang Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đậu Hũ Co Vang Quận 8 - nơi hương vị tuổi thơ được giữ trọn vẹn với hơn 4.6 sao đánh giá. Mỗi hộp Đậu Hũ Co Vang mềm mịn, tan chảy trong nước đường gừng thơm lừng, là sự kết tinh của cái tâm và công thức truyền thống. Ghé 198 Đặng Thúc Liêng để tìm lại chút ngọt ngào, ấm áp giữa lòng Sài Gòn, cùng ly cà phê hoặc trà vải mát lạnh nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Đậu Hũ Co Vang Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sâm Chill Me - Bông Sao Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Sâm Chill Me - Bông Sao Quận 8 là điểm hẹn lý tưởng cho những ai tìm kiếm chút bình yên và hương vị độc đáo giữa lòng Sài Gòn. Đến đây, bạn sẽ được thưởng thức Sâm Táo Bát Bảo thanh mát, được pha chế tỉ mỉ với bí quyết riêng, mang đến trải nghiệm sảng khoái khó quên. Đừng bỏ lỡ Me Đác Mê Mẫn đầy lôi cuốn và những ly sâm dừa nước ngọt lành, chắc chắn sẽ khiến bạn "chill" ngay tức thì!' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Bông Sao Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hồng Trà Sữa Ba Cô Gái Tam Hảo - 421 Liên Tỉnh 5, Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Hồng Trà Sữa Ba Cô Gái Tam Hảo, nơi hương vị truyền thống được chắt lọc tinh tế trong từng ly trà. Từ hồng trà sữa đặc biệt béo ngậy, nhãn nhục thơm lừng đến lục trà mãng cầu tươi mát, mỗi thức uống đều được pha chế bằng cả tâm huyết. Ghé 421 Liên Tỉnh 5, Quận 8 để tìm thấy góc nhỏ bình yên và tận hưởng những ly trà sữa đậm đà khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Hồng Trà Sữa Ba Cô Gái Tam Hảo - 421 Liên Tỉnh 5, Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Hằng Quận 8 (Chi Nhánh 1)
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Tráng Hằng Quận 8, chúng tôi gói trọn cả tấm lòng vào từng chiếc bánh tráng dẻo quen thuộc. Từ lớp bánh mềm dai đến các loại topping đậm đà như tóp mỡ giòn rụm và muối nhuyễn đặc trưng, mỗi miếng bánh đều là hương vị tuổi thơ, là nét ẩm thực bình dân tinh túy của Sài Gòn. Với 4.9 sao tin yêu, chúng tôi mời bạn ghé đến để tự mình cảm nhận sự khác biệt khó quên này.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Hằng Quận 8 (Chi Nhánh 1)'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nước Sâm Bưu Điện Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Nước Sâm Bưu Điện Quận 8, nơi lưu giữ hương vị giải khát thanh mát bao đời. Từng ly sâm lạnh, bông cúc dịu êm hay rau má xanh mát đều được ủ nấu cẩn thận, mang đậm cái tâm của người pha chế. Ghé quán để tìm về chút bình yên, cảm nhận vị truyền thống Sài Gòn và xua tan cái nóng oi ả.' AS story 
    FROM Restaurants 
    WHERE name = N'Nước Sâm Bưu Điện Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: ZINC CORNER - Trà Sữa, Ăn Vặt & Gà Tokbokki - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'ZINC CORNER – góc nhỏ ấm cúng tại Quận 8, nơi hương vị Hàn Quốc đường phố được tái hiện trọn vẹn. Từ cánh gà chiên giòn rụm, tokbokki dai dai đẫm sốt đặc trưng đến tokbokki phô mai béo ngậy, mỗi món ăn đều là sự kết hợp hoàn hảo giữa nguyên liệu tươi ngon và tâm huyết người đầu bếp. Hãy ghé ZINC CORNER để thưởng thức bữa ăn ngon miệng, đúng điệu và cảm nhận sự chào đón nồng nhiệt của chúng tôi!' AS story 
    FROM Restaurants 
    WHERE name = N'ZINC CORNER - Trà Sữa, Ăn Vặt & Gà Tokbokki - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Thố Anh Nguyễn - Dương Bá Trạc (Quận 8)
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cơm Thố Anh Nguyễn - Dương Bá Trạc mời bạn ghé lại để thưởng thức bữa cơm ấm lòng chuẩn vị Việt. Từng thố cơm nóng hổi, dẻo thơm được nung cùng gà mềm mọng, xá xíu đậm đà hay bò tươi ngon, thấm đượm gia vị truyền thống. Nơi đây, mỗi món ăn đều gói trọn cái tâm người nấu, mang đến cảm giác thân thuộc như bữa cơm mẹ làm giữa lòng Quận 8. Chắc chắn bạn sẽ có một trải nghiệm ẩm thực đáng nhớ!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Thố Anh Nguyễn - Dương Bá Trạc (Quận 8)'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cát Cát House - Kem Ý Gelato, Bánh Trứng Gà Non & Trà Trái Cây - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến Cát Cát House, nơi những hương vị ngọt ngào kể câu chuyện riêng tại Quận 8. Chúng tôi tự hào mang đến trải nghiệm độc đáo với Bánh Trứng Gà Non mềm mịn kết hợp Kem Ý Gelato béo ngậy, hay Bánh Trứng Tứ Sắc đầy màu sắc cùng Trà Trái Cây thanh mát. Mỗi món quà nhỏ được làm từ cái tâm, để bạn luôn tìm thấy niềm vui và sự ấm áp như về nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Cát Cát House - Kem Ý Gelato, Bánh Trứng Gà Non & Trà Trái Cây - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: A DUY FOOD - Gà Quay Sườn Quay Cơm Lam - Quận 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến A DUY FOOD, nơi hương vị gia đình Việt được gói trọn trong từng món ăn. Từ gà quay sườn quay đậm đà, vịt quay da giòn rụm cho đến cơm lam dẻo thơm, mỗi miếng đều thấm đượm tâm huyết của người đầu bếp. Ghé thăm A DUY FOOD Quận 8 để tận hưởng bữa ăn ấm cúng và trọn vẹn như chính nhà mình.' AS story 
    FROM Restaurants 
    WHERE name = N'A DUY FOOD - Gà Quay Sườn Quay Cơm Lam - Quận 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nem Nướng Nha Trang - Since 1982 - Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hơn bốn thập kỷ qua, Nem Nướng Nha Trang - Quận 10 vẫn giữ trọn vẹn hương vị truyền thống ''Since 1982''. Nép mình trong con hẻm nhỏ, quán là nơi bạn tìm thấy những cuốn nem vàng ươm, giòn rụm với nước chấm gia truyền đầy mê hoặc. Mỗi món ăn đều gói ghém cái tâm của người đầu bếp, mang đến trải nghiệm ẩm thực ấm áp, bình dị và khó quên. Mời bạn ghé qua để thưởng thức hương vị Sài Gòn xưa!' AS story 
    FROM Restaurants 
    WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bo Food - Gà Quay, Sườn Quay & Cơm Lam Bánh Bao Quận 10 - Bà Hạt
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bo Food Bà Hạt mời bạn ghé thăm căn bếp ấm cúng, nơi hương vị món Việt truyền thống được nâng tầm bằng cả tâm huyết. Thưởng thức vịt quay Tỳ Bà da giòn rụm trứ danh, gà quay sốt thảo dược đậm đà, hay những món ăn nhà làm chuẩn vị. Với mức 4.5 sao, Bo Food tự hào mang đến trải nghiệm ẩm thực gia đình khó quên, ấm áp như trở về nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Bo Food - Gà Quay, Sườn Quay & Cơm Lam Bánh Bao Quận 10 - Bà Hạt'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: CHÂN GÀ GOOD - QUẬN 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'CHÂN GÀ GOOD - QUẬN 10 là điểm đến không thể bỏ qua cho tín đồ chân gà. Từng miếng chân gà rút xương giòn sần sật, hòa quyện hoàn hảo cùng sốt Thái cay nồng hay sốt sả tắc chua ngọt đậm đà, được chế biến bằng tất cả tâm huyết. Ghé 63-65 Ngô Quyền để thưởng thức hương vị đặc trưng, hiểu vì sao quán luôn đạt 4.5 sao và trải nghiệm món ngon chuẩn vị Á Đông, bình dân mà chất lượng!' AS story 
    FROM Restaurants 
    WHERE name = N'CHÂN GÀ GOOD - QUẬN 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn Phủ Trứng - Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Trộn Phủ Trứng Quận 10 – nơi vị ngon giao thoa giữa truyền thống và sáng tạo, ẩn mình tại 104/42 Thành Thái. Nổi bật với tô mì trộn đầy đặn, sợi mì dai vàng ươm hòa quyện cùng nước sốt đậm đà và đặc biệt là lớp trứng lòng đào béo ngậy, bùng nổ hương vị. Mỗi món là một câu chuyện về sự tỉ mỉ, mang đến trải nghiệm ấm lòng, khó quên ngay giữa lòng Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn Phủ Trứng - Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán YumIco - Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Rán YumIco - Quận 10, mỗi miếng gà là một câu chuyện về sự giòn tan, mọng nước, được chế biến bằng cả tâm huyết để giữ trọn vị ngon đặc trưng. Từ miếng TENDER SOLO ấm nóng đến TENDER PARTY chia sẻ niềm vui, chúng tôi tự hào mang đến trải nghiệm gà rán hoàn hảo, đậm đà khó quên. Ghé ngay 031 Lô U Chung Cư Ngô Gia Tự để cảm nhận hương vị đỉnh cao đã làm nên đánh giá 4.5 sao đầy yêu mến của thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán YumIco - Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Muối Tỏi & Dừa Tắc Quận 10 - Hòa Hưng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Tráng Muối Tỏi & Dừa Tắc Hòa Hưng là điểm dừng chân lý tưởng cho những ai yêu thích hương vị bình dị mà cuốn hút của Sài Gòn. Nơi đây, bạn sẽ được thưởng thức miếng bánh tráng muối tỏi giòn thơm, đậm đà kết hợp hoàn hảo cùng ly dừa tắc thanh mát, giải khát. Ghé quán để tìm về chút bình yên, thư giãn và nạp năng lượng với những món trà trái cây tươi ngon, mát lành đặc trưng của quán.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Muối Tỏi & Dừa Tắc Quận 10 - Hòa Hưng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 4 Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối - Chi Nhánh 4, nơi hương vị biển khơi tươi ngon hòa quyện cùng bí quyết chế biến độc đáo, tạo nên những món hải sản bình dân mà đậm đà khó quên. Tại G1A Trường Sơn, từng đĩa Sò Huyết cháy tỏi tóp mỡ thơm lừng hay Nhum biển nướng trứng cút béo ngậy đều được chuẩn bị với tất cả tâm huyết. Hãy ghé thăm để tận hưởng không gian ấm cúng và sẻ chia khoảnh khắc ẩm thực tuyệt vời cùng bạn bè, gia đình!' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 4 Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Chiang Thai Delivery - Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chiang Thai Delivery - Quận 10 hân hạnh mang hương vị Thái Lan chuẩn mực và ấm áp đến tận nhà bạn. Từng đĩa Pad Thai hay hủ tiếu xào đều được chế biến bằng cả tâm huyết, từ nguyên liệu tươi ngon và bí quyết riêng để nước sốt đậm đà khó quên. Hãy để sự hòa quyện hoàn hảo của chua, cay, mặn, ngọt đánh thức mọi giác quan, mang đến trải nghiệm ẩm thực được khách hàng yêu mến với 4.5 sao tuyệt vời.' AS story 
    FROM Restaurants 
    WHERE name = N'Chiang Thai Delivery - Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Truyền Thuyết Champong - Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến với Truyền Thuyết Champong - Quận 10, nơi những bữa ăn gia đình Hàn Quốc trở thành khoảnh khắc đáng nhớ. Từng sợi Mì tương đen béo ngậy, Mỳ lạnh thanh mát hay Thịt heo chua ngọt giòn rụm đều được chế biến bằng cả tấm lòng, mang đến hương vị chuẩn mực như tại Seoul. Hãy ghé thăm và cảm nhận sự ấm cúng, để mỗi món ăn kể câu chuyện về tình yêu và ẩm thực, làm nên "truyền thuyết" của riêng bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Truyền Thuyết Champong - Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bò Né 3 Anh Em Quận 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bò Né 3 Anh Em Quận 10, giữa khu chung cư thân thuộc, chúng tôi mang đến hương vị bò né truyền thống gói trọn tình anh em. Từng phần bò mềm xèo trên chảo gang nóng hổi, kèm pate thơm lừng và trứng ốp la béo ngậy, được chế biến tỉ mỉ với công thức riêng. Với 4.5 sao từ thực khách, quán là điểm đến lý tưởng cho những bữa ăn ấm cúng, đậm đà chất Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Bò Né 3 Anh Em Quận 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Kênh Bà Châu - Cá Hồi Ngâm Tương Thạng Hạng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Lạc bước đến Kênh Bà Châu, bạn sẽ tìm thấy một góc Nhật Bản ấm cúng giữa lòng Sài Gòn. Nơi đây, từng lát cá hồi Nauy thượng hạng được ngâm tương theo công thức riêng, thấm đẫm vị đậm đà khó quên. Hãy cùng người thương tận hưởng bữa ăn tinh tế, nơi hương vị tuyệt hảo và không gian lãng mạn hòa quyện, làm nên những kỷ niệm đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Kênh Bà Châu - Cá Hồi Ngâm Tương Thạng Hạng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Trường Sơn - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Phở Trường Sơn - Quận 11 chào đón bạn với hương vị phở gia truyền được ủ nấu bằng cả tấm lòng. Từng tô phở Tái, Nạm, Gân... đều mang nước dùng thanh ngọt, đậm đà, sợi phở mềm mại và thịt tươi ngon, chuẩn vị đặc trưng không lẫn vào đâu được. Ghé 273 Lạc Long Quân để cảm nhận sự ấm áp và thưởng thức một bữa ăn ngon như nhà làm, nơi món ăn nuôi dưỡng cả tâm hồn.' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Trường Sơn - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Tuấn Mập - Bánh Mì Chảo & Bò Bít Tết - Lãnh Binh Thăng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại 116 Lãnh Binh Thăng, Bánh Mì Tuấn Mập là góc nhỏ quen thuộc cho những ai mê ẩm thực đường phố Sài Gòn. Mỗi phần Bánh Mì Chảo nóng hổi hay Bò Bít Tết thơm lừng tại đây đều được chế biến với tất cả tâm huyết, mang đến hương vị đặc trưng và sự ấm lòng khó quên. Ghé Tuấn Mập để thưởng thức bữa ăn ngon, chất lượng với mức giá bình dân, xứng đáng 4.5 sao!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Tuấn Mập - Bánh Mì Chảo & Bò Bít Tết - Lãnh Binh Thăng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới, mỗi đĩa cơm là một lời mời gọi ấm áp. Miếng bò beefsteak mềm mọng, nước sốt đậm đà quyện cùng trứng lòng đào béo ngậy, tạo nên hương vị khó cưỡng như cơm mẹ nấu. Chúng tôi phục vụ bằng tất cả cái tâm, sẵn sàng mang đến cho bạn bữa ăn ngon miệng, tràn đầy năng lượng bất kể đêm ngày giữa lòng Quận 11.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hủ Tiếu Chay - Tôn Thất Hiệp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Quận 11, Hủ Tiếu Chay - Tôn Thất Hiệp mời gọi bạn đến với thế giới ẩm thực chay Việt tinh tế, nơi bình yên và hương vị hòa quyện. Mỗi tô hủ tiếu, bún hay mì đều được chúng tôi chăm chút bằng tất cả cái tâm, từ nước dùng thanh ngọt đến nguyên liệu tươi ngon, để đánh thức trọn vẹn vị giác. Với điểm 4.5 sao và thực đơn đa dạng như Hủ Tiếu Nam Vang Chay hay Bún Huế Chay, chúng tôi tin sẽ mang đến một bữa ăn an lành, ấm lòng thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Hủ Tiếu Chay - Tôn Thất Hiệp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Truyền Ký - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cơm Truyền Ký - Quận 11, mỗi món ăn là một câu chuyện về tình thân và ẩm thực Hoa truyền thống. Từ Cơm Gà Hải Nam mềm mọng đến Cơm Xá Xíu đậm đà, chúng tôi chắt chiu từng hương vị để mang đến cho bạn bữa cơm gia đình ấm cúng ngay giữa lòng Sài Gòn. Ghé con hẻm nhỏ Lý Thường Kiệt để tìm thấy sự an yên và thưởng thức những món ăn được nấu bằng cả trái tim.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Truyền Ký - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sủi Cảo Ngọc Ý - Hà Tôn Quyền
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ngọc Ý – Sủi Cảo Hà Tôn Quyền, nơi hương vị truyền thống Trung Hoa gói gọn trong từng viên sủi cảo nức tiếng 4.5 sao. Mỗi viên bánh được làm thủ công với sự tỉ mỉ, từ vỏ dai mềm đến nhân thập cẩm đậm đà, thấm đượm bí quyết gia truyền. Dù là món nước ấm lòng hay chiên giòn rụm, bạn sẽ cảm nhận được cái tâm và sự ấm áp trong từng món ăn. Mời bạn ghé 187-189 Hà Tôn Quyền để trải nghiệm bữa tiệc vị giác bình dị mà khó quên!' AS story 
    FROM Restaurants 
    WHERE name = N'Sủi Cảo Ngọc Ý - Hà Tôn Quyền'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sủi Cảo Thiên Thiên - Hà Tôn Quyền
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Sủi Cảo Thiên Thiên - Hà Tôn Quyền, nơi mỗi chiếc sủi cảo được nắn nót gói trọn tinh hoa ẩm thực. Từ sủi cảo tôm mực tươi rói, mì thập cẩm đậm đà đến xá xíu thơm lừng, chúng tôi luôn đặt cái tâm vào từng nguyên liệu để mang đến hương vị chuẩn mực nhất. Ghé 195 Hà Tôn Quyền để cảm nhận sự ấm áp và no bụng trong từng suất ăn chất lượng 4.5 sao nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Sủi Cảo Thiên Thiên - Hà Tôn Quyền'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sủi Cảo 193 - Hà Tôn Quyền
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Sủi Cảo 193 - Hà Tôn Quyền, chúng tôi gói ghém cả tâm tình vào từng viên sủi cảo chuẩn vị Hoa truyền thống. Từ lớp vỏ mỏng mượt, nhân thịt đậm đà cho đến nước dùng thanh ngọt trứ danh, mỗi món ăn đều là sự kết tinh của tinh hoa ẩm thực. Mời bạn ghé quán để tìm thấy một góc nhỏ ấm cúng, nơi hương vị sủi cảo đặc biệt sẽ làm hài lòng mọi thực khách, xứng đáng với điểm 4.5 sao yêu thích.' AS story 
    FROM Restaurants 
    WHERE name = N'Sủi Cảo 193 - Hà Tôn Quyền'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sủi Cảo 162 - Hà Tôn Quyền
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Sủi Cảo 162 - Hà Tôn Quyền, bạn sẽ hiểu vì sao con phố này lại nổi tiếng đến vậy. Từ viên sủi cảo tôm tươi căng mọng, vỏ bánh dai mềm cho đến nước dùng đậm đà tinh túy, mỗi món ăn đều được đôi tay tài hoa và tấm lòng người đầu bếp gửi gắm. Nơi đây không chỉ là một quán ăn bình dân mà còn là điểm hẹn của hương vị truyền thống, ấm áp và ngon khó cưỡng giữa Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Sủi Cảo 162 - Hà Tôn Quyền'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bò Né 3 Anh Em - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Bò Né 3 Anh Em - Quận 11, nơi mỗi buổi sáng đều bắt đầu với chảo bò né sizzling nóng hổi. Ba anh em chúng tôi gửi gắm cả tình yêu và bí quyết vào từng miếng bò mềm tan, pate thơm lừng và trứng ốp la lòng đào, tạo nên hương vị khó quên. Ghé ngay 221 Hòa Bình để cảm nhận sự ấm cúng và thưởng thức bữa ăn bình dân đậm đà, đánh thức vị giác của bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Bò Né 3 Anh Em - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tàu Hũ tươi Covang Quận 11 - Bình Thới
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tàu Hũ tươi Covang Quận 11 là góc nhỏ ấm áp chờ đón bạn sau ngày dài. Thưởng thức chén Tàu Hũ Co Vang mềm tan, sương sáo gói sữa béo thơm hay panna cotta chanh dây thanh mát, mỗi món đều là sự kết hợp của nguyên liệu tươi ngon và tâm huyết. Trải nghiệm vị ngọt tự nhiên, chuẩn 5 sao để xoa dịu mọi giác quan ngay tại 166 Bình Thới!' AS story 
    FROM Restaurants 
    WHERE name = N'Tàu Hũ tươi Covang Quận 11 - Bình Thới'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Cuốn & Bánh Ướt Phú Lâm - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Cuốn & Bánh Ướt Phú Lâm – Quận 11 tự hào mang đến hương vị ẩm thực truyền thống Việt gói trọn cả cái tâm người đầu bếp. Mỗi chiếc bánh cuốn trứng lá dứa thơm lừng hay bánh ướt đặc biệt đều được chăm chút tỉ mỉ, tươi ngon mỗi ngày. Ghé quán để thưởng thức bữa ăn bình dị, ấm áp như nhà làm, nơi bạn tìm thấy sự quen thuộc và hài lòng giữa lòng Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Cuốn & Bánh Ướt Phú Lâm - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Sầu Riêng 9 Sạch - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Sầu Riêng 9 Sạch - Quận 11, chúng tôi ấp ủ niềm đam mê tạo nên những chiếc bánh thơm ngon từ nguyên liệu tuyển chọn "sạch" nhất. Từ hương sầu riêng nồng nàn làm nên tên tuổi, đến những sáng tạo độc đáo như bánh ngàn lớp lá dứa hay phô mai than tre, mỗi món đều gửi gắm sự tỉ mỉ và tâm huyết. Ghé thăm để khám phá thế giới bánh ngọt đa dạng, cảm nhận từng lớp bánh giòn tan, mềm mịn tan chảy và chọn món quà ý nghĩa cho người thân yêu. Một trải nghiệm vị giác ngọt ngào đang chờ đón bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Sầu Riêng 9 Sạch - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt 3 Chị Em - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ăn Vặt 3 Chị Em - Quận 11, chúng tôi gói trọn tình cảm vào từng món ăn bình dân, đậm vị Á. Nơi đây là điểm hẹn quen thuộc cho những ai mê mẩn Chân Gà Rút Xương giòn sần sật, Khoai Tây Lắc phô mai thơm lừng hay Mẹt Chiên nóng hổi. Ba chị em tỉ mỉ chọn nguyên liệu, nêm nếm bằng cả trái tim để mỗi miếng ăn là một trải nghiệm khó quên. Ghé ngay để cảm nhận sự hài lòng đã được hơn 4.5 sao khẳng định!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt 3 Chị Em - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11 là nơi hội tụ tinh hoa ẩm thực Thái Lan truyền thống giữa lòng Sài Gòn. Từ Pad Thái Tôm trứ danh, Mì TomYum chua cay hấp dẫn đến Xôi Xoài ngọt lịm, mỗi món ăn đều được đầu bếp tận tâm chế biến, mang đậm hương vị bản xứ. Chúng tôi mong muốn mang đến những bữa ăn ngon miệng, ấm cúng và những trải nghiệm khó quên cho gia đình bạn. Hãy ghé SOI THAI để cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'SOI THAI - MÓN THÁI, TRÀ SỮA QUẬN 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn & Xiên Que Cá Con - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Mì Trộn & Xiên Que Cá Con ở Cư Xá Bình Thới, bạn sẽ tìm thấy một góc ẩm thực Á Đông giản dị mà đầy ắp tình yêu. Mỗi tô mì trộn, mỗi xiên que cá con đều được nêm nếm bằng cả tấm lòng, mang đến hương vị chuẩn nhà làm, đậm đà khó cưỡng. Từ Mì Trộn Mandu béo ngậy đến Xúc Xích Lốc Xoáy giòn tan, chúng tôi tin rằng bữa ăn ngon sẽ xua tan mọi mệt mỏi và làm ấm lòng bạn. Hãy đến và trải nghiệm hương vị "bình dân mà không hề tầm thường" này nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn & Xiên Que Cá Con - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán YumIco - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Rán YumIco Quận 11, mỗi miếng gà Tender giòn rụm bên ngoài, mọng nước bên trong là cả tâm huyết được ướp tẩm bí quyết riêng, mang đến hương vị khó quên. Dù là bữa ăn nhanh hay tụ họp bạn bè, chúng tôi tự hào là điểm đến quen thuộc, ấm cúng tại Cư Xá Lữ Gia. Ghé YumIco để trải nghiệm vị ngon đã được 4.5 sao khẳng định nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán YumIco - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn Phủ Trứng - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Mì Trộn Phủ Trứng - Quận 11, góc nhỏ ấm cúng nơi hương vị Á Đông làm say lòng thực khách. Mỗi phần mì trộn được chế biến tỉ mỉ, từ sợi mì dai ngon đến topping đậm đà, đặc biệt là lòng đào béo ngậy tan chảy, tạo nên bản giao hưởng vị giác khó cưỡng. Ghé 341/14D Lạc Long Quân để tự mình cảm nhận sự tâm huyết và hương vị đã tạo nên thương hiệu 4.5 sao của chúng tôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn Phủ Trứng - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: An Lạc - Ăn Chay - Quận 11
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại An Lạc - Ăn Chay, mỗi món ăn là một câu chuyện về sự bình yên và hương vị thuần túy. Từ Bánh mì xíu mại chay thơm lừng đến Mì trộn đậm đà, chúng tôi tự hào mang đến những bữa ăn thanh đạm, được chế biến với tất cả tấm lòng và nguyên liệu tươi ngon. Hãy ghé An Lạc để cảm nhận sự an lành trong từng miếng và nạp năng lượng tích cực cho ngày dài, giữa lòng Quận 11 thân thương.' AS story 
    FROM Restaurants 
    WHERE name = N'An Lạc - Ăn Chay - Quận 11'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Hàu Ngọc Béo Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cháo Hàu Ngọc Béo Gò Vấp: Điểm dừng chân lý tưởng cho tín đồ ẩm thực đường phố. Từng tô cháo hàu nóng hổi, sánh mịn, đậm đà vị hàu tươi rói, ngọt thơm sẽ đánh thức mọi giác quan. Ghé 12 Dương Quảng Hàm để thưởng thức hương vị chất lượng, ấm áp và bình dị, đã làm hài lòng bao thực khách gần xa!' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Hàu Ngọc Béo Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ghiền Ăn Vặt - Bánh Tráng Nướng - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghiền Ăn Vặt không chỉ là một quán ăn, mà là góc nhỏ bình yên nép mình trong hẻm Gò Vấp, nơi hương vị món quê thân quen được gói ghém bằng cả cái tâm. Từ bánh tráng mắm ruốc giòn thơm, bánh tráng lụi sốt me chua ngọt đến combo món quê đậm đà, mỗi món đều khiến bạn phải ''ghiền'' ngay từ miếng đầu tiên. Một ly trà tắc thái xanh mát lạnh sẽ hoàn thiện trải nghiệm ẩm thực chuẩn vị Á Đông, khiến bạn muốn ghé lại mãi không thôi. Hãy đến và cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Ghiền Ăn Vặt - Bánh Tráng Nướng - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp, chúng tôi gửi gắm cả tâm tình vào từng món bánh tráng tuổi thơ. Nơi đây, bạn sẽ khám phá Bánh Tráng Chấm đậm đà, Bánh Tráng Tỏi xike thơm lừng và đặc biệt là Mỡ Hành KHÔNG CAY độc đáo, chiều lòng mọi vị giác. Đến 79/5 Thống Nhất để thưởng thức hương vị gần gũi, quen thuộc nhưng vẫn đầy cuốn hút, một nét chấm phá riêng của Gò Vấp.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hủ Tiếu Thái Lan Gò Vấp 20K
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Gò Vấp sôi động, Hủ Tiếu Thái Lan Gò Vấp 20K là điểm hẹn ấm áp cho những ai mê mẩn hương vị Thái chuẩn mực. Từ tô hủ tiếu Tomyum full topping bùng vị đến mì trộn sốt độc quyền, mỗi món ăn đều gói trọn tâm huyết, mang đến trải nghiệm ẩm thực chất lượng 4.8 sao với mức giá bình dân đến bất ngờ. Hãy đến và để chúng tôi kể câu chuyện ẩm thực bằng tô hủ tiếu nóng hổi, đậm đà!' AS story 
    FROM Restaurants 
    WHERE name = N'Hủ Tiếu Thái Lan Gò Vấp 20K'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 255 Lê Văn Thọ Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Rán Jimama, mỗi miếng gà giòn rụm vàng ươm hay phần mỳ Ý sốt đậm đà đều được chúng tôi gửi gắm sự tận tâm. Chúng tôi tin rằng bữa ăn ngon không chỉ là hương vị mà còn là cảm giác ấm áp, thân thuộc, nơi bạn có thể thoải mái sẻ chia. Hãy ghé 255 Lê Văn Thọ, Gò Vấp để tận hưởng những món ăn chất lượng, giá mềm và tạo nên những khoảnh khắc vui vẻ bên bạn bè, gia đình!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 255 Lê Văn Thọ Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Xôi Ghẹ Chính Gốc - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Gò Vấp nhộn nhịp, Xôi Ghẹ Chính Gốc là điểm hẹn cho những ai yêu mến hương vị truyền thống. Nổi bật với món Xôi Ghẹ Vỏ Giòn trứ danh, từng hạt nếp dẻo thơm quyện cùng thịt ghẹ tươi rói, ngọt đậm đà tạo nên bản hòa tấu vị giác khó quên. Từ Xôi Gà Xối Mỡ giòn rụm đến Xôi Ba Chỉ Khâu Nhục đậm đà, mỗi món ăn tại đây đều gói trọn tâm huyết và bí quyết riêng, mang đến một bữa ăn chuẩn vị bình dân đầy hấp dẫn. Ghé Xôi Ghẹ Chính Gốc để thưởng thức và cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Xôi Ghẹ Chính Gốc - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hiếu Hàu Gò Vấp - Lê Đức Thọ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hiếu Hàu Gò Vấp - Lê Đức Thọ là điểm hẹn lý tưởng cho những ai trót yêu hương vị biển cả tươi rói. Tại đây, mỗi con hàu được nâng niu, biến tấu thành đủ món hấp dẫn từ nướng phô mai trứng cút béo ngậy, thơm lừng đến hấp thanh mát giữ trọn vị ngọt tự nhiên. Chúng tôi gói trọn cái tâm vào từng đĩa hàu, mong mang đến trải nghiệm ẩm thực bình dị mà cuốn hút, ấm lòng. Hãy ghé Hiếu Hàu để khám phá hương vị đặc trưng, khó quên nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Hiếu Hàu Gò Vấp - Lê Đức Thọ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Đại Hàn - Đường Số 19, Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Mì Cay Đại Hàn Gò Vấp, nơi gói trọn hương vị chuẩn Hàn Quốc trong mỗi tô mì nóng hổi! Từng sợi mì dai ngon hòa quyện cùng nước dùng cay nồng, đậm đà từ Mì Kimchi Hải Sản đến Ramyun Bò, đều được chúng tôi nấu bằng cả tâm huyết. Ghé ngay để thưởng thức bữa ăn ấm cúng, xua tan mọi mệt mỏi và cảm nhận vị ngon khó cưỡng giữa lòng Gò Vấp thân thương.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Cay Đại Hàn - Đường Số 19, Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: QUÁN ĂN HÀN QUỐC SEUON KIM NEKO - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tọa lạc trong con hẻm nhỏ Gò Vấp, Quán Ăn Hàn Quốc Seuon Kim Neko là điểm hẹn ấm cúng cho những tâm hồn yêu ẩm thực xứ sở kim chi. Mỗi tô Cơm trộn đầy đặn hay Mì tương đen chuẩn vị đều được chế biến bằng tất cả sự tỉ mỉ và tấm lòng. Đến với chúng tôi, bạn sẽ được thưởng thức hương vị Hàn Quốc chân thật, đậm đà, mang lại cảm giác hài lòng và ấm áp như tại nhà. Một trải nghiệm ẩm thực 4.8 sao đang chờ bạn khám phá!' AS story 
    FROM Restaurants 
    WHERE name = N'QUÁN ĂN HÀN QUỐC SEUON KIM NEKO - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Mẹ Shin Will - Chân Gà Sốt Thái Cay 5 Cấp Độ Và Trà Sữa, Ăn Vặt
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bếp Mẹ Shin Will là nơi hội tụ hương vị Á Đông đặc sắc, nơi những món ăn được chế biến bằng cả tấm lòng. Hãy khám phá chân gà sốt Thái cay nồng 5 cấp độ trứ danh, giòn sần sật thấm vị cùng Sứa Sốt Thái thanh mát. Ghé Bếp Mẹ để tận hưởng những buổi "nhậu" ấm cúng bên bạn bè, nhâm nhi trà sữa và cảm nhận sự thân thuộc như bữa cơm gia đình.' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Mẹ Shin Will - Chân Gà Sốt Thái Cay 5 Cấp Độ Và Trà Sữa, Ăn Vặt'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lẩu Khổ Qua Cá Thác Lác - Chợ Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Lẩu Khổ Qua Cá Thác Lác Chợ Gò Vấp, chúng tôi tự hào gìn giữ hương vị lẩu gia đình truyền thống: vị đắng nhẹ của khổ qua thanh mát hòa quyện cùng miếng cá thác lác dai ngọt tươi rói, tạo nên bản giao hưởng vị giác khó quên. Mỗi nồi lẩu, từ xí quách đậm đà đến đầu cá hồi béo ngậy hay bạch tuột giòn sần sật, đều được nấu bằng cái tâm và sự tỉ mỉ, mang đến bữa ăn ấm cúng như nhà làm. Hãy đến và cảm nhận sự chăm chút trong từng nguyên liệu, từng hương vị đã làm nên thương hiệu được yêu mến tại Gò Vấp.' AS story 
    FROM Restaurants 
    WHERE name = N'Lẩu Khổ Qua Cá Thác Lác - Chợ Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Bò Huế Cô Tuyết - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Nép mình trong con hẻm nhỏ Gò Vấp, Bún Bò Huế Cô Tuyết là điểm dừng chân ấm áp dành cho những ai tìm kiếm hương vị bún bò chuẩn vị. Nước dùng đậm đà được hầm kỹ, thơm lừng mùi sả ớt, hòa quyện cùng từng lát thịt bò, nạm, gân, giò tươi ngon thấm đượm cái tâm người nấu. Đặc biệt, ly nước sâm nhà làm thanh mát sẽ là cái kết hoàn hảo cho bữa ăn tròn vị, mang đến trải nghiệm ẩm thực chân thành và gần gũi.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Bò Huế Cô Tuyết - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Ếch Geylang Gia Bảo - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cháo Ếch Geylang Gia Bảo tự hào mang hương vị Singapore trứ danh về ngay Gò Vấp, Sài Gòn. Mỗi tô cháo nóng hổi, từ thịt ếch tươi ngon thấm đẫm sốt gừng đặc trưng đến hạt cháo mềm mượt, đều được nấu bằng cả tâm huyết, là bí quyết của gia đình chúng tôi. Đến đây, bạn không chỉ thưởng thức cháo ếch lừng danh mà còn có cháo bò sốt tiêu xanh độc đáo, hứa hẹn một bữa ăn ấm bụng, đậm đà và thân thuộc như ở nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Ếch Geylang Gia Bảo - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Snow Bingsu & Tea Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Snow Bingsu & Tea Gò Vấp ấp ủ tình yêu vào từng ly Bingsu mát lạnh và ly trà sữa thơm lừng, mang đến khoảnh khắc ngọt ngào xua tan mọi mệt mỏi. Từ Bingsu Dâu Xoài tươi rói, Matcha Đậu Đỏ béo bùi đến Hồng Trà Sữa Phomai Dầm độc đáo, mỗi hương vị đều được chăm chút tỉ mỉ. Ghé ngay 78/11 Nguyễn Văn Khối để tìm thấy góc nhỏ bình yên, nơi vị giác và tâm hồn bạn được vỗ về trong không gian ấm cúng, thân thiện!' AS story 
    FROM Restaurants 
    WHERE name = N'Snow Bingsu & Tea Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hân Gia Ký Gò Vấp - Mì Xào Giòn & Hủ Tiếu Xào - Lê Quang Định
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hân Gia Ký Gò Vấp tự hào mang đến những món mì xào giòn rụm và hủ tiếu xào hải sản chuẩn vị gia đình, nơi mỗi đĩa ăn đều chứa đựng cái tâm tỉ mỉ. Với bí quyết riêng, từng sợi mì giòn tan, từng miếng hải sản tươi ngon hòa quyện trong nước sốt đậm đà, tạo nên hương vị khó quên. Ghé 583 Lê Quang Định để cảm nhận sự ấm cúng và thưởng thức bữa ăn ngon đúng điệu.' AS story 
    FROM Restaurants 
    WHERE name = N'Hân Gia Ký Gò Vấp - Mì Xào Giòn & Hủ Tiếu Xào - Lê Quang Định'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiramisu - Gò vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tiramisu - Gò vấp là góc nhỏ ngọt ngào nơi hương vị Tiramisu Ý truyền thống được kể lại bằng những biến tấu đầy bất ngờ. Từ Tiramisu Nhãn thơm lừng đến Tiramisu Dâu tây thanh mát, mỗi chiếc bánh đều chứa đựng sự tinh tế và cái tâm của người làm bánh. Đừng quên Khúc Bạch Sầu Riêng béo ngậy khó cưỡng. Hãy ghé thăm để tìm thấy khoảnh khắc bình yên và những niềm vui ngọt ngào rất riêng giữa lòng Gò Vấp.' AS story 
    FROM Restaurants 
    WHERE name = N'Tiramisu - Gò vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hạt Dẻ Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hạt Dẻ Gò Vấp ủ ấp hương vị mộc mạc của hạt dẻ rang thơm lừng, mang đến trải nghiệm bình yên giữa lòng Sài Gòn. Mỗi hạt dẻ được chọn lựa kỹ lưỡng, rang đều tay, hay nấu thành chè táo đỏ ngọt dịu, thấm đượm cái tâm người làm. Ghé 29/7/22 Lê Đức Thọ để tìm về chút ký ức tuổi thơ, nơi vị ngon 4.7 sao luôn chờ đón bạn với sự ấm áp.' AS story 
    FROM Restaurants 
    WHERE name = N'Hạt Dẻ Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Chấm & Xiên Que Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về chút Sài Gòn thân thương tại Bánh Tráng Chấm & Xiên Que Gò Vấp, nơi mỗi món ăn đều gói trọn hương vị tuổi thơ. Từ bánh tráng trộn chả đậm đà, bánh tráng sa tế mỡ hành thơm lừng đến xoài sống sốt Thái chua cay giòn rụm, chúng tôi tỉ mẩn chế biến từ cái tâm để mang đến những trải nghiệm ẩm thực đường phố chuẩn vị. Ghé ngay để nếm thử và cảm nhận sự ấm áp, ngon miệng trong từng khoảnh khắc bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Chấm & Xiên Que Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hủ Tiếu Mực - Bún Thái Tí Nị - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Hủ Tiếu Mực - Bún Thái Tí Nị Gò Vấp để khám phá tô bún Thái Tí Nị gây thương nhớ hay hủ tiếu mực tươi ngon nức tiếng. Mỗi món ăn là sự hòa quyện tinh tế giữa công thức gia truyền và nguyên liệu chọn lọc, mang đến hương vị chuẩn mực của sự tận tâm. Chúng tôi mong muốn mỗi bữa ăn tại đây sẽ là khoảnh khắc ấm áp, gợi nhắc về hương vị thân quen, đậm đà tình cảm gia đình.' AS story 
    FROM Restaurants 
    WHERE name = N'Hủ Tiếu Mực - Bún Thái Tí Nị - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: BÁNH TRÁNG & ĂN VẶT - MỸ HẰNG - GÒ VẤP
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Tráng & Ăn Vặt Mỹ Hằng Gò Vấp, chúng tôi gói ghém cả tấm lòng vào từng món ăn vặt tuổi thơ. Từ bánh tráng dẻo trộn trứng gà béo ngậy, mỡ hành thơm lừng đến bánh tráng cuốn đỏ sốt me chua ngọt, mỗi hương vị đều được chăm chút tỉ mỉ để bạn nhớ mãi. Ghé Mỹ Hằng, bạn sẽ tìm thấy một góc ẩm thực bình dị, nơi những món ngon đậm đà mang dấu ấn riêng đang chờ được khám phá.' AS story 
    FROM Restaurants 
    WHERE name = N'BÁNH TRÁNG & ĂN VẶT - MỸ HẰNG - GÒ VẤP'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trạm Cơm Gà & Bánh Mì 24H - Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa nhịp sống hối hả Gò Vấp, Trạm Cơm Gà & Bánh Mì 24H là điểm dừng chân lý tưởng, chào đón bạn bất kể ngày đêm. Nơi đây, từ Cơm Gà Xối Mỡ đùi tỏi "siêu ngon" giòn rụm đến Cơm Chiên Gà Trứng Lòng Đào béo ngậy, mỗi món đều được làm từ nguyên liệu tươi ngon và gói trọn tâm huyết. Chúng tôi tự hào mang đến những bữa ăn đậm đà hương vị truyền thống, luôn ấm nóng và xứng đáng với 4.8/5 sao mà thực khách tin yêu.' AS story 
    FROM Restaurants 
    WHERE name = N'Trạm Cơm Gà & Bánh Mì 24H - Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Ốc Tự Chọn Gò Vấp - Lê Hoàng Phái
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Quán Ốc Tự Chọn Gò Vấp - Lê Hoàng Phái để đắm chìm vào thế giới ốc tự chọn tươi ngon, chuẩn vị nhậu. Từ ốc len xào dừa béo ngậy, nghêu hấp Thái cay nồng đến càng ghẹ xào me chua ngọt hấp dẫn, mỗi món là một câu chuyện hương vị riêng. Hẹn hò bạn bè và tận hưởng những khoảnh khắc vui vẻ tại góc nhỏ ấm áp trên đường Lê Hoàng Phái nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Ốc Tự Chọn Gò Vấp - Lê Hoàng Phái'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Delica - Mỳ Ý & Pizza - Phan Văn Trị
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Delica - Mỳ Ý & Pizza Phan Văn Trị, bạn sẽ tìm thấy không gian ấm cúng lý tưởng cho những buổi hẹn hò lãng mạn. Từng món ăn, từ pizza phô mai xúc xích bacon béo ngậy đến mì Ý tôm tỏi sốt bơ cay đặc biệt, đều được đầu bếp gửi gắm trọn vẹn hương vị và tâm huyết. Hãy ghé Delica 558 Phan Văn Trị để trải nghiệm ẩm thực 4.7 sao, nơi mỗi bữa ăn là một kỷ niệm khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Delica - Mỳ Ý & Pizza - Phan Văn Trị'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bê Tươi Quyết Thắng Gò Vấp
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bê Tươi Quyết Thắng Gò Vấp tự hào mang đến những món bê tươi ngon nức lòng, được chế biến từ cái tâm và bí quyết gia truyền. Thưởng thức Bê thui thơm lừng, Dựng bò chiên giòn đậm đà hay Lẩu Xí Quách nóng hổi, mỗi món ăn là một bản hòa tấu hương vị Việt mộc mạc mà quyến rũ. Hãy ghé 102 Đường 28 để cùng bạn bè, người thân sum vầy, sẻ chia khoảnh khắc tuyệt vời bên mâm cơm ấm cúng!' AS story 
    FROM Restaurants 
    WHERE name = N'Bê Tươi Quyết Thắng Gò Vấp'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Delica - Mỳ ý & Pizza - Nguyễn Văn Khối
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Delica - Mỳ ý & Pizza chào đón bạn đến với thế giới hương vị Ý nồng nàn, nơi mỗi món ăn là một câu chuyện tình yêu. Từ những sợi mì Ý dai ngon đến lát pizza giòn tan chuẩn vị, tất cả đều được tạo nên bằng cả tâm huyết. Ghé Delica để tận hưởng không gian ấm cúng, lãng mạn và cùng người thương tạo nên những khoảnh khắc ẩm thực đáng nhớ. Hãy để chúng tôi mang đến cho bạn trải nghiệm tuyệt vời nhất.' AS story 
    FROM Restaurants 
    WHERE name = N'Delica - Mỳ ý & Pizza - Nguyễn Văn Khối'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nem Nướng Nha Trang Bé Thảo
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Dừng chân tại Nem Nướng Nha Trang Bé Thảo trên con hẻm nhỏ Hoàng Sa, bạn sẽ được chào đón bởi hương thơm nem nướng vàng ươm, giòn rụm chuẩn vị Nha Trang. Mỗi phần ăn là sự kết hợp tinh tế giữa nem, rau sống tươi rói và chén nước chấm bí truyền đậm đà, gói trọn cả cái tâm của người làm. Nơi đây là điểm hẹn quen thuộc cho những ai yêu mến ẩm thực đường phố và đã được hàng ngàn thực khách tin yêu với 4.8/5 sao.' AS story 
    FROM Restaurants 
    WHERE name = N'Nem Nướng Nha Trang Bé Thảo'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tacos Toro - Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tacos Toro - Nhà Bè: Nơi hương vị Tacos bùng nổ ngay giữa lòng Nhà Bè! Chúng tôi tự hào mang đến những chiếc Tacos nóng hổi, vỏ giòn tan cùng nhân Bò Phô Mai béo ngậy, Gà thơm lừng hay Hải Sản tươi rói, mỗi món ăn là cả tâm huyết của người đầu bếp. Ghé 2129/47 Huỳnh Tấn Phát để khám phá hương vị độc đáo, nạp đầy năng lượng và trải nghiệm sự ấm áp mà chỉ Tacos Toro mới có!' AS story 
    FROM Restaurants 
    WHERE name = N'Tacos Toro - Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Thị Gọt Fruits - Trái Cây Tươi Gọt Sẵn - Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến với Thị Gọt Fruits – nơi những lát trái cây tươi ngon nhất được gọt sẵn, trao tận tay bạn. Từng miếng Mận Hậu giòn chua, Thơm Thái ngọt thanh hay Xoài chín mềm mọng đều được chọn lựa kỹ lưỡng bằng cả tấm lòng. Chúng tôi mong muốn mang đến sự tiện lợi, một chút ngọt lành xua tan mọi mệt mỏi trong ngày. Ghé Thị Gọt để cảm nhận hương vị tự nhiên và sự tươi mới đánh thức mọi giác quan nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Thị Gọt Fruits - Trái Cây Tươi Gọt Sẵn - Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nhà Food - Lê Tấn Bê
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Nhà Food - Lê Tấn Bê, chúng tôi tin rằng bữa ăn ngon nhất là bữa ăn mang lại cảm giác ấm cúng như ở nhà. Hãy thử món mì Indomie trộn trứ danh với sợi mì dai ngon quyện cùng nước sốt đậm đà và topping đa dạng, từ gà viên đến xá xíu thơm lừng. Với không gian bình dị, giá cả phải chăng, đây chính là điểm dừng chân lý tưởng để bạn nạp năng lượng và tận hưởng hương vị quen thuộc một cách thật đặc biệt.' AS story 
    FROM Restaurants 
    WHERE name = N'Nhà Food - Lê Tấn Bê'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Highlands Coffee - Trà, Cà Phê & Bánh - Dragon Hill 1 Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn ghé Highlands Coffee Dragon Hill 1 Nhà Bè, nơi bạn có thể tìm thấy một góc bình yên để thưởng thức. Từ hương vị cà phê PhinĐI Choco đậm đà chuẩn Việt đến trà sữa trà xanh thanh mát, mỗi món đều được pha chế với tất cả tâm huyết. Đừng quên thử Bánh Mì Que Pate giòn rụm trứ danh. Ghé thăm để thư giãn và nạp năng lượng cho ngày mới nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Dragon Hill 1 Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Nhà Bé Bự
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cơm Nhà Bé Bự không chỉ là quán ăn, mà là nơi bạn tìm về hương vị ấm áp của bữa cơm nhà. Mỗi món ăn, từ Bún nước tương Keo Vy đặc biệt đến Cơm Ba Rọi Chiên Sả Ớt đậm đà, đều được nêm nếm bằng cả tấm lòng và những công thức lưu giữ. Chúng tôi tự hào mang đến trải nghiệm "Bé Bự" đúng nghĩa: ngon miệng, no bụng và đong đầy tình cảm. Ghé Cơm Nhà Bé Bự để cảm nhận sự khác biệt bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Nhà Bé Bự'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Yn Tea - Tiệm Trà Sữa Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Yn Tea - Tiệm Trà Sữa Nhà Bè là điểm đến lý tưởng cho những ai tìm kiếm sự bình yên và hương vị thân quen giữa lòng phố thị. Từ Matcha Latte đậm đà, Matcha Dâu tươi mới đến Nguyên Lá Kem Cheese béo ngậy, mỗi ly trà đều được pha chế bằng cả cái tâm, chọn lọc từ những nguyên liệu tốt nhất. Hãy ghé Yn Tea để thư giãn, tận hưởng những khoảnh khắc ngọt ngào và cảm nhận sự khác biệt trong từng ngụm trà. Chúng tôi luôn chờ đón bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Yn Tea - Tiệm Trà Sữa Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Nhà - Cơm Văn Phòng & Cơm Phần
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bếp Nhà mời bạn về với mâm cơm nhà đúng điệu Sài Gòn, nơi mỗi món ăn đều được nêm nếm bằng cả tấm lòng. Từ miếng sườn cốt lết nướng trứ danh đến cá hú kho tộ đậm đà, chúng tôi chắt chiu tinh hoa ẩm thực Việt để mang đến bữa trưa văn phòng ấm bụng, chuẩn vị như mẹ nấu. Hàng nghìn thực khách đã tin chọn hương vị thân thương này, còn bạn thì sao?' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Nhà - Cơm Văn Phòng & Cơm Phần'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Nhà Bin - Kinh Dương Vương
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bếp Nhà Bin, mỗi món ăn là một câu chuyện ấm áp, ẩn mình trong con hẻm nhỏ 600/12/4A Kinh Dương Vương. Từ Kimbap tươi ngon, mì cay bùng vị đến crepe sầu riêng béo ngậy, chúng tôi gói ghém cả tâm tình vào từng hương vị Á-Âu quen thuộc. Hãy ghé Bếp Nhà Bin để trải nghiệm bữa ăn "nhà làm" đầy đặn và tràn ngập yêu thương, nơi ẩm thực bình dân mang đến sự ấm lòng.' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Nhà Bin - Kinh Dương Vương'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: BÁNH XÈO MIỀN TÂY - HUỲNH THỊ ĐỒNG, NHÀ BÈ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình tại Nhà Bè, BÁNH XÈO MIỀN TÂY - HUỲNH THỊ ĐỒNG là điểm hẹn lý tưởng cho những ai khao khát hương vị miền Tây chân chất. Từng chiếc bánh xèo giòn tan, vàng ươm hay đĩa nui/mì xào bò thơm lừng đều được làm bằng cả tấm lòng. Nơi đây mang đến bữa ăn ngon miệng và ấm cúng, cảm giác gần gũi, đậm đà như nhà làm mà thực khách luôn yêu mến. Hãy ghé để thưởng thức và cảm nhận sự đặc biệt này!' AS story 
    FROM Restaurants 
    WHERE name = N'BÁNH XÈO MIỀN TÂY - HUỲNH THỊ ĐỒNG, NHÀ BÈ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Sốt Gạch Cua Nhà Bé Chi
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Trong con hẻm nhỏ Nguyễn Đình Chiểu, Bánh Mì Sốt Gạch Cua Nhà Bé Chi chờ đón bạn với hương vị đặc trưng khó quên. Mỗi ổ bánh mì nóng giòn hòa quyện cùng sốt gạch cua béo ngậy, thơm lừng và nhân đầy đặn, được chế biến bằng tất cả tấm lòng. Ghé Nhà Bé Chi để thưởng thức sự ấm áp, đậm đà như bữa cơm nhà, chắc chắn sẽ khiến bạn mê mẩn mãi không thôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Sốt Gạch Cua Nhà Bé Chi'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Khoai Mỡ Lắc - Nhà Bé Gôn
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Khoai Mỡ Lắc - Nhà Bé Gôn tự hào mang đến những món khoai chiên giòn rụm, nóng hổi, gói trọn hương vị tuổi thơ ấm áp. Từ khoai mỡ lắc phô mai béo ngậy đến khoai tây lốc xoáy độc đáo, mỗi phần ăn đều được chuẩn bị với tất cả sự tỉ mỉ và tình yêu thương. Ghé qua để thưởng thức và cảm nhận không khí thân quen như nhà mình bạn nhé, đảm bảo sẽ khiến bạn mê mẩn mãi không thôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Khoai Mỡ Lắc - Nhà Bé Gôn'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Khói Quán Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Khói Quán Nhà Bè tại Khu 4T Park để tìm một góc bình yên, nơi hương vị Việt thân quen được chăm chút và nâng tầm. Từ Chả Mực chiên vàng giòn đến Cơm Chiên Hải Sản thơm lừng, mỗi món ăn đều thấm đượm cái "tâm" của người đầu bếp, mang đến những bữa "nhậu" ấm cúng và đầy ắp tiếng cười. Khói Quán mời bạn đến thưởng thức trọn vẹn khoảnh khắc sum vầy bên bạn bè và người thân.' AS story 
    FROM Restaurants 
    WHERE name = N'Khói Quán Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: T & T Coffee - NHÀ BÈ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại T & T Coffee - NHÀ BÈ, bạn sẽ tìm thấy một góc nhỏ ấm cúng, quen thuộc giữa lòng Nhà Bè. Nổi tiếng với Cà Phê Muối đậm đà khó quên, Bạc Xỉu Đá thơm lừng hay Đá Xay Matcha thanh mát, mỗi ly đồ uống đều được pha chế bằng cả tâm huyết. Hãy ghé thăm để tận hưởng hương vị đặc trưng và những khoảnh khắc thư giãn tuyệt vời!' AS story 
    FROM Restaurants 
    WHERE name = N'T & T Coffee - NHÀ BÈ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sầu Riêng Nhà Vườn Bé Sáo - Lê Quang Định
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào bạn đến với Sầu Riêng Nhà Vườn Bé Sáo, nơi hương vị chuẩn nhà vườn được gói ghém cẩn thận. Chúng tôi tự hào mang đến những múi sầu Ri6 vàng ươm, sầu Thái chín cây ngậy béo và Chuồng Bò thơm lừng, được tuyển chọn kỹ càng. Từng hộp cơm sầu là cả tâm huyết, đảm bảo độ tươi ngon, ngọt béo tan chảy ngay từ muỗng đầu tiên. Hãy ghé Bé Sáo để cảm nhận sự tinh túy và biến khoảnh khắc thưởng thức thành món quà ý nghĩa!' AS story 
    FROM Restaurants 
    WHERE name = N'Sầu Riêng Nhà Vườn Bé Sáo - Lê Quang Định'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sâm Chill Me Nhà Bè - Phạm Hữu Lầu
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Sâm Chill Me Nhà Bè – Phạm Hữu Lầu, góc nhỏ bình yên ngay giữa lòng Nhà Bè đang chờ đón bạn. Thư thái cùng Sâm Táo Bát Bảo thanh mát hay đắm chìm trong vị Nước Dừa Tắc sảng khoái, Me Đác Mê Mẫn độc đáo. Mỗi ly thức uống đều được pha chế bằng cả tâm huyết, mang đến những khoảnh khắc "chill" đúng điệu và ngọt ngào khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me Nhà Bè - Phạm Hữu Lầu'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến với Bánh Mì Hà Nội Khu Phố 6, bạn sẽ tìm thấy một góc bình yên mang đậm hương vị quen thuộc giữa lòng Nhà Bè. Từng chiếc bánh mì giòn tan, bông lan trứng muối béo ngậy hay bánh bông cúc thơm lừng đều gói trọn cái tâm người làm, mang đến bữa sáng ngon miệng hay bữa xế ấm lòng. Nơi đây, hương vị truyền thống giao thoa với sự sáng tạo, để mỗi lần ghé là một niềm vui giản dị khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Hà Nội Khu Phố 6 - Thị Trấn Nhà Bè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Nhà Bé Béo - Phạm Hùng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến với Bếp Nhà Bé Béo, nơi mỗi món ăn là một câu chuyện ấm áp như chính tên gọi. Thưởng thức mì phá lấu nước đậm đà, phá lấu bò thơm lừng hay mì trộn đùi gà mắm tỏi chuẩn vị Sài Gòn. Với 4.4 sao đánh giá, chúng tôi tự hào mang đến hương vị thân thương và cái tâm trong từng chén ăn. Ghé Bếp Nhà Bé Béo để tìm lại món ngon quen thuộc như cơm nhà bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Nhà Bé Béo - Phạm Hùng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Nhà Na Sindat Thai - Đinh Bộ Lĩnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Bếp Nhà Na Sindat Thai ở con hẻm 369/10 Đinh Bộ Lĩnh, bạn sẽ tìm thấy một góc Thái Lan bình yên, gần gũi như nhà. Mỗi món ăn, từ Tomyum hải sản chua cay bùng vị đến Gỏi đu đủ Ba Khía độc đáo, đều là tâm huyết được gửi gắm để mang đến hương vị chuẩn mực và ấm lòng. Nơi đây, ẩm thực Thái tinh tế là niềm vui giản dị, chờ bạn ghé thăm và thưởng thức!' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Nhà Na Sindat Thai - Đinh Bộ Lĩnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nem Nướng Nha Trang - Bếp Của Vân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Nem Nướng Nha Trang - Bếp Của Vân, bạn sẽ được chào đón bởi hương thơm nem nướng Nha Trang lừng danh, giòn rụm đậm đà. Mỗi món ăn, từ set đặc biệt đến nem kem phô mai độc đáo, đều được chế biến bằng công thức gia truyền và cả tấm lòng của Bếp Vân. Chúng tôi mời bạn đến thưởng thức hương vị ấm cúng, chuẩn vị gia đình đã chinh phục mọi thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Nem Nướng Nha Trang - Bếp Của Vân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bò Lá Lốt & Mỡ Chài - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước chân vào con hẻm nhỏ 491/189, bạn sẽ tìm thấy Bò Lá Lốt & Mỡ Chài – Phú Nhuận, nơi hương thơm lá lốt nướng quyện mỡ chài dậy lên đầy mời gọi. Mỗi cuốn bò nóng hổi, đậm đà vị truyền thống, ăn kèm mắm nêm, bún và rau tươi xanh mướt, mang đến trải nghiệm ẩm thực chuẩn vị Sài Gòn. Với đánh giá 4.8 sao, đây chính là điểm hẹn lý tưởng để bạn khám phá món ngon bình dân nhưng đầy tinh tế, gói trọn cả cái tâm của người đầu bếp.' AS story 
    FROM Restaurants 
    WHERE name = N'Bò Lá Lốt & Mỡ Chài - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Indomie & Ăn Vặt Phú Nhuận - Phú Nhuận Food
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Indomie & Ăn Vặt Phú Nhuận là nơi biến tấu sợi mì Indomie quen thuộc thành những tuyệt phẩm vị giác khó quên. Tại đây, mỗi đĩa Mì Trộn Indomie Tôm hay Thịt Cua Phủ Trứng đều được ủ ấp bởi công thức sốt độc đáo và nguyên liệu tươi ngon. Hãy ghé 127/1 Cô Giang để khám phá hương vị đậm đà, cùng những món ăn vặt giòn tan, mang đến cho bạn bữa ăn ấm cúng và trọn vẹn nhất.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Indomie & Ăn Vặt Phú Nhuận - Phú Nhuận Food'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hủ Tiếu Xào & Mì Xào Giòn - Phong Ký Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước chân vào Phong Ký, bạn sẽ được đánh thức mọi giác quan với hương thơm đặc trưng của Hủ Tiếu Xào và Mì Xào Giòn. Chúng tôi tự hào mang đến những món xào trứ danh với bí quyết gia truyền, từng sợi mì, hủ tiếu giòn rụm bên ngoài, mềm dai bên trong cùng nước sốt đậm đà khó cưỡng. Mỗi đĩa ăn là cả tâm huyết, hứa hẹn một bữa ngon miệng, ấm lòng ngay tại 63 Phan Đình Phùng. Ghé Phong Ký để cảm nhận hương vị thân quen, đậm đà chất Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Hủ Tiếu Xào & Mì Xào Giòn - Phong Ký Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: BÒ BÍA PHÚ NHUẬN HẺM 96 - PHAN ĐÌNH PHÙNG
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước chân vào hẻm 96 Phan Đình Phùng, bạn sẽ khám phá BÒ BÍA PHÚ NHUẬN – nơi hương vị món Việt truyền thống được gìn giữ vẹn nguyên. Từ những cuốn bò bía mặn thanh nhẹ đến gỏi cuốn tôm thịt tươi rói và bún mắm nêm đậm đà, mỗi món ăn đều gói trọn cái tâm của người làm bếp. Không gian bình dị, gần gũi nhưng hương vị lại đặc sắc khó quên, như một lời mời gọi thân thương từ Sài Gòn xưa.' AS story 
    FROM Restaurants 
    WHERE name = N'BÒ BÍA PHÚ NHUẬN HẺM 96 - PHAN ĐÌNH PHÙNG'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: EmmyHappy - Box Ăn Vặt - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại EmmyHappy - Box Ăn Vặt, chúng mình tin rằng hạnh phúc có thể gói gọn trong từng hộp Kimbap hay tô Mì trộn Gà viên Phô mai nóng hổi. Ghé 20E Cầm Bá Thước, bạn sẽ tìm thấy một không gian ấm cúng, nơi hương vị Hàn Quốc bình dân được chế biến với tất cả sự tỉ mỉ và tâm huyết. Từng món ăn đều là lời mời gọi thân thương, mang đến trải nghiệm ngon miệng và ngập tràn niềm vui.' AS story 
    FROM Restaurants 
    WHERE name = N'EmmyHappy - Box Ăn Vặt - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bento Delichi (by Cooky) - Cơm Gà Mắm Tỏi, Xối Mỡ - Quận Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bento Delichi mời bạn ghé lại góc nhỏ quen thuộc tại Phú Nhuận, nơi hương vị Cơm Gà Mắm Tỏi đậm đà khó quên hay Cơm Gà Xối Mỡ giòn rụm đang chờ. Mỗi suất cơm đều gói trọn tâm huyết, chắt chiu từ nguyên liệu tươi ngon để mang đến bữa ăn chuẩn vị nhà làm, ấm áp và trọn vẹn. Hãy để chúng tôi kể câu chuyện ẩm thực bằng cả tấm lòng qua từng đùi gà vàng ươm bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bento Delichi (by Cooky) - Cơm Gà Mắm Tỏi, Xối Mỡ - Quận Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 1 Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm một chốn dừng chân ấm cúng giữa lòng Phú Nhuận? Ốc Trứng Muối tại 11 Hoa Sữa chính là điểm hẹn lý tưởng cho những buổi tụ họp rôm rả. Nơi bạn sẽ đắm chìm vào thế giới hải sản tươi rói, từ Ốc Bươu nướng tiêu cay nồng đến Hàu 7 Vị độc đáo và đặc biệt là món Ốc Trứng Muối trứ danh làm nên tên tuổi. Mỗi món ăn đều gói trọn tâm huyết của người đầu bếp, hứa hẹn mang đến trải nghiệm vị giác khó quên cùng những khoảnh khắc vui vẻ bên bạn bè.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 1 Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: A Mìn Quán - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé A Mìn Quán ở Phú Nhuận để tìm lại hương vị ẩm thực Hoa truyền thống nức lòng bao thế hệ. Từ Cơm Gà Xối Mỡ da giòn rụm đến Mì Vịt Tiềm thơm lừng thảo mộc, mỗi món ăn đều là sự kết tinh của tâm huyết và công thức gia truyền. Chúng tôi tự hào mang đến những bữa ăn chất lượng, ấm bụng và đậm đà, khiến mỗi thực khách đều cảm thấy như được trở về nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'A Mìn Quán - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Thie Macaron Bakery Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Thie Macaron Bakery Phú Nhuận, bạn sẽ khám phá một thế giới ngọt ngào ẩn mình, nơi mỗi chiếc macaron được ấp ủ bằng cả trái tim và sự tỉ mỉ. Từng viên bánh nhỏ xinh, từ lớp vỏ giòn tan đến nhân kem mềm mượt, là một bản giao hưởng 15 hương vị độc đáo, tan chảy nhẹ nhàng trên đầu lưỡi. Ghé Thie để tìm món quà tinh tế hay tự thưởng cho mình khoảnh khắc an lành, ngập tràn cảm hứng.' AS story 
    FROM Restaurants 
    WHERE name = N'Thie Macaron Bakery Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Truyền Thuyết Champong - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Truyền Thuyết Champong - Phú Nhuận, chúng tôi tin rằng ẩm thực là câu chuyện của tình yêu và sự tận tâm. Mỗi tô Mỳ Champong Hải sản nóng hổi, Mì Tương Đen Xào Cay đậm đà hay Thịt Heo Sốt Chua Ngọt giòn tan đều được chế biến với bí quyết gia đình, mang đến hương vị chuẩn Hàn ấm áp. Ghé 450/1 Phan Xích Long để trải nghiệm bữa ăn trọn vẹn, nơi vị giác và tâm hồn được vỗ về.' AS story 
    FROM Restaurants 
    WHERE name = N'Truyền Thuyết Champong - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: KIM SINH - Mỳ Vịt Tiềm - Trường Sa, Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'KIM SINH - Mỳ Vịt Tiềm Trường Sa, chốn dừng chân ấm áp để khám phá tinh hoa ẩm thực Trung Hoa gia truyền. Nổi bật với tô mỳ vịt tiềm góc tư đùi trứ danh cùng nước dùng thuốc bắc đậm đà, mỗi món ăn tại đây đều được chế biến bằng cả tâm huyết, mang đến hương vị bồi bổ và cảm giác như bữa cơm nhà. Đừng bỏ lỡ trải nghiệm 4.8 sao tại 522 Trường Sa, nơi vị giác được nuông chiều và tâm hồn được vỗ về.' AS story 
    FROM Restaurants 
    WHERE name = N'KIM SINH - Mỳ Vịt Tiềm - Trường Sa, Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sushi Story HCM - Sushi & Sashimi Ngon Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Sushi Story HCM, mỗi món ăn là một "câu chuyện" được kể bằng cả trái tim và sự tỉ mỉ. Từ Sashimi Hàu Nhật Trứng Cá Chuồn tươi ngon đến SET HEALTHY cân bằng, chúng tôi mang đến hương vị Nhật Bản đích thực trong không gian ấm áp, lãng mạn tại 85 Hoa Hồng. Hãy đến và tạo nên những kỷ niệm đáng nhớ cùng "CÂU CHUYỆN CHÚNG MÌNH" – nơi tinh hoa ẩm thực hòa quyện cùng cảm xúc.' AS story 
    FROM Restaurants 
    WHERE name = N'Sushi Story HCM - Sushi & Sashimi Ngon Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Vò Tây Ninh - CN Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Bánh Tráng Vò Tây Ninh - CN Phú Nhuận, bạn sẽ được thưởng thức hương vị đặc trưng Tây Ninh ngay giữa lòng Sài Gòn. Từ bánh tráng vò mềm dẻo thấm vị đến những cuốn lòng đào béo ngậy hay trộn sate me cay nồng, mỗi món ăn đều được làm bằng cả cái tâm và bí quyết riêng, mang đến trải nghiệm ẩm thực đường phố thân quen mà đầy cuốn hút. Ghé ngay 525/75 Huỳnh Văn Bánh để cảm nhận sự khác biệt bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Vò Tây Ninh - CN Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: TAKOYAKI TKY - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'TAKOYAKI TKY - Phú Nhuận mời bạn đến 78 Thích Quảng Đức để khám phá thế giới Takoyaki chuẩn vị Nhật. Từng viên bánh tròn xinh, nóng hổi, giòn rụm lớp vỏ ngoài và mềm tan bên trong, ẩn chứa nhân bạch tuộc tươi ngon hoặc phô mai béo ngậy. Đây là nơi hương vị đường phố giao thoa cùng sự tâm huyết, mang đến khoảnh khắc thưởng thức ấm áp và khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'TAKOYAKI TKY - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Zin Zin - Cà Phê & Tea - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Zin Zin Phú Nhuận là chốn dừng chân ấm cúng, nơi hương vị Sài Gòn thân quen gặp gỡ những sáng tạo độc đáo. Nhấp một ngụm Cafe Sữa đậm đà hay thử Bạc Xỉu Muối, Matcha Kem Muối đầy bất ngờ, bạn sẽ cảm nhận trọn vẹn sự tỉ mỉ trong từng ly nước. Chúng tôi tin rằng mỗi thức uống không chỉ giải khát mà còn là niềm vui nhỏ, mang đến khoảnh khắc thư thái giữa phố phường tấp nập.' AS story 
    FROM Restaurants 
    WHERE name = N'Zin Zin - Cà Phê & Tea - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Hải Sản The Spicy Crab - Miến, Cơm & Mì - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Tiệm Hải Sản The Spicy Crab, nơi hương vị biển cả tươi rói hòa quyện cùng vị cay nồng đặc trưng, đánh thức mọi giác quan. Mỗi món ăn tại đây, từ Crawfish sốt Thái đậm đà đến Mì trộn tôm sò điệp độc đáo, đều là tâm huyết của người đầu bếp, hứa hẹn mang đến bữa tiệc hải sản chuẩn vị cho cả gia đình. Hãy ghé thăm để tận hưởng không gian ấm cúng và những trải nghiệm ẩm thực khó quên, nơi niềm vui và hương vị thăng hoa.' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Hải Sản The Spicy Crab - Miến, Cơm & Mì - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Huynh Hoa - Phan Xích Long
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Bánh Mì Huynh Hoa Phan Xích Long, nơi tinh hoa ẩm thực đường phố Sài Gòn được gói trọn trong từng ổ bánh. Chiếc bánh mì truyền thống đặc biệt trứ danh với nhân đầy ắp, đậm đà khó cưỡng sẽ đánh thức mọi giác quan của bạn. Ghé thăm để thưởng thức hương vị thân quen, giòn rụm và ấm áp, đã làm nên thương hiệu được yêu mến suốt bao năm.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Huynh Hoa - Phan Xích Long'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Tấm Ba Ghiền Không Chi Nhánh - 84 Đặng Văn Ngữ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cơm Tấm Ba Ghiền Không Chi Nhánh - 84 Đặng Văn Ngữ, chúng tôi tin rằng hương vị chân thực nhất chỉ có thể tìm thấy ở một nơi duy nhất. Mỗi dĩa cơm sườn, bì, chả tại đây đều được chế biến bằng công thức gia truyền và cái tâm của người đầu bếp, tạo nên "cơn ghiền" khó cưỡng cho mọi thực khách. Kèm thêm ly rau má đậu xanh nhà làm mát lành, bạn sẽ cảm nhận được sự ấm áp và thân thuộc như bữa cơm gia đình. Hãy đến để thưởng thức và hiểu vì sao chúng tôi luôn được đánh giá 4.9 sao nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Tấm Ba Ghiền Không Chi Nhánh - 84 Đặng Văn Ngữ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Mì MaLai - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Phú Nhuận, Cơm Mì MaLai là góc nhỏ ấm cúng mang đến trải nghiệm ẩm thực Á Châu rất riêng. Nơi đây, bạn sẽ tìm thấy hương vị độc đáo từ Cơm Gà Sốt Teriyaki đậm đà đến Cơm Chiên SaLai Sườn Me Cay lạ miệng. Mỗi món ăn đều được chế biến bằng cả tâm huyết, hứa hẹn một bữa ngon tròn vị và giải nhiệt cùng Sâm La Hán Quả thanh mát.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Mì MaLai - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Ếch Geylang A Bảo - Chợ Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Cháo Ếch Geylang A Bảo - nơi hương vị Singapore trứ danh hội ngộ giữa lòng Chợ Phú Nhuận sôi động. Từng thố cháo ếch nóng hổi, sánh mịn với thịt ếch tươi ngon đẫm sốt Geylang đậm đà sẽ đánh thức mọi giác quan. Ngoài ra, cháo bò sốt tiêu xanh cũng là một lựa chọn tuyệt vời. Ghé A Bảo để cảm nhận sự ấm cúng, gần gũi và một bữa ăn ngon tròn vị, đúng chuẩn bình dân mà chất lượng!' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Ếch Geylang A Bảo - Chợ Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Chivago Chicken - Gà Rán Hàn Quốc & Bia - Phú Nhuận
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Chivago Chicken, nơi mỗi miếng gà rán giòn tan hay bánh gạo cay nồng đều gói trọn tinh hoa ẩm thực Hàn Quốc. Tại số 8 Hoa Đào, Phú Nhuận, chúng tôi mời bạn đắm chìm vào hương vị sốt Galbi, Sriracha Mayo độc đáo cùng ly bia mát lạnh. Với đánh giá 4.8/5 sao, Chivago tự hào là điểm hẹn ấm cúng, lý tưởng để bạn chia sẻ niềm vui và tận hưởng bữa ăn chất lượng khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Chivago Chicken - Gà Rán Hàn Quốc & Bia - Phú Nhuận'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lê Na Food - Lẩu Thái, Lẩu Hải Sản & Lẩu Bò - CN Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Lê Na Food Tân Bình, mỗi nồi lẩu là một câu chuyện hương vị đầy mời gọi. Từ lẩu Thái chua cay bùng nổ, lẩu hải sản tươi ngon đến lẩu bò Mỹ mềm tan, tất cả đều được chế biến bằng tâm huyết, mang đến trải nghiệm ẩm thực ấm áp, đậm đà. Nơi đây là điểm hẹn lý tưởng để bạn bè, gia đình sum vầy, sẻ chia niềm vui và những khoảnh khắc đáng nhớ. Hãy đến để cảm nhận sự tận tâm trong từng giọt nước lẩu!' AS story 
    FROM Restaurants 
    WHERE name = N'Lê Na Food - Lẩu Thái, Lẩu Hải Sản & Lẩu Bò - CN Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Bé Ú - Mì Trộn Indome & Drink Mix - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Quán Bé Ú, bạn sẽ tìm thấy một góc nhỏ ấm cúng ngay giữa lòng Bình Tân, nơi hương mì trộn Indome thơm lừng đánh thức mọi giác quan. Mỗi tô Mì Bát Bảo hay Hải Sản Mini đều được chúng mình nêm nếm tỉ mỉ, gửi gắm trọn vẹn vị ngon độc đáo khó cưỡng. Đến đây, thưởng thức mì rộn ràng và nhâm nhi drink mix mát lạnh để tận hưởng trọn vẹn niềm vui ẩm thực nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Bé Ú - Mì Trộn Indome & Drink Mix - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - CMT8 Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gà Rán Jimama tại CMT8 Tân Bình tự hào mang đến hành trình vị giác khó quên. Từng miếng gà giòn rụm cùng sốt cay ngọt Hàn Quốc độc đáo, hay mì Ý đậm đà chuẩn vị và cơm gà nóng hổi đều được chế biến với tất cả tâm huyết. Chúng tôi tin rằng, một bữa ăn nhanh cũng phải thật ngon, thật chất lượng, và đó là lý do vì sao Jimama luôn được đánh giá 4.8 sao. Hãy ghé thăm và cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - CMT8 Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Mợ Ba - Shop Online - Tân Bình Tân Hoà
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ăn Vặt Mợ Ba là điểm hẹn của những tâm hồn mê đồ ăn vặt chuẩn vị, nơi hương vị truyền thống được gửi gắm trong từng món ăn. Từ Tóp Mỡ Mắm Da Giòn giòn rụm khó cưỡng đến Da Cá Trứng Muối béo thơm, mỗi món đều là sự tỉ mỉ của Mợ Ba. Với đánh giá 4.7/5 sao, chúng tôi tự hào mang đến trải nghiệm ẩm thực bình dân nhưng cực kỳ lôi cuốn, ăn là mê ngay!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Mợ Ba - Shop Online - Tân Bình Tân Hoà'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Ma Bư Food - Mì Trộn & Gà Rán Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Ăn Vặt Ma Bư Food – điểm hẹn lý tưởng cho những tín đồ ẩm thực đường phố Á Châu tại Tân Bình! Khám phá ngay tô mì trộn độc đáo với tóp mỡ giòn tan, hay những miếng gà rán giòn rụm, thấm vị sốt đặc trưng, luôn được chế biến đầy tâm huyết. Mỗi bữa ăn tại Ma Bư không chỉ ngon miệng mà còn mang đến năng lượng vui vẻ, ấm áp. Hãy ghé qua và để Ma Bư Food chiêu đãi vị giác của bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Ma Bư Food - Mì Trộn & Gà Rán Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 175 Nguyễn Thị Nhỏ Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gà Rán Jimama là điểm hẹn của những tâm hồn yêu ẩm thực bình dân nhưng chất lượng. Từng miếng gà giòn rụm, mỳ Ý đậm đà hay gà sốt mật ong Brasil độc đáo đều được chế biến bằng cả tâm huyết, mang đến trải nghiệm vị giác khó quên. Ghé Jimama 175 Nguyễn Thị Nhỏ để tìm thấy niềm vui trong mỗi bữa ăn ngon miệng, ấm áp bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 175 Nguyễn Thị Nhỏ Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Amy Food - Bánh Mì & Cơm Cháy Chà Bông - Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Amy Food Tân Bình, nơi hương vị Việt truyền thống được gói trọn trong từng món ăn. Từ miếng cơm cháy chà bông giòn rụm thơm lừng đến khô heo, khô bò đậm đà cay tê, mỗi món đều được làm bằng cả tấm lòng. Ghé Amy Food để thưởng thức những hương vị thân quen, đánh thức mọi giác quan và cảm nhận sự chân thành trong từng nguyên liệu.' AS story 
    FROM Restaurants 
    WHERE name = N'Amy Food - Bánh Mì & Cơm Cháy Chà Bông - Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bà Na Food - Lẩu Thái Hải Sản, Lẩu Bò & Mì Trộn Cá Viên Chiên - CN Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bà Na Food, mỗi món ăn là một câu chuyện tình yêu ẩm thực. Từ nồi lẩu Thái hải sản chua cay thơm lừng chuẩn vị cho đến đĩa mì trộn cá viên chiên giòn rụm đậm đà, tất cả đều được nêm nếm bằng cái tâm của Bà Na. Ghé Bà Na, bạn không chỉ thưởng thức món ngon mà còn tìm thấy hương vị ấm áp như bữa cơm nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Bà Na Food - Lẩu Thái Hải Sản, Lẩu Bò & Mì Trộn Cá Viên Chiên - CN Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: RỐI COFFEE - Matcha Latte & Cacao Latte - Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'RỐI COFFEE mời bạn lạc vào thế giới của hương vị đậm đà và sảng khoái bất tận. Thử ngay Matcha Latte và Cacao Latte ly 1.3 lít khổng lồ, mỗi giọt là sự hòa quyện tinh tế của nguyên liệu chất lượng. Đến RỐI, bạn không chỉ thưởng thức đồ uống ngon mà còn cảm nhận sự tận tâm trong từng ly, cho một trải nghiệm thật "đã" và đầy ắp niềm vui.' AS story 
    FROM Restaurants 
    WHERE name = N'RỐI COFFEE - Matcha Latte & Cacao Latte - Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Đại Hàn - Gò Xoài, Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Đại Hàn - Gò Xoài mời bạn đến thưởng thức hương vị mì cay chuẩn Hàn nồng ấm, xua tan cái lạnh và xoa dịu tâm hồn. Mỗi tô mì kim chi, dù là hải sản tươi ngon hay rau nấm thanh đạm, đều được chúng tôi nấu bằng tất cả tâm huyết để mang đến trải nghiệm vị giác khó quên. Ghé ngay 228/21A Gò Xoài để cảm nhận không gian thân thiện và đắm mình trong vị cay bùng nổ, nơi mỗi bữa ăn là một niềm vui giản dị.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Cay Đại Hàn - Gò Xoài, Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 118 Đồng Đen Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Rán Jimama, chúng tôi tin rằng bữa ăn ngon không cần cầu kỳ, chỉ cần thật ấm lòng. Mỗi miếng gà rán giòn tan, thấm đẫm sốt độc quyền hay đĩa mì Ý thơm lừng đều là sự kết hợp của nguyên liệu tươi ngon và tâm huyết người đầu bếp, mang đến trải nghiệm ẩm thực chất lượng với giá bình dân. Ghé 118 Đồng Đen để cùng Jimama tạo nên những khoảnh khắc vui vẻ và cảm nhận hương vị đã làm nên 4.7 sao yêu thích của bao thực khách nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán Jimama - Gà Rán, Mỳ Ý & Ăn Vặt - 118 Đồng Đen Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Niêu TodoFood - Bình Tân - Cơm Ngon 3 Miền
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cơm Niêu TodoFood, mỗi chén cơm niêu nóng hổi, dẻo thơm hạt gạo ngon cùng lớp cháy vàng giòn rụm là tâm huyết của chúng tôi. Bạn sẽ tìm thấy hương vị quen thuộc, đậm đà của ba rọi kho tiêu hay cá hú kho tộ, như một bữa cơm nhà ấm cúng. Hãy ghé Cơm Niêu TodoFood để cảm nhận sự tận tâm và thưởng thức những món ăn bình dị mà chất lượng, vẹn tròn vị ngon.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Niêu TodoFood - Bình Tân - Cơm Ngon 3 Miền'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt, Chân Gà Sốt Thái & Vịt Cay Gia Truyền - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Ăn Vặt, Chân Gà Sốt Thái & Vịt Cay Gia Truyền - Bình Tân để trải nghiệm bữa ăn ngon miệng, đậm đà hương vị Á đặc trưng! Nơi đây, mỗi món ăn vặt đều được chế biến tỉ mỉ, từ gỏi đu đủ tôm tươi giòn sần sật đến bún thập cẩm đầy đặn. Đặc biệt, đừng bỏ lỡ món chân gà sốt Thái chua cay mặn ngọt gia truyền, mix trứng non béo ngậy đầy lôi cuốn. Mời bạn ghé 203 Mã Lò để thưởng thức và cảm nhận tất cả tâm huyết của chúng tôi trong từng hương vị.' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt, Chân Gà Sốt Thái & Vịt Cay Gia Truyền - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gỏi Cuốn, Bò Bía & Bún Mắm Nêm - Chị Hạnh Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về một góc nhỏ bình yên tại Tân Bình, bạn sẽ khám phá Gỏi Cuốn Chị Hạnh – nơi mỗi món ăn là một câu chuyện về hương vị Sài Gòn. Từ những cuốn gỏi tươi mát, bò bía thanh đạm đến tô bún mắm nêm dậy mùi đặc trưng, tất cả đều được Chị Hạnh tỉ mỉ chuẩn bị với trọn vẹn cái tâm. Hãy ghé để thưởng thức hương vị thân quen, đậm đà, khó quên này nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Gỏi Cuốn, Bò Bía & Bún Mắm Nêm - Chị Hạnh Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Ân - Bánh Bao Phô Mai, Pizza & Bánh Tart Trứng - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Tiệm Ân, chúng tôi tin rằng mỗi chiếc bánh không chỉ là món ăn mà còn là cả tấm lòng. Từng chiếc bánh bao phô mai tan chảy, bánh kim sa ngọt ngào hay bánh tart trứng thơm lừng đều được ủ ấm bằng công thức độc đáo và sự tỉ mẩn. Với hơn 4.8 sao yêu mến, Tiệm Ân mời bạn ghé để cảm nhận hương vị đặc trưng, ấm áp như nhà làm, cho một bữa ăn vừa vặn, trọn vẹn ngay tại Bình Tân.' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Ân - Bánh Bao Phô Mai, Pizza & Bánh Tart Trứng - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nước Mía Henry - Rau Má, Cà Phê Sữa Tươi & Trà Tắc - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa nắng nóng Bình Tân, Nước Mía Henry mời bạn dừng chân với những ly nước giải khát "khổng lồ" đầy ắp sảng khoái. Nước mía tắc thanh mát, rau má đậu xanh béo bùi hay sữa dừa thơm lừng đều được pha chế từ tâm, mang đến hương vị tươi ngon khó cưỡng. Đến Henry để cảm nhận sự tươi mới, tiếp thêm năng lượng cho ngày dài bận rộn!' AS story 
    FROM Restaurants 
    WHERE name = N'Nước Mía Henry - Rau Má, Cà Phê Sữa Tươi & Trà Tắc - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ông Trấn - Bánh Mì Bình Định - Tân Sơn Nhì
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Ông Trấn tại 93 Tân Sơn Nhì, bạn sẽ cảm nhận ngay không khí ấm cúng và hương thơm quyến rũ đặc trưng. Mỗi ổ bánh mì giòn rụm hay đĩa bánh cuốn Bình Định tại đây đều là sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết gia truyền từ quê hương Ông Trấn. Chúng tôi mong muốn mang đến những bữa ăn đậm đà hương vị, làm ấm lòng thực khách và gợi nhớ về những khoảnh khắc bình dị mà đặc biệt. Hãy ghé qua và tự mình trải nghiệm nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Ông Trấn - Bánh Mì Bình Định - Tân Sơn Nhì'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: 1705 Matcha - Trà Matcha Nguyên Chất Nhật Bản - Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến 1705 Matcha! Nơi đây là điểm hẹn của những tâm hồn yêu trà, tìm kiếm hương vị matcha nguyên chất Nhật Bản hòa quyện cùng sự sáng tạo bất ngờ như Matcha Yuzu hay Coconut Matcha tươi mát. Với đánh giá 4.7/5 sao, chúng tôi mời bạn ghé không gian bình dị ấm cúng tại Tân Bình để thưởng thức, tìm thấy khoảnh khắc thư thái và năng lượng mới trong từng ngụm trà đậm đà.' AS story 
    FROM Restaurants 
    WHERE name = N'1705 Matcha - Trà Matcha Nguyên Chất Nhật Bản - Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nuri Juices - Sinh Tố, Nước Ép & Trái Cây Tô - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Nuri Juices là điểm dừng chân lý tưởng để bạn tìm về sự tươi mát và năng lượng tích cực ngay giữa lòng Bình Tân. Mỗi ly Trà Trái Cây Nhiệt Đới rực rỡ hay tô Trái Cây Tô đầy ắp đều được chúng tôi chuẩn bị bằng tất cả cái tâm, chọn lọc nguyên liệu tươi ngon nhất. Hãy ghé 117 Đường Số 14 để thưởng thức hương vị đặc trưng, cảm nhận sự sảng khoái và tận hưởng những khoảnh khắc ngọt lành, thư thái.' AS story 
    FROM Restaurants 
    WHERE name = N'Nuri Juices - Sinh Tố, Nước Ép & Trái Cây Tô - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Phở Ngọc Bình Tân - Lê Văn Qưới
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Quán Phở Ngọc Bình Tân, chúng tôi tự hào mang đến tô phở chuẩn vị truyền thống, nức tiếng 4.8 sao giữa lòng Lê Văn Qưới. Nước dùng được ninh hầm kỳ công suốt nhiều giờ, chắt lọc tinh hoa tạo nên hương thơm lừng và vị ngọt thanh khó cưỡng. Từng miếng thịt tươi mềm, sợi phở dai ngon hòa quyện, gói trọn tâm huyết của người đầu bếp. Hãy ghé 116 Lê Văn Qưới để cảm nhận bữa ăn ấm lòng như gia đình bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Phở Ngọc Bình Tân - Lê Văn Qưới'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Happi Coffee & Tea - Bình Tân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Happi Coffee & Tea Bình Tân để tìm niềm vui trong từng ngụm trà sữa hay cà phê ấm nóng. Từ Matcha Caramel Kem Dẻo độc đáo đến Bạc Xỉu truyền thống, mỗi thức uống đều được pha chế bằng cả tấm lòng, mang đến hương vị tuyệt hảo. Không gian thân thiện, gần gũi sẽ là điểm hẹn lý tưởng cho những khoảnh khắc thư giãn bình yên của bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Happi Coffee & Tea - Bình Tân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Cô Thảo Tôm Cá – nơi hương vị Hàn Quốc đích thực gói trọn trong từng món ngâm tương tươi ngon. Từ cá hồi béo ngậy, tôm tươi giòn đến cua gạch đậm đà và trứng lòng đào tan chảy, mỗi nguyên liệu đều thấm đượm công thức bí truyền cùng cái tâm của Cô Thảo. Ghé Cô Thảo, bạn không chỉ thưởng thức bữa ăn chuẩn vị gia đình mà còn cảm nhận sự ấm áp, thân thuộc như đang dùng bữa tại nhà. Một trải nghiệm ẩm thực chất lượng, đầy cảm hứng đang chờ đón bạn ngay tại Tân Bình.' AS story 
    FROM Restaurants 
    WHERE name = N'Cô Thảo Tôm Cá - Cá Hồi Ngâm Tương - Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 2 Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 2 Tân Bình, chúng tôi mời bạn khám phá thế giới hải sản tươi ngon, hòa quyện trong từng hương vị đặc sắc. Từ món tôm càng xanh sốt trứng muối béo ngậy trứ danh đến sò huyết xào me đậm đà, mỗi trải nghiệm là một khám phá vị giác khó quên. Hãy ghé 11 Đường B6 để tận hưởng không gian ấm cúng, nhâm nhi món ngon và cùng bạn bè viết nên những câu chuyện sum vầy, đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 2 Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ram Nhà Nẫu - Ram Bắp & Ram Cá - Tân Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ram Nhà Nẫu mang cả tấm lòng "Nhà Nẫu" vào từng cuốn ram giòn rụm, thơm lừng. Ram bắp ngọt thanh, ram chả cá đậm đà chuẩn vị được chế biến với bí quyết riêng, khiến thực khách mê mẩn. Ghé con hẻm nhỏ 127/44/32 Ni Sư Huỳnh Liên, bạn sẽ tìm thấy một trải nghiệm ẩm thực bình dân nhưng ấm áp, được cộng đồng đánh giá 4.7 sao tuyệt vời.' AS story 
    FROM Restaurants 
    WHERE name = N'Ram Nhà Nẫu - Ram Bắp & Ram Cá - Tân Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: CHÁO SƯỜN VƯƠNG - TÂN PHÚ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cháo Sườn Vương chào đón bạn về với hương vị cháo truyền thống ấm áp, đậm đà ngay tại Tân Phú. Từng tô cháo được nấu từ nước xương hầm ngọt thanh, quyện cùng thịt bằm mềm và bò viên dai ngon. Thêm chút Móng Giò béo ngậy hay giải khát với Sâm Lạnh Bông Cúc để bữa ăn thêm trọn vẹn. Một điểm đến bình dị, mang đến sự ấm lòng và hài lòng cho mọi thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'CHÁO SƯỜN VƯƠNG - TÂN PHÚ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Ếch Singapore Geylang - A Bảo Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Cháo Ếch Singapore Geylang - A Bảo Tân Phú, chúng tôi gói trọn hương vị Geylang trứ danh để mang đến tận bàn bạn. Mỗi chén cháo ếch nóng hổi là sự hòa quyện tinh tế của thịt ếch tươi săn chắc cùng nước sốt đậm đà, thấm đẫm từng hạt gạo. Ghé A Bảo để thưởng thức món ếch Sapo thơm lừng khó cưỡng và tận hưởng bữa ăn ấm cúng, chuẩn vị ngay giữa lòng Tân Phú. Chắc chắn sẽ là trải nghiệm vị giác khó quên!' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Ếch Singapore Geylang - A Bảo Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nem Nướng Nha Trang - Since 1982 - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Nem Nướng Nha Trang - Since 1982, nơi hương vị truyền thống được gìn giữ qua hơn bốn thập kỷ. Mỗi cuốn nem nướng vàng ruộm, thơm lừng là cả tâm huyết, sự tỉ mỉ từ công thức gia truyền đến từng nguyên liệu tươi ngon nhất. Hãy ghé Nem Nướng Nha Trang - Tân Phú để cảm nhận miếng nem giòn dai, đậm đà quyện cùng nước chấm đặc trưng, và tìm thấy một góc bình dị, ấm cúng đúng chất Nha Trang giữa lòng Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Nem Nướng Nha Trang - Since 1982 - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trái Cây Tươi Tân Phú - Trái Cây Tô, Nước Ép & Sinh Tố
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Trái Cây Tươi Tân Phú, mỗi tô trái cây đặc biệt hay ly sinh tố bơ sánh mịn đều là kết tinh của sự tận tâm và tình yêu trái cây. Chúng tôi chọn lựa kỹ càng từng quả, để hương vị nguyên bản nhất bừng nở trong mọi thức uống, món tráng miệng. Ghé 76/3A Nguyễn Sơn để thưởng thức vị tươi ngon, ngọt lành, xua tan mọi mệt mỏi và cảm nhận sự chăm chút trong từng giọt, từng miếng.' AS story 
    FROM Restaurants 
    WHERE name = N'Trái Cây Tươi Tân Phú - Trái Cây Tô, Nước Ép & Sinh Tố'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Đêm Tây Thạnh - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Khi phố lên đèn, Ốc Đêm Tây Thạnh tại Số 8 Lưu Chí Hiếu mời gọi bạn đắm mình vào thế giới hải sản tươi ngon, nóng hổi. Từ Ốc Hương Rang Muối ớt cay nồng đến Sò Lông Nướng Mỡ Hành béo ngậy, mỗi món ăn là sự kết hợp tinh tế của hương vị và tâm huyết. Hãy ghé để tận hưởng không gian ấm cúng, sẻ chia khoảnh khắc vui vẻ cùng bạn bè và quên đi mọi âu lo đời thường.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Đêm Tây Thạnh - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Bò Kho PHÚ QUÝ - 34 Tân Hòa Đông
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Mì Bò Kho PHÚ QUÝ - 34 Tân Hòa Đông, chúng tôi tự hào mang đến hương vị bò kho đậm đà, thơm lừng chuẩn vị truyền thống đã chinh phục bao thực khách, thể hiện qua 4.8/5 sao đánh giá. Từng miếng thịt bò mềm tan, thấm đẫm nước sốt sánh vàng bí truyền, hòa quyện tuyệt vời cùng bánh mì giòn rụm hay các món ăn kèm khác. Đến với PHÚ QUÝ, bạn sẽ tìm thấy một bữa ăn ấm bụng, ngon miệng và tràn đầy cái tâm của người đầu bếp.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Bò Kho PHÚ QUÝ - 34 Tân Hòa Đông'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cafe Mr Lee - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cafe Mr Lee - Tân Phú là góc nhỏ bình yên, nơi hương cà phê sữa đá đậm đà hòa quyện cùng những câu chuyện thân mật. Mỗi ly Cà Phê Sữa Đá chuẩn vị, Bạc Xỉu ngọt dịu hay Trà Đào Cam Sả thanh mát đều được pha chế bằng trọn vẹn tâm huyết, mang đến hương vị làm say lòng thực khách. Chúng tôi mời bạn ghé qua để tìm thấy một chốn dừng chân ấm áp, thư thái giữa lòng Tây Thạnh.' AS story 
    FROM Restaurants 
    WHERE name = N'Cafe Mr Lee - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Chân Gà Rút Xương 100% - Tân Phước
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Chân Gà Rút Xương 100% - Tân Phước, mỗi chiếc chân gà đều là tâm huyết được rút xương tỉ mỉ, đảm bảo trọn vẹn vị ngon và sự tiện lợi khó cưỡng. Hãy để vị sốt Thái chua cay bùng nổ hay hương sả tắc thơm lừng đánh thức mọi giác quan, hoàn hảo cho những cuộc vui bất tận. Ghé 438 Tân Phước để tận hưởng món nhậu chất lượng và khoảnh khắc sum vầy ấm cúng bên bạn bè nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Chân Gà Rút Xương 100% - Tân Phước'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn Tóp Mỡ Trứng Lòng Đào - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Trộn Tóp Mỡ Trứng Lòng Đào Tân Phú không chỉ là một cái tên, mà là cả một trải nghiệm vị giác khiến bao người mê mẩn. Hãy thử ngay tô mì trộn đặc biệt với tóp mỡ giòn rụm, trứng lòng đào béo ngậy tan chảy cùng sợi mì dai ngon thấm vị, đảm bảo gây nghiện ngay từ đũa đầu tiên. Với không gian bình dị ấm cúng và hương vị đỉnh cao được đánh giá 4.9/5 sao, chúng tôi mời bạn ghé Tân Phú để khám phá ''linh hồn'' ẩm thực đường phố tại đây.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn Tóp Mỡ Trứng Lòng Đào - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Nakajima Susian Sushi - Aeon Mall Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Nakajima Susian Sushi, chúng tôi mời bạn khám phá thế giới hương vị Nhật Bản tươi ngon, nơi mỗi lát sashimi cá hồi óng ả hay cuộn cơm California đầy màu sắc đều được tạo nên bằng cả tâm huyết. Hãy để vị giác của bạn được đánh thức bởi sự tinh túy của ẩm thực và tận hưởng không gian ấm cúng, lý tưởng cho những khoảnh khắc sum vầy bên gia đình tại Aeon Mall Tân Phú. Trải nghiệm ẩm thực chân thực đang chờ đón bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Nakajima Susian Sushi - Aeon Mall Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: HUYỀN FOOD LAB - Ăn Vặt, Bánh Tráng & Chân Gà - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến HUYỀN FOOD LAB để khám phá "công thức" hạnh phúc từ những món ăn vặt thân quen. Nơi đây, từng sợi bánh tráng trộn đậm đà hay chiếc chân gà dai giòn đều được chế biến bằng tất cả sự tỉ mỉ và niềm vui. Ghé 72G/11 Nguyễn Văn Yến, Tân Phú để cảm nhận hương vị đặc trưng, ấm áp như nhà làm, đánh thức mọi giác quan.' AS story 
    FROM Restaurants 
    WHERE name = N'HUYỀN FOOD LAB - Ăn Vặt, Bánh Tráng & Chân Gà - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Đậu Mắm Tôm A Chảnh - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bún Đậu Mắm Tôm A Chảnh là điểm hẹn lý tưởng cho những ai trót yêu ẩm thực Hà Nội dân dã, ấm cúng giữa lòng Sài Gòn. Tại đây, mỗi mẹt bún đậu đều được chuẩn bị tươm tất với mắm tôm bí truyền đậm đà, đậu rán giòn tan và nem chua rán thơm lừng khó cưỡng. Ghé 123 Trương Vĩnh Ký để cảm nhận sự ấm áp và hương vị tuyệt vời, chắc chắn bạn sẽ muốn quay lại nhiều lần!' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Đậu Mắm Tôm A Chảnh - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trà Sữa MayCha - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Trà Sữa MayCha - Tân Phú, chúng mình ấp ủ từng ly trà sữa với trọn vẹn sự tỉ mỉ và đam mê. Từ Trà Sữa Truyền Thống thơm lừng đến Olong Macchiato béo ngậy, mỗi hương vị đều được chọn lọc kỹ càng, mang đến trải nghiệm ngọt ngào và thư giãn. Hãy ghé 456 Lũy Bán Bích để tìm thấy góc nhỏ ấm áp, nhâm nhi thức uống yêu thích và tận hưởng những khoảnh khắc thật chill bạn nhé.' AS story 
    FROM Restaurants 
    WHERE name = N'Trà Sữa MayCha - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lẩu Gà Lá É 109 - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Lẩu Gà Lá É 109, chúng tôi tự hào mang đến trải nghiệm ẩm thực Việt ấm áp và chân thành. Nồi lẩu gà lá é đặc trưng, với nước dùng thanh ngọt, lá é the thơm và thịt gà đồng dai ngon, sẽ là điểm nhấn hoàn hảo cho bữa ăn gia đình bạn. Hãy ghé 89 Tân Sơn Nhì, Tân Phú để cùng người thân tận hưởng những khoảnh khắc sum vầy bên hương vị 4.6 sao chuẩn vị nhé.' AS story 
    FROM Restaurants 
    WHERE name = N'Lẩu Gà Lá É 109 - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Trộn Cô Út - Tân Phú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Tráng Trộn Cô Út - Tân Phú không chỉ là địa điểm ăn vặt mà còn là nơi gửi gắm cái tâm của Cô Út trong từng sợi bánh. Với công thức gia truyền, món bánh tráng trộn trứ danh tại 12 Nguyễn Sơn sẽ khiến bạn ngất ngây bởi sự hòa quyện hoàn hảo của chua, cay, mặn, ngọt. Hãy ghé thăm để trải nghiệm hương vị đặc sắc và nhâm nhi Trà Tắc Xí Muội mát lạnh, cảm nhận sự thân thuộc đã làm nên đánh giá 4.4 sao ấm áp.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Trộn Cô Út - Tân Phú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Trộn, Ăn Vặt & Cá Viên - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Trộn, Ăn Vặt & Cá Viên Bình Chánh mời bạn ghé thăm để trải nghiệm hương vị ẩm thực bình dân nhưng đầy tinh tế. Mỗi tô mì trộn thập cẩm full topping hay Combo chiên mắm tỏi đều được chế biến bằng cái tâm, mang đến sự ấm áp và no lòng. Đừng quên thử Phô mai que siêu to độc đáo và tận hưởng khoảnh khắc ăn vặt vui vẻ, thân thuộc như ở nhà nhé.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Trộn, Ăn Vặt & Cá Viên - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 14 Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối Bình Chánh, chúng tôi tự hào mang đến hương vị biển cả tươi ngon, gần gũi như chính mảnh đất này. Từng đĩa Ốc mỡ cháy tỏi tóp mỡ giòn thơm hay Sò huyết xào me đậm đà đều là sự kết tinh của cái tâm người đầu bếp và nguyên liệu tuyển chọn. Ghé thăm không gian bình dân, ấm cúng của chúng tôi để thưởng thức bữa tiệc hải sản hấp dẫn, nơi vị giác của bạn sẽ được đánh thức trọn vẹn và mọi lo toan dường như tan biến.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 14 Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: MÊ - Coffee, Tea & Matcha - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với MÊ - Coffee, Tea & Matcha, góc nhỏ bình yên tại Bình Chánh nơi mỗi ly thức uống đều được ủ ấp bằng cả tấm lòng. Từ vị Matcha Latte chuẩn Nhật, Trà Sữa MÊ gây thương nhớ, đến Dừa Sen Full Topping thanh mát và Cacao Sữa Gấu ngọt ngào, chúng tôi mời bạn đắm chìm trong hương vị đặc trưng. Hãy ghé MÊ để tìm thấy chốn thư giãn, quên đi bộn bề và để vị giác dẫn lối!' AS story 
    FROM Restaurants 
    WHERE name = N'MÊ - Coffee, Tea & Matcha - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán KFC - Central Plaza
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Gà Rán KFC - Central Plaza để đánh thức mọi giác quan với hương vị gà rán giòn tan, mọng nước đã làm nên tên tuổi. Mỗi miếng gà vàng ươm, thơm lừng là sự kết hợp hoàn hảo của bí quyết riêng, mang đến bữa ăn nhanh ngon, tiện lợi nhưng vẫn trọn vẹn. Không gian ấm cúng, phục vụ chu đáo, chúng tôi luôn sẵn sàng chào đón bạn cho những khoảnh khắc ẩm thực vui vẻ.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán KFC - Central Plaza'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Bánh Kem Ngon Nhất - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh chào đón bạn bằng hương thơm ấm áp của những chiếc bánh vừa ra lò. Nơi đây, bạn sẽ tìm thấy sự hòa quyện hoàn hảo trong bánh su kem hộp thanh mát, bánh mì phô mai tan chảy béo ngậy, hay bánh crep sầu riêng nồng nàn. Mỗi món đều được làm bằng cả tấm lòng, mang đến niềm vui ngọt ngào cho mọi khoảnh khắc của bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Bánh Kem Ngon Nhất - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Highlands Coffee - Trà, Cà Phê & Bánh - Central Mall Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm một góc bình yên giữa lòng Bình Chánh? Highlands Coffee Central Mall mời bạn ghé thăm để tận hưởng không gian ấm cúng và hương cà phê Việt đậm đà. Khám phá sự tươi mới của MatchaĐI Dừa Mây hay khởi đầu ngày mới đầy năng lượng với Combo Sáng, mỗi món đều được pha chế bằng cả tâm huyết. Nơi đây là điểm hẹn lý tưởng cho những khoảnh khắc thư giãn và kết nối.' AS story 
    FROM Restaurants 
    WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Central Mall Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: 3 Râu - Gà Rán, Pizza & Trà Sữa - Đường Số 1, Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'3 Râu - Gà Rán, Pizza & Trà Sữa là điểm hẹn ấm cúng tại Bình Chánh, nơi mỗi món ăn đều được chuẩn bị với trọn vẹn cái tâm. Từ miếng gà rán giòn tan, mì Ý bò bằm đậm đà đến gà sốt Hàn Quốc lạ miệng, tất cả đều sẵn sàng khơi gợi vị giác bạn. Chúng tôi mang đến những bữa ăn ngon miệng, giá cả phải chăng, là nơi lý tưởng để sẻ chia niềm vui cùng gia đình và bạn bè. Ghé 3 Râu để tận hưởng hương vị tuyệt vời trong không gian thân thiện!' AS story 
    FROM Restaurants 
    WHERE name = N'3 Râu - Gà Rán, Pizza & Trà Sữa - Đường Số 1, Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Highlands Coffee - Trà, Cà Phê & Bánh - Số 1 Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Highlands Coffee Bình Chánh là điểm hẹn quen thuộc, nơi bạn tìm thấy sự an yên giữa bộn bề cuộc sống. Đắm mình trong hương cà phê phin đậm chất Việt, hay nhâm nhi PhinĐI Matcha Dâu đầy sáng tạo và Trà Thạch Vải thanh khiết. Từng món đồ uống đều được pha chế với tất cả tâm tình, mời bạn đến tận hưởng không gian ấm cúng và trải nghiệm vị giác đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - Số 1 Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Highlands Coffee - Trà, Cà Phê & Bánh - West Gate Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Highlands Coffee West Gate Bình Chánh chào đón bạn đến một không gian ấm cúng, nơi hương vị thân quen hòa quyện cùng sự thư thái. Đắm mình trong thế giới trà đặc sắc: từ Trà Sen Vàng thanh khiết, Trà Thạch Vải ngọt ngào đến Trà Sữa Đài Loan đậm đà. Mỗi ly trà được pha chế bằng cả tấm lòng, là liều thuốc cho tâm hồn sau một ngày dài. Hãy ghé qua và để chúng tôi chăm sóc bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'Highlands Coffee - Trà, Cà Phê & Bánh - West Gate Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tráng Lòng Đào - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Tráng Lòng Đào - Bình Chánh, bạn sẽ khám phá thế giới hương vị cuốn hút từ trứng non lòng đào béo ngậy tan chảy, kết hợp hoàn hảo cùng các món bánh tráng và chân gà sốt thái trứ danh. Mỗi món ăn là tâm huyết của chúng tôi, mang đến trải nghiệm ẩm thực bình dân nhưng đầy tinh tế, chuẩn vị Á ngay giữa lòng Bình Chánh. Hãy ghé số 349 Tân Túc để tận hưởng không gian ấm cúng và những khoảnh khắc ngon lành khó quên!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tráng Lòng Đào - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán KFC - Nguyễn Thị Tú
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Rán KFC Nguyễn Thị Tú, hương vị gà giòn tan, nóng hổi trứ danh luôn sẵn sàng chiều lòng bạn. Thưởng thức combo Cơm Gà Mắm Tỏi đậm đà hay Mì Ý béo ngậy, mỗi món đều là lựa chọn hoàn hảo cho bữa trưa nhanh gọn mà vẫn tròn vị. Ghé ngay để nạp năng lượng, tận hưởng sự tiện lợi và những khoảnh khắc ẩm thực vui vẻ bên bạn bè, gia đình nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán KFC - Nguyễn Thị Tú'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán KFC - Hiệp Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Gà Rán KFC Hiệp Bình, bạn sẽ luôn tìm thấy miếng gà vàng ươm, giòn rụm tan chảy trên đầu lưỡi, một hương vị đã làm nên tên tuổi. Dù là bữa trưa năng động với Combo Cơm Gà Nanban hay những buổi tối quây quần cùng Combo Hội Cú Đêm, chúng tôi luôn sẵn sàng mang đến niềm vui ẩm thực. Tọa lạc tại 112 Hiệp Bình, đây chính là điểm hẹn quen thuộc cho những bữa ăn ngon miệng, ấm áp và luôn tràn đầy sự chào đón.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán KFC - Hiệp Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Đậu Lực Phát - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa nhịp sống hối hả của Bình Chánh, Bún Đậu Lực Phát là điểm dừng chân lý tưởng cho những ai yêu mến ẩm thực Hà Nội dân dã. Mẹt bún đậu thập cẩm của chúng tôi quy tụ đậu chiên vàng giòn, nem chua rán thơm lừng, chả cốm dẻo ngọt và đặc biệt là mắm tôm pha chuẩn vị, đánh thức mọi giác quan. Mỗi món ăn từ chả ốc dai giòn đến nem rán đều được làm bằng cái tâm của người đầu bếp, mang đến hương vị ấm áp, thân thương như nhà làm. Hãy ghé Lực Phát để thưởng thức tinh hoa ẩm thực bình dân mà vô cùng chất lượng!' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Đậu Lực Phát - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Đức 2 - 137 Đường Hiệp Bình, Phường Hiệp Bình Chánh, TP Thủ Đức
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Phở Đức 2 là điểm hẹn quen thuộc tại Thủ Đức, nơi hương vị phở truyền thống và các món bò kho đậm đà luôn làm nức lòng thực khách. Mỗi tô phở tái, phở sườn với nước dùng ngọt thanh, hay hủ tiếu bò kho sánh mịn đều được chế biến bằng cả tâm huyết, mang đến bữa ăn ấm cúng như nhà làm. Ghé Phở Đức 2 để tìm lại chút bình yên trong từng hương vị, bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Đức 2 - 137 Đường Hiệp Bình, Phường Hiệp Bình Chánh, TP Thủ Đức'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bobapop - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bobapop Bình Chánh là điểm hẹn quen thuộc cho những tâm hồn yêu trà. Khám phá sự khác biệt trong từng ngụm Trà Bá Tước hay Trà xanh sủi bọt độc đáo, cùng vị ngọt ngào của Trà sữa 4Q. Chúng mình tỉ mỉ pha chế, mong mang đến những khoảnh khắc thư giãn tuyệt vời và hương vị khó quên ngay tại Bình Chánh. Ghé thăm và cảm nhận nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bobapop - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Nướng 2 Vị CoGaVa Bình Chánh - Thới Hòa
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Gà Nướng 2 Vị CoGaVa Bình Chánh, nơi hương vị truyền thống giao thoa cùng sự sáng tạo. Thưởng thức gà nướng hai vị độc đáo thơm lừng, da giòn rụm, quyện cùng cơm lam dẻo thơm nóng hổi và sườn nướng đậm đà. Mỗi món ăn tại đây đều được chế biến với trọn vẹn tâm huyết, hứa hẹn mang đến bữa ăn gia đình ấm cúng và những khoảnh khắc đáng nhớ.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Nướng 2 Vị CoGaVa Bình Chánh - Thới Hòa'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Gà Xối Mỡ A Hí - Hiệp Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Thủ Đức, Cơm Gà Xối Mỡ A Hí chắt chiu từng hương vị, gói trọn tâm tình trong mỗi đĩa cơm. Món gà xối mỡ trứ danh với lớp da vàng óng giòn rụm, thịt gà mềm mọng nước cùng hạt cơm dẻo thơm đã trở thành dấu ấn khó quên. Đến A Hí, bạn không chỉ thưởng thức bữa ăn ngon miệng mà còn cảm nhận sự ấm áp, gần gũi như bữa cơm nhà. Mời bạn ghé Cơm Gà Xối Mỡ A Hí để trải nghiệm hương vị chất lượng và quen thuộc làm nên tên tuổi của chúng tôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Gà Xối Mỡ A Hí - Hiệp Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Ăn Vặt Của HyyRuu - Ăn Vặt & Xiên Que Chiên Các Loại - Bình Chánh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bếp Ăn Vặt Của HyyRuu chào đón bạn đến thế giới ăn vặt đầy mê hoặc, nơi mỗi hương vị đều được ấp ủ bằng cả tâm huyết. Thử ngay Combo "Ngon Hơn NYC" huyền thoại, nem chua rán Hà Nội giòn tan hay xiên que chiên nóng hổi làm xiêu lòng thực khách. Ghé HyyRuu để vị giác của bạn được đánh thức và hiểu vì sao đây là điểm đến 4.7 sao không thể bỏ lỡ!' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Ăn Vặt Của HyyRuu - Ăn Vặt & Xiên Que Chiên Các Loại - Bình Chánh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán KFC - Giga Mall
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Giga Mall nhộn nhịp, KFC là điểm dừng chân lý tưởng để bạn nuông chiều vị giác với hương vị gà rán trứ danh. Từng miếng gà vàng ươm, giòn rụm bên ngoài và mọng nước bên trong, đậm đà gia vị bí truyền, luôn sẵn sàng xua tan mọi mệt mỏi. Ghé ngay để tận hưởng bữa ăn ngon lành, ấm áp và tạo nên những kỷ niệm đẹp cùng bạn bè, gia đình!' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán KFC - Giga Mall'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Xôi Bình Tiên - Phạm Hùng
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Xôi Bình Tiên - Phạm Hùng: Nơi gói ghém trọn vẹn hương vị xôi truyền thống Việt. Mỗi phần xôi, từ mặn mà xôi đùi gà trứ danh đến ngọt bùi xôi nếp than hay xôi ca dé, đều được nấu bằng cái tâm và bí quyết gia truyền. Chúng tôi tự hào mang đến những đĩa xôi nóng hổi, thơm lừng, như một lời mời gọi ấm áp cho mọi bữa ăn ngon tại 163 Phạm Hùng.' AS story 
    FROM Restaurants 
    WHERE name = N'Xôi Bình Tiên - Phạm Hùng'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Rán & Burger McDonald’s Satra Pham Hung
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến McDonald’s Satra Phạm Hùng, nơi mỗi bữa ăn là một trải nghiệm vui tươi và đầy bất ngờ! Hãy khám phá ngay Gà Xốt Kem Lá Chanh độc đáo, giòn rụm bên ngoài, đậm đà vị lá chanh và kem béo ngậy tan chảy trong miệng. Cùng phần mì Ý Spaghetti ấm áp hay những chiếc burger kinh điển, đây là điểm dừng chân lý tưởng để nạp năng lượng. Đến và tận hưởng không gian ấm cúng, nơi bạn có thể thư giãn và tạo thêm những kỷ niệm đẹp sau những giờ mua sắm sôi động.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Rán & Burger McDonald’s Satra Pham Hung'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: ỐC HÀ ĐỒNG GIÁ 40K - Đinh Đức Thiện
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghét bỏ ưu phiền, về với ỐC HÀ ĐỒNG GIÁ 40K – nơi hương vị biển cả gói trọn trong từng đĩa ốc nóng hổi. Từ ốc tỏi nướng mỡ hành dậy mùi cho đến sò huyết rang me chua ngọt hay trứng gà non xào bơ bắp béo ngậy, mỗi món đều được chế biến bằng cái tâm của người yêu ẩm thực. Đến 442 Đinh Đức Thiện để trải nghiệm những bữa nhậu lai rai vui vẻ, ấm cúng và tận hưởng hương vị đặc trưng chỉ với 40K.' AS story 
    FROM Restaurants 
    WHERE name = N'ỐC HÀ ĐỒNG GIÁ 40K - Đinh Đức Thiện'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bếp Nhà Thỏ - Ăn Vặt Hàn Quốc - Quốc Lộ 50
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Bếp Nhà Thỏ trên Quốc Lộ 50, nơi hương vị Hàn Quốc đường phố sôi động hòa quyện cùng những món ăn vặt quen thuộc, chuẩn vị ''nhà làm''. Từ gà sốt phô mai tan chảy nóng hổi đến mì Ý đậm đà hay Matcha kem muối lạ miệng, mỗi món đều được chế biến với tất cả tâm huyết. Ghé ngay để cảm nhận sự ấm cúng, gần gũi và thưởng thức bữa tiệc vị giác đầy bất ngờ, ngon miệng, chuẩn 4.8 sao!' AS story 
    FROM Restaurants 
    WHERE name = N'Bếp Nhà Thỏ - Ăn Vặt Hàn Quốc - Quốc Lộ 50'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Tacos Pháp Newday - Trần Đại Nghĩa
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Bánh Tacos Pháp Newday, bạn sẽ khám phá một thế giới hương vị độc đáo nơi tinh hoa ẩm thực Pháp hòa quyện bất ngờ trong từng chiếc tacos thơm lừng, giòn rụm. Từ Tacos Bò Xào Gà Giòn đậm đà đến Tacos Thập Cẩm Khủng Lồ đầy ắp, mỗi món ăn đều được chúng tôi chuẩn bị bằng tất cả tâm huyết để mang lại trải nghiệm ẩm thực khó quên. Hãy đến và thưởng thức sự kết hợp mới mẻ, hấp dẫn, đảm bảo sẽ khơi gợi vị giác và làm hài lòng những tín đồ mê Tacos!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Tacos Pháp Newday - Trần Đại Nghĩa'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Mập - Thịt Chả - Huỳnh Mẫn Đạt, Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Mì Mập, tên gọi không chỉ là định danh mà còn là lời hứa về một ổ bánh mì đầy ắp, đậm đà hương vị. Mỗi chiếc Bánh Mì MẬP Đặc Biệt giòn rụm, nhân thịt chả thơm lừng hay chiếc bánh bao nóng hổi đều được chúng tôi tỉ mỉ chuẩn bị bằng cả tấm lòng. Ghé 11a Huỳnh Mẫn Đạt để cảm nhận sự ấm áp, thân thuộc của món ăn Sài Gòn chuẩn vị, tiếp thêm năng lượng cho ngày mới.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Mập - Thịt Chả - Huỳnh Mẫn Đạt, Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Quảng Bình Thạnh - Phan Văn Hân
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Mì Quảng Bình Thạnh - Phan Văn Hân, mỗi tô mì là một câu chuyện ấm áp, gói trọn hương vị đặc trưng của miền Trung. Sợi mì dai mềm, nước dùng đậm đà bí truyền cùng các loại topping tươi ngon như gà ta, sườn non, thịt trứng cút sẽ đánh thức mọi giác quan. Ghé 182 Phan Văn Hân để thưởng thức và cảm nhận sự tận tâm trong từng nguyên liệu, làm nên một địa chỉ Mì Quảng được yêu mến suốt bao năm qua.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Quảng Bình Thạnh - Phan Văn Hân'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Hamburger & Cà Phê Legacy Bình Thạnh - FastFood - Tân Cảnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Mì Hamburger & Cà Phê Legacy Bình Thạnh, mỗi chiếc Burger hay Hotdog đều được chúng tôi làm bằng cả tâm huyết. Hương vị bùng nổ từ Burger Đầy Đủ nóng hổi hay Hotdog Xúc Xích Phô Mai tan chảy sẽ khiến bạn khó quên. Ghé ngay đối diện 37 Tân Cảng để thưởng thức món ngon bình dân, chất lượng và cảm nhận sự ấm áp thân quen nơi đây.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Hamburger & Cà Phê Legacy Bình Thạnh - FastFood - Tân Cảnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Bao Thọ Phát Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Bao Thọ Phát Bình Thạnh, chúng tôi tự hào mang đến những món ngon chuẩn vị, nơi hương vị truyền thống giao thoa cùng sự sáng tạo hiện đại. Dù là chiếc Hamburger bò thơm lừng, Bánh Bao Thập Cẩm đậm đà hay ly cà phê sữa đá nguyên chất, mỗi món đều được chuẩn bị bằng cả tấm lòng. Không gian ấm cúng, giá cả bình dân cùng chất lượng 4.8 sao đã làm nên một Thọ Phát rất riêng giữa Nơ Trang Long. Ghé thăm để thưởng thức và cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Bao Thọ Phát Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Bình Thạnh - Xôi Chiên - Lê Quang Định
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Bình Thạnh, Ăn Vặt Lê Quang Định là điểm đến quen thuộc cho những ai trót yêu hương vị xôi chiên giòn rụm, nóng hổi. Mỗi chiếc xôi vàng ươm, nhân thịt đậm đà hay chà bông thơm lừng đều được làm bằng cả tấm lòng, mang đến vị ngon khó cưỡng. Ghé ngay 377/9/45 Lê Quang Định để cảm nhận sự ấm áp, bình dị và hương vị đặc trưng đã làm nên tên tuổi của quán nhỏ chúng tôi nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Bình Thạnh - Xôi Chiên - Lê Quang Định'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Bò Thanh Đa - Bình Quới
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Phở Bò Thanh Đa - Bình Quới mời gọi bạn ghé thăm để khám phá hương vị truyền thống chuẩn vị của phở bò, nơi mỗi tô là cả một câu chuyện. Nước dùng được ninh hầm công phu, ngọt thanh tự nhiên, quyện cùng từng lát bò mềm và đậm đà khó quên. Đừng quên thử món Bò kho bánh mì hay Phở bò kho độc đáo, chắc chắn sẽ làm bạn phải xiêu lòng. Ghé Phở Bò Thanh Đa để tìm thấy sự ấm cúng và những tinh hoa ẩm thực bình dân ngay hôm nay!' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Bò Thanh Đa - Bình Quới'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Bình Định Thanh Mai - Nguyễn Quang Bích
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Mì Bình Định Thanh Mai - Nguyễn Quang Bích, mỗi ổ bánh mì không chỉ là bữa ăn mà còn là cả một câu chuyện về hương vị xứ Nẫu dung dị mà đậm đà. Bánh mì giòn rụm, nóng hổi, từ phần Đặc Biệt đậm đà chuẩn vị đến Heo Quay giòn tan hay Trứng Opla béo ngậy, đều được làm bằng cả cái tâm và công thức gia truyền. Hãy ghé 2 Nguyễn Quang Bích để cảm nhận sự chân thành trong từng nguyên liệu và sự ấm áp như được ăn bánh mì nhà làm, nơi bạn luôn tìm thấy bữa ăn ngon miệng và đầy hoài niệm.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Bình Định Thanh Mai - Nguyễn Quang Bích'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Bún Cá Rô Đồng Bà Thành - Nguyễn Thái Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Quán Bún Cá Rô Đồng Bà Thành, bạn sẽ tìm thấy hương vị cá rô đồng chuẩn Bắc đầy tinh tế. Mỗi tô bún hay bánh đa đều là tâm huyết của Bà Thành, từ nước dùng ngọt thanh tự nhiên đến từng miếng thịt cá được gỡ xương tỉ mỉ. Đây là món quà ẩm thực ấm lòng, đậm đà tình quê giữa lòng Sài Gòn. Ghé Quán Bà Thành để cảm nhận hương vị khó quên, nơi hương vị truyền thống được gìn giữ trọn vẹn!' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Bún Cá Rô Đồng Bà Thành - Nguyễn Thái Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sầu Riêng - Lan Ngọc - Bình Thành
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Sầu Riêng - Lan Ngọc, chúng tôi kiến tạo một thiên đường ngọt ngào, nơi hương vị sầu riêng Ri6 Cái Mơn hảo hạng hay Monthong Thái chất lượng cao được tuyển chọn kỹ lưỡng. Từng hộp cơm sầu vàng óng, thơm lừng hay trái sầu nguyên múi đều là món quà tinh túy từ thiên nhiên, được gửi gắm bằng cả tâm huyết. Hãy ghé 299 Bình Thành để tận hưởng và sẻ chia những khoảnh khắc ngọt ngào khó quên!' AS story 
    FROM Restaurants 
    WHERE name = N'Sầu Riêng - Lan Ngọc - Bình Thành'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Bình Định Thanh Mai - 21 Lê Lợi
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bánh Mì Bình Định Thanh Mai, 21 Lê Lợi, chúng tôi tự hào mang hương vị tuổi thơ và biển cả xứ Nẫu về Sài Gòn. Mỗi ổ bánh mì giòn rụm, từ chả cá dai ngon đến heo quay trứng luộc đậm đà, đều gói trọn cái tâm và công thức gia truyền. Ghé Thanh Mai để thưởng thức bữa sáng, bữa trưa dân dã mà đầy ắp tình cảm, đánh thức mọi giác quan của bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Bình Định Thanh Mai - 21 Lê Lợi'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt - Landmark Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ăn Vặt - Landmark Bình Thạnh, chúng tôi mang đến một góc nhỏ ấm cúng ngay giữa lòng Landmark 4 để bạn thỏa sức khám phá thế giới ăn vặt Á Đông đầy mê hoặc. Nơi đây, những miếng Tokbokki phô mai béo ngậy hay khoai tây lắc giòn rụm không chỉ đơn thuần là món ăn, mà còn là hành trình vị giác bất ngờ, đặc biệt với Tokbokki lắc phô mai sốt sô-cô-la độc đáo. Ghé ngay để nạp năng lượng và tận hưởng niềm vui giản dị, ngon miệng!' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt - Landmark Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Tiger - Khô Bò - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ăn Vặt Tiger chào đón bạn giữa lòng Bình Thạnh, nơi những hương vị Á Đông quen thuộc được thổi hồn một cách mạnh mẽ và đầy lôi cuốn. Hãy đắm mình trong vị Khô Bò, Xoài Sấy muối ớt chua cay hay Mực Cán tẩm vị đậm đà – mỗi món đều là sự kết hợp hoàn hảo của vị giác. Tại đây, chúng tôi gửi gắm sự tỉ mỉ vào từng món ăn vặt "có võ", biến mỗi buổi tụ họp trở nên rôm rả và khó quên hơn.' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Tiger - Khô Bò - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Tấm Miền Tây - Bún Thịt Nướng & Bánh Mì Thịt Nướng - Bình Thành Liên Khu 4-5
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Cơm Tấm Miền Tây để khám phá bản sắc ẩm thực chân chất từ đồng bằng sông Cửu Long! Từ miếng sườn nướng vàng ruộm trên đĩa cơm tấm dẻo thơm, đến tô bún thịt nướng đậm đà, hay chiếc bánh mì thịt nướng giòn rụm – mỗi món đều chan chứa cái tâm và công thức gia truyền. Chúng tôi mời bạn ghé 6/3A Bình Thành để thưởng thức bữa ăn chuẩn vị, ấm lòng như bữa cơm nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Tấm Miền Tây - Bún Thịt Nướng & Bánh Mì Thịt Nướng - Bình Thành Liên Khu 4-5'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hoàng Anh Bakery - Bánh Kem & Bánh Ngọt Ngon - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hoàng Anh Bakery là nơi tình yêu và tâm huyết gia đình hòa quyện trong từng chiếc bánh. Từ Bánh Cua Phô Mai béo ngậy tan chảy đến Bông Lan Trứng Muối mặn ngọt hài hòa, mỗi món đều được nướng tươi mỗi ngày, mang đến hương vị thân quen ấm áp như nhà làm. Ghé 434 Nơ Trang Long để trải nghiệm không gian ngọt ngào và thưởng thức những khoảnh khắc đáng nhớ cùng gia đình Hoàng Anh nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Hoàng Anh Bakery - Bánh Kem & Bánh Ngọt Ngon - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Omsom - Cà Phê Đặc Sản, Trà Sữa & Trà Trái Cây - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Omsom chào đón bạn đến một không gian ấm cúng tại Bình Thạnh, nơi mỗi tách cà phê không chỉ là thức uống mà còn là câu chuyện. Chúng tôi tỉ mỉ chọn lọc để mang đến Espresso "1 Shot Là Tỉnh", Latte "Sữa Ôm Cà Phê" hay Matcha "Mát Tim" với hương vị đặc sắc, đánh thức mọi giác quan. Ghé Omsom để tìm thấy sự bình yên và nạp đầy năng lượng cho ngày mới, tất cả được gửi gắm bằng cả tâm huyết.' AS story 
    FROM Restaurants 
    WHERE name = N'Omsom - Cà Phê Đặc Sản, Trà Sữa & Trà Trái Cây - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Hoàng Thanh - Hiệp Bình
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bánh Mì Hoàng Thanh - Hiệp Bình mời gọi bạn đến với thế giới hương vị bánh mì Việt thân thuộc, nơi mỗi chiếc bánh là sự kết hợp hoàn hảo giữa vỏ giòn rụm và nhân đậm đà. Từ gà xé thơm lừng đến chả cá Nha Trang chuẩn vị hay nem nướng hấp dẫn, chúng tôi gói trọn cái tâm của người làm nghề vào từng nguyên liệu tươi ngon. Hãy ghé 45A Hiệp Bình để tận hưởng bữa sáng, bữa xế đầy năng lượng, ấm áp tình người ngay tại Thủ Đức nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Hoàng Thanh - Hiệp Bình'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ăn Vặt Bé Thảo - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Ăn Vặt Bé Thảo tại 80/57D Hoàng Hoa Thám để khám phá thế giới quà vặt đậm chất Sài Gòn. Mỗi món ăn, từ cơm cháy mắm hành giòn rụm đến bánh tráng cuốn sốt me bơ độc đáo, đều được Bé Thảo chăm chút với tất cả tâm huyết. Cảm nhận hương vị khó quên và sự ấm áp như ở nhà, nơi đây đã trở thành điểm đến yêu thích được đánh giá 4.7 sao của nhiều thực khách.' AS story 
    FROM Restaurants 
    WHERE name = N'Ăn Vặt Bé Thảo - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Riêu & Canh Bún 30 - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bún Riêu & Canh Bún 30 - Bình Thạnh là nơi gửi gắm hương vị cua đồng truyền thống trong từng tô bún và canh bún. Nước lèo đậm đà, thơm lừng mùi gạch cua béo ngậy, cùng topping tươi ngon được chế biến bằng tất cả cái tâm. Đến đây, bạn không chỉ thưởng thức món ăn mà còn tìm thấy sự ấm áp, quen thuộc như bữa cơm nhà. Một trải nghiệm ẩm thực chuẩn vị Việt đang chờ bạn tại 16 Huỳnh Đình Hai.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Riêu & Canh Bún 30 - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Hảo Vị Vạn Gia - Món Ăn Trung Quốc - 608 Điện Biên Phủ, Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Hảo Vị Vạn Gia không chỉ là quán ăn, mà là nơi bạn tìm thấy hương vị Trung Hoa chuẩn mực, ấm áp như bữa cơm nhà. Mỗi món ăn, từ Ếch Nồi Khô nồng đậm đến Bò Xào Tiêu Đen thơm lừng, đều được chế biến bằng cả tâm huyết, mang đến trải nghiệm ẩm thực gia đình đích thực. Hãy ghé 608 Điện Biên Phủ để cảm nhận sự vẹn tròn trong từng hương vị, nơi vị ngon gắn kết mọi nhà.' AS story 
    FROM Restaurants 
    WHERE name = N'Hảo Vị Vạn Gia - Món Ăn Trung Quốc - 608 Điện Biên Phủ, Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cơm Bắc Ngon - Cơm - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cơm Bắc Ngon là nơi lý tưởng để bạn khám phá hương vị Bắc Bộ mộc mạc, thân thương giữa lòng Bình Thạnh. Mỗi món ăn, từ cơm gà rang gừng sả thơm lừng đến thịt luộc cà pháo mắm tôm đậm đà chuẩn vị, đều được chế biến bằng cả tấm lòng, gợi nhớ bữa cơm nhà ấm áp. Ghế nhà Cơm Bắc Ngon luôn sẵn sàng đón bạn, mang đến bữa ăn ngon miệng, chất lượng và đong đầy ký ức tuổi thơ.' AS story 
    FROM Restaurants 
    WHERE name = N'Cơm Bắc Ngon - Cơm - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Yến Nhà Mình - 100% Yến Chưng Tươi Giao Nóng - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Yến Nhà Mình ấp ủ tâm huyết trong từng chén yến chưng tươi, nơi mỗi sợi yến tinh khiết hòa quyện cùng vị ngọt thanh tự nhiên của đường phèn, hạt sen hay táo đỏ. Chúng tôi nâng niu chuẩn bị và giao nóng đến tận tay bạn, giữ trọn vẹn dưỡng chất quý giá và hương vị thơm lành. Hãy để Yến Nhà Mình trở thành món quà sức khỏe, gửi gắm yêu thương và chăm sóc bản thân mỗi ngày.' AS story 
    FROM Restaurants 
    WHERE name = N'Yến Nhà Mình - 100% Yến Chưng Tươi Giao Nóng - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Súp Cua Ông Bắp - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về Súp Cua Ông Bắp - Bình Thạnh là tìm về hương vị thân thương giữa lòng Sài Gòn nhộn nhịp. Tọa lạc tại 122/5 Bùi Đình Tuý, mỗi chén súp cua nóng hổi tại đây đều được Ông Bắp đặt trọn tâm huyết, từ súp cua truyền thống đến các biến tấu độc đáo như óc heo hay trứng bắc thảo. Với vị ngon đậm đà, sánh mịn khó cưỡng, chúng tôi tự hào mang đến trải nghiệm ẩm thực ấm áp, chuẩn vị nhà làm. Ghé thăm để thưởng thức và cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Súp Cua Ông Bắp - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Súp Cua Vương Gia - Điểm Tâm & Ăn Vặt - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Bình Thạnh, Súp Cua Vương Gia mời bạn ghé thăm một không gian bình dị nhưng chứa đựng hương vị vương giả. Mỗi chén súp cua tại đây là bản giao hưởng của vị ngọt thịt cua tươi, trứng bắc thảo béo ngậy và bí quyết gia truyền, tạo nên độ sánh mịn khó quên. Chúng tôi tin rằng, món ăn ngon nhất đến từ nguyên liệu tươi và cái tâm của người đầu bếp, và bạn sẽ cảm nhận được điều đó qua từng muỗng súp nóng hổi. Hãy đến và tự mình trải nghiệm hương vị đã làm nên tên tuổi của Vương Gia!' AS story 
    FROM Restaurants 
    WHERE name = N'Súp Cua Vương Gia - Điểm Tâm & Ăn Vặt - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Thái & Cơm Phủ Trứng - Bình Thạnh
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Bình Thạnh thân quen, Bún Thái & Cơm Phủ Trứng mang đến hương vị Á Châu đầy mê hoặc. Thưởng thức Bún Thái Hải Sản chua cay nồng nàn đánh thức mọi giác quan, hay đắm mình trong sự mềm mại, thơm lừng của Cơm Chiên Phủ Trứng nóng hổi. Mỗi món ăn đều được chế biến với tất cả tâm huyết, hứa hẹn một bữa ăn ấm áp, tròn vị như chính căn bếp nhà mình.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Thái & Cơm Phủ Trứng - Bình Thạnh'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Nguyên Quận 12 - Vườn Lài
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Quận 12 tấp nập, Phở Nguyên Vườn Lài là điểm dừng chân ấm áp, mang đến hương vị phở truyền thống nồng nàn không thể quên. Nồi nước dùng hầm xương kỹ lưỡng, ngọt thanh mà đậm đà, cùng thịt tươi và sợi phở mềm dẻo, mỗi tô là cả tâm huyết. Ghé Phở Nguyên để cảm nhận nét ẩm thực Việt tinh túy, một trải nghiệm vị giác chân thật, vẹn nguyên như ngày đầu.' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Nguyên Quận 12 - Vườn Lài'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Súp Cua Cô 8
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Súp Cua Cô 8, mỗi chén súp không chỉ là món ăn mà còn là cả tấm lòng người đầu bếp gửi gắm. Giữa lòng Quận 12, hương vị cua tươi ngọt hòa quyện cùng bí quyết gia truyền đã tạo nên món súp sánh mịn, đậm đà khó quên. Dù là súp cua truyền thống hay biến tấu bắc thảo, óc heo độc đáo, tất cả đều ấm nóng và giàu dinh dưỡng. Ghé Cô 8 để xua tan mệt mỏi, tìm lại hương vị tuổi thơ trong từng thìa súp cua thân quen.' AS story 
    FROM Restaurants 
    WHERE name = N'Súp Cua Cô 8'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Mùa Hạ - Trà & Bánh - Thạnh Xuân Quận 12
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tiệm Mùa Hạ mời bạn dừng chân tại một góc bình yên ở Quận 12, nơi hương trà sữa truyền thống ngọt ngào như đánh thức ký ức tuổi thơ. Nhưng điểm nhấn thực sự lại là những phần chân gà rút xương trứ danh: từ sả tắc giòn dai đến Tomyum chua cay đậm đà, mỗi món đều được chế biến thủ công với tất cả tâm huyết. Hãy đến Tiệm Mùa Hạ để tự mình khám phá sự kết hợp độc đáo, mang đến những khoảnh khắc ẩm thực thật đáng nhớ!' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Mùa Hạ - Trà & Bánh - Thạnh Xuân Quận 12'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Nam Hàn - Mì Cay & Tokbokki - Đông Hưng Thuận 2
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Nằm giữa lòng Quận 12, Mì Cay Nam Hàn là điểm đến lý tưởng cho những ai trót yêu hương vị cay nồng chuẩn Hàn. Mỗi tô mì cay, từ Hải Sản Đặc Biệt đến Bò đậm đà, đều được nêm nếm tinh tế, mang đến trải nghiệm bùng vị khó quên. Với không gian ấm cúng, gần gũi và mức giá bình dân, chúng tôi tự hào mang đến những bữa ăn ngon miệng, ấm lòng để bạn cùng người thân thưởng thức. Hãy đến và cảm nhận sự khác biệt từ cái tâm chúng tôi đặt vào từng món ăn!' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Cay Nam Hàn - Mì Cay & Tokbokki - Đông Hưng Thuận 2'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: NT Food - Mì Trộn Indo - Gà Rán & Ăn Vặt
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào bạn đến với NT Food, chốn dừng chân lý tưởng cho những bữa ăn chuẩn vị Á châu tại Quận 12. Từ mì tương đen đậm đà, đùi gà giòn rụm khó cưỡng đến cơm chiên hải sản thơm lừng, mỗi món đều được chúng tôi chăm chút tỉ mỉ. NT Food mang đến hương vị thân quen, chất lượng trong từng nguyên liệu và sự ấm áp như bữa cơm nhà. Mời bạn ghé 292 Huỳnh Thị Hai để trải nghiệm nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'NT Food - Mì Trộn Indo - Gà Rán & Ăn Vặt'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Ý Happy Meal - Nui & Nước - 481/9/21 HT17
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Ý Happy Meal là góc nhỏ hạnh phúc tại Quận 12, nơi mỗi đĩa mì Ý và nui sốt bò bằm phô mai đều được chế biến bằng cả tấm lòng. Chúng tôi mang đến hương vị Ý bình dân, ấm áp như bữa cơm nhà, với điểm nhấn là phần sốt sánh mịn đậm đà, quyện cùng phô mai béo ngậy khó cưỡng. Đến với Happy Meal, bạn không chỉ thưởng thức món ngon 4.6 sao mà còn tìm thấy niềm vui trong từng miếng ăn, một trải nghiệm ẩm thực đáng nhớ và tràn đầy năng lượng.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Ý Happy Meal - Nui & Nước - 481/9/21 HT17'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trà Sữa Te Amo - 109 Dương Thị Mười
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Trà Sữa Te Amo – nơi tình yêu được ủ trong từng ly nước. Tại 109 Dương Thị Mười, chúng tôi mang đến một không gian bình dị nhưng ấm cúng, nơi bạn có thể thưởng thức những hương vị đặc trưng khó quên. Từ Trà Đào Cam Sả thơm lừng, độc đáo đến Trà Sữa Bí Đao thanh mát hay Hồng Trà Trân Châu 3Q giòn dai, mỗi món đều được pha chế tỉ mỉ bằng tất cả tâm huyết. Ghé Te Amo, để vị giác được vỗ về và trái tim được thư thái!' AS story 
    FROM Restaurants 
    WHERE name = N'Trà Sữa Te Amo - 109 Dương Thị Mười'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cô Lan - Bún Thịt Nướng & Bột Chiên - Nguyễn Văn Quá
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ẩn mình trong con hẻm nhỏ Nguyễn Văn Quá, Cô Lan là điểm hẹn quen thuộc cho những ai mê mẩn hương vị bún thịt nướng đậm đà, miếng chả giò giòn rụm và bột chiên vàng ươm, thơm nức mũi. Mỗi đĩa ăn tại đây là sự kết tinh của tình yêu và bí quyết gia truyền, mang đến bữa ăn vừa ngon miệng, vừa ấm lòng. Hãy ghé Cô Lan để tìm lại những ký ức ẩm thực thân thương và tận hưởng hương vị chuẩn nhà làm giữa lòng Sài Gòn.' AS story 
    FROM Restaurants 
    WHERE name = N'Cô Lan - Bún Thịt Nướng & Bột Chiên - Nguyễn Văn Quá'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Cơm Gà Mắm Tỏi 1208 - Nguyễn Văn Quá
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Quán Cơm Gà Mắm Tỏi 1208 Nguyễn Văn Quá, mỗi suất cơm là cả tâm huyết gói ghém hương vị truyền thống. Nổi bật là gà góc tư giòn rụm, quyện cùng bí quyết nước mắm tỏi trứ danh làm nên dấu ấn khó quên. Đến đây, bạn không chỉ thưởng thức bữa ăn ngon mà còn tìm thấy sự ấm áp, quen thuộc như cơm nhà. Mời bạn ghé để cảm nhận chất "bình dân" nhưng đầy tinh tế này!' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Cơm Gà Mắm Tỏi 1208 - Nguyễn Văn Quá'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cá Viên Chiên TyBy - Trần Thị Hè
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Cá Viên Chiên TyBy Trần Thị Hè mời bạn đến khám phá hương vị tuổi thơ tại 621/39/2/4 Trần Thị Hè. Từng viên cá, tôm, bò chiên giòn rụm, hay hoành thánh vàng ươm, đều được chuẩn bị với tất cả tâm huyết, mang đến những combo nóng hổi, đậm đà khó quên. Đây là điểm hẹn ấm cúng, nơi mỗi món ăn vặt đều kể một câu chuyện về sự thân thuộc và niềm vui giản dị.' AS story 
    FROM Restaurants 
    WHERE name = N'Cá Viên Chiên TyBy - Trần Thị Hè'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: 3 Râu - Gà Rán Pizza & Trà Sữa – 1208 Nguyễn Văn Quá
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm kiếm hương vị gà rán giòn rụm chuẩn fastfood bình dân tại 1208 Nguyễn Văn Quá? 3 Râu tự hào mang đến những miếng gà nóng hổi, thấm đẫm gia vị độc đáo, cùng cơm gà xốt đậm đà hay gà viên chiên giòn cực đã. Mỗi bữa ăn tại 3 Râu không chỉ ngon miệng mà còn ấm áp, vui vẻ với mức giá cực kỳ phải chăng. Hãy ghé 3 Râu để trải nghiệm bữa tiệc vị giác được lòng rất nhiều thực khách!' AS story 
    FROM Restaurants 
    WHERE name = N'3 Râu - Gà Rán Pizza & Trà Sữa – 1208 Nguyễn Văn Quá'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trà Sữa HongKong Baley - Phan Văn Hớn
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Trà Sữa HongKong Baley, chúng mình ủ ấp từng hương vị để mang đến bạn những khoảnh khắc ngọt ngào nhất. Từ Trà Sữa Khoai Môn Tươi béo ngậy đến Trà Sữa Kem Trứng Nướng thơm lừng, mỗi ly đều là sự kết hợp của tâm huyết và nét đặc trưng Hong Kong. Ghé 93 Phan Văn Hớn để tìm một góc nhỏ bình yên, thưởng thức và nạp năng lượng sau ngày dài nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Trà Sữa HongKong Baley - Phan Văn Hớn'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Cháo Sò Huyết 1999 - Hiệp Thành 13
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Đến Cháo Sò Huyết 1999 - Hiệp Thành 13 để khám phá hương vị biển cả gói trọn trong từng món ăn tươi ngon. Từ Cháo Sò Huyết nóng hổi, sánh mịn đến Sò Huyết Rang Muối Ớt cay nồng và Ốc Hương Cháy Tỏi thơm lừng, mỗi món là sự kết hợp hoàn hảo của nguyên liệu tươi mới cùng bí quyết gia truyền. Với không gian bình dị, ấm cúng và chất lượng được đánh giá 4.8/5 sao, chúng tôi tự hào mang đến trải nghiệm ẩm thực hải sản đáng nhớ, đậm đà tình quê. Hãy ghé thăm để cảm nhận sự khác biệt!' AS story 
    FROM Restaurants 
    WHERE name = N'Cháo Sò Huyết 1999 - Hiệp Thành 13'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: TUTIMI - Milo Dầm - Trà Sữa & Cà Phê - 71A Nguyễn Văn Quá
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'TUTIMI – nơi những ly Milo Dầm Full Topping không chỉ là thức uống, mà là cả một bầu trời tuổi thơ được gói ghém tỉ mỉ. Từng giọt cà phê kem muối biển đậm đà, hay ly trà sữa Olong trân châu trắng thanh mát đều được pha chế bằng cả tấm lòng, mang đến hương vị riêng khó quên. Dừng chân tại 71A Nguyễn Văn Quá, bạn sẽ tìm thấy không gian bình yên và những thức uống "chuẩn vị" làm say lòng.' AS story 
    FROM Restaurants 
    WHERE name = N'TUTIMI - Milo Dầm - Trà Sữa & Cà Phê - 71A Nguyễn Văn Quá'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phở Nguyễn - Tô Ký
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Phở Nguyễn - Tô Ký, chúng tôi tin rằng mỗi món ăn là một câu chuyện. Nơi đây, giữa lòng Quận 12, bạn sẽ khám phá hương vị đặc sản Việt Nam được nâng tầm bằng phong cách riêng biệt và cái tâm truyền đời. Từ tô phở nóng hổi đến những món độc đáo, tất cả đều được chăm chút tỉ mỉ, mang đến trải nghiệm ấm lòng, khó quên. Hãy đến và thưởng thức nét tinh hoa ẩm thực chỉ có tại Phở Nguyễn!' AS story 
    FROM Restaurants 
    WHERE name = N'Phở Nguyễn - Tô Ký'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Quán Ăn 7 Thức - Bún Riêu & Hủ Tiếu
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Quán Ăn 7 Thức để khám phá hương vị Việt bình dị mà tinh tế, nơi mỗi tô bún riêu, hủ tiếu được nấu bằng cả cái tâm. Nước dùng đậm đà, topping đầy đặn cùng sợi bún, hủ tiếu dai ngon sẽ đánh thức mọi giác quan của bạn. Với đánh giá 4.6/5 sao, chúng tôi tự hào là điểm hẹn ấm cúng, mang đến bữa ăn chuẩn vị nhà làm, thơm ngon khó cưỡng.' AS story 
    FROM Restaurants 
    WHERE name = N'Quán Ăn 7 Thức - Bún Riêu & Hủ Tiếu'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gà Nướng Cơm Lam - Trần Tính
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Gà Nướng Cơm Lam - Trần Tính, mỗi món gà nướng không chỉ là món ăn mà còn là cả tâm huyết gia truyền. Từ vị mật ong đậm đà đến hương mắc khén Tây Bắc độc đáo, mọi giác quan sẽ được đánh thức. Kết hợp cùng cơm lam dẻo thơm, chúng tôi mời bạn đến trải nghiệm bữa ăn chuẩn vị gia đình ấm áp, nơi hương vị kể câu chuyện.' AS story 
    FROM Restaurants 
    WHERE name = N'Gà Nướng Cơm Lam - Trần Tính'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: PHONG VŨ - BÁNH MÌ HÀ NỘI, XÔI MẶN & BÁNH BAO - TÔ KÝ
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại PHONG VŨ, chúng tôi tự hào mang hương vị Hà Nội chuẩn mực len lỏi giữa lòng Sài Gòn, với từng chiếc bánh mì giòn rụm cùng xôi mặn đậm đà. Mỗi món ăn như Bánh mì thịt chả đặc biệt hay Xôi mặn hộp lớn đều được làm bằng tâm huyết, giữ trọn vẹn nét truyền thống. Ghé 169 Tô Ký để tận hưởng bữa sáng thơm ngon, bữa trưa tròn vị hay bữa xế ấm lòng, nơi hương vị thân quen luôn chào đón bạn!' AS story 
    FROM Restaurants 
    WHERE name = N'PHONG VŨ - BÁNH MÌ HÀ NỘI, XÔI MẶN & BÁNH BAO - TÔ KÝ'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm hẹn lý tưởng cho những tín đồ ẩm thực Hàn Quốc mê mẩn vị cay nồng ấm lòng. Mỗi tô mì là sự kết hợp tinh tế của công thức riêng nhà Sasin, mang đến hương vị bùng nổ khó quên. Đến đây để cảm nhận sự ấm cúng và thưởng thức những món ăn được chế biến bằng cả tâm huyết, hứa hẹn một trải nghiệm ẩm thực đầy xúc cảm.' AS story 
    FROM Restaurants 
    WHERE name = N'Mì Cay Sasin - Tân Phong Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Phan Rang Quán Quận 7 - Thức Ăn - Lê Văn Lương
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Phan Rang Quán Quận 7, nơi hương vị mộc mạc của quê nhà được gói trọn trong từng món đặc sản. Với cái tâm của người làm bếp và không gian bình dị, chúng tôi mang đến những bữa ăn ấm cúng, đậm đà bản sắc Phan Rang ngay giữa lòng Sài Gòn. Hãy ghé 399 Lê Văn Lương để cảm nhận sự chân thành và thưởng thức ẩm thực Việt ngon như nhà làm!' AS story 
    FROM Restaurants 
    WHERE name = N'Phan Rang Quán Quận 7 - Thức Ăn - Lê Văn Lương'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ốc Trứng Muối - Chi Nhánh 17 Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 17 Quận 7, chúng tôi tự hào mang đến hương vị biển cả tươi rói hòa quyện cùng sốt trứng muối béo ngậy độc đáo, tạo nên những món ốc trứ danh. Mỗi món đặc sản là sự ấp ủ từ cái tâm của người đầu bếp, với công thức riêng không thể tìm thấy ở nơi nào khác. Hãy ghé 109 Đường Số 79 để cùng bạn bè, người thân tận hưởng không gian bình dị, ấm cúng và những bữa ăn đậm đà, khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Ốc Trứng Muối - Chi Nhánh 17 Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Link Ốc Quận 7 - Đường Số 10
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 mời gọi bạn đắm mình vào thế giới hải sản tươi ngon và những món nhậu độc đáo mang phong cách riêng không lẫn vào đâu được. Mỗi món ăn nơi đây là sự kết hợp tinh tế giữa nguyên liệu chọn lọc và gia vị bí truyền, được chế biến bằng cả tâm huyết để đánh thức mọi giác quan. Tại 1 Đường Số 10, bạn sẽ tìm thấy một không gian ấm cúng, rộn ràng tiếng cười, lý tưởng cho những cuộc hội ngộ bạn bè. Hãy đến và trải nghiệm hương vị khó quên cùng khoảnh khắc thư giãn tuyệt vời!' AS story 
    FROM Restaurants 
    WHERE name = N'Link Ốc Quận 7 - Đường Số 10'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Bún Riêu Tóp Mỡ Đặc Biệt Quận 7, mỗi tô bún riêu là một bản giao hưởng của hương vị truyền thống và nét chấm phá riêng biệt. Nước lèo chua thanh đậm đà, gạch cua béo ngậy hòa quyện cùng tóp mỡ giòn tan tạo nên trải nghiệm khó quên. Đó là cái tâm, là sự tỉ mỉ chúng tôi gửi gắm, mời bạn ghé 269 Phạm Hữu Lầu để thưởng thức nét "đặc biệt" làm nên tên tuổi quán!' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Lẩu Cá Đuối 79k - Lotte Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Lẩu Cá Đuối 79k mời bạn ghé thăm để khám phá món lẩu cá đuối trứ danh, nơi hương vị chua cay đậm đà của nước dùng hòa quyện cùng thịt cá tươi ngon, khiến bạn khó quên. Mỗi nồi lẩu đều được chúng tôi chuẩn bị bằng tất cả tâm huyết, từ nguyên liệu chọn lọc đến công thức riêng biệt, mang đến nét đặc sắc riêng của quán. Đây là điểm hẹn lý tưởng cho những buổi tụ họp bạn bè, gia đình cùng ''nhậu'' vui vẻ, thưởng thức món ngon chuẩn vị Việt ngay tại Quận 7.' AS story 
    FROM Restaurants 
    WHERE name = N'Lẩu Cá Đuối 79k - Lotte Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trà Sữa MayCha - Yola, Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Giữa lòng Quận 7 nhộn nhịp, Trà Sữa MayCha - Yola mở ra một không gian ấm cúng, chờ đón bạn. Nơi đây không chỉ có những ly trà sữa thơm ngon mà còn tự hào giới thiệu các món ăn đặc sản được chế biến với phong cách độc đáo, gói trọn cái tâm của người làm bếp. Mỗi hương vị là một trải nghiệm khó quên. Mời bạn ghé MayCha để cảm nhận sự khác biệt và sự tinh tế trong từng món ăn.' AS story 
    FROM Restaurants 
    WHERE name = N'Trà Sữa MayCha - Yola, Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Trạm Mì Ý Dì Hiền Quận 7 - 6 Đường 15
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Trạm Mì Ý Dì Hiền Quận 7, nơi mỗi đĩa mì là hành trình vị giác ấm áp và đầy bất ngờ. Với bí quyết riêng cùng tâm huyết của Dì Hiền, từng sợi mì dai hòa quyện trong sốt độc đáo, đậm đà không lẫn vào đâu được. Ghé ngay 6 Đường 15 để thưởng thức hương vị Ý "chuẩn nhà Dì" và cảm nhận sự chân thành trong từng món ăn.' AS story 
    FROM Restaurants 
    WHERE name = N'Trạm Mì Ý Dì Hiền Quận 7 - 6 Đường 15'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN - Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với ICHI QUÁN Quận 7, nơi hương vị Hà Nội truyền thống được kể lại theo một cách rất riêng, rất ICHI. Từng bát Bún Chả thơm lừng, đậm đà và Nem Cua Bể giòn rụm là tâm huyết của chúng tôi, hòa quyện giữa công thức chuẩn vị và nét sáng tạo độc đáo. Hãy ghé thăm để cảm nhận sự ấm áp, gần gũi và thưởng thức những món ăn đặc sản đầy say mê, như một lời mời gọi thân tình từ ICHI QUÁN.' AS story 
    FROM Restaurants 
    WHERE name = N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN - Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tacos Labubu Quận 7 - Đường Số 17
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tacos Labubu Đường Số 17 là điểm đến lý tưởng cho những tín đồ fastfood mê mẩn hương vị độc đáo. Chúng tôi tự hào mang đến những món taco đặc sản theo phong cách riêng, được chế biến tỉ mỉ với niềm đam mê ẩm thực. Mỗi miếng bánh giòn tan, nhân đậm đà sẽ đánh thức mọi giác quan, hứa hẹn một trải nghiệm bình dân mà chất lượng khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Tacos Labubu Quận 7 - Đường Số 17'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Chicken 3S - Gà Rán Xốt Hàn & Mỳ Cay - Nguyễn Thị Thập Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại Chicken 3S, chúng tôi gói trọn hương vị Hàn Quốc đích thực trong từng miếng gà rán sốt cay giòn rụm và tô mỳ cay bùng vị. Với công thức "3S" độc quyền, mỗi món ăn không chỉ là sự kết hợp hoàn hảo của gia vị mà còn là cái tâm gửi gắm, mang đến trải nghiệm ẩm thực khó quên. Ghé 475A Nguyễn Thị Thập để khám phá không gian ấm áp, nơi những bữa ăn gia đình thêm phần trọn vẹn.' AS story 
    FROM Restaurants 
    WHERE name = N'Chicken 3S - Gà Rán Xốt Hàn & Mỳ Cay - Nguyễn Thị Thập Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tứ Quý Trà - Carameo Machiato Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng đến Tứ Quý Trà - Carameo Machiato Quận 7, nơi bạn tìm thấy góc nhỏ bình yên giữa lòng Sài Gòn. Tại 79A Đường 79, chúng tôi tự hào mang đến những món đặc sản độc đáo cùng hương vị cà phê Carameo Machiato đậm đà, được chế biến với tất cả tâm huyết. Mời bạn ghé thưởng thức và cảm nhận từng dư vị riêng biệt, ấm áp như chính ngôi nhà của mình.' AS story 
    FROM Restaurants 
    WHERE name = N'Tứ Quý Trà - Carameo Machiato Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Chiang Thai Delivery - Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Chiang Thai Delivery - Quận 7, nơi hương vị Thái Lan đích thực được chắt chiu và biến tấu theo phong cách riêng đầy mê hoặc. Mỗi món ăn là hành trình của vị giác, từ chút chua cay nồng nàn đến vị ngọt thanh tao, tất cả đều được đội ngũ đầu bếp tận tâm gửi gắm. Với đánh giá 4.8 sao, chúng tôi tự tin mang đến cho bạn bữa tiệc chuẩn Thái ngay tại nhà, ấm áp và khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Chiang Thai Delivery - Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tiệm Fulleaf - Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Tiệm Fulleaf - Quận 7, bạn sẽ tìm thấy một góc bình yên để tạm gác lại bộn bề. Nơi đây, mỗi món đặc sản mang phong cách riêng đều được ấp ủ bằng cái tâm, tạo nên hương vị khó quên và không gian ấm cúng. Ghé Tiệm Fulleaf để vị giác thăng hoa và tâm hồn được vỗ về nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Tiệm Fulleaf - Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Gangnam Tanghulu - Lotte Mart Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Gangnam Tanghulu - Lotte Mart Quận 7 là điểm dừng chân lý tưởng để bạn khám phá những hương vị Á Đông đặc sắc, được chế biến theo phong cách riêng đầy sáng tạo. Từ những que Tanghulu giòn ngọt đến các món ngon độc đáo khác, mỗi món ăn đều chứa đựng tâm huyết của chúng tôi, mang đến trải nghiệm ẩm thực khó quên. Hãy để Gangnam Tanghulu làm phong phú thêm hành trình vị giác của bạn, ngay tại trung tâm mua sắm sầm uất.' AS story 
    FROM Restaurants 
    WHERE name = N'Gangnam Tanghulu - Lotte Mart Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Pave Glace Chocolate Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tìm về một góc nhỏ bình yên tại Quận 7, Pave Glace Chocolate mời bạn đắm chìm vào thế giới hương vị đặc sắc. Mỗi món tráng miệng, từ socola nghệ thuật đến những chiếc bánh tinh tế, đều là tâm huyết được gửi gắm, mang đậm phong cách riêng không thể lẫn. Đây là nơi lý tưởng để tự thưởng cho mình hoặc sẻ chia niềm ngọt ngào qua những món quà ý nghĩa. Ghé Pave Glace để cảm nhận sự ngọt ngào không thể chối từ!' AS story 
    FROM Restaurants 
    WHERE name = N'Pave Glace Chocolate Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tacos Nhà Labubu 149 - Phạm Hữu Lầu Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bước vào Tacos Nhà Labubu 149, bạn không chỉ ghé một quán ăn mà là đến một ngôi nhà của những hương vị độc đáo, nơi sự sáng tạo và cái tâm quyện vào từng chiếc taco. Tại số 149 Phạm Hữu Lầu, mỗi món đặc sản đều mang phong cách riêng không thể nhầm lẫn, từ nhân sốt đậm đà đến vỏ bánh giòn tan hấp dẫn. Hãy để Labubu chiêu đãi bạn một bữa ăn bình dân nhưng tràn đầy cảm hứng, xứng đáng với 4.6 sao yêu thích từ thực khách!' AS story 
    FROM Restaurants 
    WHERE name = N'Tacos Nhà Labubu 149 - Phạm Hữu Lầu Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tacos Nhà LuXaBu - 335 Nguyễn Hữu Thọ, Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tacos Nhà LuXaBu chào đón bạn đến với thế giới Tacos bình dân nhưng đầy ắp hương vị độc đáo, được làm nên từ cái tâm và công thức riêng biệt. Mỗi chiếc bánh là sự kết hợp hoàn hảo của nguyên liệu tươi ngon, giòn tan và đậm đà, mang đến trải nghiệm khó quên. Ghé 335 Nguyễn Hữu Thọ, Quận 7 để khám phá ngay vị ngon đã tạo nên dấu ấn 4.2 sao của chúng tôi nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Tacos Nhà LuXaBu - 335 Nguyễn Hữu Thọ, Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Tacos Xin Chào - 333 Nguyễn Hữu Thọ Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tacos Xin Chào tại 333 Nguyễn Hữu Thọ! Nơi đây, mỗi chiếc taco không chỉ là món ăn nhanh mà là cả một trải nghiệm hương vị đặc trưng, độc đáo riêng của chúng tôi. Từ vỏ giòn rụm đến nhân đậm đà được chế biến thủ công, chúng tôi tự hào mang đến những bữa ăn ngon miệng, ấm lòng và chất lượng 4.8 sao. Ghé Tacos Xin Chào để thưởng thức ngay nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Tacos Xin Chào - 333 Nguyễn Hữu Thọ Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Bánh Mì Pate Hải Phòng Quận 7 - 141 Đường Số 1
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mang trọn tinh hoa ẩm thực đường phố Hải Phòng về Quận 7, Bánh Mì Pate Hải Phòng - 141 Đường Số 1 chào đón bạn với hương vị pate trứ danh và những món đặc sản đầy tâm huyết. Mỗi ổ bánh mì giòn tan, thơm lừng là sự kết hợp hoàn hảo giữa công thức truyền thống và nét chấm phá riêng của quán. Tại đây, bạn sẽ tìm thấy một không gian bình dị, ấm cúng nhưng ẩn chứa những bất ngờ về hương vị. Hãy ghé thăm để cảm nhận sự gần gũi và khám phá những trải nghiệm vị giác khó quên.' AS story 
    FROM Restaurants 
    WHERE name = N'Bánh Mì Pate Hải Phòng Quận 7 - 141 Đường Số 1'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: A Duy Food - Hệ Thống Gà Quay, Sườn Quay & Cơm Lam - Chi Nhánh Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Tại A Duy Food Quận 7, chúng tôi tin rằng ẩm thực là sợi dây gắn kết gia đình. Bạn sẽ được đắm mình trong hương vị độc đáo của gà quay giòn tan, sườn quay đậm đà và cơm lam dẻo thơm, tất cả đều mang phong vị riêng biệt được ấp ủ từ cái tâm của người đầu bếp. Mỗi món ăn không chỉ ngon mà còn là câu chuyện về niềm đam mê. Mời bạn ghé thăm để cùng sẻ chia những bữa ăn trọn vẹn, ấm cúng.' AS story 
    FROM Restaurants 
    WHERE name = N'A Duy Food - Hệ Thống Gà Quay, Sườn Quay & Cơm Lam - Chi Nhánh Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Ola Tacos Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Thèm một hương vị mới lạ, đậm đà ngay tại Quận 7? Ola Tacos Quận 7 mang đến những chiếc bánh "đặc sản" với phong cách riêng biệt, làm say lòng thực khách. Mỗi món ăn được chúng tôi chế biến từ nguyên liệu tươi ngon nhất và cái tâm truyền vào, để bạn có trải nghiệm ẩm thực bình dân mà vẫn thật đặc sắc. Ghé 50 Đường Số 10 để khám phá ngay hôm nay!' AS story 
    FROM Restaurants 
    WHERE name = N'Ola Tacos Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: LaSiMi Quận 7- Trà Ngon Đậm Vị - Đường Số 17
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'LaSiMi Quận 7 mời bạn ghé thăm một góc nhỏ bình yên trên Đường Số 17, nơi Trà Ngon Đậm Vị làm say lòng người. Bên cạnh những ấm trà thơm lừng, quán còn tự hào giới thiệu các món đặc sản độc đáo, mỗi món là cả tâm huyết gói trọn hương vị riêng. Hãy đến LaSiMi để tận hưởng không gian ấm cúng và khám phá những trải nghiệm ẩm thực đáng nhớ bạn nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'LaSiMi Quận 7- Trà Ngon Đậm Vị - Đường Số 17'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Sâm Chill Me - Lý Phục Man Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Ghé Sâm Chill Me Lý Phục Man, bạn sẽ tìm thấy một góc yên bình lý tưởng để gác lại âu lo. Chúng tôi tự hào mang đến những món đặc sản được chế biến với phong cách riêng biệt và trọn vẹn cái tâm, khiến mỗi hương vị đều là một khám phá thú vị. Hãy đến và thư giãn cùng Sâm Chill Me, nơi mỗi bữa ăn không chỉ ngon miệng mà còn là khoảnh khắc đáng nhớ của bạn.' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

COMMIT TRANSACTION;
