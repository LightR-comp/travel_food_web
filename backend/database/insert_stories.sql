-- File SQL backup dữ liệu câu chuyện quán ăn (RestaurantStories)
-- Tạo tự động bằng tool Go

BEGIN TRANSACTION;

MERGE RestaurantStories AS target
USING (SELECT 1 AS restaurant_id, N'Giữa lòng Quận 1 tấp nập, Cháo Sườn Cô Giang là điểm dừng chân ấm áp, nơi hương vị truyền thống được gìn giữ vẹn nguyên. Mỗi tô cháo sườn sánh mịn, ngọt xương hầm, hòa quyện thịt bằm và trứng bách thảo đều được Cô Giang nấu bằng tất cả tấm lòng. Đây là món quà giản dị mà thân thương, khơi gợi ký ức tuổi thơ và mang đến trải nghiệm ẩm thực Sài Gòn đậm đà. Hãy ghé 15bis Đinh Tiên Hoàng để cảm nhận sự đặc biệt đã làm nên tên tuổi Cháo Sườn Cô Giang.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 2 AS restaurant_id, N'Từ năm 1982, Nem Nướng Nha Trang đã lặng lẽ ẩn mình trong con hẻm Quận 1, gìn giữ hương vị tinh túy qua bao thế hệ. Mỗi xiên nem nướng thơm lừng, vàng óng, giòn rụm hòa quyện cùng nước chấm "bí truyền" đậm đà chính là cả tấm lòng người đầu bếp. Ghé quán, bạn không chỉ thưởng thức món ăn trứ danh mà còn cảm nhận sự ấm áp, gần gũi như trở về nhà. Hãy để Nem Nướng Nha Trang kể câu chuyện ẩm thực đầy hoài niệm cho vị giác của bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 3 AS restaurant_id, N'Chào mừng bạn đến với Cơm Phủ Trứng Sốt Sệt Quận 1, nơi hương vị Á Đông quen thuộc được nâng tầm với lớp trứng sốt sệt vàng ươm, béo ngậy tan chảy trên từng hạt cơm dẻo thơm. Từ cá hồi béo ngậy đến bạch tuộc giòn sần sật, mỗi suất cơm là một bản giao hưởng vị giác khó quên. Tại số 7B Tôn Thất Tùng, chúng tôi mang đến bữa ăn ấm lòng, ngon miệng chuẩn bình dân nhưng chất lượng chẳng thua kém. Ghé thăm để tận hưởng sự giao thoa độc đáo này nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 4 AS restaurant_id, N'Tại Bún Ốc Sườn Cô Sáu, mỗi tô bún là cả tâm huyết của người đầu bếp. Nước lèo chua cay mặn ngọt hài hòa, thơm lừng vị ốc to giòn sần sật, sườn mềm tan và bò tươi ngon, hứa hẹn đánh thức mọi giác quan. Một góc bình yên giữa lòng Quận 1 sôi động, nơi hương vị truyền thống được gìn giữ và yêu thương, mang đến trải nghiệm ẩm thực ấm áp như nhà làm.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 5 AS restaurant_id, N'Bánh Mì 1 Phút 30 Giây - Lạc Long Quân là địa chỉ quen thuộc cho những ai yêu thích sự nhanh gọn mà vẫn tròn vị. Chỉ trong tích tắc, bạn đã có ngay các combo Hamburger, Hotdog hay Pita Tôm nóng hổi, giòn tan, chuẩn bị tỉ mỉ để mỗi miếng đều là một trải nghiệm đáng nhớ. Chúng tôi mang đến hương vị tuyệt hảo cùng thức uống sảng khoái, xua tan mọi mệt mỏi. Đừng quên ghé 219 Lạc Long Quân để tận hưởng bữa ăn chất lượng giữa lòng Sài Gòn bận rộn!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 6 AS restaurant_id, N'Nằm giữa lòng Quận 1 sôi động, Bánh Kem Phương Loan 185F Cống Quỳnh là điểm hẹn ngọt ngào với hương vị 4.9 sao được yêu mến. Từ những chiếc Pannacotta thanh mát, bùng nổ vị giác, đến Bông lan cuộn kem mềm mịn quen thuộc, và Bánh kem Hàn Quốc tinh tế cho mọi dịp đặc biệt. Mỗi chiếc bánh đều gói trọn tâm huyết, mang đến niềm vui trọn vẹn và khó quên cho thực khách. Hãy ghé Phương Loan để tìm thấy vị ngọt của hạnh phúc ngay hôm nay!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 7 AS restaurant_id, N'Giữa lòng Sài Gòn sôi động, Trà Sữa Thế Giới - Nguyễn Du mời bạn ghé chân thưởng thức một "thế giới" hương vị thật riêng. Từ Trà Sữa Lài Mật Ong thơm dịu đến Trà Việt Quất hay Trà Đào Trân Châu tươi mát, mỗi ly trà đều được ủ ấp sự tận tâm. Nơi đây là điểm dừng chân lý tưởng để nạp năng lượng và tận hưởng khoảnh khắc bình yên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 8 AS restaurant_id, N'Tại 75/6Bis Tân Thới Nhất, Quán Chay Diệu Hạnh là một góc nhỏ bình yên, nơi những món chay thuần Việt được nấu bằng cả tấm lòng. Từ đĩa cơm rau tươi xanh mướt, đậu hũ kho đậm đà đến chiếc bánh bao chay mềm thơm, mỗi hương vị đều gói trọn sự mộc mạc và chân thành. Hãy ghé Diệu Hạnh để cảm nhận bữa chay ấm áp, chuẩn vị nhà làm, tiếp thêm năng lượng cho ngày dài.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 9 AS restaurant_id, N'Bún Mắm Nêm Chị Linh Quận 1 tại 15 Lê Thánh Tôn là nơi lưu giữ hồn Việt trong từng món ăn bình dị, chuẩn vị. Đến đây, bạn sẽ được thưởng thức những hương vị đặc trưng, từ gỏi đu đủ thanh mát đến combo bánh hỏi heo quay đậm đà, được Chị Linh gửi gắm trọn vẹn cái tâm. Không gian ấm cúng, thân quen hứa hẹn mang đến trải nghiệm ẩm thực như bữa cơm nhà đầy ắp tình cảm.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 10 AS restaurant_id, N'Vua Gà Tần - Since 1999, hơn hai thập kỷ qua đã tận tâm giữ trọn tinh hoa gà tần truyền thống ngay giữa lòng Quận 1. Tại đây, bạn sẽ được thưởng thức món gà hầm bổ dưỡng, thấm đẫm hương vị đặc trưng, được chế biến từ tâm huyết và công thức gia truyền. Cùng với rau ngải cứu hầm mềm mại, măng chua ngâm ớt giòn cay và bánh mì nóng giòn, tất cả hòa quyện tạo nên một trải nghiệm ẩm thực Việt ấm cúng và khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 11 AS restaurant_id, N'Ẩn mình tại con hẻm nhỏ TK24/9 Nguyễn Cảnh Chân, Gà Tần Gia Bảo - Quận 1 là điểm hẹn cho hương vị gà tiềm thuốc bắc, ngải cứu chuẩn vị gia truyền. Mỗi phần gà ta tươi ngon, được hầm tỉ mỉ cùng thảo mộc quý, chắt chiu nên món ăn bổ dưỡng, thơm lừng nức mũi, ấm lòng thực khách. Với 4.8/5 sao từ hàng ngàn lời khen, chúng tôi tự hào mang đến bữa ăn chất lượng như nhà làm. Mời bạn ghé và cảm nhận tinh hoa ẩm thực ''Gia Bảo'' của Sài Gòn!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 12 AS restaurant_id, N'Tìm về một góc nhỏ 42/2 Trần Đình Xu, Cô Thảo Tôm Cá mang đến bí quyết "ngâm tương" chuẩn Hàn đầy lôi cuốn ngay tại Quận 1. Từng lát cá hồi Nauy tươi rói, tôm và trứng ngấm trọn vị nước tương độc quyền, tạo nên hương vị đậm đà khó cưỡng. Dù là cơm gạo lứt bổ dưỡng hay set tôm cá hấp dẫn, mỗi suất ăn mang về đều gói trọn cái tâm của Cô Thảo. Hứa hẹn một bữa ăn trọn vị, ấm lòng và khó quên cho bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 13 AS restaurant_id, N'Tiệm Xôi Mềm Nguyễn Trãi là nơi chúng tôi gói trọn tinh hoa ẩm thực đường phố vào một không gian thanh lịch, đầy tinh tế. Từng hạt nếp được chọn lựa kỹ lưỡng tạo nên độ mềm dẻo đặc trưng, hòa quyện hoàn hảo với thịt kho trứng kho đậm đà hay chà bông, chả mỡ thơm lừng. Mỗi phần xôi không chỉ là món ăn, mà còn là cả tấm lòng và ký ức tuổi thơ ấm áp, mời bạn ghé và cảm nhận.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 14 AS restaurant_id, N'Trong con hẻm nhỏ yên bình giữa lòng Quận 1, Bếp Lành Quận 1 chào đón bạn với bữa trưa ngon miệng và đầy tâm huyết. Mỗi phần cơm văn phòng đều được chế biến kỹ lưỡng, mang hương vị quen thuộc và tốt cho sức khỏe. Đừng quên thử Matcha Latte Dâu đặc trưng, một sự kết hợp độc đáo mang lại sự sảng khoái bất ngờ. Hãy để Bếp Lành là nơi bạn tìm thấy năng lượng tích cực cho một ngày dài.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 15 AS restaurant_id, N'Tại Highlands Coffee Bùi Thị Xuân, giữa nhịp sống hối hả Quận 1, bạn sẽ tìm thấy một không gian sang trọng và ấm cúng để thư thái. Thưởng thức ly Trà Sen Vàng trứ danh, với hương sen thanh tao quyện trong vị trà đậm đà, khơi gợi xúc cảm khó quên. Nơi đây là điểm đến lý tưởng để bạn gác lại lo toan, tận hưởng những khoảnh khắc an yên và chất lượng.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 16 AS restaurant_id, N'Ghé Hủ Tiếu Cô Tám Quận 1 để tìm lại hương vị Sài Gòn thân thương, nơi mỗi tô hủ tiếu là cả một tâm huyết được gửi gắm. Nước lèo ngọt thanh từ xương hầm kỹ, sợi hủ tiếu dai mềm cùng topping chất lượng tạo nên món ăn chuẩn vị, ấm lòng. Với rating 4.8 sao, quán bình dân đối diện 81 Nguyễn Thái Bình luôn là điểm đến lý tưởng cho bữa ăn ngon, đậm đà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 17 AS restaurant_id, N'Ghé 37B Nguyễn Thông, bạn sẽ tìm thấy hương vị Bún Bò Sa Tế Sả trứ danh, nơi mỗi tô bún là một câu chuyện thấm đượm gia vị truyền thống. Điểm nhấn chính là sự kết hợp độc đáo của sa tế thơm lừng cùng sả cay nồng, tạo nên tô Bún Bò Khô hay Nước đậm đà khó quên, chuẩn vị bình dân mà tinh tế. Thêm chén Bánh Mì Xíu Mại nóng hổi, bạn sẽ có một bữa ăn tròn vị, đậm chất Sài Gòn. Hãy đến và trải nghiệm hương vị đã làm nên 4.3 sao của chúng tôi!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 18 AS restaurant_id, N'Chào mừng bạn đến Big Feet, nơi Chân Gà Đông Tảo Hưng Yên trứ danh được nâng tầm thành những món nhậu khó quên. Từ chân gà hấp mắm nhĩ đậm đà lôi cuốn đến món hầm táo đỏ hạt sen thơm lừng bổ dưỡng, mỗi hương vị đều là tâm huyết chúng tôi gửi gắm. Ghé 52/3 Lý Chính Thắng, Quận 3 để cùng bạn bè tận hưởng không gian ấm cúng và những bữa tiệc vị giác thật sự đặc biệt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 19 AS restaurant_id, N'Tre Tre - Gà Nướng Ống Tre Tây Bắc mang cả hương vị núi rừng Tây Bắc về giữa lòng Sài Gòn tại Quận 3. Đến đây, bạn sẽ được thưởng thức những chú gà, vịt tuyển chọn được nướng chậm trong ống tre, từng thớ thịt mọng nước đượm mùi thơm đặc trưng khó cưỡng. Với không gian ấm cúng và món ăn độc đáo, Tre Tre hứa hẹn mang đến trải nghiệm ẩm thực gia đình khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 20 AS restaurant_id, N'Tại Hanyang, chúng tôi tin rằng mỗi món ăn là một câu chuyện về sự tận tâm. Nổi tiếng với nồi gà hầm sâm Hàn Quốc nguyên con, từ gà vườn cho đến gà đen Sa Pa, mỗi phần đều được ủ vị kỹ lưỡng, mang đến hương thơm ấm nồng và dưỡng chất phục hồi. Bước vào Hanyang, bạn sẽ tìm thấy một không gian ấm cúng để thưởng thức những tinh hoa ẩm thực, đậm đà tình cảm giữa lòng Quận 3.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 21 AS restaurant_id, N'Ghé Lão Trư và khám phá một góc nhỏ ấm cúng giữa lòng Quận 3, nơi tụ hội những món nhậu Á Đông thấm đượm hương vị tuổi thơ và tình bằng hữu. Đặc biệt, những đôi chân gà Đông Tảo trứ danh tại đây được chế biến thủ công, từ hương tàu xì đậm đà đến mắm nhĩ thơm lừng hay trộn thính giòn rụm, mỗi món đều mang một nét riêng khó quên. Chúng tôi tin rằng, cái tâm tỉ mỉ trong từng món ăn sẽ chạm đến trái tim bạn. Hãy đến Lão Trư để cùng sẻ chia khoảnh khắc và tạo nên những kỷ niệm đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 22 AS restaurant_id, N'Tại Thằng Bờm, bạn sẽ tìm thấy một phần hồn Tây Nguyên ấm áp giữa lòng Sài Gòn. Mỗi món gà vườn hay vịt cherry lam ống nứa đều được nướng cẩn thận, thấm đẫm hương tre nứa tự nhiên, cho thịt mềm mọng và vị ngọt khó quên. Đây là nơi lý tưởng để gia đình quây quần, cùng nhau tận hưởng bữa ăn đậm đà bản sắc và tràn đầy tình cảm. Hãy đến và để Thằng Bờm kể câu chuyện hương vị riêng cho bạn!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 23 AS restaurant_id, N'Phở Thìn - Bà Huyện Thanh Quan mang trọn vẹn hương vị phở Hà Nội chuẩn mực đến giữa lòng Sài Gòn sôi động. Từng tô phở tái lăn đặc trưng hay phở sốt vang lạ miệng đều được nấu bằng cái tâm, từ nước dùng ninh xương công phu đến miếng thịt thơm lừng. Ghé Phở Thìn, bạn không chỉ thưởng thức món ngon mà còn tìm thấy một góc bình yên, ấm cúng và đậm đà bản sắc Việt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 24 AS restaurant_id, N'Tại GÀ ĐẤT, chúng tôi gói trọn tinh hoa ẩm thực Việt trong từng món gà được ủ đất sét hay nướng nồi đất đầy tâm huyết. Từ gà đen Tây Bắc ôm xôi trắng mộc mạc đến gà Đông Tảo Hưng Yên trứ danh, mỗi nguyên liệu được chọn lọc kỹ càng và chế biến theo bí quyết gia truyền. Hãy tìm đến con hẻm nhỏ 52/1/1 Lý Chính Thắng để thưởng thức hương vị độc đáo, ấm áp như bữa cơm nhà, nơi mọi khoảnh khắc đều trở nên thật đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 25 AS restaurant_id, N'Gà Đốt Kampot là nơi hội tụ tinh hoa ẩm thực độc lạ từ Hà Tiên, mang đến trải nghiệm vị giác khó quên ngay giữa lòng Quận 3. Từng con gà vườn, vịt Cherry hay gà H''Mông quý hiếm đều được tẩm ướp và đốt thủ công theo công thức gia truyền, dậy mùi thơm nức mũi và giữ trọn vị ngọt tự nhiên. Ghé 52/1 Lý Chính Thắng để thưởng thức hương vị đặc trưng, đánh thức mọi giác quan và cảm nhận sự tâm huyết trong từng món ăn. Chắc chắn bạn sẽ tìm thấy một "đặc sản" của riêng mình tại đây!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 26 AS restaurant_id, N'Ẩn mình tại con hẻm Quận 3, Vịt Khói là chốn dừng chân cho những ai mê mẩn hương vị Tây Bắc nguyên bản. Nơi đây, vịt trời được tuyển chọn và hun khói thủ công, tạo nên vị ngon độc đáo thấm đẫm từng thớ thịt. Từ đĩa xôi vịt trời áp chảo giòn rụm đến mẹt vịt 5 món sum vầy, mỗi món là câu chuyện về cái tâm người đầu bếp. Mời gọi bạn cùng gia đình khám phá bữa ăn ấm cúng, đậm đà khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 27 AS restaurant_id, N'Tại O Thum, chúng tôi tự hào mang đến trải nghiệm ẩm thực độc đáo khó quên với món Gà Không Lối Thoát trứ danh. Mỗi con gà vườn, gà H''Mông hay chân gà Đông Tảo được bao bọc khéo léo trong lớp xôi giòn rụm, từ truyền thống đến ngũ sắc Tây Bắc thấm đượm hương vị đậm đà khó cưỡng. Đây không chỉ là món ăn, mà còn là tâm huyết chúng tôi gửi gắm. Mời bạn ghé O Thum để khám phá hương vị có một không hai!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 28 AS restaurant_id, N'Gà Ủ Muối Deli - Quận 3 mời bạn khám phá một hành trình hương vị Việt Nam chân thật, đậm đà ngay giữa lòng thành phố. Từ Gà Đông Tảo Hưng Yên ủ muối thảo mộc công phu đến Gà vườn nướng ống tre Tây Bắc thơm lừng, mỗi món là cả tâm huyết và bí quyết riêng biệt. Thưởng thức miếng thịt mềm ngọt, da giòn thơm, thấm đượm gia vị, bạn sẽ cảm nhận được sự ấm áp và hài lòng trong từng thớ thịt. Ghé Deli để mang về món ngon chuẩn vị, biến bữa ăn tại nhà thêm phần đặc sắc!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 29 AS restaurant_id, N'Với 4.8 sao, GUTA CAFE - 8 Bà Huyện Thanh Quan tự hào là điểm đến quen thuộc, nơi bạn tìm thấy năng lượng và sự thoải mái mỗi ngày. Từng giọt Trà sữa Oolong đặc biệt, Matcha Latte thanh mát hay chiếc Bánh Mì Que Pate Chà Bông giòn rụm đều được chuẩn bị với tất cả tâm huyết. Ghé GUTA, để mỗi khoảnh khắc đều trở nên ấm áp và ngon miệng khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 30 AS restaurant_id, N'Tìm về A Phủ trong con hẻm yên bình 52/3 Lý Chính Thắng, bạn sẽ khám phá bí quyết của món Gà Hấp Nước Tương làm nên tên tuổi. Chúng tôi tỉ mẩn chọn lọc từng loại gà, từ truyền thống đến H''Mông, Đông Tảo, rồi công phu hấp cùng công thức nước tương độc đáo để thịt gà thấm đẫm, dậy mùi thơm nức. Thưởng thức miếng gà đậm đà cùng xôi tam sắc, gỏi thanh mát, mọi cuộc vui bỗng thêm phần tròn vị, ấm cúng. A Phủ – chuẩn vị nhậu Việt, gói trọn hương vị tình thân.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 31 AS restaurant_id, N'Tại Bếp Xanh, mỗi tô hủ tiếu là cả một câu chuyện vị giác truyền thống thấm đượm cái hồn ẩm thực Quận 3. Nước lèo trong veo, ngọt thanh được ninh nấu tỉ mỉ, kết hợp cùng những nguyên liệu tươi ngon chọn lọc như gà trứng non béo ngậy hay mực bào ngư trứ danh. Ghé Bếp Xanh để thưởng thức sự giao thoa hài hòa giữa hương vị bình dân ấm áp và những món đặc sắc, mang đến trải nghiệm khó quên cho thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 32 AS restaurant_id, N'Tại Vịt Bamboo, chúng tôi tự hào mang cả tinh hoa ẩm thực Tây Bắc về lòng Sài Gòn qua món Vịt Lam Ống Tre độc đáo. Hương vị thịt vịt đồng hay vịt cherry thấm đẫm gia vị núi rừng, được nướng chậm trong ống tre, tạo nên bản giao hưởng khó quên cho vị giác. Bên cạnh Gà Mẹt 7 món hay Gà Đông Tảo bó xôi truyền thống, mỗi bữa ăn tại đây là sự hội tụ của tâm huyết, mang đến những khoảnh khắc gia đình ấm cúng. Khám phá hương vị 4.6 sao được yêu thích tại 52/1 Lý Chính Thắng, Quận 3 ngay hôm nay.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 33 AS restaurant_id, N'Giấu mình trong con hẻm yên bình Quận 3, Nam Phương Quán là chốn dừng chân ấm cúng cho tâm hồn ẩm thực. Nơi đây, cá lóc đồng tươi rói được biến tấu đầy tinh tế: từ quay me chua ngọt cuốn bánh tráng mềm dẻo đến nướng muối ớt đậm đà, nướng lá chuối thơm lừng. Mỗi món ăn là một bản giao hưởng hương vị miền Tây chân chất, mang đến những giây phút "nhậu" sum vầy, đáng nhớ. Mời bạn ghé Nam Phương để cảm nhận trọn vẹn sự giao thoa độc đáo này!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 34 AS restaurant_id, N'Chào mừng bạn đến Gà Bản Đôn - Gà Nướng Sa Lửa tại 52/3 Lý Chính Thắng, nơi chúng tôi mang trọn vẹn tinh hoa ẩm thực Tây Nguyên về giữa lòng Quận 3. Những chú gà bản được tuyển chọn tỉ mỉ, tẩm ướp gia vị núi rừng đặc trưng rồi nướng sa lửa nguyên con, cho lớp da vàng giòn, thịt ngọt mọng nước khó cưỡng. Kèm theo ống cơm lam dẻo thơm, đây chính là hương vị ấm cúng, đậm đà của bữa cơm gia đình, một trải nghiệm vị giác khó quên đang chờ đón bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 35 AS restaurant_id, N'Út Lục Lâm nép mình trong con hẻm nhỏ Quận 3, nơi những món ốc hấp nóng hổi chờ đón bạn. Điểm nhấn không thể bỏ qua là Ốc Bươu Hấp Tiêu Xanh trứ danh, với vị cay nồng đặc trưng của tiêu xanh quyện cùng hương sả thanh mát, đánh thức mọi giác quan. Mỗi con ốc tươi rói, mỗi món ăn đều được gửi gắm cái tâm của Út, mang đến bữa ăn bình dị mà ấm áp, đậm đà tình người. Hãy ghé Út Lục Lâm để cảm nhận và tìm về hương vị thân quen!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 36 AS restaurant_id, N'Đất Phương Nam mời bạn ghé lại con hẻm nhỏ Quận 3, khám phá hương vị Vịt Nướng Muối Ớt độc đáo làm say lòng bao thực khách. Từng miếng vịt thấm đẫm gia vị cay nồng, thơm lừng trên bếp than hồng, mang đến trải nghiệm nhậu chuẩn vị miền Nam. Hãy cùng bạn bè sẻ chia khoảnh khắc sum vầy ấm áp và thưởng thức những món vịt nướng đặc sắc của chúng tôi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 37 AS restaurant_id, N'Tại Phùng Hưng, Quận 5, Cơm Tấm Sườn Nướng không chỉ là một bữa ăn mà là hành trình về với hương vị Sài Gòn bình dị, ấm áp. Miếng sườn nướng thơm lừng trên hạt cơm tấm dẻo mềm, thêm chút trứng ốp la béo ngậy, hay Cơm Ba Rọi Xào Ruốc đậm đà, mỗi món đều được chế biến bằng cả tấm lòng. Nơi đây, bạn sẽ tìm thấy không gian thân quen, cùng trà sữa và ăn vặt hấp dẫn để mọi khoảnh khắc đều trở nên ngon miệng và thư giãn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 38 AS restaurant_id, N'Lẩu Bò Hân Quận 5 Nguyễn Biểu là điểm đến không thể bỏ qua cho những tín đồ ẩm thực mê bò hấp trứ danh. Mỗi phần bắp, đuôi, gù bò đều được chọn lọc kỹ càng và hấp khéo léo, giữ trọn vị ngọt tự nhiên, dai mềm tan chảy. Hương vị đậm đà cùng không khí nhậu chất Sài Gòn ấm cúng chắc chắn sẽ mang đến những phút giây sum vầy khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 39 AS restaurant_id, N'Bước vào Bánh Kem & Bánh Ngọt - 1819 Gato Quận 5, bạn sẽ tìm thấy một góc nhỏ bình yên, nơi những chiếc bánh ngọt ngào được gửi gắm cả tấm lòng. Từ su kem mềm tan, bánh kem bắp thơm lừng đến bông lan cuộn dâu dịu ngọt, mỗi hương vị đều gợi nhớ ký ức tuổi thơ thân thương. Hãy để chúng tôi mang đến cho bạn niềm vui giản dị và những khoảnh khắc ngọt ngào mỗi ngày.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 40 AS restaurant_id, N'Bánh Sầu Riêng 9 Sạch - Quận 5 mời bạn ghé thăm để khám phá thế giới sầu riêng tươi ngon, chuẩn vị. Mỗi chiếc bánh là sự hòa quyện tinh tế của sầu Ri6 nguyên chất cùng những sáng tạo độc đáo như ngàn lớp siêu sầu, phô mai than tre hay choco hạnh nhân. Chúng tôi gửi gắm cả tâm huyết vào từng hương vị, mang đến món quà ngọt ngào, khó quên cho bạn và người thân.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 41 AS restaurant_id, N'Ốc Trứng Muối - Chi Nhánh 5 là điểm đến lý tưởng cho những tín đồ hải sản bình dân, chất lượng ngay tại Quận 5. Từng con ốc bươu mập ú thấm đẫm sốt tiêu cay nồng hay tôm càng xanh nướng phô mai thơm lừng, béo ngậy đều được chế biến bằng cả tâm huyết. Ghé ngay để cảm nhận hương vị đặc trưng khó quên và tận hưởng không gian ấm cúng, gần gũi nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 42 AS restaurant_id, N'Domoto Saigon Quận 5 là điểm hẹn lý tưởng cho những tâm hồn yêu ẩm thực Nhật Bản bình dân, ấm cúng giữa lòng Sài Gòn. Mỗi phần cơm tại đây, từ Cơm Lươn truyền thống đến Cơm bò Hamburger phô mai độc đáo, đều được chế biến bằng cả sự tỉ mỉ và tâm huyết. Ghé Domoto để thưởng thức hương vị chuẩn Nhật, cảm nhận sự gần gũi như bữa cơm nhà, với mức giá vô cùng phải chăng nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 43 AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối - Chi Nhánh Quận 5, nơi mỗi bữa ăn là một trải nghiệm vị giác đầy bất ngờ. Chúng tôi tự hào mang đến những hương vị hải sản độc đáo, khởi đầu với combo hàu sữa tươi rói, được hấp sả thơm lừng, giữ trọn vẹn sự tinh khiết của biển cả. Từng con hàu căng mọng, ngọt lành sẽ đánh thức mọi giác quan của bạn. Ghé thăm không gian bình dân, ấm cúng trên đường Trần Phú để cùng bạn bè, gia đình tận hưởng những khoảnh khắc ngon miệng và tràn đầy niềm vui.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 44 AS restaurant_id, N'Truyền Thuyết Champong mời bạn khám phá không gian ấm cúng, nơi hương vị Hàn Quốc đích thực gói trọn trong từng món ăn chuẩn vị gia đình. Từ những đĩa Tteokbokki nồng đượm đến Mì Tương Đen đậm đà, mỗi món đều là một "truyền thuyết" được tạo nên bằng cả tâm huyết và bí quyết riêng. Hãy đến và viết thêm câu chuyện ẩm thực của riêng bạn cùng chúng tôi tại 197 Nguyễn Trãi, Quận 5.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 45 AS restaurant_id, N'Giữa lòng Quận 5 sôi động, An Lạc - Ăn Chay mang đến một không gian yên bình cùng những món chay thuần túy, đậm đà hương vị Á Châu. Chúng tôi gửi gắm cả tấm lòng vào từng nguyên liệu tươi ngon, để mỗi bữa ăn là một trải nghiệm an lành. Đừng quên thử Bánh Mì Nấm hay Bánh Mì Xúc Xích Chay Best Seller giòn thơm, bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 46 AS restaurant_id, N'Tại Tàu Hũ Tươi Covang Quận 5 - Trần Tuấn Khải, chúng tôi tỉ mỉ gửi gắm cả tấm lòng vào từng chén tàu hũ tươi Co Vang thanh mát. Từng muỗng mềm tan, ngọt dịu sẽ đưa bạn vào không gian thư thái, nhẹ nhàng ngay giữa lòng Sài Gòn sôi động. Ghé 159 Trần Tuấn Khải để tận hưởng món tráng miệng ngọt lành, ấm áp cho tâm hồn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 47 AS restaurant_id, N'Đến Ăn Vặt Quận 6 để khám phá hương vị tuổi thơ được nâng tầm! Nơi đây, mỗi cuộn bánh tráng phơi sương dẻo dai là một bản giao hưởng vị giác: từ mỡ hành thơm lừng, satế cay nồng đến tỏi phi giòn rụm và trứng cút béo ngậy. Với 4.5 sao từ thực khách, chúng tôi tự hào mang đến những món ăn vặt độc đáo, chuẩn vị và đậm đà tình Sài Gòn. Ghé ngay 444/1 Phạm Văn Chí để thưởng thức sự mê hoặc này nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 48 AS restaurant_id, N'Tại Ăn Vặt Cá Viên Chiên Phát Lộc 9999 - Quận 6, những tô mì trộn Indomie quen thuộc bỗng trở thành "ngôi sao 5 sao" được đánh giá cao. Với chút tâm huyết và bí quyết riêng, mì được trộn đều cùng xúc xích chiên giòn, trứng ốp la béo ngậy và các topping thập cẩm tươi ngon, tạo nên hương vị đậm đà khó cưỡng. Mỗi suất ăn là một sự kết hợp hoàn hảo, mang đến bữa ăn ấm lòng, thơm ngon đúng điệu vị giác của người Sài Gòn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 49 AS restaurant_id, N'Cơm Tấm 279 tại Hậu Giang đã trở thành điểm hẹn thân quen cho những ai yêu mến hương vị Sài Gòn. Nơi đây, bạn có thể thưởng thức dĩa cơm sườn bì ốp la truyền thống hay khám phá vị lạ miệng của Cơm Mắm Chưng, Khổ Qua Cà Chớn. Mỗi món ăn đều chứa đựng cái tâm, mang đến bữa cơm bình dị nhưng đậm đà và ấm áp như nhà làm.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 50 AS restaurant_id, N'Đến Mến - Bún Chả Cá Sứa Nha Trang, bạn sẽ cảm nhận ngay tấm lòng của cô chủ Hậu Giang gửi gắm trong từng tô bún. Hương vị biển Nha Trang tinh túy với chả cá thơm dai, sứa giòn sần sật quyện trong nước lèo thanh ngọt bí truyền, làm nức lòng thực khách. Hãy ghé Mến để tự mình khám phá tô Bún Đầy Đủ "có cả thế giới", nơi ẩm thực bình dân chạm đến trái tim bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 51 AS restaurant_id, N'Tại Cơm Tấm 3 Chị Em, mỗi đĩa cơm tấm không chỉ là món ăn mà còn là cả một câu chuyện về tình yêu và niềm đam mê ẩm thực được ba chị em gửi gắm. Miếng sườn nướng thơm lừng, bì dai giòn, chả trứng mềm mượt hòa quyện cùng nước mắm bí truyền, mang đến hương vị thân quen như cơm mẹ nấu. Ghé 733 Lò Gốm để thưởng thức bữa cơm ấm lòng, chuẩn vị Sài Gòn, nơi những hương vị truyền thống được trân trọng mỗi ngày!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 52 AS restaurant_id, N'Mì Trộn & Xiên Que Cá Con - Đồ Ăn Vặt Quận 6 là điểm hẹn lý tưởng cho những tín đồ ẩm thực đường phố. Tại đây, mỗi sợi mì trộn dai ngon, mỗi xiên cá con giòn rụm đều gói trọn hương vị đặc trưng và tâm huyết của người làm bếp. Ghé 151 Bãi Sậy để thưởng thức ngay các COMBO TIẾT KIỆM, NO NÊ đầy ắp, và khám phá bữa ăn vặt ngon chuẩn vị, giá cả phải chăng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 53 AS restaurant_id, N'Ghé Bánh Cuốn & Bánh Ướt Phú Lâm, bạn sẽ được đánh thức vị giác bởi những cuốn bánh nóng hổi mang đậm hương vị truyền thống. Đặc biệt, đừng bỏ lỡ bánh cuốn trứng lá dứa xanh tươi hay hoa đậu biếc tím biếc, vừa đẹp mắt vừa gói trọn cái tâm của người làm bếp. Mỗi suất bánh ướt đặc biệt hay bánh dày thơm lừng tại 1/1A Tân Hòa Đông đều là lời mời gọi chân thành, mang đến bữa ăn bình dị mà ấm áp cho mọi thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 54 AS restaurant_id, N'Phở Thắng - Quận 6 từ lâu đã là điểm hẹn quen thuộc cho những ai yêu mến hương vị phở bò truyền thống. Nước dùng ninh xương cô đọng, trong vắt cùng lát thịt tươi rói, mềm tan sẽ đánh thức mọi giác quan của bạn. Đến 224 Minh Phụng, thưởng thức tô phở ấm nóng, thơm lừng và cảm nhận trọn vẹn sự tinh túy của ẩm thực Việt Nam.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 55 AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối Quận 6 – điểm hẹn lý tưởng cho những buổi nhâm nhi ấm cúng. Tại đây, mỗi đĩa trứng gà non sốt mắm tắc chua cay hay răng mực cháy tỏi tóp mỡ giòn thơm đều là sự kết hợp hoàn hảo của hương vị đậm đà và nguyên liệu tươi ngon. Chúng tôi gửi gắm cả tâm huyết vào từng món ăn, mang đến trải nghiệm ẩm thực đường phố Sài Gòn đặc sắc, khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 56 AS restaurant_id, N'Chào mừng bạn đến Neko Izakaya Bar Quận 6, nơi phong vị Nhật Bản giao thoa cùng sự phóng khoáng của ẩm thực nhậu. Thưởng thức Cua Cà Mau sốt phô mai độc đáo hay Cá bò da nướng muối ớt đậm đà, mỗi món đều được chế biến từ hải sản tươi rói và cái tâm của người đầu bếp. Hãy cùng nhau nâng ly, sẻ chia khoảnh khắc vui vẻ trong không gian ấm cúng, để Neko Izakaya trở thành điểm đến lý tưởng cho những buổi tối đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 57 AS restaurant_id, N'Trong con hẻm nhỏ thân thương Quận 6, Ăn Vặt 3 Chị Em là điểm hẹn của những tâm hồn mê đồ chiên. Nơi đây, từng chiếc Chân Gà Rút Xương giòn rụm, từng miếng khoai tây hay gà viên lắc phô mai thơm lừng đều gói trọn tình yêu và bí quyết gia truyền. Hãy đến để cảm nhận hương vị tuổi thơ ấm áp và niềm vui sẻ chia không thể chối từ!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 58 AS restaurant_id, N'Cháo Ếch Singapore Geylang SD88 là điểm đến quen thuộc của thực khách Quận 6 để thưởng thức hương vị cháo ếch chuẩn Singapore trứ danh. Từng thố cháo nóng hổi quyện cùng thịt ếch ú nu thấm đẫm sốt, mang đến trải nghiệm vị giác khó quên. Đây không chỉ là bữa ăn ngon mà còn là không gian ấm cúng, chan chứa tình thân, nơi các gia đình tìm thấy niềm vui ẩm thực. Với 4.5 sao đánh giá, chúng tôi tự hào mang đến chất lượng và sự hài lòng trọn vẹn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 59 AS restaurant_id, N'Ẩn mình tại Quận 6, Cà Ri Vịt Bạc Liêu mang đến một góc nhỏ bình yên, nơi hương vị miền Tây sông nước được tái hiện trọn vẹn. Nồi cà ri vịt vàng óng, thơm lừng mùi sả và nước cốt dừa béo ngậy, từng miếng thịt vịt tươi ngon thấm đẫm gia vị độc đáo của xứ Bạc Liêu. Đây chính là món ăn ấm lòng, đậm đà khó quên mà bạn không thể bỏ lỡ. Mời bạn ghé 496/34 Hậu Giang để thưởng thức và cảm nhận!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 60 AS restaurant_id, N'Giữa nhịp sống hối hả của Quận 6, Gà Rán Và Mì Ý - Jollibee EC Hậu Giang mời gọi bạn ghé thăm để tận hưởng hương vị khó quên. Nơi đây, bạn sẽ khám phá sự hòa quyện tuyệt vời giữa gà rán giòn rụm và món Mì Ý sốt cay vừa đặc trưng, đủ sức lay động mọi giác quan. Với không gian ấm cúng và sự phục vụ tận tâm, chúng tôi mong muốn mang đến những bữa ăn ngon miệng, tràn đầy niềm vui, xứng đáng với đánh giá 4.5 sao từ thực khách thân yêu.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 61 AS restaurant_id, N'Tại Thắng Lợi Mì Gia, chúng tôi gói trọn tinh hoa ẩm thực Hoa trong từng bát mì và chiếc dimsum. Mì Vịt Tiềm danh tiếng với nước dùng tiềm bí truyền cùng thịt vịt mềm tan, hay những chiếc bánh bao xá xíu nóng hổi, đều được làm từ cái tâm của người đầu bếp. Hãy đến để cảm nhận không gian ấm cúng và thưởng thức hương vị đặc trưng đã làm nên thương hiệu 4.5 sao của chúng tôi suốt bao năm qua.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 62 AS restaurant_id, N'Chào mừng đến SOI THAI, nơi bạn tìm thấy một góc Thái Lan thu nhỏ ấm áp giữa lòng Quận 6. Mỗi món ăn đều được chế biến với cả tâm huyết, mang đến hương vị chua cay mặn ngọt hài hòa, đánh thức mọi giác quan. Từ những combo độc đáo như "Gác Lại Âu Lo" đến ly trà sữa thơm lừng, chúng tôi mời bạn cùng gia đình tận hưởng những khoảnh khắc ẩm thực trọn vẹn và đầy cảm xúc tại 79 Kinh Dương Vương.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 63 AS restaurant_id, N'Xôi Ghẹ 192 Quận 6 hân hoan chào đón bạn đến khám phá sự kết hợp độc đáo, nơi hạt xôi dẻo thơm hòa quyện cùng ghẹ tươi rói và hải sản vỏ giòn rụm. Mỗi suất ăn là tổng hòa của nguyên liệu tươi ngon chọn lọc và bí quyết gia truyền, mang đến hương vị đậm đà khó cưỡng. Ghé 200 Phạm Văn Chí để tận hưởng món xôi ghẹ chuẩn vị, bình dị mà ấm lòng, chắc chắn sẽ làm hài lòng cả những thực khách khó tính nhất.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 64 AS restaurant_id, N'Tại Cô Điệp, mỗi cuốn nem nướng Nha Trang là cả tâm huyết, chắt lọc tinh hoa biển cả mang về giữa lòng Quận 6. Hương vị nem vàng ruộm, thơm lừng cùng nước chấm bí truyền đã làm say lòng bao thực khách suốt bao năm qua. Ghé D36 Cư Xá Phú Lâm B để tận hưởng không gian ấm cúng và trải nghiệm ẩm thực Việt bình dị, đậm đà, chuẩn vị quê nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 65 AS restaurant_id, N'Chào mừng đến với Cơm Gà Hải Nam Tam Kỳ 142, nơi hương vị trứ danh Tam Kỳ được tái hiện trọn vẹn tại Quận 6. Từng đĩa cơm gà xé gỏi tươi ngon, miến trộn đậm đà hay cháo gà sánh mịn đều là kết tinh của nguyên liệu tuyển chọn và bí quyết gia truyền. Hãy ghé thăm để tận hưởng bữa ăn ấm cúng, đậm chất Việt và cảm nhận sự chân thành trong từng món ăn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 66 AS restaurant_id, N'Mì Cay Sasin Tân Phong Quận 7 là nơi bạn tìm thấy hương vị Hàn Quốc bình dân nhưng đầy lôi cuốn, với những món ăn đặc sản mang phong cách riêng không thể lẫn. Mỗi bát mì cay nóng hổi hay món ngon độc đáo đều được chế biến tỉ mỉ, gửi gắm trọn vẹn tâm huyết của người đầu bếp. Đến Sasin, bạn sẽ được thưởng thức ẩm thực ngon miệng trong một không gian ấm cúng, thân thuộc như chính ngôi nhà của mình.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 67 AS restaurant_id, N'Phan Rang Quán Quận 7 mang đến hương vị đặc sản miền biển nắng gió, được biến tấu tinh tế theo phong cách riêng của quán. Tại 399 Lê Văn Lương, mỗi món ăn là sự kết hợp của nguyên liệu tươi ngon và cái tâm gửi gắm trong từng công đoạn. Hãy ghé thăm để tận hưởng bữa cơm ấm cúng, đậm đà như nhà làm, một trải nghiệm ẩm thực chất Phan Rang đích thực giữa lòng Sài Gòn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 68 AS restaurant_id, N'Chào mừng bạn đến với Ốc Trứng Muối Quận 7 – nơi hương vị đặc trưng và không khí ấm cúng hòa quyện. Chúng tôi tự hào mang đến món ốc trứng muối trứ danh béo ngậy, cùng các loại hải sản tươi ngon chế biến theo phong cách rất riêng, đảm bảo sẽ làm hài lòng cả những vị giác khó tính nhất. Hãy ghé 109 Đường Số 79, P. Tân Quy để sẻ chia niềm vui ẩm thực bình dị và những khoảnh khắc thật đáng nhớ bên bạn bè, người thân nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 69 AS restaurant_id, N'Tại Link Ốc Quận 7, chúng tôi tự hào mang đến những món ốc và hải sản tươi rói, chế biến với công thức đặc biệt chỉ có tại Đường Số 10. Mỗi đĩa ăn không chỉ là món nhậu ngon mà còn là tâm huyết của người đầu bếp, kết nối những khoảnh khắc vui vẻ. Hãy ghé để thưởng thức hương vị độc đáo và cảm nhận sự ấm cúng như ở nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 70 AS restaurant_id, N'Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 - Phạm Hữu Lầu là điểm hẹn của những tâm hồn yêu ẩm thực. Mỗi tô bún riêu tại đây là sự kết hợp tinh tế của nước lèo đậm đà, riêu cua đồng tươi ngon và đặc biệt là tóp mỡ giòn tan, béo ngậy tạo nên hương vị có "một không hai". Chúng tôi đặt trọn vẹn cái tâm vào từng nguyên liệu, từng công đoạn để mang đến trải nghiệm khó quên. Ghé 269 Phạm Hữu Lầu để khám phá hương vị đã chinh phục hàng ngàn thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 71 AS restaurant_id, N'Chào mừng bạn đến Lẩu Cá Đuối 79k, nơi hương vị biển cả gói trọn trong nồi lẩu cá đuối chua cay, đậm đà khó quên. Mỗi món nhậu đặc sắc tại đây đều là sự kết hợp hoàn hảo giữa nguyên liệu tươi ngon và bí quyết chế biến riêng, tạo nên trải nghiệm ẩm thực Việt đầy bất ngờ. Dù là tụ họp bạn bè hay thư giãn cuối ngày, Lẩu Cá Đuối 79k hứa hẹn mang đến khoảnh khắc sum vầy ấm áp và vị giác bùng nổ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 72 AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, chúng tôi mời bạn khám phá thế giới hương vị đặc sản không lẫn vào đâu được. Mỗi món ăn là một tác phẩm mang đậm phong cách riêng, được tạo nên từ cái tâm và sự sáng tạo. Hãy để ly trà sữa thân quen và những món ngon đạt 4.8 sao tại Quận 7 này khơi gợi mọi giác quan của bạn trong không gian ấm cúng, gần gũi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 73 AS restaurant_id, N'Tại Trạm Mì Ý Dì Hiền Quận 7, bạn sẽ tìm thấy một góc Ý ấm cúng ngay giữa lòng Sài Gòn. Mỗi suất mì là sự kết hợp tinh tế của hương vị truyền thống và phong cách độc đáo của Dì Hiền, tạo nên những "đặc sản" riêng biệt, khó quên. Với cái tâm gửi gắm trong từng sợi mì, Dì Hiền mời bạn ghé 6 Đường 15 để thưởng thức bữa ăn ngon chuẩn vị và đầy ắp tình cảm.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 74 AS restaurant_id, N'Chào mừng bạn đến với Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN Quận 7, nơi mỗi món ăn là một câu chuyện về cái tâm và sự sáng tạo. Chúng tôi tự hào mang đến hương vị Bún Chả Hà Nội đậm đà và Nem Cua Bể giòn tan theo một phong cách riêng biệt, không thể tìm thấy ở nơi nào khác. Tại đây, bạn sẽ tìm thấy sự kết hợp hoàn hảo giữa nét truyền thống ấm áp và sự tinh tế hiện đại, trong không gian thân thuộc và gần gũi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 75 AS restaurant_id, N'Chào mừng đến Tacos Labubu Quận 7! Tại 145 Đường Số 17, chúng tôi tin rằng fastfood cũng có thể mang đậm dấu ấn riêng. Mỗi chiếc taco là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và công thức độc đáo, gửi gắm trọn vẹn tâm huyết của người đầu bếp. Hãy đến và khám phá những hương vị đặc trưng chỉ có tại Labubu, nơi bạn luôn được chào đón.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 76 AS restaurant_id, N'Đến Chicken 3S Nguyễn Thị Thập để khám phá thế giới gà rán xốt Hàn giòn tan, đượm vị và những tô mì cay bùng nổ trứ danh. Mỗi món ăn tại đây là sự kết hợp hoàn hảo của bí quyết riêng và cái tâm người đầu bếp, mang đến trải nghiệm ẩm thực chuẩn Hàn nhưng rất riêng của Chicken 3S. Không gian ấm áp, thân thiện chắc chắn sẽ là điểm đến lý tưởng cho những bữa ăn gia đình tràn ngập tiếng cười. Hãy để chúng tôi mang đến cho bạn những khoảnh khắc ngon khó quên!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 77 AS restaurant_id, N'Tại Tứ Quý Trà - Carameo Machiato Quận 7, mỗi góc nhỏ đều ấp ủ sự ấm cúng và những bất ngờ vị giác. Nơi đây, bạn sẽ được thưởng thức các món đặc sản đậm đà, mang dấu ấn riêng biệt được chế biến bằng cả tấm lòng. Hãy đến trải nghiệm ly Carameo Machiato thơm lừng hay bữa ăn ngon miệng, để cảm nhận một khoảnh khắc yên bình và tràn đầy năng lượng cho ngày mới.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 78 AS restaurant_id, N'Tại Chiang Thai Delivery Quận 7, mỗi món ăn là một câu chuyện hương vị Thái được kể bằng bí quyết riêng, gửi gắm trọn vẹn cái tâm của người đầu bếp. Từ vị chua cay nồng nàn đến béo ngậy đậm đà, bạn sẽ được trải nghiệm bản giao hưởng ẩm thực tinh túy, độc đáo ngay tại nhà. Hơn cả một bữa ăn, đây là trải nghiệm 4.8 sao ấm áp, chuẩn vị Thái và rất riêng của chúng tôi dành cho bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 79 AS restaurant_id, N'Tìm một góc nhỏ ấm cúng giữa Quận 7 để xoa dịu tâm hồn? Tiệm Fulleaf là điểm hẹn lý tưởng! Chúng tôi tự hào mang đến những món đặc sản mang phong cách riêng, được gửi gắm trọn vẹn tâm tình để bạn khám phá những hương vị độc đáo, khó quên. Hãy ghé Tiệm Fulleaf để cảm nhận sự ấm áp và khởi đầu một hành trình ẩm thực đầy cảm hứng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 80 AS restaurant_id, N'Giữa nhịp sống Lotte Mart Quận 7, Gangnam Tanghulu là điểm dừng chân lý tưởng để bạn khám phá những hương vị Á Châu độc đáo, được chế biến với tâm huyết riêng. Từng viên kẹo hồ lô giòn tan ngọt lịm hay các đặc sản khác tại đây đều là hành trình vị giác đầy mê hoặc, mang đến trải nghiệm khó quên. Với đánh giá 4.7/5 sao, chúng tôi mời bạn đến thưởng thức và cảm nhận sự khác biệt trong từng món ăn chuẩn vị, ấm cúng và đầy cảm hứng.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 81 AS restaurant_id, N'Pave Glace Chocolate Quận 7 không chỉ là điểm đến của những tín đồ yêu ngọt, mà còn là nơi mỗi hương vị kể một câu chuyện. Chúng tôi tỉ mỉ tạo nên những đặc sản chocolate và dessert độc đáo, mang đậm phong cách riêng, gói trọn tinh hoa và cái tâm người làm. Từng chiếc bánh, viên kẹo là lời mời gọi ngọt ngào để bạn tự thưởng hoặc trao gửi những món quà ý nghĩa nhất.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 82 AS restaurant_id, N'Tại Tacos Nhà Labubu 149, mỗi chiếc taco là một tác phẩm nghệ thuật vị giác, mang đậm dấu ấn riêng biệt mà bạn sẽ khó tìm thấy ở bất cứ đâu. Chúng tôi đặt trọn tâm huyết vào từng nguyên liệu, từng công đoạn, để mang đến những "đặc sản" fastfood không chỉ ngon mà còn đầy cảm hứng. Hãy ghé 149 Phạm Hữu Lầu để tự mình khám phá hương vị độc đáo và cảm nhận sự ấm áp, gần gũi như chính ngôi nhà của mình nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 83 AS restaurant_id, N'Tại Tacos Nhà LuXaBu, 335 Nguyễn Hữu Thọ, Quận 7, chúng tôi tự hào mang đến những chiếc taco fastfood bình dân nhưng ẩn chứa hương vị "độc quyền" khó quên. Mỗi chiếc bánh là câu chuyện của sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết riêng, gói trọn tâm huyết người làm. Đến với "Nhà LuXaBu", bạn không chỉ thưởng thức món ăn mà còn cảm nhận sự ấm áp, khác biệt làm nên 4.2 sao của chúng tôi. Ghé ngay để trải nghiệm nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 84 AS restaurant_id, N'Tacos Xin Chào mời bạn khám phá thế giới hương vị đặc trưng, nơi mỗi chiếc taco là một tác phẩm ẩm thực độc đáo, gói trọn tâm huyết và công thức bí truyền của quán. Tại 333 Nguyễn Hữu Thọ, chúng tôi chào đón bạn bằng sự nồng hậu và những món ăn chuẩn 4.8 sao, biến fastfood bình dân thành trải nghiệm khó quên. Ghé ngay để cảm nhận sự tươi ngon, bùng nổ và sự ấm áp trong từng cuốn bánh!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 85 AS restaurant_id, N'Chào mừng bạn đến Bánh Mì Pate Hải Phòng Quận 7 – nơi tinh hoa ẩm thực đất Cảng được gửi gắm trọn vẹn trong từng món ăn. Với phần pate độc quyền, béo ngậy, thơm lừng cùng bí quyết riêng, mỗi chiếc bánh mì hay đặc sản khác tại 141 Đường Số 1 đều là một trải nghiệm vị giác khó quên. Hãy ghé để cảm nhận hương vị thân quen mà độc đáo, được chúng tôi chuẩn bị bằng cả tấm lòng và sự tỉ mỉ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 86 AS restaurant_id, N'Chào mừng bạn đến với A Duy Food Quận 7, nơi hương vị Việt truyền thống được nâng tầm bằng cái tâm và bí quyết riêng của gia đình. Từng miếng gà quay, sườn quay vàng óng hay hạt cơm lam dẻo thơm đều gói trọn tinh hoa, mang đến bữa ăn ấm cúng như nhà làm. Đây chính là điểm đến lý tưởng cho những bữa ăn sum vầy, mang đậm bản sắc ẩm thực riêng của A Duy Food. Hãy ghé 163 Nguyễn Thị Thập để thưởng thức và cảm nhận sự khác biệt đã làm nên thương hiệu được yêu mến.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 87 AS restaurant_id, N'Đến Ola Tacos Quận 7, bạn sẽ được thưởng thức những chiếc taco mang hương vị rất riêng, là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và bí quyết chế biến đầy tâm huyết. Chúng tôi tin rằng mỗi món ăn không chỉ làm no bụng mà còn phải chạm đến vị giác, để lại ấn tượng khó quên. Ghé 50 Đường Số 10 để trải nghiệm sự tận tâm và khám phá phong cách ẩm thực độc đáo của chúng tôi ngay hôm nay!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 88 AS restaurant_id, N'Chào mừng bạn đến với LaSiMi Quận 7 – Trà Ngon Đậm Vị, một góc nhỏ bình yên tại 147c Đường Số 17. Nơi đây, bạn sẽ được thưởng thức những ly trà chuẩn vị, đậm đà cùng các món ăn đặc sản được chế biến theo phong cách riêng đầy sáng tạo. Mỗi hương vị đều được gửi gắm cái tâm của đội ngũ, hứa hẹn mang lại trải nghiệm ấm cúng, khó quên. Ghé LaSiMi để cảm nhận sự khác biệt và nạp năng lượng cho ngày mới!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 89 AS restaurant_id, N'Sâm Chill Me Lý Phục Man mời bạn ghé thăm góc nhỏ bình yên giữa lòng Quận 7, nơi hương vị đặc sản được thổi hồn theo phong cách riêng đầy sáng tạo. Mỗi món ăn, thức uống tại đây đều là một câu chuyện ấm áp, khơi gợi ký ức và đánh thức vị giác của bạn. Hãy đến để tìm một không gian thư thái, thưởng thức những bữa ăn ngon lành mang đậm dấu ấn riêng không thể lẫn vào đâu được.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 90 AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm dừng chân lý tưởng cho những tâm hồn yêu ẩm thực Hàn Quốc bình dân. Tại đây, bạn sẽ khám phá những món đặc sản được chế biến theo phong cách Sasin độc đáo, nơi vị cay nồng ấm lòng hòa quyện cùng hương vị riêng biệt khó cưỡng. Từng tô mì, từng món ăn đều là thành quả của sự tận tâm, mang đến trải nghiệm vị giác bùng nổ và cảm giác ấm áp như ở nhà. Hãy ghé 69 Đường số 1 để tự mình trải nghiệm bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 91 AS restaurant_id, N'Tại Phan Rang Quán Quận 7, chúng tôi chắt chiu tinh hoa ẩm thực Phan Rang, mang hương vị biển cả và nắng gió đặc trưng về giữa lòng Sài Gòn. Mỗi món đặc sản tại 399 Lê Văn Lương là một câu chuyện về sự tận tâm, được chế biến theo phong cách riêng, vừa quen vừa lạ. Hãy đến để thưởng thức vị ngon khó quên, nơi mỗi đĩa ăn đều là lời mời gọi ấm áp như bữa cơm nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 92 AS restaurant_id, N'Tại Ốc Trứng Muối - Quận 7, chúng tôi mang đến hương vị hải sản bình dị nhưng đầy cuốn hút. Nổi bật là các món ốc tươi rói đượm sốt trứng muối béo ngậy, sánh mịn theo công thức gia truyền, đánh thức mọi giác quan. Mỗi món ăn là tâm huyết, là niềm vui được sẻ chia, mời bạn ghé 109 Đường Số 79 để cùng khám phá và tận hưởng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 93 AS restaurant_id, N'Đến Link Ốc Quận 7 - Đường Số 10, bạn sẽ khám phá thế giới hải sản tươi ngon được biến tấu đầy sáng tạo, mang đậm phong cách riêng của quán. Mỗi món ăn là sự kết hợp tinh tế của nguyên liệu tuyển chọn và tâm huyết người đầu bếp, tạo nên hương vị đặc trưng khó quên. Trong không gian ấm cúng, rộn rã tiếng cười, đây là điểm hẹn lý tưởng để bạn cùng bạn bè thưởng thức những bữa nhậu chất lừ. Mời bạn ghé 1 Đường Số 10 để cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 94 AS restaurant_id, N'Khám phá Bún Riêu Tóp Mỡ Đặc Biệt Quận 7, nơi mỗi tô bún là sự kết tinh của hương vị truyền thống và cái tâm của người nấu. Nước lèo riêu cua đồng chuẩn vị, thanh ngọt, quyện cùng tóp mỡ vàng giòn rụm béo ngậy, tạo nên nét đặc trưng khó quên. Dù bình dân, không gian ấm cúng tại 269 Phạm Hữu Lầu luôn chào đón bạn ghé đến để thưởng thức tinh hoa ẩm thực đã làm hài lòng bao thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 95 AS restaurant_id, N'Lẩu Cá Đuối 79k mời gọi bạn khám phá hương vị biển cả tươi rói, thấm đẫm trong từng miếng cá đuối ngọt thanh cùng nước lẩu chua cay đậm đà, chuẩn phong cách riêng của quán. Mỗi món đặc sản Việt tại đây đều được chế biến bằng cả tấm lòng, mang đến trải nghiệm nhậu hấp dẫn và trọn vẹn. Hãy ghé 621 Nguyễn Thị Thập, Quận 7 để tận hưởng không gian ấm cúng và những khoảnh khắc sum vầy thật đáng nhớ cùng người thân, bạn bè.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 96 AS restaurant_id, N'Bước vào Trà Sữa MayCha - Yola, Quận 7, bạn sẽ tìm thấy một không gian ấm cúng, thân quen giữa phố thị. Nơi đây mời gọi thực khách với những ly trà sữa MayCha thơm lừng, cùng các món ăn đặc sản mang phong vị riêng độc đáo, được chế biến bằng tất cả tâm huyết. Mỗi hương vị đều là câu chuyện, mang đến trải nghiệm khó quên và cảm giác được chào đón như về nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 97 AS restaurant_id, N'Trạm Mì Ý Dì Hiền Quận 7 là điểm hẹn lý tưởng cho những tín đồ ẩm thực Ý bình dân, nơi mỗi món ăn đều được "biến hóa" theo phong cách rất riêng của Dì Hiền. Từ những sợi mì dai ngon đến sốt kem béo ngậy, tất cả đều thấm đượm hương vị đặc trưng khó quên. Dì Hiền đã gửi gắm cả tâm huyết vào từng suất ăn, mang đến trải nghiệm ấm áp như bữa cơm nhà. Hãy đến 6 Đường 15 và cảm nhận sự khác biệt bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 98 AS restaurant_id, N'ICHI QUÁN mang trọn tinh hoa ẩm thực Hà Nội đến giữa lòng Sài Gòn, đặc biệt với Bún Chả và Nem Cua Bể chuẩn vị truyền thống. Mỗi món ăn là kết tinh của nguyên liệu tươi ngon và bí quyết gia truyền, được nêm nếm bằng cả tấm lòng, tạo nên hương vị đặc trưng rất riêng. Ghé thăm ICHI QUÁN tại Quận 7, bạn sẽ tìm thấy một không gian ấm cúng để thưởng thức những đặc sản đậm đà, gợi nhớ về chút hồn quê Bắc Bộ trong từng miếng ăn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 99 AS restaurant_id, N'Đến với Tacos Labubu Quận 7 - Đường Số 17, bạn sẽ tìm thấy những chiếc taco fastfood mang phong cách riêng có một không hai. Mỗi hương vị là sự kết hợp tinh tế của nguyên liệu tươi ngon và cái tâm của người đầu bếp, tạo nên trải nghiệm ẩm thực bùng nổ mà vẫn gần gũi. Ghé ngay để tự mình cảm nhận sự khác biệt và tận hưởng bữa ăn ấm cúng, đậm đà chỉ có tại Labubu!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 100 AS restaurant_id, N'Ghé Chicken 3S để cảm nhận hương vị Hàn Quốc đích thực gói trọn trong từng miếng gà rán giòn tan hay tô mỳ cay xì xụp. Tại 475A Nguyễn Thị Thập, chúng tôi không chỉ phục vụ món ăn mà còn là nơi gắn kết gia đình, bạn bè qua những hương vị đặc trưng, đầy tâm huyết. Mỗi bữa ăn là một câu chuyện ấm áp, mời gọi bạn đến thưởng thức và cảm nhận sự khác biệt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 101 AS restaurant_id, N'Tứ Quý Trà - Carameo Machiato Quận 7 mời gọi bạn ghé thăm một không gian bình yên giữa lòng Quận 7 nhộn nhịp. Tại đây, bạn sẽ được thưởng thức Carameo Machiato ngọt ngào cùng những món đặc sản độc đáo, mang đậm dấu ấn riêng của quán. Mỗi hương vị đều được ủ ấp từ cái tâm người nấu, hứa hẹn mang đến một trải nghiệm ẩm thực ấm áp và khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 102 AS restaurant_id, N'Chào mừng đến với Chiang Thai Delivery Quận 7, nơi mỗi món ăn là một tấm vé đưa bạn phiêu lưu đến xứ sở Chùa Vàng. Với hương vị Thái chuẩn mực được biến tấu đầy sáng tạo, chúng tôi tự hào mang đến những trải nghiệm ẩm thực độc đáo khó quên. Mỗi nguyên liệu tươi ngon đều được chọn lựa tỉ mỉ, gửi gắm trọn vẹn tâm huyết của người đầu bếp để tạo nên những món đặc sản riêng biệt, đậm đà khó cưỡng. Hãy để Chiang Thai Delivery đánh thức mọi giác quan và làm ấm lòng bạn ngay hôm nay!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 103 AS restaurant_id, N'Tiệm Fulleaf Quận 7 mời bạn ghé thăm một góc nhỏ bình yên, nơi mỗi món ăn đặc sản đều được ấp ủ bằng cả tấm lòng. Từ ly cà phê đậm đà đến hương vị riêng biệt của thực đơn độc đáo, chúng tôi tin rằng trải nghiệm ẩm thực tại đây sẽ đánh thức mọi giác quan. Hãy để Fulleaf kể bạn nghe câu chuyện của vị giác và sự ấm áp.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 104 AS restaurant_id, N'Tại Gangnam Tanghulu, chúng tôi mời bạn khám phá thế giới ẩm thực Á Châu mang đậm phong cách riêng, ngay tại Lotte Mart Quận 7. Mỗi món đặc sản đều được chế biến bằng cả tâm huyết, từ vị mặn đậm đà đến những xiên Tanghulu giòn rụm ngọt ngào, hứa hẹn mang đến trải nghiệm vị giác khó quên. Ghé thăm để tận hưởng những hương vị độc đáo, bình dị mà đầy cuốn hút!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 105 AS restaurant_id, N'Tại Pave Glace Chocolate Quận 7, mỗi món tráng miệng không chỉ là hương vị mà còn là cả một câu chuyện ngọt ngào từ tâm huyết. Chúng tôi tự hào mang đến những đặc sản độc đáo, được chế biến tỉ mỉ với phong cách riêng biệt, đánh thức mọi giác quan. Ghé thăm để đắm chìm trong thế giới dessert đầy mê hoặc và chọn cho mình, hoặc người thân, món quà ý nghĩa nhất!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 106 AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi mỗi chiếc taco là một khám phá vị giác đầy bất ngờ! Dù là fast food bình dân, chúng tôi tự hào mang đến những hương vị đặc trưng, được chế biến bằng tất cả cái tâm và sự sáng tạo riêng biệt. Ghé 149 Phạm Hữu Lầu, Quận 7 để trải nghiệm những món đặc sản "có một không hai" và cảm nhận sự ấm áp, gần gũi như ở nhà nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 107 AS restaurant_id, N'Chào mừng đến Tacos Nhà LuXaBu 335 Nguyễn Hữu Thọ! Tại đây, mỗi chiếc taco không chỉ là fastfood mà là cả tâm huyết, biến tấu thành "đặc sản" riêng của nhà. Hương vị độc đáo, quen mà lạ, đủ sức khơi gợi mọi giác quan ngay lần thử đầu tiên. Ghé LuXaBu để trải nghiệm sự ấm áp và ngon miệng khó quên!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 108 AS restaurant_id, N'Tacos Xin Chào mời bạn đến khám phá thế giới hương vị taco đặc sắc, nơi mỗi món ăn là sự kết hợp tinh tế của truyền thống và sáng tạo. Với cái tâm của người đầu bếp, chúng tôi mang đến những trải nghiệm ẩm thực nhanh gọn mà vẫn đậm đà, khó quên. Tại Tacos Xin Chào, bạn sẽ luôn được chào đón bằng vị ngon 4.8 sao và sự ấm áp từ những món đặc sản riêng biệt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 109 AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến hương vị Hải Phòng trứ danh giữa lòng Sài Gòn. Mỗi ổ bánh mì pate, mỗi món đặc sản đều được chế biến với tâm huyết, giữ trọn nét truyền thống và pha chút biến tấu riêng đầy tinh tế. Ghé 141 Đường Số 1, bạn sẽ tìm thấy sự ấm áp trong từng món ăn bình dị, ngon miệng và chân thành.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 110 AS restaurant_id, N'A Duy Food Quận 7 hân hạnh mang đến những bữa ăn đậm đà hương vị Việt, nơi gà quay giòn tan và sườn quay thơm lừng được chế biến bằng bí quyết gia truyền cùng tất cả tâm huyết. Cơm lam dẻo ngọt quyện trong từng miếng thịt sẽ đánh thức ký ức về những bữa cơm gia đình ấm cúng. Trải nghiệm hương vị chuẩn nhà làm đã làm nên đánh giá 4.7 sao tuyệt vời, chỉ có tại 163 Nguyễn Thị Thập.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 111 AS restaurant_id, N'Tìm kiếm một bữa ăn nhanh gọn nhưng đầy bất ngờ về hương vị tại Quận 7? Ola Tacos Quận 7 chính là điểm dừng chân lý tưởng của bạn tại 50 Đường Số 10. Tại đây, chúng tôi tự hào mang đến những món đặc sản Tacos được biến tấu theo phong cách riêng, mỗi miếng đều đong đầy tâm huyết và sự sáng tạo. Hãy đến và cảm nhận sự khác biệt trong từng hương vị, nơi ẩm thực bình dân được nâng tầm để mọi khoảnh khắc ăn uống đều là một trải nghiệm đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 112 AS restaurant_id, N'Chào mừng bạn đến LaSiMi Quận 7, nơi mỗi tách trà đậm vị và món đặc sản phong cách riêng đều ẩn chứa sự tận tâm. Tại không gian bình dị, ấm cúng của chúng tôi, bạn sẽ tìm thấy những hương vị độc đáo, được hàng ngàn thực khách tin yêu và đánh giá 4.9/5 sao. Hãy ghé thăm LaSiMi để tận hưởng những phút giây thư thái và ngon miệng trọn vẹn!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 113 AS restaurant_id, N'Giữa nhịp sống Quận 7 hối hả, Sâm Chill Me tại 89 Lý Phục Man là chốn dừng chân lý tưởng để bạn tìm lại sự an yên. Chúng tôi tự hào mang đến những món đặc sản độc đáo, được chế biến bằng tất cả tâm huyết và nguyên liệu tươi ngon nhất. Mỗi hương vị tại Sâm Chill Me là một câu chuyện riêng biệt, mời bạn đến thưởng thức và cảm nhận sự thư thái lan tỏa. Hãy ghé thăm để "chill" và nạp năng lượng cùng chúng tôi!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 114 AS restaurant_id, N'Bạn đã sẵn sàng cho một cuộc phiêu lưu vị giác chưa? Mì Cay Sasin - Tân Phong Quận 7 chào đón bạn đến với thế giới ẩm thực Hàn Quốc bình dân nhưng đầy tinh hoa, nơi mỗi món ăn là một câu chuyện hương vị độc đáo. Từ bát mì cay nồng hít hà đến những món đặc sản trứ danh, tất cả đều được chúng tôi gửi gắm sự tận tâm, hứa hẹn một bữa ăn ấm áp và khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 115 AS restaurant_id, N'Phan Rang Quán Quận 7 tự hào mang đến những món đặc sản đậm đà hương vị quê hương, được chế biến bằng cả tấm lòng và phong cách riêng biệt. Mỗi món ăn là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết truyền thống, khơi gợi ký ức đẹp về ẩm thực Phan Rang. Đến với không gian bình dị, ấm cúng của chúng tôi, bạn sẽ được thưởng thức bữa ăn ngon như nhà làm, tràn đầy sự chân thành và gần gũi. Hãy để Phan Rang Quán Quận 7 đánh thức vị giác của bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 116 AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 17 Quận 7, chúng tôi mời bạn ghé thăm một không gian bình dị, ấm cúng nhưng đầy ắp hương vị biển cả tươi ngon. Từng con ốc được chọn lọc kỹ càng, biến tấu khéo léo, đặc biệt là món ốc trứng muối trứ danh với sốt sánh mịn, béo ngậy đậm đà, khó cưỡng. Đó là sự kết hợp hoàn hảo giữa hải sản tươi rói và công thức riêng biệt, tạo nên những trải nghiệm ẩm thực độc đáo, chỉ có tại quán.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 117 AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 mời bạn khám phá thế giới ốc Sài Gòn với phong vị độc đáo có một không hai. Từng món đặc sản tại đây là sự kết tinh của nguyên liệu tươi ngon và bí quyết riêng, mang đến trải nghiệm vị giác bùng nổ, khiến bạn phải xuýt xoa. Hãy ghé Link Ốc để tận hưởng không gian ấm cúng, tiếng cười rộn rã và những khoảnh khắc sum vầy bên bàn tiệc đậm đà hương vị biển cả.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 118 AS restaurant_id, N'Tọa lạc trên con đường Phạm Hữu Lầu, Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 đã trở thành điểm đến quen thuộc của thực khách gần xa. Nồi nước lèo riêu cua chuẩn vị, thơm lừng quyện cùng những miếng tóp mỡ giòn rụm độc đáo tạo nên hương vị bún riêu khó cưỡng, không lẫn vào đâu được. Từng tô bún đều được chế biến bằng cả cái tâm, mang đến trải nghiệm ẩm thực ấm áp, đậm đà hương vị truyền thống mà bạn nhất định phải thử.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 119 AS restaurant_id, N'Ghé Lẩu Cá Đuối 79k để khám phá hương vị lẩu cá đuối chua cay, đậm đà làm say lòng người. Mỗi món ăn tại đây đều là một đặc sản được chế biến với tâm huyết, mang đến trải nghiệm nhậu chuẩn vị Việt. Không gian ấm cúng, thoáng đãng tại Quận 7 sẽ là nơi lý tưởng để bạn bè, gia đình sum vầy và tận hưởng những khoảnh khắc tuyệt vời bên nhau.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 120 AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, không chỉ có những ly trà sữa thơm ngon mà còn là cả một thế giới ẩm thực đặc sắc đang chờ bạn khám phá. Chúng tôi tự hào mang đến các món ăn đặc sản đậm phong cách riêng, được chế biến tỉ mỉ với tất cả tâm huyết. Hãy ghé thăm không gian ấm áp của chúng tôi để thưởng thức hương vị tuyệt vời và cảm nhận sự khác biệt mà MayCha mang lại!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 121 AS restaurant_id, N'Ghé Trạm Mì Ý Dì Hiền Quận 7 để khám phá không gian bình dị, ấm cúng và những đĩa mì Ý đậm đà phong cách rất riêng của Dì. Mỗi món ăn là tâm huyết được gửi gắm tỉ mẩn, từ sợi mì dai ngon đến sốt sánh mịn, mang đến hương vị đặc sắc khó quên. Dù bình dân, quán vẫn giữ trọn vẹn chất lượng đỉnh cao, chờ bạn ghé 6 Đường 15 trải nghiệm sự khác biệt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 122 AS restaurant_id, N'Tại Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN, chúng tôi tự hào mang đến hương vị chuẩn mực của tinh hoa ẩm thực Bắc Bộ giữa lòng Sài Gòn. Mỗi món ăn không chỉ là công thức mà còn là cái tâm, là sự tỉ mỉ trong từng nguyên liệu và cách chế biến riêng biệt, làm nên nét đặc trưng không thể trộn lẫn. Dù là bữa trưa vội vã hay khoảnh khắc quây quần, ICHI QUÁN ở Quận 7 luôn sẵn sàng chào đón bạn bằng không gian ấm cúng và những món ăn đậm đà, khó quên. Hãy đến và cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 123 AS restaurant_id, N'Đến Tacos Labubu Đường Số 17, bạn sẽ khám phá những chiếc taco mang phong cách riêng đầy bất ngờ, gói trọn hương vị độc đáo không thể tìm thấy ở nơi khác. Mỗi miếng cắn là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết đặc trưng, được tạo nên từ tâm huyết của người đầu bếp. Một điểm hẹn ẩm thực bình dân nhưng lại chứa đựng cả thế giới hương vị đang chờ bạn khám phá.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 124 AS restaurant_id, N'Tại Chicken 3S, mỗi món ăn là một câu chuyện tình yêu với ẩm thực Hàn Quốc. Từ miếng gà rán giòn tan đẫm sốt độc quyền, đến tô mỳ cay chuẩn vị làm ấm lòng, chúng tôi luôn đặt trọn tâm huyết để mang đến trải nghiệm vị giác khó quên. Hãy cùng gia đình và bạn bè tận hưởng không gian ấm cúng, thưởng thức những hương vị đặc sắc chỉ có tại 475A Nguyễn Thị Thập, Quận 7!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 125 AS restaurant_id, N'Tại 79A Đường 79, Quận 7, Tứ Quý Trà mở ra một không gian ấm cúng, nơi bạn tìm thấy sự bình yên giữa phố thị. Nổi tiếng với Carameo Machiato ngọt ngào và những món đặc sản mang phong vị riêng độc đáo, mỗi hương vị tại đây đều được ấp ủ bằng tâm huyết của người đầu bếp. Hãy đến để cảm nhận trọn vẹn sự tinh tế trong từng món ăn và thức uống, tạo nên những khoảnh khắc đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 126 AS restaurant_id, N'Tại Chiang Thai Delivery - Quận 7, chúng tôi tin rằng ẩm thực là câu chuyện của đam mê và hương vị. Mỗi món đặc sản Thái được chế biến tỉ mỉ bằng công thức riêng, gói trọn vị chua cay mặn ngọt hài hòa, khó quên. Với đánh giá 4.8/5 sao từ thực khách, hãy để Chiang Thai mang tinh hoa xứ sở Chùa Vàng đến tận cửa nhà bạn, thắp lên niềm vui trong từng bữa ăn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 127 AS restaurant_id, N'Chào mừng bạn đến Tiệm Fulleaf - chốn bình yên giữa Quận 7! Nơi đây không chỉ là một quán cà phê thân thiện mà còn là điểm hẹn của những hương vị độc đáo. Mỗi món đặc sản tại Fulleaf được chế biến với tất cả tâm huyết, mang đậm phong cách riêng, hứa hẹn đánh thức mọi giác quan của bạn. Hãy đến để thưởng thức và cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 128 AS restaurant_id, N'Chào mừng đến Gangnam Tanghulu - Lotte Mart Quận 7, nơi hương vị Á Châu bình dị gặp gỡ sự sáng tạo độc đáo. Chúng tôi tự hào mang đến thực đơn các món đặc sản theo phong cách riêng, mỗi suất ăn là một câu chuyện về nguyên liệu tươi ngon và bí quyết được gửi gắm trọn vẹn. Hãy ghé thăm để tận hưởng không gian ấm cúng và những trải nghiệm ẩm thực khó quên, chắc chắn sẽ khiến bạn muốn quay lại.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 129 AS restaurant_id, N'Pave Glace Chocolate Quận 7 là chốn dừng chân ngọt ngào, nơi mỗi món tráng miệng kể câu chuyện của đam mê. Từng thanh chocolate, từng chiếc bánh đặc sản độc đáo đều được làm thủ công với cả tâm huyết, mang đến hương vị không lẫn vào đâu được. Ghé số 98 Đường 65 để đắm mình trong vị ngọt tinh tế và tìm những món quà ý nghĩa nhất.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 130 AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi những chiếc taco không chỉ là món ăn mà còn là cả một "phòng thí nghiệm" hương vị đầy sáng tạo. Tại đây, mỗi chiếc bánh là sự kết hợp tinh tế của nguyên liệu tươi ngon và bí quyết độc đáo, mang đậm phong cách Labubu không lẫn vào đâu được. Dù bạn là tín đồ fastfood hay mê mẩn ẩm thực đường phố, hãy ghé 149 Phạm Hữu Lầu để tự mình khám phá món ngon và cảm nhận sự ấm áp, thân quen như ở nhà nhé.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 131 AS restaurant_id, N'Dừng chân tại 335 Nguyễn Hữu Thọ, Tacos Nhà LuXaBu mời bạn khám phá thế giới Tacos "độc quyền" đậm chất riêng, nơi mỗi chiếc bánh là một câu chuyện hương vị. Với bí quyết gia truyền và nguyên liệu tươi ngon, chúng tôi gói trọn cái tâm vào từng nhân bánh đầy đặn, vỏ giòn tan cùng nước sốt bí truyền khó cưỡng. Dù là fastfood bình dân, chúng tôi tin rằng trải nghiệm ẩm thực phải thật đặc biệt và đáng nhớ. Ghé LuXaBu ngay để cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 132 AS restaurant_id, N'Chào bạn đến với Tacos Xin Chào! Nơi những chiếc taco không chỉ là món ăn nhanh, mà là một hành trình vị giác đầy bất ngờ với phong cách riêng biệt. Mỗi miếng nhân đậm đà, vỏ bánh giòn tan đều gói trọn tâm huyết, mang đến hương vị khó quên mà bạn sẽ muốn quay lại mãi. Ghé 333 Nguyễn Hữu Thọ, Quận 7 để tự mình khám phá tinh hoa ẩm thực đường phố!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 133 AS restaurant_id, N'Ngay tại Quận 7, Bánh Mì Pate Hải Phòng - 141 Đường Số 1 tự hào mang đến hành trình vị giác đậm đà hương vị miền biển. Mỗi chiếc bánh mì giòn rụm hay những món đặc sản tại đây đều được chế biến bằng cả tấm lòng, gìn giữ nét tinh hoa ẩm thực Hải Phòng. Ghé thăm để cảm nhận sự ấm cúng và thưởng thức những món ăn đặc sắc, chất lượng chuẩn nhà làm trong không gian thân quen.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 134 AS restaurant_id, N'Chào mừng đến A Duy Food Quận 7, nơi hương vị truyền thống Việt Nam hòa quyện trong không gian ấm cúng. Tại đây, gà quay giòn rụm, sườn quay đậm đà và cơm lam dẻo thơm mang phong vị độc đáo được chế biến từ tâm huyết của những người đầu bếp. Hãy ghé A Duy để trải nghiệm bữa cơm gia đình tròn vị, ấm áp như mẹ nấu.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 135 AS restaurant_id, N'Chào bạn ghé Ola Tacos Quận 7! Chúng tôi tự hào mang đến những hương vị đặc trưng có 1-0-2, nơi mỗi chiếc bánh đều là sự kết tinh của công thức riêng và cái tâm người đầu bếp. Dù là bữa ăn nhanh, bạn sẽ luôn tìm thấy sự ấm áp, chuẩn vị và đầy bất ngờ trong từng món. Ghé 50 Đường Số 10 để tự mình khám phá nét ẩm thực riêng có này nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 136 AS restaurant_id, N'LaSiMi Quận 7 tại Đường Số 17 là điểm dừng chân lý tưởng để thưởng thức trà ngon đậm vị và khám phá những món đặc sản độc đáo. Mỗi hương vị tại đây đều được chế biến bằng tất cả sự tận tâm, mang đến trải nghiệm ẩm thực vừa quen thuộc vừa đầy bất ngờ. Đến với LaSiMi, bạn không chỉ ăn ngon mà còn cảm nhận được sự ấm áp, thân tình như trở về nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 137 AS restaurant_id, N'Sâm Chill Me Lý Phục Man mời bạn ghé thăm một không gian bình dị nhưng tràn đầy hương vị độc đáo tại Quận 7. Mỗi món ăn đặc sản tại đây đều được chế biến bằng cả tâm huyết, mang đến sự kết hợp tinh tế giữa truyền thống và phong cách riêng đầy sáng tạo. Hãy để Sâm Chill Me đưa bạn vào hành trình khám phá ẩm thực thư thái, nơi mọi giác quan được đánh thức và bạn tìm thấy một góc "chill" thật sự.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 138 AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 mở cửa đón bạn vào thế giới ẩm thực Hàn Quốc bình dân đầy lôi cuốn. Từng tô mì cay bùng vị, đậm đà theo phong cách Sasin độc đáo, được chế biến bằng cả tâm huyết, chắc chắn sẽ khiến mọi giác quan của bạn thức tỉnh. Đến Sasin, không chỉ là ăn mà còn là trải nghiệm không gian ấm cúng và hương vị đặc trưng chỉ tìm thấy ở đây.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 139 AS restaurant_id, N'Chào mừng đến Phan Rang Quán Quận 7! Tại 399 Lê Văn Lương, chúng tôi gói trọn tinh hoa ẩm thực Việt bình dân trong từng món đặc sản đậm đà hương vị độc đáo. Mỗi món ăn là một câu chuyện được kể bằng cả tấm lòng, qua bàn tay tài hoa cùng bí quyết riêng, mang đến trải nghiệm ấm cúng như nhà. Ghé thăm để cảm nhận sự khác biệt đã làm nên đánh giá 4.7/5 sao của chúng tôi!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 140 AS restaurant_id, N'Tại Ốc Trứng Muối Quận 7, chúng tôi mang đến trải nghiệm ẩm thực bình dân độc đáo, nơi hương vị biển cả tươi rói hòa quyện hoàn hảo cùng sốt trứng muối béo ngậy, đậm đà khó cưỡng. Mỗi món ốc đặc sản đều được chế biến bằng cả tâm huyết, biến tấu theo công thức riêng, hứa hẹn đánh thức mọi giác quan của bạn. Hãy ghé ngay để tận hưởng không khí ấm cúng và những bữa ăn ngon miệng, đậm chất Sài Gòn bình dị!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 141 AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 là nơi hội tụ tinh hoa hải sản tươi ngon với phong cách chế biến độc đáo, không lẫn vào đâu được. Mỗi món ăn là sự kết hợp hoàn hảo của gia vị bí truyền và tâm huyết người đầu bếp, khơi gợi mọi giác quan. Ghé Link Ốc để cùng bạn bè lai rai, tận hưởng không gian thoáng đãng và chìm đắm trong hương vị đặc sắc, khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 142 AS restaurant_id, N'Chào mừng đến với Bún Riêu Tóp Mỡ Đặc Biệt Quận 7, nơi hương vị truyền thống được nâng tầm. Thưởng thức tô bún riêu cua đỏ au, nước lèo đậm đà quyện cùng tóp mỡ giòn tan béo ngậy – tạo nên bản giao hưởng ẩm thực độc đáo. Mỗi muỗng là một trải nghiệm từ cái tâm người nấu, mang đến sự ấm lòng khó tả. Ghé 269 Phạm Hữu Lầu để khám phá ngay món ngon "đặc biệt" này!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 143 AS restaurant_id, N'Chào mừng bạn đến Lẩu Cá Đuối 79k - Lotte Quận 7, nơi hương vị biển cả hội tụ trong nồi lẩu cá đuối chua cay đậm đà, chuẩn vị đặc trưng của riêng chúng tôi. Mỗi món nhậu tại đây đều là sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết độc đáo, làm nên phong cách ẩm thực Việt khó quên. Với không gian ấm cúng và sự tận tâm trong từng món ăn, chúng tôi mong muốn mang đến những bữa ăn thật trọn vẹn và niềm vui sum họp. Mời bạn ghé 621 Nguyễn Thị Thập để cùng trải nghiệm!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 144 AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, Quận 7, mỗi món đặc sản là một câu chuyện hương vị được sáng tạo với tất cả tâm huyết và phong cách riêng biệt. Ghé thăm không gian ấm cúng, thân thiện để bạn tìm thấy giây phút thư giãn bên những món ăn ngon, khó quên. Hơn cả một quán ăn, chúng tôi mang đến trải nghiệm ẩm thực độc đáo, được hàng ngàn thực khách yêu mến và đánh giá cao.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 145 AS restaurant_id, N'Tại Trạm Mì Ý Dì Hiền Quận 7, mỗi đĩa mì không chỉ là món ăn mà còn là lời mời gọi ấm áp về một hương vị Ý bình dị nhưng đầy tinh tế. Dì Hiền tự tay chế biến từng món đặc sản theo phong cách riêng, mang đến những trải nghiệm ẩm thực gần gũi mà khó quên. Ghé 6 Đường 15 để thưởng thức bữa ăn ngon chuẩn vị nhà làm với đánh giá 4.6/5 sao!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 146 AS restaurant_id, N'ICHI QUÁN Quận 7 mời bạn khám phá Bún Chả Hà Nội và Nem Cua Bể trứ danh, nơi hương vị truyền thống được chúng tôi khoác lên chiếc áo mới, đầy phong cách và tinh tế. Mỗi món ăn là tâm huyết, là sự chắt lọc từ nguyên liệu tươi ngon nhất, mang đến cho bạn trải nghiệm ẩm thực đặc sắc không thể quên. Hãy ghé ICHI QUÁN để cảm nhận sự ấm áp và thưởng thức đặc sản Việt Nam chuẩn vị, đậm chất riêng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 147 AS restaurant_id, N'Đừng bỏ lỡ Tacos Labubu Quận 7 - Đường Số 17, nơi mỗi chiếc taco là một hành trình vị giác đầy bất ngờ và lôi cuốn. Chúng tôi khéo léo kết hợp những nguyên liệu tươi ngon cùng công thức độc đáo, tạo nên hương vị đặc trưng làm say lòng thực khách. Ghé 145 Đường Số 17 để thưởng thức ''đặc sản'' mang đậm dấu ấn riêng của Labubu, và cảm nhận ngay sự khác biệt trong từng miếng cắn bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 148 AS restaurant_id, N'Tại Chicken 3S, chúng tôi tin rằng ẩm thực là nơi kết nối yêu thương. Hãy đến 475A Nguyễn Thị Thập để thưởng thức gà rán xốt Hàn bí truyền và mỳ cay độc đáo, mỗi món đều mang đậm dấu ấn riêng của quán. Từ công thức ủ vị đặc biệt đến không gian ấm cúng, chúng tôi tạo nên trải nghiệm ẩm thực khó quên, hoàn hảo cho những bữa ăn gia đình ấm áp và tràn ngập niềm vui.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 149 AS restaurant_id, N'Chào mừng bạn đến Tứ Quý Trà - Carameo Machiato Quận 7, nơi hương vị độc đáo và không gian ấm cúng hòa quyện. Thưởng thức Carameo Machiato thơm béo đặc trưng cùng những món đặc sản được chế biến tỉ mỉ, mang phong cách riêng của quán. Mỗi món ăn, thức uống đều chứa đựng trọn vẹn tâm huyết, mời bạn ghé 79A Đường 79 để cảm nhận sự gần gũi và ngon miệng như ở nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 150 AS restaurant_id, N'Chiang Thai Delivery Quận 7 là nơi tinh hoa ẩm thực Thái được biến tấu đầy sáng tạo, mang đến phong vị riêng không lẫn vào đâu được. Từ những nguyên liệu tươi ngon nhất, mỗi món ăn đều được chế biến bằng cả tâm huyết, chắt lọc bí quyết để hương vị bùng nổ và khó quên. Với 4.8 sao đánh giá, chúng tôi tự hào trao gửi những bữa ăn chuẩn vị, ấm lòng đến tận nhà bạn, biến mọi khoảnh khắc thưởng thức thành trải nghiệm đặc biệt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 151 AS restaurant_id, N'Bước vào Tiệm Fulleaf - Quận 7, bạn sẽ tìm thấy một không gian bình dị, ấm cúng như chính ngôi nhà của mình. Nơi đây, hương cà phê thơm lừng hòa quyện cùng những món đặc sản được chế biến với tất cả tâm huyết, mang đậm phong cách riêng khó quên. Mỗi món ăn là một lời mời chân thành để bạn khám phá vị ngon độc đáo, để mỗi lần ghé là một kỷ niệm đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 152 AS restaurant_id, N'Gangnam Tanghulu tại Lotte Mart Quận 7 là điểm hẹn của những tâm hồn yêu ẩm thực Á Châu, nơi bạn sẽ khám phá các món đặc sản mang phong vị rất riêng, khó quên. Mỗi đĩa ăn là sự hòa quyện tinh tế giữa nguyên liệu tươi ngon và công thức bí truyền, được chúng tôi chăm chút bằng tất cả niềm đam mê. Hãy ghé thăm để trải nghiệm một bữa ăn ấm cúng, chuẩn vị đã chinh phục trái tim của biết bao thực khách!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 153 AS restaurant_id, N'Chào mừng bạn đến Pave Glace Chocolate Quận 7, nơi lan tỏa hương vị ngọt ngào và ấm áp. Chúng tôi tự hào giới thiệu những món tráng miệng đặc trưng, được chế biến bằng cả tâm huyết và công thức riêng biệt, mang đến trải nghiệm vị giác khó quên. Hãy ghé thăm để tận hưởng khoảnh khắc thư thái hoặc chọn những món quà ý nghĩa, làm cho mỗi ngày thêm ngọt.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 154 AS restaurant_id, N'Chào mừng bạn đến Tacos Nhà Labubu 149, nơi mỗi chiếc taco bình dị lại chứa đựng cả một câu chuyện hương vị riêng đầy mê hoặc. Chúng tôi tự hào mang đến những món đặc sản được chế biến với phong cách độc đáo, từ vỏ bánh giòn rụm đến nhân thịt đậm đà, tươi ngon. Hãy ghé 149 Phạm Hữu Lầu để khám phá và cảm nhận sự khác biệt đúng chất Labubu, nơi vị giác của bạn được nuông chiều một cách đặc biệt nhất.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 155 AS restaurant_id, N'Tại 335 Nguyễn Hữu Thọ, Quận 7, Tacos Nhà LuXaBu mời bạn ghé thăm để trải nghiệm thế giới taco đầy mê hoặc. Mỗi chiếc taco mang phong cách Nhà LuXaBu độc đáo là sự kết hợp tinh tế giữa nguyên liệu tươi ngon và bí quyết riêng, gói trọn cái tâm của người làm bếp. Từng miếng cắn giòn tan, nhân đậm đà cùng nước sốt đặc trưng sẽ đánh thức mọi giác quan, mang đến trải nghiệm ẩm thực ấm áp và đáng nhớ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 156 AS restaurant_id, N'Tacos Xin Chào tại 333 Nguyễn Hữu Thọ, Quận 7, là điểm hẹn ẩm thực nơi hương vị độc đáo gặp gỡ sự nồng nhiệt. Mỗi chiếc taco không chỉ là món ăn fastfood bình dân, mà là một tác phẩm gói trọn niềm đam mê và công thức đặc biệt của chúng tôi. Từ nguyên liệu tươi ngon đến cách chế biến tinh tế, chúng tôi tự hào mang đến những đặc sản làm nên dấu ấn riêng, được khách hàng đánh giá 4.8 sao. Hãy ghé Tacos Xin Chào để thưởng thức sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 157 AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến những hương vị đặc sản Việt gói trọn cả cái tâm người đầu bếp. Từ ổ bánh mì pate trứ danh đến các món ngon độc đáo theo phong cách riêng, mỗi suất ăn là một hành trình vị giác đậm đà, khó quên. Đến đây, bạn không chỉ thưởng thức món ngon bình dân mà còn cảm nhận sự ấm áp, thân thuộc như bữa cơm nhà. Hân hoan chào đón bạn ghé 141 Đường Số 1 để trải nghiệm!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 158 AS restaurant_id, N'A Duy Food Quận 7 - nơi tinh hoa ẩm thực Việt giao hòa cùng phong vị độc đáo. Mỗi đĩa Gà Quay, Sườn Quay hay Cơm Lam tại đây đều là sự kết tinh của nguyên liệu tươi ngon và công thức gia truyền, thấm đượm tâm huyết người đầu bếp. Hãy đến 163 Nguyễn Thị Thập để cảm nhận một bữa ăn trọn vẹn, ấm cúng và đầy xúc cảm bên gia đình thân yêu.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 159 AS restaurant_id, N'Chào mừng đến Ola Tacos Quận 7, nơi hương vị đường phố bùng nổ trong từng món đặc sản được chế biến theo phong cách độc đáo của riêng chúng tôi. Không cầu kỳ, chỉ đơn giản là những chiếc taco gói trọn tâm huyết, mang đến trải nghiệm ẩm thực nhanh gọn mà khó quên. Ghé 50 Đường Số 10 ngay để cảm nhận sự khác biệt và nạp năng lượng với những món ngon khó cưỡng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 160 AS restaurant_id, N'Tại LaSiMi Quận 7 – Trà Ngon Đậm Vị, chúng tôi kiến tạo một không gian bình yên để bạn tạm quên đi phố thị, đắm mình vào từng ngụm trà đậm đà và thưởng thức món đặc sản mang phong cách riêng không lẫn vào đâu được. Mỗi món ăn, thức uống tại 147c đường số 17 đều là sự chắt lọc tinh hoa và tâm huyết, mang đến cho bạn trải nghiệm ẩm thực ấm áp, gần gũi như ở nhà. Hãy ghé LaSiMi để cảm nhận sự khác biệt trong từng câu chuyện hương vị.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 161 AS restaurant_id, N'Sâm Chill Me - Lý Phục Man chào đón bạn đến một góc nhỏ ấm cúng, nơi mỗi món đặc sản đều kể một câu chuyện hương vị riêng. Chúng tôi gửi gắm cả tâm huyết vào từng nguyên liệu, từng công thức độc đáo để mang đến trải nghiệm ẩm thực khó quên. Hãy đến và cảm nhận sự thư thái, cùng vị ngon đặc trưng chỉ có tại Sâm Chill Me!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 162 AS restaurant_id, N'Mì Cay Sasin - Tân Phong Quận 7 là điểm đến lý tưởng cho những tín đồ ẩm thực yêu thích hương vị Hàn Quốc đậm đà. Tại đây, bạn sẽ khám phá những tô mì cay và món đặc sản được chế biến theo công thức độc đáo, mang phong cách riêng không lẫn vào đâu được của Sasin. Mỗi món ăn không chỉ ngon miệng mà còn chứa đựng tâm huyết của chúng tôi, hứa hẹn mang đến một trải nghiệm ấm cúng, khó quên!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 163 AS restaurant_id, N'Chào mừng bạn đến với Phan Rang Quán Quận 7 - nơi hương vị Việt truyền thống được nâng tầm bằng phong cách riêng độc đáo. Tại số 399 Lê Văn Lương, bạn sẽ tìm thấy không gian bình dị ấm cúng và những món đặc sản thấm đượm tâm huyết người nấu. Thưởng thức bữa ăn ngon chuẩn 4.7/5 sao, để mỗi miếng là một trải nghiệm khó quên!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 164 AS restaurant_id, N'Tại Ốc Trứng Muối - Chi Nhánh 17 Quận 7, mỗi món ốc bình dân đều ẩn chứa cả tâm huyết và sự sáng tạo. Hương vị trứng muối độc quyền béo ngậy, đậm đà quyện cùng hải sản tươi ngon sẽ đánh thức mọi giác quan. Ghé ngay để khám phá thực đơn đặc sắc mang phong cách riêng và cảm nhận sự ấm cúng, gần gũi như nhà mình!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 165 AS restaurant_id, N'Link Ốc Quận 7 - Đường Số 10 không chỉ là quán ốc, mà là điểm hẹn của những hương vị độc đáo, được chế biến với tất cả tâm huyết. Tại đây, mỗi món hải sản tươi ngon đều mang "phong cách riêng" không lẫn vào đâu được, khiến thực khách say mê từ miếng đầu tiên. Còn gì tuyệt hơn khi cùng bạn bè nhâm nhi ốc nóng hổi trong không gian ấm cúng, đậm chất Sài Gòn? Mời bạn ghé 1 Đường Số 10 để khám phá ngay!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 166 AS restaurant_id, N'Tìm một chút ấm áp giữa lòng Sài Gòn? Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 tại 269 Phạm Hữu Lầu chính là điểm đến bạn cần. Nước lèo bún riêu đậm đà, thanh ngọt được nấu từ công thức gia truyền, kết hợp cùng lớp tóp mỡ giòn rụm, béo ngậy tạo nên hương vị "đặc biệt" không thể lẫn vào đâu được. Mỗi tô bún là cả tâm huyết và sự tỉ mỉ, mang đến trải nghiệm ẩm thực bình dân nhưng đầy tinh tế. Hãy ghé ngay để cảm nhận sự khác biệt và hương vị khó quên này!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 167 AS restaurant_id, N'Lẩu Cá Đuối 79k - Lotte Quận 7 mời bạn tìm về hương vị đặc trưng của biển cả và những món nhậu truyền thống Việt Nam. Từng nồi lẩu cá đuối chua thanh, thịt cá tươi ngọt cùng các đặc sản độc đáo được chế biến từ tâm huyết sẽ đánh thức mọi giác quan. Đây là điểm hẹn lý tưởng tại 621 Nguyễn Thị Thập để sẻ chia những khoảnh khắc ấm cúng, tràn đầy niềm vui bên bàn ăn đậm đà bản sắc riêng của chúng tôi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 168 AS restaurant_id, N'Trà Sữa MayCha - Yola là điểm dừng chân lý tưởng giữa lòng Quận 7, nơi bạn tìm thấy những góc nhỏ ấm cúng cho buổi hẹn hò hay phút giây thư giãn. Tại đây, chúng tôi tự hào mang đến thực đơn đặc sản độc đáo, mang phong cách riêng cùng những ly trà sữa thơm lừng, được chế biến bằng trọn vẹn tâm huyết. Từng hương vị đều được chăm chút tỉ mỉ, hứa hẹn một trải nghiệm ẩm thực khó quên và những khoảnh khắc ấm áp bên người thân yêu. Hãy ghé Trà Sữa MayCha - Yola để cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 169 AS restaurant_id, N'Tìm chút ấm áp giữa lòng Quận 7? Trạm Mì Ý Dì Hiền chào đón bạn với những đĩa mì Ý mang đậm dấu ấn riêng, được chế biến bằng cả tấm lòng. Giữa không gian bình dị nhưng tràn ngập mùi hương quyến rũ, mỗi sợi mì, mỗi loại sốt đều được Dì Hiền chăm chút tỉ mỉ. Hãy đến và tự mình cảm nhận sự đặc biệt trong từng hương vị, nơi ẩm thực Ý hòa quyện với nét bình dân gần gũi, tạo nên trải nghiệm 4.6 sao khó quên mà thực khách luôn tin yêu.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 170 AS restaurant_id, N'Giữa lòng Sài Gòn nhộn nhịp, ICHI QUÁN Quận 7 mở ra một không gian ẩm thực Việt bình dị mà ấm cúng. Tại đây, bạn sẽ khám phá hương vị Bún Chả Hà Nội trứ danh và Nem Cua Bể giòn tan, được chế biến với bí quyết riêng biệt, thấm đẫm tâm huyết của người đầu bếp. Mỗi món ăn là một câu chuyện, mang đậm dấu ấn riêng và khơi gợi ký ức đẹp. Mời bạn ghé thưởng thức để cảm nhận trọn vẹn sự tinh túy trong từng miếng ngon!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 171 AS restaurant_id, N'Đến Tacos Labubu Đường Số 17, bạn sẽ được thưởng thức những chiếc Tacos fastfood không chỉ nhanh gọn mà còn ngập tràn hương vị đặc trưng, có một không hai. Chúng tôi gửi gắm cả tâm huyết và sự sáng tạo vào từng nguyên liệu, từng lớp nhân đậm đà. Ghé Tacos Labubu để trải nghiệm một bữa ăn ngon miệng, đậm chất riêng và tràn đầy cảm hứng ẩm thực nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 172 AS restaurant_id, N'Chicken 3S là nơi hội tụ tinh hoa ẩm thực Hàn Quốc dành cho gia đình bạn tại 475A Nguyễn Thị Thập, Quận 7. Khám phá ngay những miếng gà rán giòn tan đẫm sốt độc quyền và tô mì cay chuẩn vị, mỗi món đều gói trọn tâm huyết của người đầu bếp. Hãy đến và tận hưởng không gian ấm cúng, để mỗi bữa ăn là một kỷ niệm đáng nhớ tràn ngập hương vị và tiếng cười.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 173 AS restaurant_id, N'Tứ Quý Trà là góc nhỏ thân quen giữa lòng Quận 7, nơi bạn luôn tìm thấy sự ấm áp và bình yên. Từ ly Carameo Machiato béo thơm đặc trưng đến những món đặc sản đậm đà, mỗi hương vị đều gói trọn cái tâm người làm. Ghé Tứ Quý Trà để tự mình cảm nhận, rồi bạn sẽ hiểu vì sao nơi đây luôn khiến người ta muốn quay lại.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 174 AS restaurant_id, N'Chiang Thai Delivery - Quận 7 mang đến tinh hoa ẩm thực Thái Lan với phong cách riêng độc đáo, ngay tại nhà bạn. Mỗi món đặc sản, từ Tom Yum chua cay nồng nàn đến Pad Thai đậm đà, đều là sự kết hợp hoàn hảo của nguyên liệu tươi ngon và cái tâm của người đầu bếp. Hãy để chúng tôi đánh thức mọi giác quan của bạn bằng một trải nghiệm vị giác chuẩn Thái, tiện lợi và đầy cảm hứng.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 175 AS restaurant_id, N'Tiệm Fulleaf - Quận 7 là chốn dừng chân lý tưởng để bạn tìm thấy sự bình yên và những hương vị rất riêng. Mỗi món đặc sản ở đây đều được chúng tôi chuẩn bị bằng tất cả cái tâm, mang đến trải nghiệm ẩm thực độc đáo không lẫn vào đâu được. Hãy ghé Tiệm Fulleaf để cảm nhận sự ấm áp và để vị giác dẫn lối khám phá những bất ngờ.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 176 AS restaurant_id, N'Tại Gangnam Tanghulu, chúng tôi mời bạn khám phá thế giới hương vị Á Đông đặc sắc ngay trong Lotte Mart Quận 7. Mỗi món ăn, từ những xiên kẹo trái cây giòn tan đến các đặc sản nóng hổi mang phong cách riêng, đều được chế biến bằng tất cả tâm huyết để mang lại trải nghiệm ẩm thực độc đáo. Ghé thăm để cảm nhận sự ấm áp và thưởng thức bữa ăn ngon miệng, chất lượng làm nên thương hiệu của chúng tôi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 177 AS restaurant_id, N'Đến với Pave Glace Chocolate Quận 7, bạn sẽ tìm thấy một thế giới ngọt ngào ẩn mình tại 98 Đường 65. Mỗi món tráng miệng đặc trưng của chúng tôi là sự hòa quyện tinh tế của hương vị chocolate độc đáo và niềm đam mê sáng tạo. Từ những viên kẹo ngọt ngào làm quà tặng đến khoảnh khắc thưởng thức riêng, hãy để Pave Glace lan tỏa niềm vui và sự ấm áp đến bạn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 178 AS restaurant_id, N'Chào mừng bạn đến với Tacos Nhà Labubu 149, nơi những chiếc taco bình dân được nâng tầm thành trải nghiệm ẩm thực đặc sắc. Mỗi miếng bánh là sự hòa quyện hoàn hảo của nguyên liệu tươi ngon cùng công thức "bí mật" mang đậm phong cách Labubu. Ghé ngay 149 Phạm Hữu Lầu, Quận 7 để khám phá hương vị độc đáo, khó quên và cảm nhận sự ấm áp trong từng món ăn bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 179 AS restaurant_id, N'Bước chân vào Tacos Nhà LuXaBu ở 335 Nguyễn Hữu Thọ, bạn sẽ ngạc nhiên với những chiếc taco bình dân nhưng đậm đà chất riêng. Tại đây, mỗi chiếc bánh là sự kết hợp hoàn hảo của vỏ giòn tan, nhân tươi ngon và hương vị độc đáo, được làm bằng tất cả tâm huyết. Ghé ngay để khám phá phong cách ẩm thực đặc sắc, nơi những hương vị khó quên đang chờ đón bạn!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 180 AS restaurant_id, N'Xin chào các tín đồ ẩm thực! Tại Tacos Xin Chào 333 Nguyễn Hữu Thọ, chúng tôi tự hào mang đến những chiếc taco bùng nổ hương vị, độc đáo với phong cách riêng không lẫn vào đâu được. Từng nguyên liệu tươi ngon được chế biến đầy tâm huyết, tạo nên món fastfood chất lượng chuẩn nhà làm mà giá thì bình dân. Ghé ngay để cảm nhận sự "Xin Chào" chân thành qua từng miếng cắn giòn tan, đậm đà khó quên nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 181 AS restaurant_id, N'Tại Bánh Mì Pate Hải Phòng Quận 7, chúng tôi tự hào mang đến những hương vị đặc trưng từ phố Cảng với phong cách riêng đầy sáng tạo. Mỗi món ăn, đặc biệt là bánh mì pate trứ danh, đều là kết quả của công thức gia truyền và tâm huyết gửi gắm vào từng nguyên liệu tươi ngon. Hãy đến 141 Đường Số 1 để trải nghiệm nét ẩm thực bình dị mà quyến rũ, đã làm hài lòng hàng ngàn thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 182 AS restaurant_id, N'Tại A Duy Food Quận 7, mỗi món ăn là một câu chuyện hương vị đậm đà, được nêm nếm bằng cả tấm lòng. Từng miếng gà quay vàng óng, sườn quay thấm vị hay chén cơm lam dẻo thơm đều mang phong cách đặc trưng, gợi nhớ bữa cơm gia đình ấm cúng. Đến và cảm nhận sự khác biệt từ những đặc sản riêng có, đã làm nên thương hiệu được thực khách yêu mến.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 183 AS restaurant_id, N'Đến với Ola Tacos Quận 7, bạn sẽ khám phá những chiếc tacos đặc sản với phong cách ẩm thực độc đáo, chỉ riêng tại đây. Mỗi chiếc bánh giòn tan, nhân đầy ắp hương vị đậm đà là kết quả của sự tỉ mỉ và tâm huyết, hứa hẹn mang đến một trải nghiệm vị giác bùng nổ. Hãy để Ola Tacos đánh thức vị giác của bạn bằng nét chấm phá khó quên này!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 184 AS restaurant_id, N'Chào bạn ghé LaSiMi Quận 7, điểm hẹn ấm cúng trên Đường Số 17 tấp nập. Tại đây, bạn sẽ khám phá không chỉ những ly trà ngon đậm vị mà còn là thế giới của các món đặc sản riêng biệt, được chế biến bằng tất cả tâm huyết. Mỗi hương vị là một câu chuyện chân thành, mang đến trải nghiệm ẩm thực khó quên mà thực khách đã tin yêu với 4.9/5 sao. Mời bạn đến cảm nhận và tận hưởng những khoảnh khắc thật chill cùng LaSiMi nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 185 AS restaurant_id, N'Sâm Chill Me Lý Phục Man chào đón bạn đến với không gian ấm cúng, nơi thời gian dường như chậm lại. Chúng tôi tự hào mang đến những món đặc sản độc đáo, được chế biến bằng tất cả tâm huyết để mỗi hương vị đều là một trải nghiệm khó quên. Ghé Sâm Chill Me để "chill" với tách cafe thơm lừng và khám phá phong cách ẩm thực riêng biệt chỉ có tại 89 Lý Phục Man nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 186 AS restaurant_id, N'Mì Cay Sasin Tân Phong Quận 7 không chỉ là quán ăn, mà là nơi chúng tôi gửi gắm cả tâm huyết vào từng món Hàn chuẩn vị, mang đậm dấu ấn riêng. Mỗi tô mì cay nóng hổi, mỗi món ăn đặc sắc đều được chế biến cẩn thận, hứa hẹn đánh thức mọi giác quan. Ghé Sasin, bạn sẽ tìm thấy sự ấm áp, quen thuộc và những trải nghiệm vị giác khó quên trong không gian bình dị, gần gũi.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 187 AS restaurant_id, N'Phan Rang Quán Quận 7 là chốn dừng chân lý tưởng trên con đường Lê Văn Lương, nơi hương vị miền Trung chân thật được giữ trọn vẹn. Mỗi món đặc sản tại đây đều thấm đượm cái tâm người đầu bếp, mang đến phong vị riêng độc đáo, bình dị mà lôi cuốn. Hãy đến và cảm nhận sự ấm áp, vị ngon khó cưỡng như bữa cơm nhà mẹ nấu, chắc chắn sẽ khiến bạn hài lòng.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 188 AS restaurant_id, N'Ốc Trứng Muối - Chi Nhánh 17 Quận 7 tự hào mang đến những món ốc tươi ngon, đậm đà hương vị đặc trưng mà không nơi nào có được. Nổi bật nhất là sự kết hợp hoàn hảo của ốc và trứng muối béo ngậy, tạo nên trải nghiệm vị giác khó quên. Với không gian bình dân, ấm cúng, chúng tôi mời bạn ghé thăm để cùng sẻ chia những khoảnh khắc ẩm thực đầy hứng khởi và niềm vui!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 189 AS restaurant_id, N'Link Ốc Đường Số 10 là điểm dừng chân lý tưởng cho những tâm hồn yêu hải sản và mê nhậu tại Quận 7. Từng món ốc tươi rói, thấm đẫm gia vị độc quyền mang phong cách Link Ốc, hứa hẹn đánh thức mọi giác quan. Đến đây, không gian ấm cúng, rộn rã tiếng cười sẽ là chất xúc tác hoàn hảo cho những cuộc tụ họp đáng nhớ. Link Ốc không chỉ là bữa ăn, mà là trải nghiệm vị giác đầy cảm hứng chờ bạn khám phá.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 190 AS restaurant_id, N'Tìm về hương vị xưa trên con đường Phạm Hữu Lầu, Bún Riêu Tóp Mỡ Đặc Biệt Quận 7 là điểm đến không thể bỏ lỡ. Nồi nước lèo đỏ au, thơm lừng cùng gạch cua béo ngậy và miếng tóp mỡ vàng giòn tan chảy, tạo nên sự giao thoa vị giác độc đáo. Chúng tôi gửi gắm cả tình yêu vào từng tô bún, mang đến cho bạn bữa ăn ấm cúng, đậm đà chất Sài Gòn. Hãy ghé 269 Phạm Hữu Lầu để cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 191 AS restaurant_id, N'Tại Lẩu Cá Đuối 79k - Lotte Quận 7, bạn sẽ được đắm mình trong hương vị lẩu cá đuối chua cay đậm đà, chuẩn gu nhậu Việt. Không gian ấm cúng tại 621 Nguyễn Thị Thập là nơi lý tưởng để tụ họp, sẻ chia những câu chuyện bên bàn ăn chất lượng. Chúng tôi tỉ mẩn gửi gắm nét riêng biệt và sự tươi ngon vào từng món, mang đến trải nghiệm ẩm thực khó quên. Mời bạn ghé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 192 AS restaurant_id, N'MayCha Yola, điểm hẹn bình yên tại Quận 7, mời bạn ghé thăm để tận hưởng không gian thoáng đãng và hương vị riêng biệt. Không chỉ có trà sữa thơm ngon, mà mỗi món đặc sản tại đây đều là tâm huyết được gửi gắm, mang đến trải nghiệm ẩm thực độc đáo khó quên. Đến MayCha Yola, nơi bạn luôn tìm thấy sự ấm áp và những khoảnh khắc tuyệt vời bên bàn ăn.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 193 AS restaurant_id, N'Trạm Mì Ý Dì Hiền là nơi bạn tìm thấy những đĩa mì Ý quen mà lạ, được Dì Hiền khéo léo biến tấu với phong cách riêng đầy mê hoặc. Mỗi món ăn đều gói trọn cái tâm, mang đến hương vị đậm đà, khó quên trong không gian ấm cúng, gần gũi. Ghé ngay 6 Đường 15 để thưởng thức bữa ăn bình dị nhưng tràn đầy cảm hứng, như một lời chào từ nước Ý qua bàn tay người Việt! Chắc chắn bạn sẽ hiểu vì sao quán luôn được đánh giá cao đến thế.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 194 AS restaurant_id, N'Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN: Nơi tinh hoa ẩm thực Hà Thành hội tụ cùng phong cách riêng đầy hấp dẫn ngay giữa lòng Quận 7. Mỗi món ăn là sự kết hợp của tâm huyết và bí quyết đặc biệt, từ bún chả thơm lừng đến nem cua bể giòn rụm. Hãy đến để thưởng thức hương vị khó quên, ấm áp như nhà làm và cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 195 AS restaurant_id, N'Tại Tacos Labubu Quận 7 - Đường Số 17, mỗi chiếc taco không chỉ là món ăn nhanh mà còn là cả một câu chuyện hương vị độc đáo. Từ vỏ bánh giòn tan đến nhân thịt đậm đà thấm sốt đặc trưng, tất cả đều được chế biến bằng cái tâm để mang đến trải nghiệm ẩm thực khó quên. Hãy đến và tự mình khám phá phong vị Labubu rất riêng, bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 199 AS restaurant_id, N'Tiệm Fulleaf Quận 7 là chốn dừng chân bình yên giữa lòng phố, nơi bạn luôn cảm nhận được sự ấm cúng và gần gũi như về nhà. Tại đây, mỗi món ăn đặc sản đều được chúng tôi gửi gắm cả tâm huyết, mang một phong cách riêng độc đáo, khó lẫn. Từ những nguyên liệu tươi ngon nhất, chúng tôi tỉ mỉ biến tấu để mỗi hương vị đều khiến bạn phải vấn vương. Ghé Fulleaf để khám phá và tận hưởng bữa ăn trọn vẹn hương sắc nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 203 AS restaurant_id, N'Tacos Nhà LuXaBu tại 335 Nguyễn Hữu Thọ không chỉ là quán fast food bình dân mà còn là nơi gói trọn niềm đam mê ẩm thực. Mỗi chiếc tacos là sự sáng tạo độc đáo, mang "chất LuXaBu" riêng, khiến thực khách luôn bất ngờ với hương vị đậm đà, khó quên. Đến đây, bạn sẽ tìm thấy những món đặc sản được làm từ cái tâm, vừa vặn cho bữa nhanh gọn mà vẫn ấm áp và đầy hứng khởi. Hãy ghé thăm để trải nghiệm phong vị riêng chỉ có tại Tacos Nhà LuXaBu!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 208 AS restaurant_id, N'Chào mừng bạn đến với LaSiMi Quận 7, nơi Trà Ngon Đậm Vị hòa quyện cùng những món đặc sản mang phong cách riêng, độc đáo. Mỗi hương vị tại LaSiMi đều là kết quả của sự tận tâm, tỉ mỉ, mang đến trải nghiệm ẩm thực bình dị nhưng khó quên. Hãy ghé Đường Số 17 để cảm nhận không gian ấm cúng và sự chào đón nồng hậu, nơi chúng tôi gửi gắm cả tấm lòng vào từng món ăn, thức uống.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 212 AS restaurant_id, N'Tại Ốc Trứng Muối Quận 7, chúng tôi tin rằng món ngon nhất đến từ nguyên liệu tươi rói và một chút "tâm tình" riêng. Đến đây, bạn sẽ khám phá thế giới hải sản bình dị nhưng đầy bất ngờ với những món ốc thấm đượm sốt trứng muối béo ngậy đặc trưng. Mỗi đĩa là một câu chuyện hương vị độc đáo, ấm áp chờ bạn thưởng thức. Mời bạn ghé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 216 AS restaurant_id, N'Tại Trà Sữa MayCha - Yola, mỗi ly trà sữa là một bản giao hưởng hương vị, còn các món đặc sản lại kể một câu chuyện ẩm thực riêng biệt, được chế biến bằng cả tâm huyết. Chúng tôi kiến tạo không gian ấm cúng, gần gũi ngay tại Quận 7 để bạn thưởng thức những sáng tạo độc đáo này. Với 4.8 sao đánh giá, MayCha cam kết mang đến những trải nghiệm ngon miệng và khó quên, biến mỗi khoảnh khắc ghé thăm thành một kỷ niệm đẹp.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 217 AS restaurant_id, N'Chào mừng đến Trạm Mì Ý Dì Hiền, nơi mỗi đĩa mì Ý không chỉ là món ăn mà còn là cả tấm lòng Dì Hiền gửi gắm. Với công thức riêng đầy sáng tạo, những món đặc sản tại đây mang hương vị Ý quen mà lạ, thấm đượm nét Sài Gòn bình dị. Ghé số 6 Đường 15, Quận 7 để thưởng thức vị ngon đặc trưng và cảm nhận sự ấm áp như ở nhà.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 218 AS restaurant_id, N'Tại Bún Chả Hà Nội & Nem Cua Bể - ICHI QUÁN, chúng tôi tự hào mang hương vị Hà Nội trứ danh về giữa lòng Quận 7. Mỗi suất bún chả thơm lừng hay nem cua bể giòn rụm đều được chế biến bằng cả cái tâm và công thức riêng biệt, đảm bảo giữ trọn vẹn bản sắc ẩm thực truyền thống nhưng vẫn rất độc đáo. Hãy ghé thăm để tìm lại những ký ức ẩm thực thân thương trong không gian bình dị, ấm cúng và thưởng thức những món đặc sản đậm đà, khó quên.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 220 AS restaurant_id, N'Tại Chicken 3S, chúng tôi tin rằng món ăn ngon nhất đến từ cái tâm và sự sáng tạo không ngừng. Từng miếng gà rán giòn tan đẫm xốt Hàn độc quyền, hay tô mỳ cay đậm đà đều được chế biến với tất cả tâm huyết. Hãy ghé 475A Nguyễn Thị Thập để cảm nhận không gian ấm cúng và thưởng thức hương vị đặc sắc, chuẩn vị gia đình bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 221 AS restaurant_id, N'Tứ Quý Trà - Carameo Machiato Quận 7 là nơi bạn tìm thấy một góc bình yên giữa lòng Sài Gòn, nơi hương vị Carameo Machiato ngọt ngào và sánh mịn đánh thức mọi giác quan. Chúng tôi tự hào mang đến những món đặc sản mang đậm phong cách riêng, được chế biến tỉ mỉ bằng cả tấm lòng để mỗi hương vị đều là một trải nghiệm khó quên. Ghé 79A Đường 79 để cảm nhận sự ấm áp và sự tận tâm trong từng món ăn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 222 AS restaurant_id, N'Chiang Thai Delivery - Quận 7 không chỉ mang đến món ăn, mà là cả một hành trình vị giác đầy mê hoặc. Mỗi món Thái tại đây đều được chế biến bằng tất cả cái tâm, từ nguyên liệu tươi rói đến công thức độc đáo riêng biệt. Hãy để hương vị đậm đà, tinh túy đánh thức mọi giác quan, biến bữa ăn tại nhà bạn thành một trải nghiệm ẩm thực Thái Lan chuẩn vị, ấm cúng.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 223 AS restaurant_id, N'Giữa Quận 7 năng động, Tiệm Fulleaf là điểm hẹn bình yên, nơi hương cà phê thơm lừng hòa quyện cùng những món đặc sản mang phong cách riêng độc đáo. Mỗi món ăn đều được chế biến bằng cả tâm huyết, mang đến trải nghiệm vị giác khó quên. Ghé Tiệm Fulleaf để tìm về chút ký ức thân quen và thưởng thức nét sáng tạo rất riêng bạn nhé!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 225 AS restaurant_id, N'Pave Glace Chocolate Quận 7 mời bạn ghé thăm một góc nhỏ bình yên, nơi hương thơm ngọt ngào lan tỏa. Tại đây, mỗi món dessert là câu chuyện của sự tỉ mỉ, niềm đam mê và những công thức độc quyền, mang đến hương vị khó quên chỉ có riêng tại quán. Hãy để vị giác được nuông chiều bởi sự tinh tế và tìm thấy món quà hoàn hảo cho những khoảnh khắc đặc biệt. Chúng tôi chờ đón bạn tại 98 Đường 65 để cùng trải nghiệm!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 288 AS restaurant_id, N'Tại 116 Lãnh Binh Thăng, Bánh Mì Tuấn Mập là góc nhỏ quen thuộc cho những ai mê ẩm thực đường phố Sài Gòn. Mỗi phần Bánh Mì Chảo nóng hổi hay Bò Bít Tết thơm lừng tại đây đều được chế biến với tất cả tâm huyết, mang đến hương vị đặc trưng và sự ấm lòng khó quên. Ghé Tuấn Mập để thưởng thức bữa ăn ngon, chất lượng với mức giá bình dân, xứng đáng 4.5 sao!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 289 AS restaurant_id, N'Tại Cơm Bò Beefsteak Phủ Trứng 24H - Bình Thới, mỗi đĩa cơm là một lời mời gọi ấm áp. Miếng bò beefsteak mềm mọng, nước sốt đậm đà quyện cùng trứng lòng đào béo ngậy, tạo nên hương vị khó cưỡng như cơm mẹ nấu. Chúng tôi phục vụ bằng tất cả cái tâm, sẵn sàng mang đến cho bạn bữa ăn ngon miệng, tràn đầy năng lượng bất kể đêm ngày giữa lòng Quận 11.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 290 AS restaurant_id, N'Giữa lòng Quận 11, Hủ Tiếu Chay - Tôn Thất Hiệp mời gọi bạn đến với thế giới ẩm thực chay Việt tinh tế, nơi bình yên và hương vị hòa quyện. Mỗi tô hủ tiếu, bún hay mì đều được chúng tôi chăm chút bằng tất cả cái tâm, từ nước dùng thanh ngọt đến nguyên liệu tươi ngon, để đánh thức trọn vẹn vị giác. Với điểm 4.5 sao và thực đơn đa dạng như Hủ Tiếu Nam Vang Chay hay Bún Huế Chay, chúng tôi tin sẽ mang đến một bữa ăn an lành, ấm lòng thực khách.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 307 AS restaurant_id, N'Ghiền Ăn Vặt không chỉ là một quán ăn, mà là góc nhỏ bình yên nép mình trong hẻm Gò Vấp, nơi hương vị món quê thân quen được gói ghém bằng cả cái tâm. Từ bánh tráng mắm ruốc giòn thơm, bánh tráng lụi sốt me chua ngọt đến combo món quê đậm đà, mỗi món đều khiến bạn phải ''ghiền'' ngay từ miếng đầu tiên. Một ly trà tắc thái xanh mát lạnh sẽ hoàn thiện trải nghiệm ẩm thực chuẩn vị Á Đông, khiến bạn muốn ghé lại mãi không thôi. Hãy đến và cảm nhận sự khác biệt!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 308 AS restaurant_id, N'Tại Bánh Tráng Chấm & Tráng Trộn - Ăn Vặt Gò Vấp, chúng tôi gửi gắm cả tâm tình vào từng món bánh tráng tuổi thơ. Nơi đây, bạn sẽ khám phá Bánh Tráng Chấm đậm đà, Bánh Tráng Tỏi xike thơm lừng và đặc biệt là Mỡ Hành KHÔNG CAY độc đáo, chiều lòng mọi vị giác. Đến 79/5 Thống Nhất để thưởng thức hương vị gần gũi, quen thuộc nhưng vẫn đầy cuốn hút, một nét chấm phá riêng của Gò Vấp.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 309 AS restaurant_id, N'Giữa lòng Gò Vấp sôi động, Hủ Tiếu Thái Lan Gò Vấp 20K là điểm hẹn ấm áp cho những ai mê mẩn hương vị Thái chuẩn mực. Từ tô hủ tiếu Tomyum full topping bùng vị đến mì trộn sốt độc quyền, mỗi món ăn đều gói trọn tâm huyết, mang đến trải nghiệm ẩm thực chất lượng 4.8 sao với mức giá bình dân đến bất ngờ. Hãy đến và để chúng tôi kể câu chuyện ẩm thực bằng tô hủ tiếu nóng hổi, đậm đà!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 329 AS restaurant_id, N'Bê Tươi Quyết Thắng Gò Vấp tự hào mang đến những món bê tươi ngon nức lòng, được chế biến từ cái tâm và bí quyết gia truyền. Thưởng thức Bê thui thơm lừng, Dựng bò chiên giòn đậm đà hay Lẩu Xí Quách nóng hổi, mỗi món ăn là một bản hòa tấu hương vị Việt mộc mạc mà quyến rũ. Hãy ghé 102 Đường 28 để cùng bạn bè, người thân sum vầy, sẻ chia khoảnh khắc tuyệt vời bên mâm cơm ấm cúng!' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

MERGE RestaurantStories AS target
USING (SELECT 354 AS restaurant_id, N'Bước chân vào hẻm 96 Phan Đình Phùng, bạn sẽ khám phá BÒ BÍA PHÚ NHUẬN – nơi hương vị món Việt truyền thống được gìn giữ vẹn nguyên. Từ những cuốn bò bía mặn thanh nhẹ đến gỏi cuốn tôm thịt tươi rói và bún mắm nêm đậm đà, mỗi món ăn đều gói trọn cái tâm của người làm bếp. Không gian bình dị, gần gũi nhưng hương vị lại đặc sắc khó quên, như một lời mời gọi thân thương từ Sài Gòn xưa.' AS story) AS source
ON (target.restaurant_id = source.restaurant_id)
WHEN MATCHED THEN
    UPDATE SET target.story = source.story, target.updated_at = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (restaurant_id, story, updated_at) VALUES (source.restaurant_id, source.story, GETDATE());

COMMIT TRANSACTION;
