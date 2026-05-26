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
  { name: 'Phạm Nguyễn Quang Sáng', avatar: 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-6/706982659_981718768152296_6804290194071511298_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFNo3eTa1CsZ797rvZvmoFQLS3XgifLZ5AtLdeCJ8tnkCvJNAXdvqC5E6tFhmoodPu2vPeXzJ6RqfiTitZjMrN1&_nc_ohc=ASBlmMCtMXcQ7kNvwF1Jcig&_nc_oc=AdpPpsWTxrltopqk7BRYHxZ5oohgYcpD5YTX9NyQdP2Op2YwjvdCrXm9odNf7N4gCmU&_nc_zt=23&_nc_ht=scontent.fsgn5-5.fna&_nc_gid=go84TmteFtGjt0sPttNTZA&_nc_ss=7b2a8&oh=00_Af7Q_nG2Vh-dJch70WGXBWr0WHoDbPHmf2nbj_As8ihHNg&oe=6A1A38A6' },
  { name: 'Nguyễn Khánh Đăng', avatar: 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/707523633_981721194818720_2529786717978328982_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGOk5u2Ebl2n50kv_Nab_OpxDuUSk-_fIfEO5RKT798h1ulCbIqjYe6pP6LJWspwrWWUJVKoC0NzPuPQRYl9jaX&_nc_ohc=dpqt7yyDj0IQ7kNvwEF9Soq&_nc_oc=AdqUGu4pnH6kr1xsUF_NxSSmKC2XPoAedDgeGxgEpCIiTfk3ADcw04X_EAwgqAD7-tc&_nc_zt=23&_nc_ht=scontent.fsgn5-10.fna&_nc_gid=QDDa4w9zFMBm4gv7ZDdaZA&_nc_ss=7b2a8&oh=00_Af5g1YD5HEifUnW4PE-0RAQVnWey4N7H6FYFuSTejX3h3Q&oe=6A1A4982' },
  { name: 'Nguyễn Lê Anh Kiên', avatar: 'https://scontent.fsgn5-6.fna.fbcdn.net/v/t39.30808-6/707581292_981718764818963_4570806076034280643_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeG7jP4ALAMfaWtgjTrAgrrZEtFI5stleisS0Ujmy2V6K1dKAriGkB9sumJjPLOSYAXOHc74rqBV_EFubE1-KVt5&_nc_ohc=JGselX1zEIcQ7kNvwE6HHZB&_nc_oc=AdqtN4ObrIN4_e7Db3YHr6XwSLM7jLPXvGX6BAK4lcygdifcAD8HVh_mW6tiUEPbkSI&_nc_zt=23&_nc_ht=scontent.fsgn5-6.fna&_nc_gid=FrYYOABTsiPwMclEO4T1BQ&_nc_ss=7b2a8&oh=00_Af6UQmCUA3sabRiqPYnlKOIwc41-GIiZjNEe0bPARzBlkw&oe=6A1A6578' },
  { name: 'Võ Đình Đình', avatar: 'https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.6435-9/180089779_1215226415559099_8337677280890062923_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeE6Hq46QLQBOFLBEt9KwGHgDxo2EODPm_IPGjYQ4M-b8pwua2Tiu_GjBEOaDeqWvzSTKHxJd-t4gxU_ifecOuJ6&_nc_ohc=Z5ANywLzqm8Q7kNvwFt-QYF&_nc_oc=Adq_Ql70mLinUz1YHSNsPxE9nP54PM22EW5qC-h3d3G0Lmsf08BQ-IgH0AA-efQTGLY&_nc_zt=23&_nc_ht=scontent.fsgn5-6.fna&_nc_gid=jgWN5UTYKwDT_5vFdwYjJA&_nc_ss=7b2a8&oh=00_Af7C7h9PHpKR5rnYv--vtIPC_yig9rQvATDGEZ9HZ4XWLw&oe=6A3BD4B6' },
  { name: 'Nguyễn Thành Đạt', avatar: 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-6/634479725_900784659579041_3756430268885978532_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFtJWvX3y4pvh0sdg66bnIsNMBzfseVhMM0wHN-x5WEw8IFsriiAEcHIClceMLjIq67DqzEFjw3c-2j51DD5Bhd&_nc_ohc=BiaYEVqU67UQ7kNvwF3KwvP&_nc_oc=AdqeBx8fd7cfEPtDPtKLz69Vk53hKL5GQGhTDsJykWZmuYGXRItCjzZkuprZL41NSXQ&_nc_zt=23&_nc_ht=scontent.fsgn5-12.fna&_nc_gid=-K3qtQaYAQmJxIPlwsgYxQ&_nc_ss=7b2a8&oh=00_Af6JpO2GACHwuo648nPC43caa2KWnkVyFxTFI2xcVw-MaA&oe=6A1A4EC9' },
  { name: 'Võ Nhật Minh', avatar: 'https://scontent.fsgn5-6.fna.fbcdn.net/v/t39.30808-6/701020015_1021196827043692_6399698190642810280_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGKnr7XcZgnKTOpnGiNSboOA57NCTQxE_4Dns0JNDET_k-eCKuf4nFE6zdE4ED1VXW_CKuLpdtNfNWW-uNYfZgb&_nc_ohc=5Yo-pr76sakQ7kNvwHzwwv-&_nc_oc=AdptirUHVh72BUyQ3XHz_wH8dRj-sUp99eGBqkXZ9CnJ2JEqofh9ZJVgldQKhslmRPs&_nc_zt=23&_nc_ht=scontent.fsgn5-6.fna&_nc_gid=Ul7ZcSGe4lRFvj-watqRbQ&_nc_ss=7b2a8&oh=00_Af4xSqobM4vn2A4kN4h95nLjsz6b5PkXnoYkkrENUQQ7Yg&oe=6A1A4843' },
  { name: 'Lê Công Minh Nhựt', avatar: 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-6/707393616_981718761485630_3023176207231412308_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGx3QFYqLqyU40a7vVGurD1aeohgfl99t1p6iGB-X323SVOqtv72nnYWufKjesctmOIRRuf774FqI8J-5IWS65d&_nc_ohc=dXmpJd8TG5YQ7kNvwExrBZq&_nc_oc=AdrY3ofK5i5V6MQwNyqmGRpKpQ-JYTwn0nyehu21f7J99iYYjdnxAv8YR5ftRnnatEM&_nc_zt=23&_nc_ht=scontent.fsgn5-5.fna&_nc_gid=b3CpJ1VrqkBILFzB1AOqyQ&_nc_ss=7b2a8&oh=00_Af4g0yORuafVSwE4yAe_mju811levED-4NZaqTm3vzcELw&oe=6A1A39D8' },
];

const VALUES = [
  { icon: '🎯', title: 'Chính xác', desc: 'Thông tin được kiểm chứng và cập nhật liên tục bởi cộng đồng.' },
  { icon: '❤️', title: 'Đam mê', desc: 'Tình yêu ẩm thực Việt Nam là động lực của mọi sản phẩm chúng tôi tạo ra.' },
  { icon: '🤝', title: 'Cộng đồng', desc: 'Xây dựng cộng đồng yêu ẩm thực lớn mạnh và gắn kết.' },
  { icon: '🚀', title: 'Sáng tạo', desc: 'Ứng dụng AI và công nghệ hiện đại để mang lại trải nghiệm tốt nhất.' },
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
              <div className="w-20 h-20 mx-auto mb-4 rounded-full bg-gradient-to-br from-[#FFF8EE] via-[#FDECD8] to-[#FEF3C0] flex items-center justify-center overflow-hidden ring-3 ring-[#F5EDD8] group-hover:ring-[#E8623A]/30 transition-all duration-500 group-hover:scale-105">
                {member.avatar.startsWith('http') || member.avatar.startsWith('/') || member.avatar.startsWith('data:') ? (
                  <img src={member.avatar} alt={member.name} referrerPolicy="no-referrer" className="w-full h-full object-cover" />
                ) : (
                  <span className="text-4xl">{member.avatar}</span>
                )}
              </div>
              <h3 className="text-sm font-bold text-[#2C1810] group-hover:text-[#E8623A] transition-colors">{member.name}</h3>
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
              Khám phá ngay
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
