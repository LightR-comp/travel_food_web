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
    id: 'collection',
    icon: '📊',
    title: '1. Thu thập thông tin',
    content: [
      'Chúng tôi thu thập thông tin cá nhân khi bạn đăng ký tài khoản, bao gồm: họ tên, email, số điện thoại và ảnh đại diện (nếu có).',
      'Thông tin vị trí được thu thập khi bạn cho phép, để cung cấp gợi ý quán ăn gần bạn.',
      'Dữ liệu sử dụng ứng dụng như lịch sử tìm kiếm, đánh giá và yêu thích được lưu trữ để cá nhân hóa trải nghiệm.',
      'Chúng tôi sử dụng cookie và công nghệ tương tự để cải thiện dịch vụ.',
    ],
  },
  {
    id: 'usage',
    icon: '🎯',
    title: '2. Sử dụng thông tin',
    content: [
      'Cung cấp, duy trì và cải thiện dịch vụ YumMap.',
      'Gửi thông báo về quán ăn mới, khuyến mãi và sự kiện ẩm thực.',
      'Cá nhân hóa nội dung và gợi ý dựa trên sở thích ẩm thực.',
      'Phân tích xu hướng sử dụng để nâng cao trải nghiệm người dùng.',
      'Phát hiện và ngăn chặn gian lận, lạm dụng dịch vụ.',
    ],
  },
  {
    id: 'sharing',
    icon: '🤝',
    title: '3. Chia sẻ thông tin',
    content: [
      'Chúng tôi KHÔNG bán thông tin cá nhân cho bên thứ ba.',
      'Thông tin có thể được chia sẻ với đối tác nhà hàng để xử lý đặt bàn/đơn hàng.',
      'Chia sẻ với nhà cung cấp dịch vụ tin cậy (hosting, phân tích, thanh toán) theo hợp đồng bảo mật.',
      'Tuân thủ yêu cầu pháp lý hoặc bảo vệ quyền lợi của YumMap và người dùng.',
    ],
  },
  {
    id: 'security',
    icon: '🔒',
    title: '4. Bảo mật dữ liệu',
    content: [
      'Dữ liệu được mã hóa SSL/TLS trong quá trình truyền tải.',
      'Mật khẩu được hash bằng thuật toán bcrypt, không lưu dạng plaintext.',
      'Hệ thống được giám sát 24/7 và cập nhật bảo mật thường xuyên.',
      'Quyền truy cập dữ liệu được giới hạn cho nhân viên có thẩm quyền.',
    ],
  },
  {
    id: 'rights',
    icon: '⚖️',
    title: '5. Quyền của bạn',
    content: [
      'Truy cập và tải về dữ liệu cá nhân của bạn bất cứ lúc nào.',
      'Chỉnh sửa hoặc cập nhật thông tin cá nhân trong phần cài đặt tài khoản.',
      'Yêu cầu xóa tài khoản và toàn bộ dữ liệu liên quan.',
      'Từ chối nhận thông báo marketing qua email.',
      'Rút lại quyền truy cập vị trí bất cứ lúc nào.',
    ],
  },
  {
    id: 'cookies',
    icon: '🍪',
    title: '6. Cookie & Theo dõi',
    content: [
      'Cookie cần thiết: Đảm bảo hoạt động cơ bản của website.',
      'Cookie phân tích: Giúp hiểu cách người dùng sử dụng dịch vụ (Google Analytics).',
      'Cookie tùy chỉnh: Lưu tùy chọn ngôn ngữ, giao diện của bạn.',
      'Bạn có thể quản lý cookie thông qua cài đặt trình duyệt.',
    ],
  },
];

const PolicyPage = () => {
  const [activeSection, setActiveSection] = useState('collection');

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero */}
      <FadeSection>
        <section className="relative overflow-hidden bg-gradient-to-br from-[#2C1810] via-[#4A3728] to-[#2C1810] text-white py-16 sm:py-20">
          <div className="absolute -top-20 -right-20 w-72 h-72 bg-[#E8623A]/20 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute -bottom-20 -left-20 w-60 h-60 bg-[#F5A623]/15 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: '1s' }} />

          <div className="relative max-w-[1200px] mx-auto px-6 text-center">
            <span className="inline-block text-5xl mb-4" style={{ animation: 'float 3s ease-in-out infinite' }}>🛡️</span>
            <h1 className="font-[Baloo_2,sans-serif] text-3xl sm:text-4xl lg:text-5xl font-extrabold mb-4 bg-gradient-to-r from-white via-[#F4845A] to-[#F5A623] bg-clip-text text-transparent">
              Chính Sách Bảo Mật
            </h1>
            <p className="text-white/65 max-w-lg mx-auto text-sm sm:text-base leading-relaxed">
              Chúng tôi cam kết bảo vệ quyền riêng tư và dữ liệu cá nhân của bạn
            </p>
            <div className="flex items-center justify-center gap-4 mt-6 text-xs text-white/40">
              <span>📅 Cập nhật: 01/04/2026</span>
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
                        document.getElementById(`policy-${s.id}`)?.scrollIntoView({ behavior: 'smooth', block: 'start' });
                      }}
                      className={`
                        w-full text-left px-3 py-2 rounded-xl text-sm transition-all duration-300
                        ${activeSection === s.id
                          ? 'bg-gradient-to-r from-[#E8623A]/10 to-transparent text-[#E8623A] font-bold'
                          : 'text-[#7B7068] hover:bg-[#FFF8EE] hover:text-[#4A3728]'}
                      `}
                    >
                      <span className="mr-2">{s.icon}</span>
                      {s.title}
                    </button>
                  </li>
                ))}
              </ul>
            </nav>
          </FadeSection>

          {/* Main content */}
          <div className="flex-1 min-w-0 space-y-8">
            {/* Intro */}
            <FadeSection>
              <div className="bg-gradient-to-r from-[#FFF8EE] to-[#FDECD8] rounded-2xl border border-[#F5EDD8] p-6">
                <p className="text-sm text-[#4A3728] leading-relaxed">
                  <strong className="text-[#2C1810]">YumMap</strong> ("chúng tôi", "của chúng tôi") cam kết bảo vệ quyền 
                  riêng tư của người dùng. Chính sách bảo mật này mô tả cách chúng tôi thu thập, sử dụng, chia sẻ 
                  và bảo vệ thông tin cá nhân khi bạn sử dụng website và ứng dụng YumMap.
                </p>
              </div>
            </FadeSection>

            {SECTIONS.map((section, i) => (
              <FadeSection key={section.id} delay={i * 80}>
                <div
                  id={`policy-${section.id}`}
                  className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 scroll-mt-[140px] hover:border-[#E8623A]/15 hover:shadow-sm transition-all duration-500"
                >
                  <h2 className="font-[Baloo_2,sans-serif] text-lg sm:text-xl font-extrabold text-[#2C1810] mb-4 flex items-center gap-3">
                    <span className="w-10 h-10 rounded-xl bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-lg shadow-sm">
                      {section.icon}
                    </span>
                    {section.title}
                  </h2>
                  <ul className="space-y-3">
                    {section.content.map((item, j) => (
                      <li key={j} className="flex items-start gap-3 text-sm text-[#4A3728] leading-relaxed">
                        <span className="w-1.5 h-1.5 rounded-full bg-[#E8623A] mt-2 flex-shrink-0" />
                        {item}
                      </li>
                    ))}
                  </ul>
                </div>
              </FadeSection>
            ))}

            {/* Contact for privacy */}
            <FadeSection>
              <div className="bg-gradient-to-r from-[#E8623A] to-[#C04D2B] rounded-2xl p-6 sm:p-8 text-white text-center">
                <span className="text-3xl block mb-3">📧</span>
                <h3 className="font-[Baloo_2,sans-serif] text-lg font-extrabold mb-2">Câu hỏi về bảo mật?</h3>
                <p className="text-sm text-white/80 mb-4">Liên hệ với đội ngũ bảo mật của chúng tôi</p>
                <a
                  href="mailto:privacy@yummap.vn"
                  className="inline-flex items-center gap-2 bg-white/15 backdrop-blur-sm px-6 py-2.5 rounded-full text-sm font-semibold hover:bg-white/25 transition-colors"
                >
                  privacy@yummap.vn
                </a>
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

export default PolicyPage;
