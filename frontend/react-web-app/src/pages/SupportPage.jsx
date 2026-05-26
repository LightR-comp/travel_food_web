import { useState, useEffect, useRef } from 'react';

/* ─── Intersection Observer hook ─── */
const useInView = (threshold = 0.15) => {
  const ref = useRef(null);
  const [visible, setVisible] = useState(false);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const obs = new IntersectionObserver(([e]) => { if (e.isIntersecting) { setVisible(true); obs.disconnect(); } }, { threshold });
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
    >
      {children}
    </div>
  );
};

const FAQ_DATA = [
  {
    category: 'Tìm kiếm',
    questions: [
      { q: 'Làm sao để tìm quán ăn gần tôi?', a: 'Bật định vị trên thiết bị, YumMap sẽ tự động gợi ý các quán ăn trong phạm vi 5km xung quanh bạn. Bạn cũng có thể điều chỉnh bán kính tìm kiếm trong bộ lọc.' },
      { q: 'Tôi có thể lọc theo loại món ăn không?', a: 'Có! Bạn có thể lọc theo nhiều tiêu chí: loại món (phở, bún, cơm, ...), khoảng giá, đánh giá, khoảng cách, và trạng thái mở/đóng cửa.' },
      { q: 'Kết quả tìm kiếm được sắp xếp như thế nào?', a: 'Mặc định theo độ phù hợp. Bạn có thể sắp xếp theo: đánh giá cao nhất, gần nhất, phổ biến nhất, hoặc giá từ thấp đến cao.' },
    ],
  },
  {
    category: 'Tài khoản',
    questions: [
      { q: 'Làm sao để tạo tài khoản?', a: 'Nhấn nút "Đăng ký" ở góc trên, điền thông tin email, mật khẩu và họ tên. Bạn cũng có thể đăng ký nhanh bằng tài khoản Google.' },
      { q: 'Tôi quên mật khẩu, phải làm sao?', a: 'Tại trang đăng nhập, nhấn "Quên mật khẩu", nhập email đăng ký. Chúng tôi sẽ gửi link đặt lại mật khẩu trong vài phút.' },
      { q: 'Làm sao để xóa tài khoản?', a: 'Vào Cài đặt > Tài khoản > Xóa tài khoản. Dữ liệu sẽ được xóa vĩnh viễn trong 30 ngày. Bạn cũng có thể liên hệ support@yummap.vn.' },
    ],
  },
  {
    category: 'AI Chatbot',
    questions: [
      { q: 'AI Chatbot có thể giúp gì cho tôi?', a: 'AI Chatbot giúp gợi ý quán ăn theo sở thích, trả lời câu hỏi về ẩm thực, chia sẻ công thức nấu ăn, và tư vấn lộ trình food tour.' },
      { q: 'Dữ liệu chat có được lưu không?', a: 'Lịch sử chat được lưu trong phiên làm việc để chatbot hiểu ngữ cảnh tốt hơn. Bạn có thể xóa lịch sử bất cứ lúc nào.' },
    ],
  },
  {
    category: 'Đánh giá & Bài viết',
    questions: [
      { q: 'Làm sao để viết đánh giá?', a: 'Mở trang chi tiết quán ăn, kéo xuống phần Đánh giá và nhấn "Viết đánh giá". Bạn cần đăng nhập để thực hiện.' },
      { q: 'Đánh giá của tôi bị ẩn?', a: 'Đánh giá có thể bị ẩn nếu vi phạm quy tắc cộng đồng (ngôn từ không phù hợp, spam, ...). Bạn có thể liên hệ hỗ trợ để khiếu nại.' },
    ],
  },
];

const CONTACT_CHANNELS = [
  { icon: '📧', label: 'Email', value: 'support@yummap.vn', desc: 'Phản hồi trong 24h', color: 'from-[#E8623A] to-[#C04D2B]' },
  { icon: '💬', label: 'Live Chat', value: 'Chat trực tuyến', desc: 'Thứ 2-6, 8:00-17:30', color: 'from-[#F5A623] to-[#E8623A]' },
  { icon: '📞', label: 'Hotline', value: '1900 xxxx', desc: 'Miễn phí cuộc gọi', color: 'from-[#C04D2B] to-[#E8623A]' },
];

const SupportPage = () => {
  const [openIndex, setOpenIndex] = useState(null);
  const [searchQuery, setSearchQuery] = useState('');

  const toggleFAQ = (catIdx, qIdx) => {
    const key = `${catIdx}-${qIdx}`;
    setOpenIndex(openIndex === key ? null : key);
  };

  const filteredFAQ = FAQ_DATA.map(cat => ({
    ...cat,
    questions: cat.questions.filter(q =>
      q.q.toLowerCase().includes(searchQuery.toLowerCase()) ||
      q.a.toLowerCase().includes(searchQuery.toLowerCase())
    ),
  })).filter(cat => cat.questions.length > 0);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero */}
      <FadeSection>
        <section 
          className="relative overflow-hidden text-white py-16 sm:py-20"
          style={{
            backgroundImage: "url('https://i.pinimg.com/736x/93/34/5e/93345e29805f58551673f2da34a356bc.jpg')",
            backgroundSize: 'cover',
            backgroundPosition: 'center',
          }}
        >
          {/* Dark overlay for text legibility */}
          <div className="absolute inset-0 bg-[#2C1810]/60 backdrop-blur-[0.5px]" />
          <div className="absolute -top-20 -right-20 w-72 h-72 bg-[#E8623A]/20 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute -bottom-20 -left-20 w-60 h-60 bg-[#F5A623]/15 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: '1s' }} />

          <div className="relative max-w-[1200px] mx-auto px-6 text-center">
            <h1 className="font-iciel text-3xl sm:text-4xl lg:text-5xl font-extrabold mb-4 text-[#F4845A] pb-2">
              Trung Tâm Hỗ Trợ
            </h1>
            <p className="text-white/65 max-w-lg mx-auto text-sm sm:text-base leading-relaxed mb-8">
              Chúng tôi luôn ở đây để giúp bạn. Tìm câu trả lời nhanh hoặc liên hệ trực tiếp.
            </p>

            {/* Search */}
            <div className="max-w-md mx-auto">
              <div className="flex items-center bg-white/10 backdrop-blur-md border border-white/20 rounded-full px-5 py-3 gap-3 focus-within:border-[#F4845A] focus-within:bg-white/15 transition-all duration-300">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-4 h-4 text-white/60">
                  <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
                </svg>
                <input
                  type="text"
                  value={searchQuery}
                  onChange={e => setSearchQuery(e.target.value)}
                  placeholder="Tìm kiếm câu hỏi..."
                  className="flex-1 bg-transparent outline-none text-sm text-white placeholder:text-white/40"
                />
              </div>
            </div>
          </div>
        </section>
      </FadeSection>


      {/* FAQ */}
      <div className="max-w-[900px] mx-auto px-6 py-16">
        <FadeSection>
          <div className="text-center mb-10">
            <span className="text-xs font-bold uppercase tracking-widest text-[#E8623A] mb-2 block">FAQ</span>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl font-extrabold text-[#2C1810]">
              Câu Hỏi Thường Gặp
            </h2>
          </div>
        </FadeSection>

        {filteredFAQ.length === 0 ? (
          <div className="text-center py-12">
            <span className="text-5xl block mb-3">🔍</span>
            <p className="text-[#7B7068] font-medium">Không tìm thấy kết quả phù hợp</p>
            <p className="text-xs text-[#C8BEB5] mt-1">Thử tìm kiếm với từ khóa khác</p>
          </div>
        ) : (
          <div className="space-y-8">
            {filteredFAQ.map((cat, catIdx) => (
              <FadeSection key={cat.category} delay={catIdx * 100}>
                <div>
                  <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] text-lg mb-4 flex items-center gap-2">
                    {cat.category}
                  </h3>
                  <div className="space-y-3">
                    {cat.questions.map((item, qIdx) => {
                      const isOpen = openIndex === `${catIdx}-${qIdx}`;
                      return (
                        <div
                          key={qIdx}
                          className={`bg-white rounded-xl border transition-all duration-500 overflow-hidden ${isOpen ? 'border-[#E8623A]/30 shadow-md' : 'border-[#F5EDD8] hover:border-[#E8623A]/15'}`}
                        >
                          <button
                            onClick={() => toggleFAQ(catIdx, qIdx)}
                            className="w-full flex items-center justify-between px-5 py-4 text-left"
                          >
                            <span className="text-sm font-semibold text-[#2C1810] pr-4">{item.q}</span>
                            <span className={`text-[#E8623A] transition-transform duration-300 flex-shrink-0 ${isOpen ? 'rotate-180' : ''}`}>
                              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-4 h-4">
                                <polyline points="6,9 12,15 18,9" />
                              </svg>
                            </span>
                          </button>
                          <div
                            className={`transition-all duration-500 ease-out ${isOpen ? 'max-h-48 opacity-100' : 'max-h-0 opacity-0'}`}
                          >
                            <div className="px-5 pb-4 text-sm text-[#4A3728] leading-relaxed border-t border-[#F5EDD8]/50 pt-3">
                              {item.a}
                            </div>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>
              </FadeSection>
            ))}
          </div>
        )}
      </div>

      {/* Still need help */}
      <FadeSection>
        <section className="bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white py-14 text-center">
          <div className="max-w-[500px] mx-auto px-6">
            <span className="text-4xl block mb-3">💡</span>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold mb-3">
              Vẫn cần trợ giúp?
            </h2>
            <p className="text-sm text-white/80 mb-6">Đội ngũ hỗ trợ của chúng tôi luôn sẵn sàng giải đáp</p>
            <a
              href="/contact"
              className="inline-flex items-center gap-2 bg-white text-[#E8623A] px-8 py-3 rounded-full font-bold text-sm shadow-lg hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300"
            >
              Liên hệ chúng tôi
            </a>
          </div>
        </section>
      </FadeSection>

    </div>
  );
};

export default SupportPage;
