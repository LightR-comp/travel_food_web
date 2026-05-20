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

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin Tân Phong Quận 7 là nơi bạn tìm thấy hương vị Hàn Quốc bình dân nhưng đầy lôi cuốn, với những món ăn đặc sản mang phong cách riêng không thể lẫn. Mỗi bát mì cay nóng hổi hay món ngon độc đáo đều được chế biến tỉ mỉ, gửi gắm trọn vẹn tâm huyết của người đầu bếp. Đến Sasin, bạn sẽ được thưởng thức ẩm thực ngon miệng trong một không gian ấm cúng, thân thuộc như chính ngôi nhà của mình.' AS story 
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
    SELECT id AS restaurant_id, N'Phan Rang Quán Quận 7 mang đến hương vị đặc sản miền biển nắng gió, được biến tấu tinh tế theo phong cách riêng của quán. Tại 399 Lê Văn Lương, mỗi món ăn là sự kết hợp của nguyên liệu tươi ngon và cái tâm gửi gắm trong từng công đoạn. Hãy ghé thăm để tận hưởng bữa cơm ấm cúng, đậm đà như nhà làm, một trải nghiệm ẩm thực chất Phan Rang đích thực giữa lòng Sài Gòn.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối Quận 7 – nơi hương vị đặc trưng và không khí ấm cúng hòa quyện. Chúng tôi tự hào mang đến món ốc trứng muối trứ danh béo ngậy, cùng các loại hải sản tươi ngon chế biến theo phong cách rất riêng, đảm bảo sẽ làm hài lòng cả những vị giác khó tính nhất. Hãy ghé 109 Đường Số 79, P. Tân Quy để sẻ chia niềm vui ẩm thực bình dị và những khoảnh khắc thật đáng nhớ bên bạn bè, người thân nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Link Ốc Quận 7, chúng tôi tự hào mang đến những món ốc và hải sản tươi rói, chế biến với công thức đặc biệt chỉ có tại Đường Số 10. Mỗi đĩa ăn không chỉ là món nhậu ngon mà còn là tâm huyết của người đầu bếp, kết nối những khoảnh khắc vui vẻ. Hãy ghé để thưởng thức hương vị độc đáo và cảm nhận sự ấm cúng như ở nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu là điểm hẹn của những tâm hồn yêu ẩm thực. Mỗi tô bún riêu tại đây là sự kết hợp tinh tế của nước lèo đậm đà, riêu cua đồng tươi ngon và đặc biệt là tóp mỡ giòn tan, béo ngậy tạo nên hương vị có "một không hai". Chúng tôi đặt trọn vẹn cái tâm vào từng nguyên liệu, từng công đoạn để mang đến trải nghiệm khó quên. Ghé 269 Phạm Hữu Lầu để khám phá hương vị đã chinh phục hàng ngàn thực khách.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Lẩu Cá Đuối 79k, nơi hương vị biển cả gói trọn trong nồi lẩu cá đuối chua cay, đậm đà khó quên. Mỗi món nhậu đặc sắc tại đây đều là sự kết hợp hoàn hảo giữa nguyên liệu tươi ngon và bí quyết chế biến riêng, tạo nên trải nghiệm ẩm thực Việt đầy bất ngờ. Dù là tụ họp bạn bè hay thư giãn cuối ngày, Lẩu Cá Đuối 79k hứa hẹn mang đến khoảnh khắc sum vầy ấm áp và vị giác bùng nổ.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, chúng tôi mời bạn khám phá thế giới hương vị đặc sản không lẫn vào đâu được. Mỗi món ăn là một tác phẩm mang đậm phong cách riêng, được tạo nên từ cái tâm và sự sáng tạo. Hãy để ly trà sữa thân quen và những món ngon đạt 4.8 sao tại Quận 7 này khơi gợi mọi giác quan của bạn trong không gian ấm cúng, gần gũi.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trạm Mì Ý Dì Hiền Quận 7, bạn sẽ tìm thấy một góc Ý ấm cúng ngay giữa lòng Sài Gòn. Mỗi suất mì là sự kết hợp tinh tế của hương vị truyền thống và phong cách độc đáo của Dì Hiền, tạo nên những "đặc sản" riêng biệt, khó quên. Với cái tâm gửi gắm trong từng sợi mì, Dì Hiền mời bạn ghé 6 Đường 15 để thưởng thức bữa ăn ngon chuẩn vị và đầy ắp tình cảm.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN Quận 7, nơi mỗi món ăn là một câu chuyện về cái tâm và sự sáng tạo. Chúng tôi tự hào mang đến hương vị Bún Chả Hà Nội đậm đà và Nem Cua Bể giòn tan theo một phong cách riêng biệt, không thể tìm thấy ở nơi nào khác. Tại đây, bạn sẽ tìm thấy sự kết hợp hoàn hảo giữa nét truyền thống ấm áp và sự tinh tế hiện đại, trong không gian thân thuộc và gần gũi.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Tacos Labubu Quận 7! Tại 145 Đường Số 17, chúng tôi tin rằng fastfood cũng có thể mang đậm dấu ấn riêng. Mỗi chiếc taco là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và công thức độc đáo, gửi gắm trọn vẹn tâm huyết của người đầu bếp. Hãy đến và khám phá những hương vị đặc trưng chỉ có tại Labubu, nơi bạn luôn được chào đón.' AS story 
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
    SELECT id AS restaurant_id, N'Đến Chicken 3S Nguyễn Thị Thập để khám phá thế giới gà rán xốt Hàn giòn tan, đượm vị và những tô mì cay bùng nổ trứ danh. Mỗi món ăn tại đây là sự kết hợp hoàn hảo của bí quyết riêng và cái tâm người đầu bếp, mang đến trải nghiệm ẩm thực chuẩn Hàn nhưng rất riêng của Chicken 3S. Không gian ấm áp, thân thiện chắc chắn sẽ là điểm đến lý tưởng cho những bữa ăn gia đình tràn ngập tiếng cười. Hãy để chúng tôi mang đến cho bạn những khoảnh khắc ngon khó quên!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Tứ Quý Trà - Carameo Machiato Quận 7, mỗi góc nhỏ đều ấp ủ sự ấm cúng và những bất ngờ vị giác. Nơi đây, bạn sẽ được thưởng thức các món đặc sản đậm đà, mang dấu ấn riêng biệt được chế biến bằng cả tấm lòng. Hãy đến trải nghiệm ly Carameo Machiato thơm lừng hay bữa ăn ngon miệng, để cảm nhận một khoảnh khắc yên bình và tràn đầy năng lượng cho ngày mới.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chiang Thai Delivery Quận 7, mỗi món ăn là một câu chuyện hương vị Thái được kể bằng bí quyết riêng, gửi gắm trọn vẹn cái tâm của người đầu bếp. Từ vị chua cay nồng nàn đến béo ngậy đậm đà, bạn sẽ được trải nghiệm bản giao hưởng ẩm thực tinh túy, độc đáo ngay tại nhà. Hơn cả một bữa ăn, đây là trải nghiệm 4.8 sao ấm áp, chuẩn vị Thái và rất riêng của chúng tôi dành cho bạn.' AS story 
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
    SELECT id AS restaurant_id, N'Tìm một góc nhỏ ấm cúng giữa Quận 7 để xoa dịu tâm hồn? Tiệm Fulleaf là điểm hẹn lý tưởng! Chúng tôi tự hào mang đến những món đặc sản mang phong cách riêng, được gửi gắm trọn vẹn tâm tình để bạn khám phá những hương vị độc đáo, khó quên. Hãy ghé Tiệm Fulleaf để cảm nhận sự ấm áp và khởi đầu một hành trình ẩm thực đầy cảm hứng!' AS story 
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
    SELECT id AS restaurant_id, N'Giữa nhịp sống Lotte Mart Quận 7, Gangnam Tanghulu là điểm dừng chân lý tưởng để bạn khám phá những hương vị Á Châu độc đáo, được chế biến với tâm huyết riêng. Từng viên kẹo hồ lô giòn tan ngọt lịm hay các đặc sản khác tại đây đều là hành trình vị giác đầy mê hoặc, mang đến trải nghiệm khó quên. Với đánh giá 4.7/5 sao, chúng tôi mời bạn đến thưởng thức và cảm nhận sự khác biệt trong từng món ăn chuẩn vị, ấm cúng và đầy cảm hứng.' AS story 
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
    SELECT id AS restaurant_id, N'Pave Glace Chocolate Quận 7 không chỉ là điểm đến của những tín đồ yêu ngọt, mà còn là nơi mỗi hương vị kể một câu chuyện. Chúng tôi tỉ mỉ tạo nên những đặc sản chocolate và dessert độc đáo, mang đậm phong cách riêng, gói trọn tinh hoa và cái tâm người làm. Từng chiếc bánh, viên kẹo là lời mời gọi ngọt ngào để bạn tự thưởng hoặc trao gửi những món quà ý nghĩa nhất.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Tacos Nhà Labubu 149, mỗi chiếc taco là một tác phẩm nghệ thuật vị giác, mang đậm dấu ấn riêng biệt mà bạn sẽ khó tìm thấy ở bất cứ đâu. Chúng tôi đặt trọn tâm huyết vào từng nguyên liệu, từng công đoạn, để mang đến những "đặc sản" fastfood không chỉ ngon mà còn đầy cảm hứng. Hãy ghé 149 Phạm Hữu Lầu để tự mình khám phá hương vị độc đáo và cảm nhận sự ấm áp, gần gũi như chính ngôi nhà của mình nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Tacos Nhà LuXaBu, 335 Nguyễn Hữu Thọ, Quận 7, chúng tôi tự hào mang đến những chiếc taco fastfood bình dân nhưng ẩn chứa hương vị "độc quyền" khó quên. Mỗi chiếc bánh là câu chuyện của sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết riêng, gói trọn tâm huyết người làm. Đến với "Nhà LuXaBu", bạn không chỉ thưởng thức món ăn mà còn cảm nhận sự ấm áp, khác biệt làm nên 4.2 sao của chúng tôi. Ghé ngay để trải nghiệm nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Xin Chào mời bạn khám phá thế giới hương vị đặc trưng, nơi mỗi chiếc taco là một tác phẩm ẩm thực độc đáo, gói trọn tâm huyết và công thức bí truyền của quán. Tại 333 Nguyễn Hữu Thọ, chúng tôi chào đón bạn bằng sự nồng hậu và những món ăn chuẩn 4.8 sao, biến fastfood bình dân thành trải nghiệm khó quên. Ghé ngay để cảm nhận sự tươi ngon, bùng nổ và sự ấm áp trong từng cuốn bánh!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Bánh Mì Pate Hải Phòng Quận 7 – nơi tinh hoa ẩm thực đất Cảng được gửi gắm trọn vẹn trong từng món ăn. Với phần pate độc quyền, béo ngậy, thơm lừng cùng bí quyết riêng, mỗi chiếc bánh mì hay đặc sản khác tại 141 Đường Số 1 đều là một trải nghiệm vị giác khó quên. Hãy ghé để cảm nhận hương vị thân quen mà độc đáo, được chúng tôi chuẩn bị bằng cả tấm lòng và sự tỉ mỉ.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với A Duy Food Quận 7, nơi hương vị Việt truyền thống được nâng tầm bằng cái tâm và bí quyết riêng của gia đình. Từng miếng gà quay, sườn quay vàng óng hay hạt cơm lam dẻo thơm đều gói trọn tinh hoa, mang đến bữa ăn ấm cúng như nhà làm. Đây chính là điểm đến lý tưởng cho những bữa ăn sum vầy, mang đậm bản sắc ẩm thực riêng của A Duy Food. Hãy ghé 163 Nguyễn Thị Thập để thưởng thức và cảm nhận sự khác biệt đã làm nên thương hiệu được yêu mến.' AS story 
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
    SELECT id AS restaurant_id, N'Đến Ola Tacos Quận 7, bạn sẽ được thưởng thức những chiếc taco mang hương vị rất riêng, là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và bí quyết chế biến đầy tâm huyết. Chúng tôi tin rằng mỗi món ăn không chỉ làm no bụng mà còn phải chạm đến vị giác, để lại ấn tượng khó quên. Ghé 50 Đường Số 10 để trải nghiệm sự tận tâm và khám phá phong cách ẩm thực độc đáo của chúng tôi ngay hôm nay!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với LaSiMi Quận 7 – Trà Ngon Đậm Vị, một góc nhỏ bình yên tại 147c Đường Số 17. Nơi đây, bạn sẽ được thưởng thức những ly trà chuẩn vị, đậm đà cùng các món ăn đặc sản được chế biến theo phong cách riêng đầy sáng tạo. Mỗi hương vị đều được gửi gắm cái tâm của đội ngũ, hứa hẹn mang lại trải nghiệm ấm cúng, khó quên. Ghé LaSiMi để cảm nhận sự khác biệt và nạp năng lượng cho ngày mới!' AS story 
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
    SELECT id AS restaurant_id, N'Sâm Chill Me Lý Phục Man mời bạn ghé thăm góc nhỏ bình yên giữa lòng Quận 7, nơi hương vị đặc sản được thổi hồn theo phong cách riêng đầy sáng tạo. Mỗi món ăn, thức uống tại đây đều là một câu chuyện ấm áp, khơi gợi ký ức và đánh thức vị giác của bạn. Hãy đến để tìm một không gian thư thái, thưởng thức những bữa ăn ngon lành mang đậm dấu ấn riêng không thể lẫn vào đâu được.' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm dừng chân lý tưởng cho những tâm hồn yêu ẩm thực Hàn Quốc bình dân. Tại đây, bạn sẽ khám phá những món đặc sản được chế biến theo phong cách Sasin độc đáo, nơi vị cay nồng ấm lòng hòa quyện cùng hương vị riêng biệt khó cưỡng. Từng tô mì, từng món ăn đều là thành quả của sự tận tâm, mang đến trải nghiệm vị giác bùng nổ và cảm giác ấm áp như ở nhà. Hãy ghé 69 Đường số 1 để tự mình trải nghiệm bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Phan Rang Quán Quận 7, chúng tôi chắt chiu tinh hoa ẩm thực Phan Rang, mang hương vị biển cả và nắng gió đặc trưng về giữa lòng Sài Gòn. Mỗi món đặc sản tại 399 Lê Văn Lương là một câu chuyện về sự tận tâm, được chế biến theo phong cách riêng, vừa quen vừa lạ. Hãy đến để thưởng thức vị ngon khó quên, nơi mỗi đĩa ăn đều là lời mời gọi ấm áp như bữa cơm nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối - Quận 7, chúng tôi mang đến hương vị hải sản bình dị nhưng đầy cuốn hút. Nổi bật là các món ốc tươi rói đượm sốt trứng muối béo ngậy, sánh mịn theo công thức gia truyền, đánh thức mọi giác quan. Mỗi món ăn là tâm huyết, là niềm vui được sẻ chia, mời bạn ghé 109 Đường Số 79 để cùng khám phá và tận hưởng!' AS story 
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
    SELECT id AS restaurant_id, N'Đến Link Ốc Quận 7 - Đường Số 10, bạn sẽ khám phá thế giới hải sản tươi ngon được biến tấu đầy sáng tạo, mang đậm phong cách riêng của quán. Mỗi món ăn là sự kết hợp tinh tế của nguyên liệu tuyển chọn và tâm huyết người đầu bếp, tạo nên hương vị đặc trưng khó quên. Trong không gian ấm cúng, rộn rã tiếng cười, đây là điểm hẹn lý tưởng để bạn cùng bạn bè thưởng thức những bữa nhậu chất lừ. Mời bạn ghé 1 Đường Số 10 để cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Khám phá Bún Riêu Tóp Mỡ Đặc Biệt Quận 7, nơi mỗi tô bún là sự kết tinh của hương vị truyền thống và cái tâm của người nấu. Nước lèo riêu cua đồng chuẩn vị, thanh ngọt, quyện cùng tóp mỡ vàng giòn rụm béo ngậy, tạo nên nét đặc trưng khó quên. Dù bình dân, không gian ấm cúng tại 269 Phạm Hữu Lầu luôn chào đón bạn ghé đến để thưởng thức tinh hoa ẩm thực đã làm hài lòng bao thực khách.' AS story 
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
    SELECT id AS restaurant_id, N'Lẩu Cá Đuối 79k mời gọi bạn khám phá hương vị biển cả tươi rói, thấm đẫm trong từng miếng cá đuối ngọt thanh cùng nước lẩu chua cay đậm đà, chuẩn phong cách riêng của quán. Mỗi món đặc sản Việt tại đây đều được chế biến bằng cả tấm lòng, mang đến trải nghiệm nhậu hấp dẫn và trọn vẹn. Hãy ghé 621 Nguyễn Thị Thập, Quận 7 để tận hưởng không gian ấm cúng và những khoảnh khắc sum vầy thật đáng nhớ cùng người thân, bạn bè.' AS story 
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
    SELECT id AS restaurant_id, N'Bước vào Trà Sữa MayCha - Yola, Quận 7, bạn sẽ tìm thấy một không gian ấm cúng, thân quen giữa phố thị. Nơi đây mời gọi thực khách với những ly trà sữa MayCha thơm lừng, cùng các món ăn đặc sản mang phong vị riêng độc đáo, được chế biến bằng tất cả tâm huyết. Mỗi hương vị đều là câu chuyện, mang đến trải nghiệm khó quên và cảm giác được chào đón như về nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Trạm Mì Ý Dì Hiền Quận 7 là điểm hẹn lý tưởng cho những tín đồ ẩm thực Ý bình dân, nơi mỗi món ăn đều được "biến hóa" theo phong cách rất riêng của Dì Hiền. Từ những sợi mì dai ngon đến sốt kem béo ngậy, tất cả đều thấm đượm hương vị đặc trưng khó quên. Dì Hiền đã gửi gắm cả tâm huyết vào từng suất ăn, mang đến trải nghiệm ấm áp như bữa cơm nhà. Hãy đến 6 Đường 15 và cảm nhận sự khác biệt bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'ICHI QUÁN mang trọn tinh hoa ẩm thực Hà Nội đến giữa lòng Sài Gòn, đặc biệt với Bún Chả và Nem Cua Bể chuẩn vị truyền thống. Mỗi món ăn là kết tinh của nguyên liệu tươi ngon và bí quyết gia truyền, được nêm nếm bằng cả tấm lòng, tạo nên hương vị đặc trưng rất riêng. Ghé thăm ICHI QUÁN tại Quận 7, bạn sẽ tìm thấy một không gian ấm cúng để thưởng thức những đặc sản đậm đà, gợi nhớ về chút hồn quê Bắc Bộ trong từng miếng ăn.' AS story 
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
    SELECT id AS restaurant_id, N'Đến với Tacos Labubu Quận 7 - Đường Số 17, bạn sẽ tìm thấy những chiếc taco fastfood mang phong cách riêng có một không hai. Mỗi hương vị là sự kết hợp tinh tế của nguyên liệu tươi ngon và cái tâm của người đầu bếp, tạo nên trải nghiệm ẩm thực bùng nổ mà vẫn gần gũi. Ghé ngay để tự mình cảm nhận sự khác biệt và tận hưởng bữa ăn ấm cúng, đậm đà chỉ có tại Labubu!' AS story 
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
    SELECT id AS restaurant_id, N'Ghé Chicken 3S để cảm nhận hương vị Hàn Quốc đích thực gói trọn trong từng miếng gà rán giòn tan hay tô mỳ cay xì xụp. Tại 475A Nguyễn Thị Thập, chúng tôi không chỉ phục vụ món ăn mà còn là nơi gắn kết gia đình, bạn bè qua những hương vị đặc trưng, đầy tâm huyết. Mỗi bữa ăn là một câu chuyện ấm áp, mời gọi bạn đến thưởng thức và cảm nhận sự khác biệt.' AS story 
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
    SELECT id AS restaurant_id, N'Tứ Quý Trà - Carameo Machiato Quận 7 mời gọi bạn ghé thăm một không gian bình yên giữa lòng Quận 7 nhộn nhịp. Tại đây, bạn sẽ được thưởng thức Carameo Machiato ngọt ngào cùng những món đặc sản độc đáo, mang đậm dấu ấn riêng của quán. Mỗi hương vị đều được ủ ấp từ cái tâm người nấu, hứa hẹn mang đến một trải nghiệm ẩm thực ấm áp và khó quên.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến với Chiang Thai Delivery Quận 7, nơi mỗi món ăn là một tấm vé đưa bạn phiêu lưu đến xứ sở Chùa Vàng. Với hương vị Thái chuẩn mực được biến tấu đầy sáng tạo, chúng tôi tự hào mang đến những trải nghiệm ẩm thực độc đáo khó quên. Mỗi nguyên liệu tươi ngon đều được chọn lựa tỉ mỉ, gửi gắm trọn vẹn tâm huyết của người đầu bếp để tạo nên những món đặc sản riêng biệt, đậm đà khó cưỡng. Hãy để Chiang Thai Delivery đánh thức mọi giác quan và làm ấm lòng bạn ngay hôm nay!' AS story 
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
    SELECT id AS restaurant_id, N'Tiệm Fulleaf Quận 7 mời bạn ghé thăm một góc nhỏ bình yên, nơi mỗi món ăn đặc sản đều được ấp ủ bằng cả tấm lòng. Từ ly cà phê đậm đà đến hương vị riêng biệt của thực đơn độc đáo, chúng tôi tin rằng trải nghiệm ẩm thực tại đây sẽ đánh thức mọi giác quan. Hãy để Fulleaf kể bạn nghe câu chuyện của vị giác và sự ấm áp.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Gangnam Tanghulu, chúng tôi mời bạn khám phá thế giới ẩm thực Á Châu mang đậm phong cách riêng, ngay tại Lotte Mart Quận 7. Mỗi món đặc sản đều được chế biến bằng cả tâm huyết, từ vị mặn đậm đà đến những xiên Tanghulu giòn rụm ngọt ngào, hứa hẹn mang đến trải nghiệm vị giác khó quên. Ghé thăm để tận hưởng những hương vị độc đáo, bình dị mà đầy cuốn hút!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Pave Glace Chocolate Quận 7, mỗi món tráng miệng không chỉ là hương vị mà còn là cả một câu chuyện ngọt ngào từ tâm huyết. Chúng tôi tự hào mang đến những đặc sản độc đáo, được chế biến tỉ mỉ với phong cách riêng biệt, đánh thức mọi giác quan. Ghé thăm để đắm chìm trong thế giới dessert đầy mê hoặc và chọn cho mình, hoặc người thân, món quà ý nghĩa nhất!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi mỗi chiếc taco là một khám phá vị giác đầy bất ngờ! Dù là fast food bình dân, chúng tôi tự hào mang đến những hương vị đặc trưng, được chế biến bằng tất cả cái tâm và sự sáng tạo riêng biệt. Ghé 149 Phạm Hữu Lầu, Quận 7 để trải nghiệm những món đặc sản "có một không hai" và cảm nhận sự ấm áp, gần gũi như ở nhà nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Tacos Nhà LuXaBu 335 Nguyễn Hữu Thọ! Tại đây, mỗi chiếc taco không chỉ là fastfood mà là cả tâm huyết, biến tấu thành "đặc sản" riêng của nhà. Hương vị độc đáo, quen mà lạ, đủ sức khơi gợi mọi giác quan ngay lần thử đầu tiên. Ghé LuXaBu để trải nghiệm sự ấm áp và ngon miệng khó quên!' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Xin Chào mời bạn đến khám phá thế giới hương vị taco đặc sắc, nơi mỗi món ăn là sự kết hợp tinh tế của truyền thống và sáng tạo. Với cái tâm của người đầu bếp, chúng tôi mang đến những trải nghiệm ẩm thực nhanh gọn mà vẫn đậm đà, khó quên. Tại Tacos Xin Chào, bạn sẽ luôn được chào đón bằng vị ngon 4.8 sao và sự ấm áp từ những món đặc sản riêng biệt.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến hương vị Hải Phòng trứ danh giữa lòng Sài Gòn. Mỗi ổ bánh mì pate, mỗi món đặc sản đều được chế biến với tâm huyết, giữ trọn nét truyền thống và pha chút biến tấu riêng đầy tinh tế. Ghé 141 Đường Số 1, bạn sẽ tìm thấy sự ấm áp trong từng món ăn bình dị, ngon miệng và chân thành.' AS story 
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
    SELECT id AS restaurant_id, N'A Duy Food Quận 7 hân hạnh mang đến những bữa ăn đậm đà hương vị Việt, nơi gà quay giòn tan và sườn quay thơm lừng được chế biến bằng bí quyết gia truyền cùng tất cả tâm huyết. Cơm lam dẻo ngọt quyện trong từng miếng thịt sẽ đánh thức ký ức về những bữa cơm gia đình ấm cúng. Trải nghiệm hương vị chuẩn nhà làm đã làm nên đánh giá 4.7 sao tuyệt vời, chỉ có tại 163 Nguyễn Thị Thập.' AS story 
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
    SELECT id AS restaurant_id, N'Tìm kiếm một bữa ăn nhanh gọn nhưng đầy bất ngờ về hương vị tại Quận 7? Ola Tacos Quận 7 chính là điểm dừng chân lý tưởng của bạn tại 50 Đường Số 10. Tại đây, chúng tôi tự hào mang đến những món đặc sản Tacos được biến tấu theo phong cách riêng, mỗi miếng đều đong đầy tâm huyết và sự sáng tạo. Hãy đến và cảm nhận sự khác biệt trong từng hương vị, nơi ẩm thực bình dân được nâng tầm để mọi khoảnh khắc ăn uống đều là một trải nghiệm đáng nhớ.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến LaSiMi Quận 7, nơi mỗi tách trà đậm vị và món đặc sản phong cách riêng đều ẩn chứa sự tận tâm. Tại không gian bình dị, ấm cúng của chúng tôi, bạn sẽ tìm thấy những hương vị độc đáo, được hàng ngàn thực khách tin yêu và đánh giá 4.9/5 sao. Hãy ghé thăm LaSiMi để tận hưởng những phút giây thư thái và ngon miệng trọn vẹn!' AS story 
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
    SELECT id AS restaurant_id, N'Giữa nhịp sống Quận 7 hối hả, Sâm Chill Me tại 89 Lý Phục Man là chốn dừng chân lý tưởng để bạn tìm lại sự an yên. Chúng tôi tự hào mang đến những món đặc sản độc đáo, được chế biến bằng tất cả tâm huyết và nguyên liệu tươi ngon nhất. Mỗi hương vị tại Sâm Chill Me là một câu chuyện riêng biệt, mời bạn đến thưởng thức và cảm nhận sự thư thái lan tỏa. Hãy ghé thăm để "chill" và nạp năng lượng cùng chúng tôi!' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Bạn đã sẵn sàng cho một cuộc phiêu lưu vị giác chưa? Mì Cay Sasin - Tân Phong Quận 7 chào đón bạn đến với thế giới ẩm thực Hàn Quốc bình dân nhưng đầy tinh hoa, nơi mỗi món ăn là một câu chuyện hương vị độc đáo. Từ bát mì cay nồng hít hà đến những món đặc sản trứ danh, tất cả đều được chúng tôi gửi gắm sự tận tâm, hứa hẹn một bữa ăn ấm áp và khó quên.' AS story 
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
    SELECT id AS restaurant_id, N'Phan Rang Quán Quận 7 tự hào mang đến những món đặc sản đậm đà hương vị quê hương, được chế biến bằng cả tấm lòng và phong cách riêng biệt. Mỗi món ăn là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết truyền thống, khơi gợi ký ức đẹp về ẩm thực Phan Rang. Đến với không gian bình dị, ấm cúng của chúng tôi, bạn sẽ được thưởng thức bữa ăn ngon như nhà làm, tràn đầy sự chân thành và gần gũi. Hãy để Phan Rang Quán Quận 7 đánh thức vị giác của bạn.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 17 Quận 7, chúng tôi mời bạn ghé thăm một không gian bình dị, ấm cúng nhưng đầy ắp hương vị biển cả tươi ngon. Từng con ốc được chọn lọc kỹ càng, biến tấu khéo léo, đặc biệt là món ốc trứng muối trứ danh với sốt sánh mịn, béo ngậy đậm đà, khó cưỡng. Đó là sự kết hợp hoàn hảo giữa hải sản tươi rói và công thức riêng biệt, tạo nên những trải nghiệm ẩm thực độc đáo, chỉ có tại quán.' AS story 
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
    SELECT id AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 mời bạn khám phá thế giới ốc Sài Gòn với phong vị độc đáo có một không hai. Từng món đặc sản tại đây là sự kết tinh của nguyên liệu tươi ngon và bí quyết riêng, mang đến trải nghiệm vị giác bùng nổ, khiến bạn phải xuýt xoa. Hãy ghé Link Ốc để tận hưởng không gian ấm cúng, tiếng cười rộn rã và những khoảnh khắc sum vầy bên bàn tiệc đậm đà hương vị biển cả.' AS story 
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
    SELECT id AS restaurant_id, N'Tọa lạc trên con đường Phạm Hữu Lầu, Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 đã trở thành điểm đến quen thuộc của thực khách gần xa. Nồi nước lèo riêu cua chuẩn vị, thơm lừng quyện cùng những miếng tóp mỡ giòn rụm độc đáo tạo nên hương vị bún riêu khó cưỡng, không lẫn vào đâu được. Từng tô bún đều được chế biến bằng cả cái tâm, mang đến trải nghiệm ẩm thực ấm áp, đậm đà hương vị truyền thống mà bạn nhất định phải thử.' AS story 
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
    SELECT id AS restaurant_id, N'Ghé Lẩu Cá Đuối 79k để khám phá hương vị lẩu cá đuối chua cay, đậm đà làm say lòng người. Mỗi món ăn tại đây đều là một đặc sản được chế biến với tâm huyết, mang đến trải nghiệm nhậu chuẩn vị Việt. Không gian ấm cúng, thoáng đãng tại Quận 7 sẽ là nơi lý tưởng để bạn bè, gia đình sum vầy và tận hưởng những khoảnh khắc tuyệt vời bên nhau.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, không chỉ có những ly trà sữa thơm ngon mà còn là cả một thế giới ẩm thực đặc sắc đang chờ bạn khám phá. Chúng tôi tự hào mang đến các món ăn đặc sản đậm phong cách riêng, được chế biến tỉ mỉ với tất cả tâm huyết. Hãy ghé thăm không gian ấm áp của chúng tôi để thưởng thức hương vị tuyệt vời và cảm nhận sự khác biệt mà MayCha mang lại!' AS story 
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
    SELECT id AS restaurant_id, N'Ghé Trạm Mì Ý Dì Hiền Quận 7 để khám phá không gian bình dị, ấm cúng và những đĩa mì Ý đậm đà phong cách rất riêng của Dì. Mỗi món ăn là tâm huyết được gửi gắm tỉ mẩn, từ sợi mì dai ngon đến sốt sánh mịn, mang đến hương vị đặc sắc khó quên. Dù bình dân, quán vẫn giữ trọn vẹn chất lượng đỉnh cao, chờ bạn ghé 6 Đường 15 trải nghiệm sự khác biệt.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN, chúng tôi tự hào mang đến hương vị chuẩn mực của tinh hoa ẩm thực Bắc Bộ giữa lòng Sài Gòn. Mỗi món ăn không chỉ là công thức mà còn là cái tâm, là sự tỉ mỉ trong từng nguyên liệu và cách chế biến riêng biệt, làm nên nét đặc trưng không thể trộn lẫn. Dù là bữa trưa vội vã hay khoảnh khắc quây quần, ICHI QUÁN ở Quận 7 luôn sẵn sàng chào đón bạn bằng không gian ấm cúng và những món ăn đậm đà, khó quên. Hãy đến và cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Đến Tacos Labubu Đường Số 17, bạn sẽ khám phá những chiếc taco mang phong cách riêng đầy bất ngờ, gói trọn hương vị độc đáo không thể tìm thấy ở nơi khác. Mỗi miếng cắn là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết đặc trưng, được tạo nên từ tâm huyết của người đầu bếp. Một điểm hẹn ẩm thực bình dân nhưng lại chứa đựng cả thế giới hương vị đang chờ bạn khám phá.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chicken 3S, mỗi món ăn là một câu chuyện tình yêu với ẩm thực Hàn Quốc. Từ miếng gà rán giòn tan đẫm sốt độc quyền, đến tô mỳ cay chuẩn vị làm ấm lòng, chúng tôi luôn đặt trọn tâm huyết để mang đến trải nghiệm vị giác khó quên. Hãy cùng gia đình và bạn bè tận hưởng không gian ấm cúng, thưởng thức những hương vị đặc sắc chỉ có tại 475A Nguyễn Thị Thập, Quận 7!' AS story 
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
    SELECT id AS restaurant_id, N'Tại 79A Đường 79, Quận 7, Tứ Quý Trà mở ra một không gian ấm cúng, nơi bạn tìm thấy sự bình yên giữa phố thị. Nổi tiếng với Carameo Machiato ngọt ngào và những món đặc sản mang phong vị riêng độc đáo, mỗi hương vị tại đây đều được ấp ủ bằng tâm huyết của người đầu bếp. Hãy đến để cảm nhận trọn vẹn sự tinh tế trong từng món ăn và thức uống, tạo nên những khoảnh khắc đáng nhớ.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chiang Thai Delivery - Quận 7, chúng tôi tin rằng ẩm thực là câu chuyện của đam mê và hương vị. Mỗi món đặc sản Thái được chế biến tỉ mỉ bằng công thức riêng, gói trọn vị chua cay mặn ngọt hài hòa, khó quên. Với đánh giá 4.8/5 sao từ thực khách, hãy để Chiang Thai mang tinh hoa xứ sở Chùa Vàng đến tận cửa nhà bạn, thắp lên niềm vui trong từng bữa ăn.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tiệm Fulleaf - chốn bình yên giữa Quận 7! Nơi đây không chỉ là một quán cà phê thân thiện mà còn là điểm hẹn của những hương vị độc đáo. Mỗi món đặc sản tại Fulleaf được chế biến với tất cả tâm huyết, mang đậm phong cách riêng, hứa hẹn đánh thức mọi giác quan của bạn. Hãy đến để thưởng thức và cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Gangnam Tanghulu - Lotte Mart Quận 7, nơi hương vị Á Châu bình dị gặp gỡ sự sáng tạo độc đáo. Chúng tôi tự hào mang đến thực đơn các món đặc sản theo phong cách riêng, mỗi suất ăn là một câu chuyện về nguyên liệu tươi ngon và bí quyết được gửi gắm trọn vẹn. Hãy ghé thăm để tận hưởng không gian ấm cúng và những trải nghiệm ẩm thực khó quên, chắc chắn sẽ khiến bạn muốn quay lại.' AS story 
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
    SELECT id AS restaurant_id, N'Pave Glace Chocolate Quận 7 là chốn dừng chân ngọt ngào, nơi mỗi món tráng miệng kể câu chuyện của đam mê. Từng thanh chocolate, từng chiếc bánh đặc sản độc đáo đều được làm thủ công với cả tâm huyết, mang đến hương vị không lẫn vào đâu được. Ghé số 98 Đường 65 để đắm mình trong vị ngọt tinh tế và tìm những món quà ý nghĩa nhất.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi những chiếc taco không chỉ là món ăn mà còn là cả một "phòng thí nghiệm" hương vị đầy sáng tạo. Tại đây, mỗi chiếc bánh là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết độc đáo, mang đậm phong cách Labubu không lẫn vào đâu được. Dù bạn là tín đồ fastfood hay mê mẩn ẩm thực đường phố, hãy ghé 149 Phạm Hữu Lầu để tự mình khám phá món ngon và cảm nhận sự ấm áp, thân quen như ở nhà nhé.' AS story 
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
    SELECT id AS restaurant_id, N'Dừng chân tại 335 Nguyễn Hữu Thọ, Tacos Nhà LuXaBu mời bạn khám phá thế giới Tacos "độc quyền" đậm chất riêng, nơi mỗi chiếc bánh là một câu chuyện hương vị. Với bí quyết gia truyền và nguyên liệu tươi ngon, chúng tôi gói trọn cái tâm vào từng nhân bánh đầy đặn, vỏ giòn tan cùng nước sốt bí truyền khó cưỡng. Dù là fastfood bình dân, chúng tôi tin rằng trải nghiệm ẩm thực phải thật đặc biệt và đáng nhớ. Ghé LuXaBu ngay để cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Chào bạn đến với Tacos Xin Chào! Nơi những chiếc taco không chỉ là món ăn nhanh, mà là một hành trình vị giác đầy bất ngờ với phong cách riêng biệt. Mỗi miếng nhân đậm đà, vỏ bánh giòn tan đều gói trọn tâm huyết, mang đến hương vị khó quên mà bạn sẽ muốn quay lại mãi. Ghé 333 Nguyễn Hữu Thọ, Quận 7 để tự mình khám phá tinh hoa ẩm thực đường phố!' AS story 
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
    SELECT id AS restaurant_id, N'Ngay tại Quận 7, Bánh Mì Pate Hải Phòng - 141 Đường Số 1 tự hào mang đến hành trình vị giác đậm đà hương vị miền biển. Mỗi chiếc bánh mì giòn rụm hay những món đặc sản tại đây đều được chế biến bằng cả tấm lòng, gìn giữ nét tinh hoa ẩm thực Hải Phòng. Ghé thăm để cảm nhận sự ấm cúng và thưởng thức những món ăn đặc sắc, chất lượng chuẩn nhà làm trong không gian thân quen.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến A Duy Food Quận 7, nơi hương vị truyền thống Việt Nam hòa quyện trong không gian ấm cúng. Tại đây, gà quay giòn rụm, sườn quay đậm đà và cơm lam dẻo thơm mang phong vị độc đáo được chế biến từ tâm huyết của những người đầu bếp. Hãy ghé A Duy để trải nghiệm bữa cơm gia đình tròn vị, ấm áp như mẹ nấu.' AS story 
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
    SELECT id AS restaurant_id, N'Chào bạn ghé Ola Tacos Quận 7! Chúng tôi tự hào mang đến những hương vị đặc trưng có 1-0-2, nơi mỗi chiếc bánh đều là sự kết tinh của công thức riêng và cái tâm người đầu bếp. Dù là bữa ăn nhanh, bạn sẽ luôn tìm thấy sự ấm áp, chuẩn vị và đầy bất ngờ trong từng món. Ghé 50 Đường Số 10 để tự mình khám phá nét ẩm thực riêng có này nhé!' AS story 
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
    SELECT id AS restaurant_id, N'LaSiMi Quận 7 tại Đường Số 17 là điểm dừng chân lý tưởng để thưởng thức trà ngon đậm vị và khám phá những món đặc sản độc đáo. Mỗi hương vị tại đây đều được chế biến bằng tất cả sự tận tâm, mang đến trải nghiệm ẩm thực vừa quen thuộc vừa đầy bất ngờ. Đến với LaSiMi, bạn không chỉ ăn ngon mà còn cảm nhận được sự ấm áp, thân tình như trở về nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Sâm Chill Me Lý Phục Man mời bạn ghé thăm một không gian bình dị nhưng tràn đầy hương vị độc đáo tại Quận 7. Mỗi món ăn đặc sản tại đây đều được chế biến bằng cả tâm huyết, mang đến sự kết hợp tinh tế giữa truyền thống và phong cách riêng đầy sáng tạo. Hãy để Sâm Chill Me đưa bạn vào hành trình khám phá ẩm thực thư thái, nơi mọi giác quan được đánh thức và bạn tìm thấy một góc "chill" thật sự.' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 mở cửa đón bạn vào thế giới ẩm thực Hàn Quốc bình dân đầy lôi cuốn. Từng tô mì cay bùng vị, đậm đà theo phong cách Sasin độc đáo, được chế biến bằng cả tâm huyết, chắc chắn sẽ khiến mọi giác quan của bạn thức tỉnh. Đến Sasin, không chỉ là ăn mà còn là trải nghiệm không gian ấm cúng và hương vị đặc trưng chỉ tìm thấy ở đây.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Phan Rang Quán Quận 7! Tại 399 Lê Văn Lương, chúng tôi gói trọn tinh hoa ẩm thực Việt bình dân trong từng món đặc sản đậm đà hương vị độc đáo. Mỗi món ăn là một câu chuyện được kể bằng cả tấm lòng, qua bàn tay tài hoa cùng bí quyết riêng, mang đến trải nghiệm ấm cúng như nhà. Ghé thăm để cảm nhận sự khác biệt đã làm nên đánh giá 4.7/5 sao của chúng tôi!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối Quận 7, chúng tôi mang đến trải nghiệm ẩm thực bình dân độc đáo, nơi hương vị biển cả tươi rói hòa quyện hoàn hảo cùng sốt trứng muối béo ngậy, đậm đà khó cưỡng. Mỗi món ốc đặc sản đều được chế biến bằng cả tâm huyết, biến tấu theo công thức riêng, hứa hẹn đánh thức mọi giác quan của bạn. Hãy ghé ngay để tận hưởng không khí ấm cúng và những bữa ăn ngon miệng, đậm chất Sài Gòn bình dị!' AS story 
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
    SELECT id AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 là nơi hội tụ tinh hoa hải sản tươi ngon với phong cách chế biến độc đáo, không lẫn vào đâu được. Mỗi món ăn là sự kết hợp hoàn hảo của gia vị bí truyền và tâm huyết người đầu bếp, khơi gợi mọi giác quan. Ghé Link Ốc để cùng bạn bè lai rai, tận hưởng không gian thoáng đãng và chìm đắm trong hương vị đặc sắc, khó quên.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến với Bún Riêu Tóp Mỡ Đặc Biệt Quận 7, nơi hương vị truyền thống được nâng tầm. Thưởng thức tô bún riêu cua đỏ au, nước lèo đậm đà quyện cùng tóp mỡ giòn tan béo ngậy – tạo nên bản giao hưởng ẩm thực độc đáo. Mỗi muỗng là một trải nghiệm từ cái tâm người nấu, mang đến sự ấm lòng khó tả. Ghé 269 Phạm Hữu Lầu để khám phá ngay món ngon "đặc biệt" này!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Lẩu Cá Đuối 79k - Lotte Quận 7, nơi hương vị biển cả hội tụ trong nồi lẩu cá đuối chua cay đậm đà, chuẩn vị đặc trưng của riêng chúng tôi. Mỗi món nhậu tại đây đều là sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết độc đáo, làm nên phong cách ẩm thực Việt khó quên. Với không gian ấm cúng và sự tận tâm trong từng món ăn, chúng tôi mong muốn mang đến những bữa ăn thật trọn vẹn và niềm vui sum họp. Mời bạn ghé 621 Nguyễn Thị Thập để cùng trải nghiệm!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, Quận 7, mỗi món đặc sản là một câu chuyện hương vị được sáng tạo với tất cả tâm huyết và phong cách riêng biệt. Ghé thăm không gian ấm cúng, thân thiện để bạn tìm thấy giây phút thư giãn bên những món ăn ngon, khó quên. Hơn cả một quán ăn, chúng tôi mang đến trải nghiệm ẩm thực độc đáo, được hàng ngàn thực khách yêu mến và đánh giá cao.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trạm Mì Ý Dì Hiền Quận 7, mỗi đĩa mì không chỉ là món ăn mà còn là lời mời gọi ấm áp về một hương vị Ý bình dị nhưng đầy tinh tế. Dì Hiền tự tay chế biến từng món đặc sản theo phong cách riêng, mang đến những trải nghiệm ẩm thực gần gũi mà khó quên. Ghé 6 Đường 15 để thưởng thức bữa ăn ngon chuẩn vị nhà làm với đánh giá 4.6/5 sao!' AS story 
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
    SELECT id AS restaurant_id, N'ICHI QUÁN Quận 7 mời bạn khám phá Bún Chả Hà Nội và Nem Cua Bể trứ danh, nơi hương vị truyền thống được chúng tôi khoác lên chiếc áo mới, đầy phong cách và tinh tế. Mỗi món ăn là tâm huyết, là sự chắt lọc từ nguyên liệu tươi ngon nhất, mang đến cho bạn trải nghiệm ẩm thực đặc sắc không thể quên. Hãy ghé ICHI QUÁN để cảm nhận sự ấm áp và thưởng thức đặc sản Việt Nam chuẩn vị, đậm chất riêng!' AS story 
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
    SELECT id AS restaurant_id, N'Đừng bỏ lỡ Tacos Labubu Quận 7 - Đường Số 17, nơi mỗi chiếc taco là một hành trình vị giác đầy bất ngờ và lôi cuốn. Chúng tôi khéo léo kết hợp những nguyên liệu tươi ngon cùng công thức độc đáo, tạo nên hương vị đặc trưng làm say lòng thực khách. Ghé 145 Đường Số 17 để thưởng thức ''đặc sản'' mang đậm dấu ấn riêng của Labubu, và cảm nhận ngay sự khác biệt trong từng miếng cắn bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chicken 3S, chúng tôi tin rằng ẩm thực là nơi kết nối yêu thương. Hãy đến 475A Nguyễn Thị Thập để thưởng thức gà rán xốt Hàn bí truyền và mỳ cay độc đáo, mỗi món đều mang đậm dấu ấn riêng của quán. Từ công thức ủ vị đặc biệt đến không gian ấm cúng, chúng tôi tạo nên trải nghiệm ẩm thực khó quên, hoàn hảo cho những bữa ăn gia đình ấm áp và tràn ngập niềm vui.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tứ Quý Trà - Carameo Machiato Quận 7, nơi hương vị độc đáo và không gian ấm cúng hòa quyện. Thưởng thức Carameo Machiato thơm béo đặc trưng cùng những món đặc sản được chế biến tỉ mỉ, mang phong cách riêng của quán. Mỗi món ăn, thức uống đều chứa đựng trọn vẹn tâm huyết, mời bạn ghé 79A Đường 79 để cảm nhận sự gần gũi và ngon miệng như ở nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Chiang Thai Delivery Quận 7 là nơi tinh hoa ẩm thực Thái được biến tấu đầy sáng tạo, mang đến phong vị riêng không lẫn vào đâu được. Từ những nguyên liệu tươi ngon nhất, mỗi món ăn đều được chế biến bằng cả tâm huyết, chắt lọc bí quyết để hương vị bùng nổ và khó quên. Với 4.8 sao đánh giá, chúng tôi tự hào trao gửi những bữa ăn chuẩn vị, ấm lòng đến tận nhà bạn, biến mọi khoảnh khắc thưởng thức thành trải nghiệm đặc biệt.' AS story 
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
    SELECT id AS restaurant_id, N'Bước vào Tiệm Fulleaf - Quận 7, bạn sẽ tìm thấy một không gian bình dị, ấm cúng như chính ngôi nhà của mình. Nơi đây, hương cà phê thơm lừng hòa quyện cùng những món đặc sản được chế biến với tất cả tâm huyết, mang đậm phong cách riêng khó quên. Mỗi món ăn là một lời mời chân thành để bạn khám phá vị ngon độc đáo, để mỗi lần ghé là một kỷ niệm đáng nhớ.' AS story 
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
    SELECT id AS restaurant_id, N'Gangnam Tanghulu tại Lotte Mart Quận 7 là điểm hẹn của những tâm hồn yêu ẩm thực Á Châu, nơi bạn sẽ khám phá các món đặc sản mang phong vị rất riêng, khó quên. Mỗi đĩa ăn là sự hòa quyện tinh tế giữa nguyên liệu tươi ngon và công thức bí truyền, được chúng tôi chăm chút bằng tất cả niềm đam mê. Hãy ghé thăm để trải nghiệm một bữa ăn ấm cúng, chuẩn vị đã chinh phục trái tim của biết bao thực khách!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Pave Glace Chocolate Quận 7, nơi lan tỏa hương vị ngọt ngào và ấm áp. Chúng tôi tự hào giới thiệu những món tráng miệng đặc trưng, được chế biến bằng cả tâm huyết và công thức riêng biệt, mang đến trải nghiệm vị giác khó quên. Hãy ghé thăm để tận hưởng khoảnh khắc thư thái hoặc chọn những món quà ý nghĩa, làm cho mỗi ngày thêm ngọt.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tacos Nhà Labubu 149, nơi mỗi chiếc taco bình dị lại chứa đựng cả một câu chuyện hương vị riêng đầy mê hoặc. Chúng tôi tự hào mang đến những món đặc sản được chế biến với phong cách độc đáo, từ vỏ bánh giòn rụm đến nhân thịt đậm đà, tươi ngon. Hãy ghé 149 Phạm Hữu Lầu để khám phá và cảm nhận sự khác biệt đúng chất Labubu, nơi vị giác của bạn được nuông chiều một cách đặc biệt nhất.' AS story 
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
    SELECT id AS restaurant_id, N'Tại 335 Nguyễn Hữu Thọ, Quận 7, Tacos Nhà LuXaBu mời bạn ghé thăm để trải nghiệm thế giới taco đầy mê hoặc. Mỗi chiếc taco mang phong cách Nhà LuXaBu độc đáo là sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết riêng, gói trọn cái tâm của người làm bếp. Từng miếng cắn giòn tan, nhân đậm đà cùng nước sốt đặc trưng sẽ đánh thức mọi giác quan, mang đến trải nghiệm ẩm thực ấm áp và đáng nhớ.' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Xin Chào tại 333 Nguyễn Hữu Thọ, Quận 7, là điểm hẹn ẩm thực nơi hương vị độc đáo gặp gỡ sự nồng nhiệt. Mỗi chiếc taco không chỉ là món ăn fastfood bình dân, mà là một tác phẩm gói trọn niềm đam mê và công thức đặc biệt của chúng tôi. Từ nguyên liệu tươi ngon đến cách chế biến tinh tế, chúng tôi tự hào mang đến những đặc sản làm nên dấu ấn riêng, được khách hàng đánh giá 4.8 sao. Hãy ghé Tacos Xin Chào để thưởng thức sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến những hương vị đặc sản Việt gói trọn cả cái tâm người đầu bếp. Từ ổ bánh mì pate trứ danh đến các món ngon độc đáo theo phong cách riêng, mỗi suất ăn là một hành trình vị giác đậm đà, khó quên. Đến đây, bạn không chỉ thưởng thức món ngon bình dân mà còn cảm nhận sự ấm áp, thân thuộc như bữa cơm nhà. Hân hoan chào đón bạn ghé 141 Đường Số 1 để trải nghiệm!' AS story 
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
    SELECT id AS restaurant_id, N'A Duy Food Quận 7 - nơi tinh hoa ẩm thực Việt giao hòa cùng phong vị độc đáo. Mỗi đĩa Gà Quay, Sườn Quay hay Cơm Lam tại đây đều là sự kết tinh của nguyên liệu tươi ngon và công thức gia truyền, thấm đượm tâm huyết người đầu bếp. Hãy đến 163 Nguyễn Thị Thập để cảm nhận một bữa ăn trọn vẹn, ấm cúng và đầy xúc cảm bên gia đình thân yêu.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Ola Tacos Quận 7, nơi hương vị đường phố bùng nổ trong từng món đặc sản được chế biến theo phong cách độc đáo của riêng chúng tôi. Không cầu kỳ, chỉ đơn giản là những chiếc taco gói trọn tâm huyết, mang đến trải nghiệm ẩm thực nhanh gọn mà khó quên. Ghé 50 Đường Số 10 ngay để cảm nhận sự khác biệt và nạp năng lượng với những món ngon khó cưỡng!' AS story 
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
    SELECT id AS restaurant_id, N'Tại LaSiMi Quận 7 – Trà Ngon Đậm Vị, chúng tôi kiến tạo một không gian bình yên để bạn tạm quên đi phố thị, đắm mình vào từng ngụm trà đậm đà và thưởng thức món đặc sản mang phong cách riêng không lẫn vào đâu được. Mỗi món ăn, thức uống tại 147c đường số 17 đều là sự chắt lọc tinh hoa và tâm huyết, mang đến cho bạn trải nghiệm ẩm thực ấm áp, gần gũi như ở nhà. Hãy ghé LaSiMi để cảm nhận sự khác biệt trong từng câu chuyện hương vị.' AS story 
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
    SELECT id AS restaurant_id, N'Sâm Chill Me - Lý Phục Man chào đón bạn đến một góc nhỏ ấm cúng, nơi mỗi món đặc sản đều kể một câu chuyện hương vị riêng. Chúng tôi gửi gắm cả tâm huyết vào từng nguyên liệu, từng công thức độc đáo để mang đến trải nghiệm ẩm thực khó quên. Hãy đến và cảm nhận sự thư thái, cùng vị ngon đặc trưng chỉ có tại Sâm Chill Me!' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm đến lý tưởng cho những tín đồ ẩm thực yêu thích hương vị Hàn Quốc đậm đà. Tại đây, bạn sẽ khám phá những tô mì cay và món đặc sản được chế biến theo công thức độc đáo, mang phong cách riêng không lẫn vào đâu được của Sasin. Mỗi món ăn không chỉ ngon miệng mà còn chứa đựng tâm huyết của chúng tôi, hứa hẹn mang đến một trải nghiệm ấm cúng, khó quên!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Phan Rang Quán Quận 7 - nơi hương vị Việt truyền thống được nâng tầm bằng phong cách riêng độc đáo. Tại số 399 Lê Văn Lương, bạn sẽ tìm thấy không gian bình dị ấm cúng và những món đặc sản thấm đượm tâm huyết người nấu. Thưởng thức bữa ăn ngon chuẩn 4.7/5 sao, để mỗi miếng là một trải nghiệm khó quên!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 17 Quận 7, mỗi món ốc bình dân đều ẩn chứa cả tâm huyết và sự sáng tạo. Hương vị trứng muối độc quyền béo ngậy, đậm đà quyện cùng hải sản tươi ngon sẽ đánh thức mọi giác quan. Ghé ngay để khám phá thực đơn đặc sắc mang phong cách riêng và cảm nhận sự ấm cúng, gần gũi như nhà mình!' AS story 
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
    SELECT id AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 không chỉ là quán ốc, mà là điểm hẹn của những hương vị độc đáo, được chế biến với tất cả tâm huyết. Tại đây, mỗi món hải sản tươi ngon đều mang "phong cách riêng" không lẫn vào đâu được, khiến thực khách say mê từ miếng đầu tiên. Còn gì tuyệt hơn khi cùng bạn bè nhâm nhi ốc nóng hổi trong không gian ấm cúng, đậm chất Sài Gòn? Mời bạn ghé 1 Đường Số 10 để khám phá ngay!' AS story 
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
    SELECT id AS restaurant_id, N'Tìm một chút ấm áp giữa lòng Sài Gòn? Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 tại 269 Phạm Hữu Lầu chính là điểm đến bạn cần. Nước lèo bún riêu đậm đà, thanh ngọt được nấu từ công thức gia truyền, kết hợp cùng lớp tóp mỡ giòn rụm, béo ngậy tạo nên hương vị "đặc biệt" không thể lẫn vào đâu được. Mỗi tô bún là cả tâm huyết và sự tỉ mỉ, mang đến trải nghiệm ẩm thực bình dân nhưng đầy tinh tế. Hãy ghé ngay để cảm nhận sự khác biệt và hương vị khó quên này!' AS story 
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
    SELECT id AS restaurant_id, N'Lẩu Cá Đuối 79k - Lotte Quận 7 mời bạn tìm về hương vị đặc trưng của biển cả và những món nhậu truyền thống Việt Nam. Từng nồi lẩu cá đuối chua thanh, thịt cá tươi ngọt cùng các đặc sản độc đáo được chế biến từ tâm huyết sẽ đánh thức mọi giác quan. Đây là điểm hẹn lý tưởng tại 621 Nguyễn Thị Thập để sẻ chia những khoảnh khắc ấm cúng, tràn đầy niềm vui bên bàn ăn đậm đà bản sắc riêng của chúng tôi.' AS story 
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
    SELECT id AS restaurant_id, N'Trà Sữa MayCha - Yola là điểm dừng chân lý tưởng giữa lòng Quận 7, nơi bạn tìm thấy những góc nhỏ ấm cúng cho buổi hẹn hò hay phút giây thư giãn. Tại đây, chúng tôi tự hào mang đến thực đơn đặc sản độc đáo, mang phong cách riêng cùng những ly trà sữa thơm lừng, được chế biến bằng trọn vẹn tâm huyết. Từng hương vị đều được chăm chút tỉ mỉ, hứa hẹn một trải nghiệm ẩm thực khó quên và những khoảnh khắc ấm áp bên người thân yêu. Hãy ghé Trà Sữa MayCha - Yola để cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Tìm chút ấm áp giữa lòng Quận 7? Trạm Mì Ý Dì Hiền chào đón bạn với những đĩa mì Ý mang đậm dấu ấn riêng, được chế biến bằng cả tấm lòng. Giữa không gian bình dị nhưng tràn ngập mùi hương quyến rũ, mỗi sợi mì, mỗi loại sốt đều được Dì Hiền chăm chút tỉ mỉ. Hãy đến và tự mình cảm nhận sự đặc biệt trong từng hương vị, nơi ẩm thực Ý hòa quyện với nét bình dân gần gũi, tạo nên trải nghiệm 4.6 sao khó quên mà thực khách luôn tin yêu.' AS story 
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
    SELECT id AS restaurant_id, N'Giữa lòng Sài Gòn nhộn nhịp, ICHI QUÁN Quận 7 mở ra một không gian ẩm thực Việt bình dị mà ấm cúng. Tại đây, bạn sẽ khám phá hương vị Bún Chả Hà Nội trứ danh và Nem Cua Bể giòn tan, được chế biến với bí quyết riêng biệt, thấm đẫm tâm huyết của người đầu bếp. Mỗi món ăn là một câu chuyện, mang đậm dấu ấn riêng và khơi gợi ký ức đẹp. Mời bạn ghé thưởng thức để cảm nhận trọn vẹn sự tinh túy trong từng miếng ngon!' AS story 
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
    SELECT id AS restaurant_id, N'Đến Tacos Labubu Đường Số 17, bạn sẽ được thưởng thức những chiếc Tacos fastfood không chỉ nhanh gọn mà còn ngập tràn hương vị đặc trưng, có một không hai. Chúng tôi gửi gắm cả tâm huyết và sự sáng tạo vào từng nguyên liệu, từng lớp nhân đậm đà. Ghé Tacos Labubu để trải nghiệm một bữa ăn ngon miệng, đậm chất riêng và tràn đầy cảm hứng ẩm thực nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Chicken 3S là nơi hội tụ tinh hoa ẩm thực Hàn Quốc dành cho gia đình bạn tại 475A Nguyễn Thị Thập, Quận 7. Khám phá ngay những miếng gà rán giòn tan đẫm sốt độc quyền và tô mì cay chuẩn vị, mỗi món đều gói trọn tâm huyết của người đầu bếp. Hãy đến và tận hưởng không gian ấm cúng, để mỗi bữa ăn là một kỷ niệm đáng nhớ tràn ngập hương vị và tiếng cười.' AS story 
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
    SELECT id AS restaurant_id, N'Tứ Quý Trà là góc nhỏ thân quen giữa lòng Quận 7, nơi bạn luôn tìm thấy sự ấm áp và bình yên. Từ ly Carameo Machiato béo thơm đặc trưng đến những món đặc sản đậm đà, mỗi hương vị đều gói trọn cái tâm người làm. Ghé Tứ Quý Trà để tự mình cảm nhận, rồi bạn sẽ hiểu vì sao nơi đây luôn khiến người ta muốn quay lại.' AS story 
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
    SELECT id AS restaurant_id, N'Chiang Thai Delivery - Quận 7 mang đến tinh hoa ẩm thực Thái Lan với phong cách riêng độc đáo, ngay tại nhà bạn. Mỗi món đặc sản, từ Tom Yum chua cay nồng nàn đến Pad Thai đậm đà, đều là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và cái tâm của người đầu bếp. Hãy để chúng tôi đánh thức mọi giác quan của bạn bằng một trải nghiệm vị giác chuẩn Thái, tiện lợi và đầy cảm hứng.' AS story 
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
    SELECT id AS restaurant_id, N'Tiệm Fulleaf - Quận 7 là chốn dừng chân lý tưởng để bạn tìm thấy sự bình yên và những hương vị rất riêng. Mỗi món đặc sản ở đây đều được chúng tôi chuẩn bị bằng tất cả cái tâm, mang đến trải nghiệm ẩm thực độc đáo không lẫn vào đâu được. Hãy ghé Tiệm Fulleaf để cảm nhận sự ấm áp và để vị giác dẫn lối khám phá những bất ngờ.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Gangnam Tanghulu, chúng tôi mời bạn khám phá thế giới hương vị Á Đông đặc sắc ngay trong Lotte Mart Quận 7. Mỗi món ăn, từ những xiên kẹo trái cây giòn tan đến các đặc sản nóng hổi mang phong cách riêng, đều được chế biến bằng tất cả tâm huyết để mang lại trải nghiệm ẩm thực độc đáo. Ghé thăm để cảm nhận sự ấm áp và thưởng thức bữa ăn ngon miệng, chất lượng làm nên thương hiệu của chúng tôi.' AS story 
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
    SELECT id AS restaurant_id, N'Đến với Pave Glace Chocolate Quận 7, bạn sẽ tìm thấy một thế giới ngọt ngào ẩn mình tại 98 Đường 65. Mỗi món tráng miệng đặc trưng của chúng tôi là sự hòa quyện tinh tế của hương vị chocolate độc đáo và niềm đam mê sáng tạo. Từ những viên kẹo ngọt ngào làm quà tặng đến khoảnh khắc thưởng thức riêng, hãy để Pave Glace lan tỏa niềm vui và sự ấm áp đến bạn.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi những chiếc taco bình dân được nâng tầm thành trải nghiệm ẩm thực đặc sắc. Mỗi miếng bánh là sự hòa quyện hoàn hảo của nguyên liệu tươi ngon cùng công thức "bí mật" mang đậm phong cách Labubu. Ghé ngay 149 Phạm Hữu Lầu, Quận 7 để khám phá hương vị độc đáo, khó quên và cảm nhận sự ấm áp trong từng món ăn bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Bước chân vào Tacos Nhà LuXaBu ở 335 Nguyễn Hữu Thọ, bạn sẽ ngạc nhiên với những chiếc taco bình dân nhưng đậm đà chất riêng. Tại đây, mỗi chiếc bánh là sự kết hợp hoàn hảo của vỏ giòn tan, nhân tươi ngon và hương vị độc đáo, được làm bằng tất cả tâm huyết. Ghé ngay để khám phá phong cách ẩm thực đặc sắc, nơi những hương vị khó quên đang chờ đón bạn!' AS story 
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
    SELECT id AS restaurant_id, N'Xin chào các tín đồ ẩm thực! Tại Tacos Xin Chào 333 Nguyễn Hữu Thọ, chúng tôi tự hào mang đến những chiếc taco bùng nổ hương vị, độc đáo với phong cách riêng không lẫn vào đâu được. Từng nguyên liệu tươi ngon được chế biến đầy tâm huyết, tạo nên món fastfood chất lượng chuẩn nhà làm mà giá thì bình dân. Ghé ngay để cảm nhận sự "Xin Chào" chân thành qua từng miếng cắn giòn tan, đậm đà khó quên nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến những hương vị đặc trưng từ phố Cảng với phong cách riêng đầy sáng tạo. Mỗi món ăn, đặc biệt là bánh mì pate trứ danh, đều là kết quả của công thức gia truyền và tâm huyết gửi gắm vào từng nguyên liệu tươi ngon. Hãy đến 141 Đường Số 1 để trải nghiệm nét ẩm thực bình dị mà quyến rũ, đã làm hài lòng hàng ngàn thực khách.' AS story 
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
    SELECT id AS restaurant_id, N'Tại A Duy Food Quận 7, mỗi món ăn là một câu chuyện hương vị đậm đà, được nêm nếm bằng cả tấm lòng. Từng miếng gà quay vàng óng, sườn quay thấm vị hay chén cơm lam dẻo thơm đều mang phong cách đặc trưng, gợi nhớ bữa cơm gia đình ấm cúng. Đến và cảm nhận sự khác biệt từ những đặc sản riêng có, đã làm nên thương hiệu được thực khách yêu mến.' AS story 
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
    SELECT id AS restaurant_id, N'Đến với Ola Tacos Quận 7, bạn sẽ khám phá những chiếc tacos đặc sản với phong cách ẩm thực độc đáo, chỉ riêng tại đây. Mỗi chiếc bánh giòn tan, nhân đầy ắp hương vị đậm đà là kết quả của sự tỉ mỉ và tâm huyết, hứa hẹn mang đến một trải nghiệm vị giác bùng nổ. Hãy để Ola Tacos đánh thức vị giác của bạn bằng nét chấm phá khó quên này!' AS story 
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
    SELECT id AS restaurant_id, N'Chào bạn ghé LaSiMi Quận 7, điểm hẹn ấm cúng trên Đường Số 17 tấp nập. Tại đây, bạn sẽ khám phá không chỉ những ly trà ngon đậm vị mà còn là thế giới của các món đặc sản riêng biệt, được chế biến bằng tất cả tâm huyết. Mỗi hương vị là một câu chuyện chân thành, mang đến trải nghiệm ẩm thực khó quên mà thực khách đã tin yêu với 4.9/5 sao. Mời bạn đến cảm nhận và tận hưởng những khoảnh khắc thật chill cùng LaSiMi nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Sâm Chill Me Lý Phục Man chào đón bạn đến với không gian ấm cúng, nơi thời gian dường như chậm lại. Chúng tôi tự hào mang đến những món đặc sản độc đáo, được chế biến bằng tất cả tâm huyết để mỗi hương vị đều là một trải nghiệm khó quên. Ghé Sâm Chill Me để "chill" với tách cafe thơm lừng và khám phá phong cách ẩm thực riêng biệt chỉ có tại 89 Lý Phục Man nhé!' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin Tân Phong Quận 7 không chỉ là quán ăn, mà là nơi chúng tôi gửi gắm cả tâm huyết vào từng món Hàn chuẩn vị, mang đậm dấu ấn riêng. Mỗi tô mì cay nóng hổi, mỗi món ăn đặc sắc đều được chế biến cẩn thận, hứa hẹn đánh thức mọi giác quan. Ghé Sasin, bạn sẽ tìm thấy sự ấm áp, quen thuộc và những trải nghiệm vị giác khó quên trong không gian bình dị, gần gũi.' AS story 
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
    SELECT id AS restaurant_id, N'Phan Rang Quán Quận 7 là chốn dừng chân lý tưởng trên con đường Lê Văn Lương, nơi hương vị miền Trung chân thật được giữ trọn vẹn. Mỗi món đặc sản tại đây đều thấm đượm cái tâm người đầu bếp, mang đến phong vị riêng độc đáo, bình dị mà lôi cuốn. Hãy đến và cảm nhận sự ấm áp, vị ngon khó cưỡng như bữa cơm nhà mẹ nấu, chắc chắn sẽ khiến bạn hài lòng.' AS story 
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
    SELECT id AS restaurant_id, N'Ốc Trứng Muối - Chi Nhánh 17 Quận 7 tự hào mang đến những món ốc tươi ngon, đậm đà hương vị đặc trưng mà không nơi nào có được. Nổi bật nhất là sự kết hợp hoàn hảo của ốc và trứng muối béo ngậy, tạo nên trải nghiệm vị giác khó quên. Với không gian bình dân, ấm cúng, chúng tôi mời bạn ghé thăm để cùng sẻ chia những khoảnh khắc ẩm thực đầy hứng khởi và niềm vui!' AS story 
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
    SELECT id AS restaurant_id, N'Link Ốc Đường Số 10 là điểm dừng chân lý tưởng cho những tâm hồn yêu hải sản và mê nhậu tại Quận 7. Từng món ốc tươi rói, thấm đẫm gia vị độc quyền mang phong cách Link Ốc, hứa hẹn đánh thức mọi giác quan. Đến đây, không gian ấm cúng, rộn rã tiếng cười sẽ là chất xúc tác hoàn hảo cho những cuộc tụ họp đáng nhớ. Link Ốc không chỉ là bữa ăn, mà là trải nghiệm vị giác đầy cảm hứng chờ bạn khám phá.' AS story 
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
    SELECT id AS restaurant_id, N'Tìm về hương vị xưa trên con đường Phạm Hữu Lầu, Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 là điểm đến không thể bỏ lỡ. Nồi nước lèo đỏ au, thơm lừng cùng gạch cua béo ngậy và miếng tóp mỡ vàng giòn tan chảy, tạo nên sự giao thoa vị giác độc đáo. Chúng tôi gửi gắm cả tình yêu vào từng tô bún, mang đến cho bạn bữa ăn ấm cúng, đậm đà chất Sài Gòn. Hãy ghé 269 Phạm Hữu Lầu để cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Lẩu Cá Đuối 79k - Lotte Quận 7, bạn sẽ được đắm mình trong hương vị lẩu cá đuối chua cay đậm đà, chuẩn gu nhậu Việt. Không gian ấm cúng tại 621 Nguyễn Thị Thập là nơi lý tưởng để tụ họp, sẻ chia những câu chuyện bên bàn ăn chất lượng. Chúng tôi tỉ mẩn gửi gắm nét riêng biệt và sự tươi ngon vào từng món, mang đến trải nghiệm ẩm thực khó quên. Mời bạn ghé!' AS story 
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
    SELECT id AS restaurant_id, N'MayCha Yola, điểm hẹn bình yên tại Quận 7, mời bạn ghé thăm để tận hưởng không gian thoáng đãng và hương vị riêng biệt. Không chỉ có trà sữa thơm ngon, mà mỗi món đặc sản tại đây đều là tâm huyết được gửi gắm, mang đến trải nghiệm ẩm thực độc đáo khó quên. Đến MayCha Yola, nơi bạn luôn tìm thấy sự ấm áp và những khoảnh khắc tuyệt vời bên bàn ăn.' AS story 
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
    SELECT id AS restaurant_id, N'Trạm Mì Ý Dì Hiền là nơi bạn tìm thấy những đĩa mì Ý quen mà lạ, được Dì Hiền khéo léo biến tấu với phong cách riêng đầy mê hoặc. Mỗi món ăn đều gói trọn cái tâm, mang đến hương vị đậm đà, khó quên trong không gian ấm cúng, gần gũi. Ghé ngay 6 Đường 15 để thưởng thức bữa ăn bình dị nhưng tràn đầy cảm hứng, như một lời chào từ nước Ý qua bàn tay người Việt! Chắc chắn bạn sẽ hiểu vì sao quán luôn được đánh giá cao đến thế.' AS story 
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
    SELECT id AS restaurant_id, N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN: Nơi tinh hoa ẩm thực Hà Thành hội tụ cùng phong cách riêng đầy hấp dẫn ngay giữa lòng Quận 7. Mỗi món ăn là sự kết hợp của tâm huyết và bí quyết đặc biệt, từ bún chả thơm lừng đến nem cua bể giòn rụm. Hãy đến để thưởng thức hương vị khó quên, ấm áp như nhà làm và cảm nhận sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Tacos Labubu Quận 7 - Đường Số 17, mỗi chiếc taco không chỉ là món ăn nhanh mà còn là cả một câu chuyện hương vị độc đáo. Từ vỏ bánh giòn tan đến nhân thịt đậm đà thấm sốt đặc trưng, tất cả đều được chế biến bằng cái tâm để mang đến trải nghiệm ẩm thực khó quên. Hãy đến và tự mình khám phá phong vị Labubu rất riêng, bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Chicken 3S, nơi mỗi miếng gà rán sốt Hàn giòn rụm hay tô mỳ cay nóng hổi đều được chế biến bằng cả trái tim và bí quyết riêng. Chúng tôi tự hào mang đến hương vị độc đáo, ấm áp đậm chất gia đình, biến mỗi bữa ăn thành khoảnh khắc hạnh phúc khó quên. Ghé thăm ngay 475A Nguyễn Thị Thập để cảm nhận trọn vẹn sự khác biệt!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tứ Quý Trà - Carameo Machiato Quận 7, một điểm hẹn bình dị nơi hương vị Carameo Machiato ngọt ngào hay tách trà thơm lừng luôn sẵn sàng. Chúng tôi tự hào gửi gắm tâm huyết vào từng món đặc sản, mang phong cách riêng không thể lẫn, để mỗi lần ghé qua là một khám phá vị giác khó quên. Hãy tìm cho mình một góc ấm cúng, thư thái và để Tứ Quý Trà mang đến những trải nghiệm ẩm thực thân tình, mộc mạc giữa lòng Sài Gòn sôi động.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chiang Thai Delivery, chúng tôi gửi gắm cả tấm lòng vào từng món ăn Thái trứ danh, mang đến hương vị đặc trưng "chuẩn Thái, chất riêng" cho Quận 7. Mỗi món là sự hòa quyện hoàn hảo của chua cay mặn ngọt, được chế biến tỉ mỉ với bí quyết độc đáo riêng của quán. Hãy để Chiang Thai đánh thức mọi giác quan và đưa bạn du ngoạn ẩm thực Thái ngay tại nhà!' AS story 
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
    SELECT id AS restaurant_id, N'Tiệm Fulleaf Quận 7 là chốn dừng chân bình yên giữa lòng phố, nơi bạn luôn cảm nhận được sự ấm cúng và gần gũi như về nhà. Tại đây, mỗi món ăn đặc sản đều được chúng tôi gửi gắm cả tâm huyết, mang một phong cách riêng độc đáo, khó lẫn. Từ những nguyên liệu tươi ngon nhất, chúng tôi tỉ mỉ biến tấu để mỗi hương vị đều khiến bạn phải vấn vương. Ghé Fulleaf để khám phá và tận hưởng bữa ăn trọn vẹn hương sắc nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Bước vào Gangnam Tanghulu tại Lotte Mart Quận 7, bạn sẽ khám phá một thế giới hương vị châu Á độc đáo, nơi mỗi món ăn là một câu chuyện được kể bằng sự tận tâm. Từ những xiên Tanghulu giòn tan trứ danh đến các món đặc sản mang phong cách riêng, chúng tôi tự hào mang đến trải nghiệm ẩm thực gần gũi và đầy cảm hứng. Hãy ghé thăm gian hàng ấm cúng của chúng tôi để thưởng thức và cảm nhận sự khác biệt bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Pave Glace Chocolate Quận 7, chúng tôi tự hào mang đến thế giới tráng miệng độc đáo, nơi sự tinh tế và hương vị được "lát" nên từ đam mê. Thưởng thức những viên chocolate Pave Glace mát lạnh tan chảy, cùng các món đặc sản được sáng tạo theo phong cách riêng của quán, hứa hẹn đánh thức mọi giác quan. Một điểm hẹn ngọt ngào lý tưởng để tự thưởng cho mình hoặc trao gửi những món quà chân thành nhất.' AS story 
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
    SELECT id AS restaurant_id, N'Tìm kiếm một "chuyến phiêu lưu" ẩm thực nhanh gọn mà vẫn tràn đầy hương vị đặc sắc? Tacos Nhà Labubu 149 chính là điểm hẹn lý tưởng. Mỗi chiếc taco tại đây không chỉ là món ăn bình dân mà còn là "đặc sản" được chế biến bằng cái tâm và phong cách độc đáo của riêng Nhà Labubu. Hãy đến và tự mình cảm nhận sự khác biệt, nơi hương vị tuyệt vời luôn chờ đón bạn!' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Nhà LuXaBu tại 335 Nguyễn Hữu Thọ không chỉ là quán fast food bình dân mà còn là nơi gói trọn niềm đam mê ẩm thực. Mỗi chiếc tacos là sự sáng tạo độc đáo, mang "chất LuXaBu" riêng, khiến thực khách luôn bất ngờ với hương vị đậm đà, khó quên. Đến đây, bạn sẽ tìm thấy những món đặc sản được làm từ cái tâm, vừa vặn cho bữa nhanh gọn mà vẫn ấm áp và đầy hứng khởi. Hãy ghé thăm để trải nghiệm phong vị riêng chỉ có tại Tacos Nhà LuXaBu!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Tacos Xin Chào, chúng tôi tin rằng ẩm thực là một lời chào nồng hậu. Mỗi chiếc taco không chỉ là món fastfood bình dân, mà còn là bản giao hưởng hương vị đặc trưng được làm nên từ sự tỉ mỉ và cái tâm của người đầu bếp. Ghé 333 Nguyễn Hữu Thọ, Quận 7 để cảm nhận trọn vẹn sự giao thoa độc đáo và lý do 4.8 sao mà khách hàng dành tặng chúng tôi!' AS story 
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
    SELECT id AS restaurant_id, N'Tìm về tuổi thơ với hương vị Bánh Mì Pate Hải Phòng trứ danh tại Quận 7. Mỗi món ăn tại quán Bánh Mì Pate Hải Phòng Quận 7 - 141 Đường Số 1 đều được chế biến bằng tất cả tâm huyết, mang đến trải nghiệm ẩm thực bình dị mà đậm đà khó quên. Ghé ngay 141 Đường Số 1 để thưởng thức sự kết hợp hoàn hảo của truyền thống và phong cách riêng!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến A Duy Food Quận 7, nơi hương vị Gà Quay, Sườn Quay vàng óng và Cơm Lam dẻo thơm luôn mời gọi. Mỗi món ăn là tâm huyết của chúng tôi, được chế biến theo công thức độc quyền, mang đậm dấu ấn đặc trưng mà bạn sẽ khó quên. Hãy cùng gia đình ghé thăm để tận hưởng không gian ấm cúng và bữa ăn truyền thống Việt Nam được nâng tầm, chuẩn vị nhà làm.' AS story 
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
    SELECT id AS restaurant_id, N'Bỏ túi ngay địa chỉ quen thuộc cho những tín đồ ẩm thực mê Tacos tại Quận 7! Ola Tacos tự hào mang đến những chiếc bánh "đặc sản" biến tấu đầy sáng tạo, đậm dấu ấn riêng không lẫn vào đâu được. Mỗi miếng cắn là sự kết hợp hoàn hảo của nguyên liệu tươi ngon cùng cái tâm người đầu bếp, đảm bảo một bữa ăn chất lượng mà giá lại cực kỳ "hạt dẻ". Ghé 50 Đường Số 10 để trải nghiệm hương vị đặc biệt này!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với LaSiMi Quận 7, nơi Trà Ngon Đậm Vị hòa quyện cùng những món đặc sản mang phong cách riêng, độc đáo. Mỗi hương vị tại LaSiMi đều là kết quả của sự tận tâm, tỉ mỉ, mang đến trải nghiệm ẩm thực bình dị nhưng khó quên. Hãy ghé Đường Số 17 để cảm nhận không gian ấm cúng và sự chào đón nồng hậu, nơi chúng tôi gửi gắm cả tấm lòng vào từng món ăn, thức uống.' AS story 
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
    SELECT id AS restaurant_id, N'Sâm Chill Me Lý Phục Man chào đón bạn đến với không gian ấm cúng, nơi những món đặc sản độc đáo mang phong cách riêng sẽ đánh thức mọi giác quan. Mỗi hương vị được ủ ấp từ cái tâm người đầu bếp, tạo nên trải nghiệm ẩm thực khác biệt, khó quên. Ghé Sâm Chill Me để thưởng thức và tìm thấy cảm giác thư thái tuyệt vời, cho một ngày thật trọn vẹn!' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED AND source.restaurant_id IS NOT NULL THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

-- Câu chuyện cho quán: Mì Cay Sasin - Tân Phong Quận 7
MERGE RestaurantStories AS target
USING (
    SELECT id AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm hẹn lý tưởng cho những ai yêu ẩm thực Hàn Quốc bình dân nhưng đầy cá tính. Tại đây, mỗi tô mì cay nghi ngút hay món đặc sản riêng đều được chế biến bằng cả tâm huyết, mang đến hương vị bùng nổ khó quên mà chỉ Sasin mới có. Hãy đến và cảm nhận sự ấm áp lan tỏa, để vị giác được chiều chuộng trong không gian gần gũi như ở nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Phan Rang Quán Quận 7 tại 399 Lê Văn Lương là điểm đến ấm cúng cho những tâm hồn yêu ẩm thực Việt. Nơi đây, mỗi món đặc sản đều được chúng tôi gửi gắm trọn vẹn cái tâm, từ nguyên liệu tươi ngon đến phong cách chế biến độc đáo, mang đến hương vị khó quên. Hãy ghé thăm để thưởng thức những bữa ăn đậm đà, thân thuộc như chính bữa cơm nhà mình nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ốc Trứng Muối Quận 7, chúng tôi tin rằng món ngon nhất đến từ nguyên liệu tươi rói và một chút "tâm tình" riêng. Đến đây, bạn sẽ khám phá thế giới hải sản bình dị nhưng đầy bất ngờ với những món ốc thấm đượm sốt trứng muối béo ngậy đặc trưng. Mỗi đĩa là một câu chuyện hương vị độc đáo, ấm áp chờ bạn thưởng thức. Mời bạn ghé!' AS story 
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
    SELECT id AS restaurant_id, N'Link Ốc Quận 7 – Đường Số 10 là điểm đến lý tưởng cho những tâm hồn yêu ẩm thực biển. Tại đây, mỗi món đặc sản ốc và hải sản nhậu đều được chế biến với cái tâm, mang phong cách riêng độc đáo, khơi dậy trọn vẹn mọi giác quan. Hãy đến và tận hưởng không gian ấm cúng, để những buổi gặp gỡ bạn bè thêm phần gắn kết bên mâm ốc nóng hổi, đậm đà hương vị khó quên.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu, nơi mỗi tô bún riêu cua dậy vị quyện cùng tóp mỡ giòn tan sẽ đánh thức mọi giác quan. Chúng tôi tỉ mẩn chọn lựa nguyên liệu tươi ngon, gửi gắm trọn vẹn tâm huyết để mang đến hương vị chuẩn mực và độc đáo riêng. Hãy ghé 269 Phạm Hữu Lầu để thưởng thức món ngon nhà làm, ấm lòng và đầy ắp kỷ niệm!' AS story 
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
    SELECT id AS restaurant_id, N'Lẩu Cá Đuối 79k - Lotte Quận 7 là nơi hội tụ tinh hoa ẩm thực Việt, mang đến món lẩu cá đuối trứ danh với hương vị chua cay hài hòa, cá tươi roi rói cùng nước dùng đậm đà khó quên. Mỗi món ăn tại đây đều được chế biến bằng cả tâm huyết, với bí quyết riêng, tạo nên phong cách đặc sắc không lẫn vào đâu được. Hãy cùng bạn bè, người thân quây quần bên bàn ăn ấm cúng, nhâm nhi những món nhậu ngon đúng điệu và tận hưởng những khoảnh khắc sum vầy đáng nhớ. Chúng tôi tin rằng bạn sẽ tìm thấy một góc Sài Gòn thân thương và tràn đầy cảm xúc tại Lẩu Cá Đuối 79k.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, mỗi ly trà sữa là một bản giao hưởng hương vị, còn các món đặc sản lại kể một câu chuyện ẩm thực riêng biệt, được chế biến bằng cả tâm huyết. Chúng tôi kiến tạo không gian ấm cúng, gần gũi ngay tại Quận 7 để bạn thưởng thức những sáng tạo độc đáo này. Với 4.8 sao đánh giá, MayCha cam kết mang đến những trải nghiệm ngon miệng và khó quên, biến mỗi khoảnh khắc ghé thăm thành một kỷ niệm đẹp.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến Trạm Mì Ý Dì Hiền, nơi mỗi đĩa mì Ý không chỉ là món ăn mà còn là cả tấm lòng Dì Hiền gửi gắm. Với công thức riêng đầy sáng tạo, những món đặc sản tại đây mang hương vị Ý quen mà lạ, thấm đượm nét Sài Gòn bình dị. Ghé số 6 Đường 15, Quận 7 để thưởng thức vị ngon đặc trưng và cảm nhận sự ấm áp như ở nhà.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN, chúng tôi tự hào mang hương vị Hà Nội trứ danh về giữa lòng Quận 7. Mỗi suất bún chả thơm lừng hay nem cua bể giòn rụm đều được chế biến bằng cả cái tâm và công thức riêng biệt, đảm bảo giữ trọn vẹn bản sắc ẩm thực truyền thống nhưng vẫn rất độc đáo. Hãy ghé thăm để tìm lại những ký ức ẩm thực thân thương trong không gian bình dị, ấm cúng và thưởng thức những món đặc sản đậm đà, khó quên.' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Labubu Đường Số 17 là điểm dừng chân bình dân nhưng ấm áp, nơi bạn sẽ khám phá những chiếc taco mang hương vị đặc trưng "chuẩn Labubu" có một không hai. Với tất cả tâm huyết gói ghém trong từng nguyên liệu tươi ngon và công thức độc đáo, chúng tôi tạo nên phong cách ẩm thực riêng, khơi gợi mọi giác quan. Ghé Labubu ngay để trải nghiệm hương vị cuốn hút và cảm nhận sự chào đón nồng nhiệt từ chúng tôi!' AS story 
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
    SELECT id AS restaurant_id, N'Tại Chicken 3S, chúng tôi tin rằng món ăn ngon nhất đến từ cái tâm và sự sáng tạo không ngừng. Từng miếng gà rán giòn tan đẫm xốt Hàn độc quyền, hay tô mỳ cay đậm đà đều được chế biến với tất cả tâm huyết. Hãy ghé 475A Nguyễn Thị Thập để cảm nhận không gian ấm cúng và thưởng thức hương vị đặc sắc, chuẩn vị gia đình bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Tứ Quý Trà - Carameo Machiato Quận 7 là nơi bạn tìm thấy một góc bình yên giữa lòng Sài Gòn, nơi hương vị Carameo Machiato ngọt ngào và sánh mịn đánh thức mọi giác quan. Chúng tôi tự hào mang đến những món đặc sản mang đậm phong cách riêng, được chế biến tỉ mỉ bằng cả tấm lòng để mỗi hương vị đều là một trải nghiệm khó quên. Ghé 79A Đường 79 để cảm nhận sự ấm áp và sự tận tâm trong từng món ăn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Chiang Thai Delivery - Quận 7 không chỉ mang đến món ăn, mà là cả một hành trình vị giác đầy mê hoặc. Mỗi món Thái tại đây đều được chế biến bằng tất cả cái tâm, từ nguyên liệu tươi rói đến công thức độc đáo riêng biệt. Hãy để hương vị đậm đà, tinh túy đánh thức mọi giác quan, biến bữa ăn tại nhà bạn thành một trải nghiệm ẩm thực Thái Lan chuẩn vị, ấm cúng.' AS story 
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
    SELECT id AS restaurant_id, N'Giữa Quận 7 năng động, Tiệm Fulleaf là điểm hẹn bình yên, nơi hương cà phê thơm lừng hòa quyện cùng những món đặc sản mang phong cách riêng độc đáo. Mỗi món ăn đều được chế biến bằng cả tâm huyết, mang đến trải nghiệm vị giác khó quên. Ghé Tiệm Fulleaf để tìm về chút ký ức thân quen và thưởng thức nét sáng tạo rất riêng bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến với Gangnam Tanghulu, nơi hương vị Á Đông giao thoa trong những món đặc sản độc đáo, mang đậm phong cách riêng của chúng tôi. Mỗi miếng ăn là sự kết tinh của cái tâm người đầu bếp, hứa hẹn một hành trình vị giác khó quên ngay tại Lotte Mart Quận 7. Hãy ghé thăm để tận hưởng không gian ấm cúng và trải nghiệm ẩm thực tuyệt vời đã làm nên tên tuổi, chờ bạn khám phá và yêu thích.' AS story 
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
    SELECT id AS restaurant_id, N'Pave Glace Chocolate Quận 7 mời bạn ghé thăm một góc nhỏ bình yên, nơi hương thơm ngọt ngào lan tỏa. Tại đây, mỗi món dessert là câu chuyện của sự tỉ mỉ, niềm đam mê và những công thức độc quyền, mang đến hương vị khó quên chỉ có riêng tại quán. Hãy để vị giác được nuông chiều bởi sự tinh tế và tìm thấy món quà hoàn hảo cho những khoảnh khắc đặc biệt. Chúng tôi chờ đón bạn tại 98 Đường 65 để cùng trải nghiệm!' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng bạn đến Tacos Nhà Labubu 149, nơi hương vị Tacos truyền thống được biến tấu đầy sáng tạo, mang đậm dấu ấn riêng không thể tìm thấy ở đâu khác. Mỗi chiếc bánh là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và bí quyết gia truyền, gói trọn cái tâm và niềm vui của Labubu gửi gắm. Ghé ngay để khám phá những món ''đặc sản'' đã làm nên tên tuổi của quán, một điểm hẹn ẩm thực ấm cúng giữa lòng Quận 7.' AS story 
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
    SELECT id AS restaurant_id, N'Tacos Nhà LuXaBu tại 335 Nguyễn Hữu Thọ là nơi bạn tìm thấy những chiếc Tacos ''đặc sản'' mang đậm dấu ấn riêng, bình dân mà không hề tầm thường. Từng miếng nhân đậm đà, quyện cùng vỏ bánh giòn rụm sẽ đánh thức mọi giác quan. Ghé Tacos Nhà LuXaBu để trải nghiệm hương vị có ''một không hai'', được làm bằng cả cái tâm! Hãy đến và cảm nhận sự khác biệt.' AS story 
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
    SELECT id AS restaurant_id, N'Chào mừng đến với Tacos Xin Chào, 333 Nguyễn Hữu Thọ, Quận 7 – nơi hương vị độc đáo đã chinh phục thực khách và được đánh giá 4.8/5 sao! Mỗi chiếc taco giòn rụm, đong đầy nhân thấm đẫm sốt nhà làm bí truyền, là minh chứng cho sự tỉ mỉ và cái tâm chúng tôi gửi gắm. Dù là fast food bình dân, Tacos Xin Chào tự hào mang đến trải nghiệm ẩm thực chân thành, đậm đà khó quên, mời bạn ghé và cảm nhận!' AS story 
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
    SELECT id AS restaurant_id, N'Bánh Mì Pate Hải Phòng Quận 7 không chỉ là tên gọi, mà là lời hứa về hương vị nguyên bản từ thành phố Cảng, được chăm chút bằng tất cả cái tâm của người thợ. Mỗi ổ bánh mì tại 141 Đường Số 1 là sự hòa quyện tinh tế của pate thơm béo đặc trưng cùng các món ăn "độc quyền" mang phong cách riêng của quán. Một địa chỉ bình dân, nhưng đậm đà và khó quên, đã chinh phục biết bao tín đồ ẩm thực Sài Gòn. Hãy ghé thăm để trải nghiệm bạn nhé!' AS story 
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
    SELECT id AS restaurant_id, N'A Duy Food Quận 7 là nơi bạn tìm thấy hương vị Việt thân thương trong mỗi món ăn. Từ gà quay giòn rụm thơm lừng, sườn quay đậm đà khó cưỡng đến cơm lam dẻo thơm đặc trưng, mỗi món đều được chế biến bằng cái tâm và bí quyết riêng của quán. Chúng tôi mong muốn mang đến những bữa cơm gia đình ấm áp, nơi vị giác và cảm xúc được vỗ về trọn vẹn.' AS story 
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
    SELECT id AS restaurant_id, N'Tại Ola Tacos Quận 7, chúng tôi mang đến những chiếc taco bình dân nhưng bùng nổ hương vị đặc trưng. Mỗi món ăn là sự pha trộn tinh tế của nguyên liệu tươi ngon và bí quyết riêng, tạo nên trải nghiệm ẩm thực khó quên chỉ có ở 50 Đường Số 10. Hãy đến và cảm nhận sự tâm huyết gửi gắm trong từng miếng, nơi vị giác của bạn được đánh thức theo một cách rất riêng!' AS story 
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
    SELECT id AS restaurant_id, N'Tại LaSiMi Quận 7 - Đường Số 17, chúng tôi tự hào mang đến một không gian thật gần gũi, nơi mỗi ngụm trà đều đậm vị ký ức và mỗi món đặc sản đều thấm đượm phong cách riêng không lẫn vào đâu được. Từng hương vị được chăm chút tỉ mỉ, gửi gắm trọn vẹn cái tâm của người làm bếp. Hãy đến và trải nghiệm hương vị 4.9 sao được yêu thích mà bạn khó lòng quên!' AS story 
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
    SELECT id AS restaurant_id, N'Ghé Sâm Chill Me Lý Phục Man để tìm một góc "chill" thật sự giữa lòng Sài Gòn. Nơi đây, mỗi món ăn là một câu chuyện riêng, được sáng tạo từ cái tâm của người đầu bếp, mang đến hương vị đặc trưng mà bạn sẽ khó tìm thấy ở nơi nào khác. Hãy đến và tận hưởng những khoảnh khắc an yên cùng ẩm thực đầy mê hoặc.' AS story 
    FROM Restaurants 
    WHERE name = N'Sâm Chill Me - Lý Phục Man Quận 7'
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

COMMIT TRANSACTION;
