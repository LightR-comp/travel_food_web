import { useState, useEffect, useRef } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';

/* ─── Intersection Observer hook ─── */
const useInView = (threshold = 0.15) => {
  const ref = useRef(null);
  const [visible, setVisible] = useState(false);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const obs = new IntersectionObserver(([e]) => {
      if (e.isIntersecting) { setVisible(true); obs.disconnect(); }
    }, { threshold });
    obs.observe(el);
    return () => obs.disconnect();
  }, [threshold]);
  return [ref, visible];
};

const FadeSection = ({ children, className = '', delay = 0 }) => {
  const [ref, visible] = useInView(0.1);
  return (
    <div
      ref={ref}
      className={`transition-all duration-700 ease-out ${visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'} ${className}`}
      style={{ transitionDelay: `${delay}ms` }}
    >{children}</div>
  );
};

/* ─── Mock data ─── */
const CATEGORIES_MAP = {
  review: { label: 'Đánh giá', icon: '⭐', color: 'bg-[#E8623A]/10 text-[#E8623A]' },
  recipe: { label: 'Công thức', icon: '📖', color: 'bg-emerald-50 text-emerald-600' },
  tips:   { label: 'Mẹo vặt', icon: '💡', color: 'bg-amber-50 text-amber-600' },
  events: { label: 'Sự kiện', icon: '🎉', color: 'bg-purple-50 text-purple-600' },
  question: { label: 'Hỏi đáp', icon: '❓', color: 'bg-blue-50 text-blue-600' },
};

const MOCK_POSTS_FULL = {
  1: {
    id: 1,
    author: 'Minh Anh',
    avatar: '🧑‍🍳',
    category: 'review',
    title: 'Top 5 quán phở ngon nhất Quận 1 – Review chân thực!',
    time: '2 giờ trước',
    readTime: '5 phút đọc',
    likes: 234,
    views: 1520,
    tags: ['#PhởHàNội', '#Quận1', '#ReviewẨmThực', '#TPHCM'],
    pinned: true,
    content: [
      { type: 'text', value: 'Sau nhiều ngày lang thang khắp Quận 1, mình đã tìm ra 5 quán phở ngon nhất mà ai đến Sài Gòn cũng nên thử. Đây là những quán mà mình đã ăn đi ăn lại nhiều lần, với hương vị đậm đà và nước dùng trong vắt.' },
      { type: 'heading', value: '1. Phở Lệ – 413 Nguyễn Trãi, Quận 5' },
      { type: 'text', value: 'Phở Lệ nổi tiếng với nước dùng ngọt thanh từ xương bò hầm suốt 12 tiếng. Thịt bò tái mềm tan trong miệng, bánh phở mỏng và dai. Đặc biệt là phần gầu giòn – béo ngậy mà không ngán.' },
      { type: 'rating', label: 'Nước dùng', score: 5 },
      { type: 'rating', label: 'Thịt bò', score: 4.5 },
      { type: 'rating', label: 'Giá cả', score: 4 },
      { type: 'heading', value: '2. Phở Hòa – 260C Pasteur, Quận 3' },
      { type: 'text', value: 'Quán phở huyền thoại của Sài Gòn, hoạt động hơn 50 năm. Nước dùng đậm vị, thịt bò thái lát to bản, rau sống tươi xanh. Quán luôn đông khách từ sáng đến tối.' },
      { type: 'rating', label: 'Nước dùng', score: 5 },
      { type: 'rating', label: 'Thịt bò', score: 5 },
      { type: 'rating', label: 'Giá cả', score: 3.5 },
      { type: 'heading', value: '3. Phở Dậu – 288 Võ Văn Tần, Quận 3' },
      { type: 'text', value: 'Quán nhỏ trong hẻm nhưng phở thì ngon xuất sắc. Nước dùng hầm từ xương ống và sá sùng, cho vị ngọt tự nhiên đặc trưng. Bát phở đầy đặn với giá cực kỳ phải chăng.' },
      { type: 'heading', value: '4. Phở Phú Gia – 25/1 Nguyễn Thị Tần, Quận 8' },
      { type: 'text', value: 'Nếu bạn là fan của phở Bắc chính hiệu, Phở Phú Gia là lựa chọn hoàn hảo. Nước dùng trong, nhẹ nhàng mà sâu lắng. Bánh phở mỏng tang, thịt bò chín mềm.' },
      { type: 'heading', value: '5. Phở Tàu Bay – 433 Lý Thái Tổ, Quận 10' },
      { type: 'text', value: 'Quán phở "già đời" nhất trong danh sách với lịch sử hơn 70 năm. Tô phở to đùng, nước dùng nóng hổi thơm lừng. Đây là điểm đến must-try cho bất kỳ ai yêu phở Sài Gòn.' },
      { type: 'text', value: 'Trên đây là top 5 quán phở ngon nhất Quận 1 và khu vực lân cận mà mình đã thử. Nếu bạn có quán phở yêu thích nào khác, hãy chia sẻ trong phần bình luận nhé! 🍜' },
    ],
    comments: [
      {
        id: 'c1', author: 'Hồng Ngọc', avatar: '👩‍🍳', time: '1 giờ trước', likes: 12,
        content: 'Phở Lệ đúng là huyền thoại! Mình ăn ở đó từ hồi còn nhỏ, giờ vẫn giữ nguyên hương vị. Gầu giòn là phần mình thích nhất 😍',
        replies: [
          { id: 'r1', author: 'Minh Anh', avatar: '🧑‍🍳', time: '45 phút trước', likes: 3, content: 'Đúng rồi bạn, gầu giòn là linh hồn của Phở Lệ luôn! 🙌' },
        ],
      },
      {
        id: 'c2', author: 'Đức Thành', avatar: '🧔', time: '1 giờ trước', likes: 8,
        content: 'Phở Hòa hết sảy! Mỗi lần ăn là mỗi lần phải gọi thêm tô. Nhưng giá hơi cao so với mặt bằng chung.',
        replies: [],
      },
      {
        id: 'c3', author: 'Thu Hương', avatar: '👩', time: '30 phút trước', likes: 5,
        content: 'Mình muốn bổ sung thêm Phở Minh ở đường Điện Biên Phủ cũng rất ngon nhé! Nước dùng trong vắt, vị thanh ngọt.',
        replies: [
          { id: 'r2', author: 'Quốc Bảo', avatar: '🧑', time: '15 phút trước', likes: 1, content: 'Ồ mình cũng nghe nói Phở Minh ngon lắm mà chưa có dịp thử! Sẽ đi sớm 👍' },
        ],
      },
      {
        id: 'c4', author: 'Lan Chi', avatar: '👧', time: '20 phút trước', likes: 3,
        content: 'Phở Tàu Bay mình ăn tuần trước, tô phở siêu to, ăn no căng bụng luôn 😂 Giá cũng ổn nữa.',
        replies: [],
      },
      {
        id: 'c5', author: 'Quốc Bảo', avatar: '🧑', time: '10 phút trước', likes: 2,
        content: 'Cảm ơn bạn chia sẻ! Mình mới vào Sài Gòn, đang cần list quán ăn ngon. Bookmark ngay! 📌',
        replies: [],
      },
    ],
  },
  2: {
    id: 2, author: 'Hồng Ngọc', avatar: '👩‍🍳', category: 'recipe',
    title: 'Cách nấu bún bò Huế chuẩn vị miền Trung tại nhà', time: '5 giờ trước', readTime: '8 phút đọc',
    likes: 189, views: 980, tags: ['#BúnBòHuế', '#CôngThức', '#NấuĂn'],
    content: [
      { type: 'text', value: 'Chia sẻ công thức bún bò Huế gia truyền từ bà ngoại mình. Đảm bảo ai ăn cũng phải khen ngon! Bí quyết nằm ở cách hầm xương và pha chế gia vị đúng cách.' },
      { type: 'heading', value: 'Nguyên liệu cần chuẩn bị' },
      { type: 'text', value: '• 1kg xương bò ống\n• 500g giò heo\n• 300g thịt bò bắp\n• 200g huyết bò\n• 2 cây sả\n• Mắm ruốc Huế\n• Sả bằm, ớt bột, dầu annatto' },
      { type: 'heading', value: 'Cách nấu' },
      { type: 'text', value: 'Bước 1: Rửa sạch xương bò, trần qua nước sôi rồi rửa lại. Hầm xương với 4 lít nước trong 3-4 tiếng cho nước dùng ngọt thanh.' },
      { type: 'text', value: 'Bước 2: Phi sả bằm với dầu annatto cho thơm, thêm ớt bột tạo màu đặc trưng. Đây là bí quyết để có lớp dầu sa tế đỏ rực trên mặt.' },
      { type: 'text', value: 'Bước 3: Pha mắm ruốc với chút nước ấm, lọc lấy phần nước trong, cho vào nồi nước dùng. Đây chính là linh hồn của bún bò Huế.' },
      { type: 'text', value: 'Đặc biệt là phải nêm nếm cẩn thận, vị phải cay nồng, đậm đà mà không quá mặn. Chúc mọi người nấu thành công nhé! 🍜' },
    ],
    comments: [
      { id: 'c1', author: 'Minh Anh', avatar: '🧑‍🍳', time: '3 giờ trước', likes: 15, content: 'Công thức hay quá! Mình sẽ thử nấu cuối tuần này. Cảm ơn bạn chia sẻ! 🙏', replies: [] },
      { id: 'c2', author: 'Đức Thành', avatar: '🧔', time: '2 giờ trước', likes: 7, content: 'Mắm ruốc Huế mua ở đâu cho chuẩn vậy bạn?', replies: [
        { id: 'r1', author: 'Hồng Ngọc', avatar: '👩‍🍳', time: '1 giờ trước', likes: 4, content: 'Mình thường mua mắm ruốc từ Huế gửi vào. Nếu ở Sài Gòn thì ra chợ Bà Chiểu có bán loại ngon lắm!' },
      ]},
    ],
  },
  3: {
    id: 3, author: 'Đức Thành', avatar: '🧔', category: 'tips',
    title: 'Bí kíp ăn vặt Sài Gòn với budget 50k', time: '1 ngày trước', readTime: '4 phút đọc',
    likes: 312, views: 2100, tags: ['#ĂnVặtSàiGòn', '#TiếtKiệm', '#StreetFood'],
    content: [
      { type: 'text', value: 'Bạn chỉ có 50k mà muốn ăn no? Không vấn đề! Đây là list những món ăn vặt Sài Gòn siêu ngon mà siêu rẻ.' },
      { type: 'heading', value: '🧇 Bánh tráng trộn – 10k' },
      { type: 'text', value: 'Món khoái khẩu của teen Sài Gòn. Mua ở bất kỳ xe hàng rong nào, bánh tráng trộn với đủ loại topping: trứng cút, xoài, rau răm, mực khô.' },
      { type: 'heading', value: '🍢 Xiên que chiên – 15k (5 xiên)' },
      { type: 'text', value: 'Bò viên, xúc xích, cá viên, khoai lang... tất cả xiên que chiên giòn rụm, chấm tương ớt thì ngon hết nấc!' },
      { type: 'heading', value: '🥤 Trà đào cam sả – 15k' },
      { type: 'text', value: 'Giải khát mùa nắng Sài Gòn không gì bằng ly trà đào cam sả size lớn. Vừa ngon vừa mát!' },
      { type: 'heading', value: '🍡 Chè bưởi – 10k' },
      { type: 'text', value: 'Tráng miệng hoàn hảo với chè bưởi nước cốt dừa béo ngậy. Tổng cộng 50k là bạn đã ăn uống no nê rồi!' },
    ],
    comments: [
      { id: 'c1', author: 'Lan Chi', avatar: '👧', time: '20 giờ trước', likes: 22, content: 'Bài viết hữu ích quá! Sinh viên như mình cần lắm 😆', replies: [] },
      { id: 'c2', author: 'Thu Hương', avatar: '👩', time: '18 giờ trước', likes: 9, content: 'Còn thiếu món gỏi cuốn nè! 15k 2 cuốn ở gần ĐH Bách Khoa ngon lắm', replies: [] },
    ],
  },
  4: {
    id: 4, author: 'Thu Hương', avatar: '👩', category: 'events',
    title: 'Lễ hội ẩm thực đường phố 2026 – Đừng bỏ lỡ!', time: '2 ngày trước', readTime: '3 phút đọc',
    likes: 156, views: 890, tags: ['#FoodTour', '#SựKiện', '#LễHội'],
    content: [
      { type: 'text', value: 'Lễ hội ẩm thực đường phố lớn nhất năm sắp diễn ra tại Công viên 23/9. Hàng trăm gian hàng ẩm thực từ khắp cả nước sẽ tụ hội.' },
      { type: 'heading', value: '📅 Thời gian & Địa điểm' },
      { type: 'text', value: '• Thời gian: 15-17/05/2026\n• Địa điểm: Công viên 23/9, Quận 1, TP.HCM\n• Giờ hoạt động: 10:00 - 22:00' },
      { type: 'heading', value: '🎪 Hoạt động nổi bật' },
      { type: 'text', value: '• 200+ gian hàng ẩm thực đường phố\n• Cuộc thi nấu ăn "MasterChef đường phố"\n• Workshop làm bánh mì, phở, bún bò\n• Khu vực ẩm thực quốc tế\n• Biểu diễn âm nhạc live mỗi tối' },
      { type: 'text', value: 'Vé vào cổng: MIỄN PHÍ! Hẹn gặp mọi người ở lễ hội nhé! 🎉' },
    ],
    comments: [
      { id: 'c1', author: 'Minh Anh', avatar: '🧑‍🍳', time: '1 ngày trước', likes: 10, content: 'Hay quá! Năm ngoái mình cũng đi, năm nay chắc chắn không bỏ lỡ 🎉', replies: [] },
    ],
  },
  5: {
    id: 5, author: 'Quốc Bảo', avatar: '🧑', category: 'question',
    title: 'Quán bánh mì nào ngon nhất TP.HCM? Cần gợi ý!', time: '3 ngày trước', readTime: '2 phút đọc',
    likes: 87, views: 650, tags: ['#BánhMì', '#TPHCM', '#HỏiĐáp'],
    content: [
      { type: 'text', value: 'Mình mới chuyển vào Sài Gòn, đang tìm quán bánh mì ngon. Mọi người gợi ý giúp mình với!' },
      { type: 'text', value: 'Mình thích bánh mì thịt nướng, pate gan và bánh mì bì. Nghe nói Sài Gòn có nhiều quán bánh mì ngon lắm, nhưng không biết bắt đầu từ đâu.' },
      { type: 'text', value: 'Tiêu chí:\n• Bánh mì giòn, ruột xốp\n• Nhân đầy đặn\n• Giá hợp lý (dưới 30k)\n• Vị Sài Gòn chính hiệu' },
      { type: 'text', value: 'Cảm ơn mọi người trước! 🙏' },
    ],
    comments: [
      { id: 'c1', author: 'Minh Anh', avatar: '🧑‍🍳', time: '2 ngày trước', likes: 18, content: 'Bánh mì Hòa Mã trên đường Cao Thắng nhé! Bánh mì ốp la huyền thoại Sài Gòn luôn 🥖', replies: [] },
      { id: 'c2', author: 'Hồng Ngọc', avatar: '👩‍🍳', time: '2 ngày trước', likes: 14, content: 'Bánh Mì Huỳnh Hoa ở Lê Thị Riêng đi bạn! Nhân siêu đầy, pate thơm lừng. Giá 45k nhưng worth it!', replies: [
        { id: 'r1', author: 'Quốc Bảo', avatar: '🧑', time: '2 ngày trước', likes: 2, content: 'Hơi vượt budget nhưng nghe hấp dẫn quá, mình sẽ thử! 😆' },
      ]},
      { id: 'c3', author: 'Đức Thành', avatar: '🧔', time: '1 ngày trước', likes: 11, content: 'Bánh mì Bảy Hổ trên đường Huỳnh Khương Ninh, quận 1. 25k/ổ, thịt nướng than siêu thơm!', replies: [] },
    ],
  },
  6: {
    id: 6, author: 'Lan Chi', avatar: '👧', category: 'review',
    title: 'Review quán cơm tấm Bụi – Hương vị Sài Gòn xưa', time: '3 ngày trước', readTime: '4 phút đọc',
    likes: 198, views: 1200, tags: ['#CơmTấm', '#SàiGòn', '#Review'],
    content: [
      { type: 'text', value: 'Quán cơm tấm nhỏ nằm trong hẻm đường Nguyễn Thị Minh Khai, không bảng hiệu, nhưng hương vị thì không lẫn vào đâu. Đây là quán cơm tấm mà mình ăn từ nhỏ.' },
      { type: 'heading', value: '🍖 Sườn nướng' },
      { type: 'text', value: 'Miếng sườn nướng than, cháy cạnh giòn rụm, thịt bên trong mềm mọng nước. Ướp gia vị vừa phải, ngọt tự nhiên từ thịt heo.' },
      { type: 'heading', value: '🥚 Trứng ốp la & Bì' },
      { type: 'text', value: 'Trứng ốp la lòng đào vừa chín tới, bì heo thái sợi trộn thính thơm nức mũi. Combo hoàn hảo!' },
      { type: 'heading', value: '🍚 Cơm tấm' },
      { type: 'text', value: 'Hạt cơm tấm tơi xốp, dẻo vừa phải. Nước mắm pha chua ngọt đậm đà, rưới lên là siêu hấp dẫn.' },
      { type: 'rating', label: 'Sườn nướng', score: 5 },
      { type: 'rating', label: 'Cơm tấm', score: 4.5 },
      { type: 'rating', label: 'Nước mắm', score: 5 },
      { type: 'rating', label: 'Giá cả', score: 4.5 },
      { type: 'text', value: 'Tổng kết: 35k cho một đĩa cơm tấm sườn bì chả hoàn hảo. Không gì bằng! ❤️' },
    ],
    comments: [
      { id: 'c1', author: 'Thu Hương', avatar: '👩', time: '2 ngày trước', likes: 8, content: 'Quán này gần chỗ mình! Ăn hoài không chán luôn. Nước mắm là điểm nhấn 💯', replies: [] },
      { id: 'c2', author: 'Minh Anh', avatar: '🧑‍🍳', time: '1 ngày trước', likes: 5, content: 'Cho mình xin địa chỉ chính xác được không bạn? Mình muốn ghé thử!', replies: [
        { id: 'r1', author: 'Lan Chi', avatar: '👧', time: '1 ngày trước', likes: 3, content: 'Hẻm 298 Nguyễn Thị Minh Khai, Q.3 nhé bạn! Mở sáng từ 6h-9h thôi nha.' },
      ]},
    ],
  },
};

const RELATED_POSTS = [
  { id: 2, title: 'Cách nấu bún bò Huế chuẩn vị miền Trung tại nhà', author: 'Hồng Ngọc', avatar: '👩‍🍳', likes: 189, category: 'recipe' },
  { id: 3, title: 'Bí kíp ăn vặt Sài Gòn với budget 50k', author: 'Đức Thành', avatar: '🧔', likes: 312, category: 'tips' },
  { id: 6, title: 'Review quán cơm tấm Bụi – Hương vị Sài Gòn xưa', author: 'Lan Chi', avatar: '👧', likes: 198, category: 'review' },
];

/* ─── Star rating ─── */
const StarDisplay = ({ score }) => {
  const full = Math.floor(score);
  const hasHalf = score % 1 >= 0.5;
  return (
    <span className="inline-flex items-center gap-0.5">
      {Array.from({ length: full }).map((_, i) => <span key={i} className="text-[#F5A623]">★</span>)}
      {hasHalf && <span className="text-[#F5A623]">★</span>}
      {Array.from({ length: 5 - full - (hasHalf ? 1 : 0) }).map((_, i) => <span key={`e${i}`} className="text-[#F5EDD8]">★</span>)}
      <span className="ml-1 text-xs font-bold text-[#4A3728]">{score}</span>
    </span>
  );
};

/* ─── Comment component ─── */
const CommentItem = ({ comment, isReply = false }) => {
  const [liked, setLiked] = useState(false);
  const [showReplyInput, setShowReplyInput] = useState(false);
  const [replyText, setReplyText] = useState('');

  return (
    <div className={`${isReply ? 'ml-12 pl-4 border-l-2 border-[#F5EDD8]' : ''}`}>
      <div className="flex gap-3 group">
        <div className={`${isReply ? 'w-8 h-8 text-sm' : 'w-10 h-10 text-lg'} rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center flex-shrink-0 ring-2 ring-[#F5EDD8] group-hover:ring-[#E8623A]/20 transition-all duration-300`}>
          {comment.avatar}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 mb-1">
            <span className="text-sm font-bold text-[#2C1810]">{comment.author}</span>
            <span className="text-[0.65rem] text-[#C8BEB5]">•</span>
            <span className="text-[0.65rem] text-[#7B7068]">{comment.time}</span>
          </div>
          <p className="text-sm text-[#4A3728] leading-relaxed mb-2">{comment.content}</p>
          <div className="flex items-center gap-4">
            <button
              onClick={() => setLiked(!liked)}
              className={`flex items-center gap-1 text-xs font-semibold transition-all duration-300 ${liked ? 'text-[#E8623A]' : 'text-[#C8BEB5] hover:text-[#E8623A]'}`}
            >
              {liked ? '❤️' : '🤍'} {liked ? comment.likes + 1 : comment.likes}
            </button>
            {!isReply && (
              <button
                onClick={() => setShowReplyInput(!showReplyInput)}
                className="text-xs font-semibold text-[#C8BEB5] hover:text-[#E8623A] transition-colors"
              >
                💬 Trả lời
              </button>
            )}
          </div>

          {/* Reply input */}
          {showReplyInput && (
            <div className="mt-3 flex gap-2 animate-fade-up">
              <input
                type="text"
                value={replyText}
                onChange={e => setReplyText(e.target.value)}
                placeholder="Viết trả lời..."
                className="flex-1 px-4 py-2 rounded-full bg-[#FFF8EE] border border-[#F5EDD8] text-sm text-[#2C1810] placeholder:text-[#C8BEB5] outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15 transition-all"
              />
              <button className="px-4 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-xs font-bold hover:shadow-md transition-shadow">
                Gửi
              </button>
            </div>
          )}
        </div>
      </div>

      {/* Replies */}
      {comment.replies?.length > 0 && (
        <div className="mt-4 space-y-4">
          {comment.replies.map(reply => (
            <CommentItem key={reply.id} comment={reply} isReply />
          ))}
        </div>
      )}
    </div>
  );
};

/* ─── Main ForumDetailPage ─── */
const ForumDetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [liked, setLiked] = useState(false);
  const [bookmarked, setBookmarked] = useState(false);
  const [commentText, setCommentText] = useState('');

  const post = MOCK_POSTS_FULL[id];

  // Scroll to top on mount
  useEffect(() => { window.scrollTo({ top: 0, behavior: 'smooth' }); }, [id]);

  if (!post) {
    return (
      <div className="min-h-screen bg-[#FAFAF7] flex flex-col items-center justify-center gap-4">
        <span className="text-6xl">🍃</span>
        <h2 className="text-xl font-bold text-[#2C1810]">Bài viết không tồn tại</h2>
        <Link to="/forum" className="px-6 py-2.5 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity text-sm">
          ← Quay lại diễn đàn
        </Link>
      </div>
    );
  }

  const cat = CATEGORIES_MAP[post.category];
  const relatedPosts = RELATED_POSTS.filter(p => p.id !== post.id).slice(0, 3);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Breadcrumb */}
      <FadeSection>
        <div className="bg-white border-b border-[#F5EDD8]/60">
          <div className="max-w-[1200px] mx-auto px-6 py-3 flex items-center gap-2 text-xs text-[#7B7068]">
            <Link to="/forum" className="hover:text-[#E8623A] transition-colors font-medium">💬 Diễn đàn</Link>
            <span className="text-[#C8BEB5]">/</span>
            <span className={`px-2 py-0.5 rounded-full text-[0.65rem] font-semibold ${cat?.color}`}>
              {cat?.icon} {cat?.label}
            </span>
            <span className="text-[#C8BEB5]">/</span>
            <span className="truncate max-w-[200px] text-[#4A3728] font-medium">{post.title}</span>
          </div>
        </div>
      </FadeSection>

      <div className="max-w-[1200px] mx-auto px-6 py-8">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main content */}
          <article className="flex-1 min-w-0">
            {/* Post header */}
            <FadeSection>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                {/* Meta */}
                <div className="flex items-center gap-3 mb-5">
                  <div className="w-12 h-12 rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center text-2xl ring-2 ring-[#F5EDD8]">
                    {post.avatar}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-[#2C1810]">{post.author}</p>
                    <div className="flex items-center gap-2 text-xs text-[#7B7068]">
                      <span>{post.time}</span>
                      <span className="w-1 h-1 rounded-full bg-[#C8BEB5]" />
                      <span>⏱ {post.readTime}</span>
                      <span className="w-1 h-1 rounded-full bg-[#C8BEB5]" />
                      <span>👁 {post.views.toLocaleString()} lượt xem</span>
                    </div>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-xs font-semibold ${cat?.color}`}>
                    {cat?.icon} {cat?.label}
                  </span>
                </div>

                {/* Title */}
                <h1 className="font-[Baloo_2,sans-serif] text-xl sm:text-2xl lg:text-3xl font-extrabold text-[#2C1810] mb-4 leading-tight">
                  {post.title}
                </h1>

                {/* Tags */}
                <div className="flex flex-wrap gap-2 mb-6">
                  {post.tags.map(tag => (
                    <span key={tag} className="px-3 py-1 rounded-full bg-[#FFF8EE] text-[#E8623A] text-xs font-semibold border border-[#F5EDD8] hover:bg-[#E8623A] hover:text-white transition-all duration-300 cursor-pointer">
                      {tag}
                    </span>
                  ))}
                </div>

                {/* Content */}
                <div className="space-y-4">
                  {post.content.map((block, i) => {
                    if (block.type === 'heading') {
                      return (
                        <h2 key={i} className="text-lg font-bold text-[#2C1810] mt-6 mb-2 flex items-center gap-2 border-l-3 border-[#E8623A] pl-3">
                          {block.value}
                        </h2>
                      );
                    }
                    if (block.type === 'rating') {
                      return (
                        <div key={i} className="flex items-center gap-3 bg-[#FFF8EE] rounded-xl px-4 py-2">
                          <span className="text-sm font-semibold text-[#4A3728] w-24">{block.label}</span>
                          <StarDisplay score={block.score} />
                        </div>
                      );
                    }
                    return (
                      <p key={i} className="text-sm text-[#4A3728] leading-relaxed whitespace-pre-line">
                        {block.value}
                      </p>
                    );
                  })}
                </div>

                {/* Action bar */}
                <div className="flex items-center gap-4 mt-8 pt-5 border-t border-[#F5EDD8]">
                  <button
                    onClick={() => setLiked(!liked)}
                    className={`flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-bold transition-all duration-300 ${
                      liked
                        ? 'bg-[#E8623A] text-white shadow-[0_4px_14px_rgba(232,98,58,0.3)] scale-105'
                        : 'bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#E8623A]/30'
                    }`}
                  >
                    {liked ? '❤️' : '🤍'} {liked ? post.likes + 1 : post.likes}
                  </button>
                  <button
                    onClick={() => setBookmarked(!bookmarked)}
                    className={`flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold transition-all duration-300 ${
                      bookmarked
                        ? 'bg-[#F5A623] text-white shadow-md'
                        : 'bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#F5A623]/30'
                    }`}
                  >
                    {bookmarked ? '🔖' : '📑'} {bookmarked ? 'Đã lưu' : 'Lưu bài'}
                  </button>
                  <button className="flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#E8623A]/30 transition-all duration-300 ml-auto">
                    ↗ Chia sẻ
                  </button>
                </div>
              </div>
            </FadeSection>

            {/* Comments section */}
            <FadeSection delay={100}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8">
                <h2 className="font-[Baloo_2,sans-serif] text-lg font-extrabold text-[#2C1810] mb-6 flex items-center gap-2">
                  💬 Bình luận ({post.comments.length})
                </h2>

                {/* New comment input */}
                <div className="flex gap-3 mb-8 pb-6 border-b border-[#F5EDD8]/60">
                  <div className="w-10 h-10 rounded-full bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-white text-sm font-bold flex-shrink-0">
                    U
                  </div>
                  <div className="flex-1">
                    <textarea
                      value={commentText}
                      onChange={e => setCommentText(e.target.value)}
                      placeholder="Viết bình luận..."
                      rows={3}
                      className="w-full px-4 py-3 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8] text-sm text-[#2C1810] placeholder:text-[#C8BEB5] outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15 transition-all resize-none"
                    />
                    <div className="flex justify-end mt-2">
                      <button className="px-5 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-xs font-bold shadow-sm hover:shadow-md hover:-translate-y-0.5 transition-all duration-300">
                        Gửi bình luận 📤
                      </button>
                    </div>
                  </div>
                </div>

                {/* Comments list */}
                <div className="space-y-6">
                  {post.comments.map(comment => (
                    <CommentItem key={comment.id} comment={comment} />
                  ))}
                </div>
              </div>
            </FadeSection>
          </article>

          {/* Sidebar */}
          <aside className="w-full lg:w-80 flex-shrink-0 space-y-6">
            {/* Author card */}
            <FadeSection delay={150}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5 text-center">
                <div className="w-16 h-16 mx-auto mb-3 rounded-full bg-gradient-to-br from-[#FFF8EE] via-[#FDECD8] to-[#FEF3C0] flex items-center justify-center text-3xl ring-3 ring-[#F5EDD8]">
                  {post.avatar}
                </div>
                <h3 className="text-sm font-bold text-[#2C1810]">{post.author}</h3>
                <p className="text-[0.65rem] text-[#7B7068] mt-0.5">Thành viên tích cực</p>
                <div className="flex items-center justify-center gap-4 mt-3 text-xs text-[#7B7068]">
                  <span>📝 42 bài</span>
                  <span>💬 156 bình luận</span>
                </div>
                <button className="mt-4 w-full py-2 rounded-full border-2 border-[#E8623A] text-[#E8623A] text-xs font-bold hover:bg-[#E8623A] hover:text-white transition-all duration-300">
                  👤 Theo dõi
                </button>
              </div>
            </FadeSection>

            {/* Related posts */}
            <FadeSection delay={250}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
                <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] mb-4 flex items-center gap-2">
                  📖 Bài viết liên quan
                </h3>
                <div className="space-y-3">
                  {relatedPosts.map(rp => (
                    <Link
                      key={rp.id}
                      to={`/forum/${rp.id}`}
                      className="flex items-start gap-3 p-3 rounded-xl hover:bg-[#FFF8EE] transition-colors group"
                    >
                      <div className="w-8 h-8 rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center text-sm ring-1 ring-[#F5EDD8] flex-shrink-0">
                        {rp.avatar}
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-xs font-bold text-[#2C1810] group-hover:text-[#E8623A] transition-colors line-clamp-2 leading-snug">{rp.title}</p>
                        <p className="text-[0.6rem] text-[#7B7068] mt-1">❤️ {rp.likes} • {rp.author}</p>
                      </div>
                    </Link>
                  ))}
                </div>
              </div>
            </FadeSection>

            {/* Back to forum */}
            <FadeSection delay={350}>
              <Link
                to="/forum"
                className="flex items-center justify-center gap-2 w-full py-3 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-2xl text-sm font-bold shadow-md hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300"
              >
                ← Quay lại Diễn đàn
              </Link>
            </FadeSection>
          </aside>
        </div>
      </div>
    </div>
  );
};

export default ForumDetailPage;
