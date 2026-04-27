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

/* ─── AnimatedCounter ─── */
const AnimatedCounter = ({ target, suffix = '' }) => {
  const [count, setCount] = useState(0);
  const [ref, visible] = useInView(0.3);
  useEffect(() => {
    if (!visible) return;
    let start = 0;
    const end = parseInt(target);
    const increment = end / 60;
    const timer = setInterval(() => {
      start += increment;
      if (start >= end) { setCount(end); clearInterval(timer); }
      else setCount(Math.ceil(start));
    }, 20);
    return () => clearInterval(timer);
  }, [visible, target]);
  return <span ref={ref}>{count.toLocaleString()}{suffix}</span>;
};

/* ─── Section Component ─── */
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

/* ─── Team data ─── */
const TEAM = [
  { name: 'Nguyễn Văn Minh', role: 'Founder & CEO', avatar: '👨‍💼', bio: 'Đam mê ẩm thực và công nghệ, 10 năm kinh nghiệm trong lĩnh vực F&B.' },
  { name: 'Trần Thị Hoa', role: 'CTO', avatar: '👩‍💻', bio: 'Chuyên gia AI/ML, xây dựng hệ thống gợi ý thông minh cho YumMap.' },
  { name: 'Lê Quốc Duy', role: 'Head of Design', avatar: '🧑‍🎨', bio: 'Thiết kế trải nghiệm người dùng tuyệt vời, yêu thích typography.' },
  { name: 'Phạm Ngọc Lan', role: 'Content Lead', avatar: '👩‍✈️', bio: 'Food blogger nổi tiếng, kết nối cộng đồng ẩm thực Việt Nam.' },
];

const VALUES = [
  { icon: '🎯', title: 'Chính xác', desc: 'Thông tin được kiểm chứng và cập nhật liên tục bởi cộng đồng.' },
  { icon: '❤️', title: 'Đam mê', desc: 'Tình yêu ẩm thực Việt Nam là động lực của mọi sản phẩm chúng tôi tạo ra.' },
  { icon: '🤝', title: 'Cộng đồng', desc: 'Xây dựng cộng đồng yêu ẩm thực lớn mạnh và gắn kết.' },
  { icon: '🚀', title: 'Sáng tạo', desc: 'Ứng dụng AI và công nghệ hiện đại để mang lại trải nghiệm tốt nhất.' },
];

const MILESTONES = [
  { year: '2024', event: 'YumMap ra đời với ý tưởng ban đầu', icon: '💡' },
  { year: '2025', event: 'Ra mắt phiên bản beta, 1000 người dùng đầu tiên', icon: '🎉' },
  { year: '2026', event: 'Tích hợp AI Chatbot, mở rộng 63 tỉnh thành', icon: '🤖' },
  { year: '2027', event: 'Mục tiêu 1 triệu người dùng trên toàn quốc', icon: '🌟' },
];

const AboutPage = () => {
  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero */}
      <FadeSection>
        <section className="relative overflow-hidden bg-gradient-to-br from-[#2C1810] via-[#4A3728] to-[#2C1810] text-white py-20 sm:py-28">
          {/* Decorative elements */}
          <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none">
            <div className="absolute -top-32 -right-32 w-96 h-96 bg-[#E8623A]/15 rounded-full blur-[120px] animate-pulse" />
            <div className="absolute -bottom-32 -left-32 w-80 h-80 bg-[#F5A623]/10 rounded-full blur-[100px] animate-pulse" style={{ animationDelay: '1.5s' }} />
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] border border-white/5 rounded-full" />
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] border border-white/[0.03] rounded-full" />
          </div>

          <div className="relative max-w-[1200px] mx-auto px-6 text-center">
            <span className="inline-block text-5xl mb-5" style={{ animation: 'float 3s ease-in-out infinite' }}>🍜</span>
            <h1 className="font-iciel text-3xl sm:text-4xl lg:text-5xl font-extrabold mb-5 text-[#F4845A] pb-2">
              Về Chúng Tôi
            </h1>
            <p className="text-white/65 max-w-2xl mx-auto text-sm sm:text-base leading-relaxed">
              YumMap không chỉ là ứng dụng tìm kiếm quán ăn – đó là người bạn đồng hành tin cậy, 
              giúp bạn khám phá những hương vị tuyệt vời nhất của ẩm thực Việt Nam.
            </p>
          </div>
        </section>
      </FadeSection>

      {/* Stats bar */}
      <section className="relative -mt-8 z-10 max-w-[900px] mx-auto px-6">
        <div className="bg-white rounded-2xl shadow-[0_8px_40px_rgba(44,24,16,0.08)] border border-[#F5EDD8]/60 p-6 grid grid-cols-2 sm:grid-cols-4 gap-6">
          {[
            { value: 50000, suffix: '+', label: 'Người dùng', icon: '👥' },
            { value: 2500, suffix: '+', label: 'Quán ăn', icon: '🏪' },
            { value: 63, suffix: '', label: 'Tỉnh thành', icon: '📍' },
            { value: 4.8, suffix: '⭐', label: 'Đánh giá', icon: '✨' },
          ].map(stat => (
            <div key={stat.label} className="text-center">
              <span className="text-2xl block mb-1">{stat.icon}</span>
              <p className="text-xl sm:text-2xl font-extrabold text-[#E8623A]">
                <AnimatedCounter target={stat.value} suffix={stat.suffix} />
              </p>
              <p className="text-xs text-[#7B7068] mt-1">{stat.label}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Mission */}
      <FadeSection className="max-w-[1200px] mx-auto px-6 py-16 sm:py-20">
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <div>
            <span className="text-xs font-bold uppercase tracking-widest text-[#E8623A] mb-3 block">Sứ mệnh</span>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl font-extrabold text-[#2C1810] mb-5">
              Kết nối mọi người qua <span className="text-[#E8623A]">hương vị</span>
            </h2>
            <p className="text-sm text-[#4A3728] leading-relaxed mb-4">
              Chúng tôi tin rằng ẩm thực là cầu nối văn hóa mạnh mẽ nhất. YumMap được tạo ra 
              với sứ mệnh giúp mọi người dễ dàng khám phá, chia sẻ và thưởng thức những trải 
              nghiệm ẩm thực tuyệt vời nhất Việt Nam.
            </p>
            <p className="text-sm text-[#4A3728] leading-relaxed">
              Với công nghệ AI tiên tiến, chúng tôi mang đến gợi ý cá nhân hóa, giúp bạn 
              tìm thấy quán ăn phù hợp nhất dù ở bất kỳ đâu trên đất nước Việt Nam xinh đẹp.
            </p>
          </div>
          <div className="grid grid-cols-2 gap-4">
            {VALUES.map((v, i) => (
              <FadeSection
                key={v.title}
                delay={i * 100}
                className="bg-white rounded-2xl border border-[#F5EDD8] p-5 hover:border-[#E8623A]/20 hover:shadow-lg transition-all duration-500 group"
              >
                <span className="text-3xl block mb-3 group-hover:scale-110 transition-transform duration-300">{v.icon}</span>
                <h3 className="text-sm font-bold text-[#2C1810] mb-1">{v.title}</h3>
                <p className="text-xs text-[#7B7068] leading-relaxed">{v.desc}</p>
              </FadeSection>
            ))}
          </div>
        </div>
      </FadeSection>

      {/* Timeline */}
      <section className="bg-gradient-to-b from-[#FFF8EE] to-[#FAFAF7] py-16 sm:py-20">
        <FadeSection className="max-w-[800px] mx-auto px-6">
          <div className="text-center mb-12">
            <span className="text-xs font-bold uppercase tracking-widest text-[#E8623A] mb-3 block">Hành trình</span>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl font-extrabold text-[#2C1810]">
              Câu Chuyện Của Chúng Tôi
            </h2>
          </div>

          <div className="relative">
            {/* Timeline line */}
            <div className="absolute left-6 sm:left-1/2 top-0 bottom-0 w-0.5 bg-gradient-to-b from-[#E8623A] via-[#F4845A] to-[#F5EDD8]" />

            {MILESTONES.map((m, i) => (
              <FadeSection key={m.year} delay={i * 150} className={`relative flex items-center gap-6 mb-10 last:mb-0 ${i % 2 === 0 ? 'sm:flex-row' : 'sm:flex-row-reverse'}`}>
                {/* Node */}
                <div className="absolute left-6 sm:left-1/2 -translate-x-1/2 w-12 h-12 rounded-full bg-white border-2 border-[#E8623A] flex items-center justify-center text-xl z-10 shadow-md">
                  {m.icon}
                </div>

                {/* Card */}
                <div className={`ml-20 sm:ml-0 sm:w-[calc(50%-40px)] ${i % 2 === 0 ? 'sm:pr-4 sm:text-right' : 'sm:pl-4'}`}>
                  <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5 shadow-sm hover:shadow-md hover:border-[#E8623A]/20 transition-all duration-500">
                    <span className="text-lg font-extrabold text-[#E8623A]">{m.year}</span>
                    <p className="text-sm text-[#4A3728] mt-1">{m.event}</p>
                  </div>
                </div>
              </FadeSection>
            ))}
          </div>
        </FadeSection>
      </section>

      {/* Team */}
      <FadeSection className="max-w-[1200px] mx-auto px-6 py-16 sm:py-20">
        <div className="text-center mb-12">
          <span className="text-xs font-bold uppercase tracking-widest text-[#E8623A] mb-3 block">Đội ngũ</span>
          <h2 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl font-extrabold text-[#2C1810]">
            Những Người Đứng Sau YumMap
          </h2>
        </div>

        <div className="grid grid-cols-2 lg:grid-cols-4 gap-6">
          {TEAM.map((member, i) => (
            <FadeSection
              key={member.name}
              delay={i * 100}
              className="group bg-white rounded-2xl border border-[#F5EDD8] p-6 text-center hover:shadow-xl hover:border-[#E8623A]/20 hover:-translate-y-1 transition-all duration-500"
            >
              <div className="w-20 h-20 mx-auto mb-4 rounded-full bg-gradient-to-br from-[#FFF8EE] via-[#FDECD8] to-[#FEF3C0] flex items-center justify-center text-4xl ring-3 ring-[#F5EDD8] group-hover:ring-[#E8623A]/30 transition-all duration-500 group-hover:scale-105">
                {member.avatar}
              </div>
              <h3 className="text-sm font-bold text-[#2C1810] group-hover:text-[#E8623A] transition-colors">{member.name}</h3>
              <p className="text-[0.7rem] font-semibold text-[#E8623A] mt-0.5">{member.role}</p>
              <p className="text-xs text-[#7B7068] mt-2 leading-relaxed">{member.bio}</p>
            </FadeSection>
          ))}
        </div>
      </FadeSection>

      {/* CTA */}
      <FadeSection>
        <section className="bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white py-16 text-center">
          <div className="max-w-[600px] mx-auto px-6">
            <span className="text-4xl block mb-4">🍽️</span>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl font-extrabold mb-4">
              Sẵn sàng khám phá?
            </h2>
            <p className="text-white/80 text-sm mb-8">
              Tham gia cùng hàng nghìn người dùng đã tin tưởng YumMap
            </p>
            <a
              href="/search"
              className="inline-flex items-center gap-2 bg-white text-[#E8623A] px-8 py-3 rounded-full font-bold text-sm shadow-lg hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300"
            >
              Khám phá ngay 🔍
            </a>
          </div>
        </section>
      </FadeSection>

      {/* Float animation keyframes */}
      <style>{`
        @keyframes float {
          0%, 100% { transform: translateY(0); }
          50% { transform: translateY(-12px); }
        }
      `}</style>
    </div>
  );
};

export default AboutPage;
