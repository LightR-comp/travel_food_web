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

const SECTIONS = [
  {
    id: 'accept',
    icon: '✅',
    title: '1. Chấp nhận Điều khoản',
    content: 'Bằng việc truy cập và sử dụng YumMap, bạn đồng ý tuân thủ các điều khoản và điều kiện được nêu trong tài liệu này. Nếu bạn không đồng ý với bất kỳ điều khoản nào, vui lòng ngừng sử dụng dịch vụ. Chúng tôi có quyền cập nhật điều khoản bất cứ lúc nào và thông báo qua email hoặc thông báo trên ứng dụng.',
  },
  {
    id: 'account',
    icon: '👤',
    title: '2. Tài khoản người dùng',
    content: 'Bạn phải đủ 13 tuổi trở lên để tạo tài khoản. Bạn chịu trách nhiệm bảo mật thông tin đăng nhập và mọi hoạt động diễn ra trên tài khoản. Mỗi người chỉ được sở hữu một tài khoản. Chúng tôi có quyền tạm khóa hoặc xóa tài khoản vi phạm điều khoản sử dụng.',
  },
  {
    id: 'content',
    icon: '📝',
    title: '3. Nội dung người dùng',
    items: [
      'Bạn sở hữu nội dung bạn đăng tải (đánh giá, ảnh, bình luận).',
      'Bằng việc đăng tải, bạn cấp cho YumMap quyền sử dụng phi độc quyền, miễn phí bản quyền để hiển thị, phân phối nội dung trên nền tảng.',
      'Nội dung không được chứa ngôn ngữ xúc phạm, phân biệt đối xử, hoặc thông tin sai lệch.',
      'Không được đăng nội dung vi phạm bản quyền hoặc quyền sở hữu trí tuệ của bên thứ ba.',
      'YumMap có quyền gỡ bỏ nội dung vi phạm mà không cần thông báo trước.',
    ],
  },
  {
    id: 'behavior',
    icon: '🤝',
    title: '4. Quy tắc ứng xử',
    items: [
      'Tôn trọng mọi thành viên trong cộng đồng.',
      'Không spam, quảng cáo hoặc gửi tin nhắn hàng loạt không mong muốn.',
      'Không giả mạo danh tính hoặc thông tin của người khác.',
      'Không sử dụng bot, script hoặc công cụ tự động để tương tác với dịch vụ.',
      'Không cố gắng truy cập trái phép vào hệ thống hoặc dữ liệu của người dùng khác.',
    ],
  },
  {
    id: 'restaurant',
    icon: '🏪',
    title: '5. Thông tin quán ăn',
    content: 'YumMap cung cấp thông tin quán ăn dựa trên dữ liệu thu thập và đóng góp từ cộng đồng. Chúng tôi nỗ lực đảm bảo tính chính xác nhưng không đảm bảo 100% thông tin luôn cập nhật (giờ mở cửa, giá cả, menu). Người dùng nên liên hệ trực tiếp quán ăn để xác nhận thông tin trước khi đến.',
  },
  {
    id: 'ip',
    icon: '©️',
    title: '6. Sở hữu trí tuệ',
    content: 'Thương hiệu YumMap, logo, giao diện, mã nguồn, thuật toán AI và tất cả tài sản trí tuệ liên quan thuộc sở hữu của YumMap. Bạn không được sao chép, sửa đổi, phân phối hoặc sử dụng cho mục đích thương mại mà không có sự đồng ý bằng văn bản.',
  },
  {
    id: 'liability',
    icon: '⚠️',
    title: '7. Giới hạn trách nhiệm',
    items: [
      'YumMap không chịu trách nhiệm về chất lượng dịch vụ của các quán ăn được liệt kê.',
      'Không chịu trách nhiệm về thiệt hại phát sinh từ việc sử dụng hoặc không thể sử dụng dịch vụ.',
      'Không đảm bảo dịch vụ hoạt động liên tục, không lỗi.',
      'Trách nhiệm tối đa của YumMap giới hạn ở số tiền bạn đã thanh toán cho dịch vụ (nếu có).',
    ],
  },
  {
    id: 'termination',
    icon: '🔚',
    title: '8. Chấm dứt',
    content: 'Bạn có thể ngừng sử dụng dịch vụ và xóa tài khoản bất cứ lúc nào. YumMap có quyền tạm ngưng hoặc chấm dứt quyền truy cập nếu bạn vi phạm điều khoản sử dụng. Khi tài khoản bị chấm dứt, quyền sử dụng dịch vụ sẽ dừng ngay lập tức.',
  },
  {
    id: 'law',
    icon: '⚖️',
    title: '9. Luật áp dụng',
    content: 'Điều khoản sử dụng này được điều chỉnh và giải thích theo pháp luật Việt Nam. Mọi tranh chấp phát sinh sẽ được giải quyết tại tòa án có thẩm quyền tại TP. Hồ Chí Minh, Việt Nam.',
  },
];

const TermsPage = () => {
  const [activeSection, setActiveSection] = useState('accept');

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero */}
      <FadeSection>
        <section className="relative overflow-hidden bg-gradient-to-br from-[#2C1810] via-[#4A3728] to-[#2C1810] text-white py-16 sm:py-20">
          <div className="absolute -top-20 -right-20 w-72 h-72 bg-[#E8623A]/20 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute -bottom-20 -left-20 w-60 h-60 bg-[#F5A623]/15 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: '1s' }} />

          <div className="relative max-w-[1200px] mx-auto px-6 text-center">
            <span className="inline-block text-5xl mb-4" style={{ animation: 'float 3s ease-in-out infinite' }}>📜</span>
            <h1 className="font-[Baloo_2,sans-serif] text-3xl sm:text-4xl lg:text-5xl font-extrabold mb-4 bg-gradient-to-r from-white via-[#F4845A] to-[#F5A623] bg-clip-text text-transparent">
              Điều Khoản Sử Dụng
            </h1>
            <p className="text-white/65 max-w-lg mx-auto text-sm sm:text-base leading-relaxed">
              Vui lòng đọc kỹ các điều khoản trước khi sử dụng dịch vụ YumMap
            </p>
            <div className="flex items-center justify-center gap-4 mt-6 text-xs text-white/40">
              <span>📅 Hiệu lực: 01/01/2026</span>
              <span className="w-1 h-1 rounded-full bg-white/30" />
              <span>📖 Phiên bản: 2.0</span>
            </div>
          </div>
        </section>
      </FadeSection>

      {/* Content */}
      <div className="max-w-[1200px] mx-auto px-6 py-12">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Sidebar navigation */}
          <FadeSection className="lg:w-72 flex-shrink-0">
            <nav className="lg:sticky lg:top-[130px] bg-white rounded-2xl border border-[#F5EDD8] p-4">
              <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] text-sm mb-3 px-2">📑 Mục lục</h3>
              <ul className="space-y-1">
                {SECTIONS.map(s => (
                  <li key={s.id}>
                    <button
                      onClick={() => {
                        setActiveSection(s.id);
                        document.getElementById(`terms-${s.id}`)?.scrollIntoView({ behavior: 'smooth', block: 'start' });
                      }}
                      className={`
                        w-full text-left px-3 py-2 rounded-xl text-xs transition-all duration-300
                        ${activeSection === s.id
                          ? 'bg-gradient-to-r from-[#E8623A]/10 to-transparent text-[#E8623A] font-bold'
                          : 'text-[#7B7068] hover:bg-[#FFF8EE] hover:text-[#4A3728]'}
                      `}
                    >
                      <span className="mr-1.5">{s.icon}</span>
                      {s.title}
                    </button>
                  </li>
                ))}
              </ul>
            </nav>
          </FadeSection>

          {/* Main content */}
          <div className="flex-1 min-w-0 space-y-6">
            {/* Intro banner */}
            <FadeSection>
              <div className="bg-gradient-to-r from-[#FFF8EE] to-[#FDECD8] rounded-2xl border border-[#F5EDD8] p-6 flex items-start gap-4">
                <span className="text-2xl flex-shrink-0 mt-0.5">ℹ️</span>
                <div>
                  <p className="text-sm text-[#4A3728] leading-relaxed">
                    Bằng việc sử dụng dịch vụ <strong className="text-[#2C1810]">YumMap</strong>, bạn đồng ý với các 
                    điều khoản dưới đây. Nếu bạn có câu hỏi, vui lòng liên hệ 
                    <a href="mailto:legal@yummap.vn" className="text-[#E8623A] font-semibold hover:underline ml-1">legal@yummap.vn</a>
                  </p>
                </div>
              </div>
            </FadeSection>

            {SECTIONS.map((section, i) => (
              <FadeSection key={section.id} delay={i * 60}>
                <div
                  id={`terms-${section.id}`}
                  className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 scroll-mt-[140px] hover:border-[#E8623A]/15 hover:shadow-sm transition-all duration-500"
                >
                  <h2 className="font-[Baloo_2,sans-serif] text-lg sm:text-xl font-extrabold text-[#2C1810] mb-4 flex items-center gap-3">
                    <span className="w-10 h-10 rounded-xl bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-lg shadow-sm">
                      {section.icon}
                    </span>
                    {section.title}
                  </h2>

                  {section.content && (
                    <p className="text-sm text-[#4A3728] leading-relaxed">{section.content}</p>
                  )}

                  {section.items && (
                    <ul className="space-y-3">
                      {section.items.map((item, j) => (
                        <li key={j} className="flex items-start gap-3 text-sm text-[#4A3728] leading-relaxed">
                          <span className="w-1.5 h-1.5 rounded-full bg-[#E8623A] mt-2 flex-shrink-0" />
                          {item}
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              </FadeSection>
            ))}

            {/* Agreement footer */}
            <FadeSection>
              <div className="bg-gradient-to-r from-[#2C1810] to-[#4A3728] rounded-2xl p-6 sm:p-8 text-white text-center">
                <span className="text-3xl block mb-3">🤝</span>
                <h3 className="font-[Baloo_2,sans-serif] text-lg font-extrabold mb-2">Đồng ý & Sử dụng</h3>
                <p className="text-sm text-white/70 mb-5 max-w-md mx-auto">
                  Bằng việc tiếp tục sử dụng YumMap, bạn xác nhận đã đọc, hiểu và đồng ý với toàn bộ điều khoản trên.
                </p>
                <div className="flex items-center justify-center gap-3">
                  <a
                    href="/policy"
                    className="inline-flex items-center gap-2 bg-white/10 backdrop-blur-sm px-5 py-2.5 rounded-full text-sm font-semibold hover:bg-white/20 transition-colors"
                  >
                    🛡️ Chính sách bảo mật
                  </a>
                  <a
                    href="/contact"
                    className="inline-flex items-center gap-2 bg-[#E8623A] px-5 py-2.5 rounded-full text-sm font-bold shadow-lg hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300"
                  >
                    📬 Liên hệ
                  </a>
                </div>
              </div>
            </FadeSection>
          </div>
        </div>
      </div>

      <style>{`
        @keyframes float {
          0%, 100% { transform: translateY(0); }
          50% { transform: translateY(-12px); }
        }
      `}</style>
    </div>
  );
};

export default TermsPage;
