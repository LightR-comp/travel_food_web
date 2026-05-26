import { useState, useEffect, useRef } from 'react';
import FacebookIcon from '../components/icon/Facebook-icon.png';
import InstagramIcon from '../components/icon/Instagram-icon.png';
import TikTokIcon from '../components/icon/TikTok-icon.png';
import YoutubeIcon from '../components/icon/Youtube-icon.png';
import MapsIcon from '../components/icon/Maps-icon.png';
import MailIcon from '../components/icon/Mail-icon.png';
import ClockIcon from '../components/icon/Clock-icon.png';

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

const CONTACT_INFO = [
  { icon: MapsIcon, label: 'Địa chỉ', value: 'Khu đô thị ĐHQG-HCM, Khu Phố 6, Đông Hòa, Hồ Chí Minh', color: 'from-[#E8623A] to-[#C04D2B]' },
  { icon: MailIcon, label: 'Email', value: 'support.yummap@gmail.com', color: 'from-[#F5A623] to-[#E8623A]' },
  { icon: ClockIcon, label: 'Giờ làm việc', value: 'Thứ 2 – Thứ 6: 08:00 – 17:30', color: 'from-[#E8623A] to-[#F4845A]' },
];

const ContactPage = () => {
  const [form, setForm] = useState({ name: '', subject: '', message: '' });
  const [submitted, setSubmitted] = useState(false);
  const [sending, setSending] = useState(false);

  const handleChange = (e) => setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSending(true);

    // Construct mailto link to send email directly to support.yummap@gmail.com
    const emailTo = 'support.yummap@gmail.com';
    const subjectLine = encodeURIComponent(`[YumMap] ${form.subject ? form.subject.toUpperCase() : 'LIÊN HỆ'} - ${form.name}`);
    const emailBody = encodeURIComponent(
      `Họ và tên: ${form.name}\n` +
      `Chủ đề: ${form.subject || 'Khác'}\n\n` +
      `Nội dung:\n${form.message}`
    );
    
    // Open user's email client
    window.location.href = `mailto:${emailTo}?subject=${subjectLine}&body=${emailBody}`;

    setSending(false);
    setSubmitted(true);
    setTimeout(() => setSubmitted(false), 5000);
    setForm({ name: '', subject: '', message: '' });
  };

  const inputClass = `
    w-full px-4 py-3 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8]
    text-sm text-[#2C1810] placeholder:text-[#C8BEB5]
    focus:outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15
    transition-all duration-300 hover:border-[#E8623A]/30
  `;

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero */}
      <FadeSection>
        <section
          className="relative overflow-hidden text-white py-20 sm:py-24"
          style={{
            backgroundImage: "url('https://i.pinimg.com/1200x/91/8a/7c/918a7c33fb1333c3daeed806202ed0c1.jpg')",
            backgroundSize: 'cover',
            backgroundPosition: 'center',
          }}
        >
          {/* Warm overlay for text legibility */}
          <div className="absolute inset-0 bg-[#2C1810]/45 backdrop-blur-[0.5px]" />

          <div className="absolute -top-20 -right-20 w-72 h-72 bg-[#E8623A]/20 rounded-full blur-[100px] animate-pulse" />
          <div className="absolute -bottom-20 -left-20 w-60 h-60 bg-[#F5A623]/15 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: '1s' }} />
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] border border-white/5 rounded-full" />

          <div className="relative z-10 max-w-[1200px] mx-auto px-6 text-center">
            <h1 className="font-iciel text-3xl sm:text-4xl lg:text-5xl mb-4 bg-gradient-to-r from-white via-[#F4845A] to-[#F5A623] bg-clip-text text-transparent drop-shadow-md py-2 leading-normal">
              Liên Hệ Chúng Tôi
            </h1>
            <p className="text-white/95 max-w-lg mx-auto text-sm sm:text-base leading-relaxed drop-shadow-sm font-medium">
              Bạn có câu hỏi, đóng góp hay phản hồi? Chúng tôi luôn sẵn lòng lắng nghe!
            </p>
          </div>
        </section>
      </FadeSection>

      {/* Contact info cards */}
      <section className="relative -mt-8 z-10 max-w-[1000px] mx-auto px-6">
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
          {CONTACT_INFO.map((info, i) => (
            <FadeSection key={info.label} delay={i * 100}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5 text-center hover:shadow-lg hover:border-[#E8623A]/20 hover:-translate-y-1 transition-all duration-500 group h-full">
                <div className="w-16 h-16 mx-auto mb-3 flex items-center justify-center group-hover:scale-110 transition-transform duration-300">
                  <img src={info.icon} alt={info.label} className="w-16 h-16 object-contain" />
                </div>
                <h3 className="text-xs font-bold uppercase tracking-wider text-[#7B7068] mb-1">{info.label}</h3>
                <p className="text-sm font-semibold text-[#2C1810]">{info.value}</p>
              </div>
            </FadeSection>
          ))}
        </div>
      </section>

      {/* Contact Form + Map */}
      <div className="max-w-[1200px] mx-auto px-6 py-16">
        <div className="grid lg:grid-cols-5 gap-10">
          {/* Form */}
          <FadeSection className="lg:col-span-3">
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 shadow-sm">
              <h2 className="font-[Baloo_2,sans-serif] text-xl sm:text-2xl font-extrabold text-[#2C1810] mb-2">
                Gửi tin nhắn cho chúng tôi
              </h2>
              <p className="text-sm text-[#7B7068] mb-6">Chúng tôi sẽ phản hồi trong vòng 24 giờ</p>

              {submitted && (
                <div className="mb-6 p-4 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-700 text-sm font-medium flex items-center gap-2 animate-fade-up">
                  ✅ Tin nhắn đã được gửi thành công! Cảm ơn bạn.
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                  <label className="block text-xs font-semibold text-[#4A3728] mb-1.5">Họ và tên *</label>
                  <input
                    type="text" name="name" required value={form.name} onChange={handleChange}
                    placeholder="Nguyễn Văn A" className={inputClass}
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#4A3728] mb-1.5">Chủ đề</label>
                  <select name="subject" value={form.subject} onChange={handleChange} className={inputClass}>
                    <option value="">Chọn chủ đề</option>
                    <option value="feedback">💬 Góp ý & phản hồi</option>
                    <option value="bug">🐛 Báo lỗi</option>
                    <option value="partner">🤝 Hợp tác kinh doanh</option>
                    <option value="other">📌 Khác</option>
                  </select>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#4A3728] mb-1.5">Nội dung *</label>
                  <textarea
                    name="message" required rows={5} value={form.message} onChange={handleChange}
                    placeholder="Nhập nội dung tin nhắn..."
                    className={`${inputClass} resize-none`}
                  />
                </div>

                <button
                  type="submit"
                  disabled={sending}
                  className={`
                    w-full sm:w-auto px-8 py-3 rounded-full text-sm font-bold text-white
                    bg-gradient-to-r from-[#E8623A] to-[#C04D2B]
                    shadow-[0_4px_14px_rgba(232,98,58,0.3)] hover:shadow-[0_8px_24px_rgba(232,98,58,0.4)]
                    hover:-translate-y-0.5 active:translate-y-0
                    transition-all duration-300
                    disabled:opacity-50 disabled:cursor-not-allowed disabled:hover:translate-y-0
                  `}
                >
                  {sending ? (
                    <span className="flex items-center gap-2">
                      <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                      Đang gửi...
                    </span>
                  ) : (
                    'Gửi tin nhắn'
                  )}
                </button>
              </form>
            </div>
          </FadeSection>

          {/* Sidebar info */}
          <FadeSection className="lg:col-span-2" delay={200}>
            <div className="space-y-6">


              {/* Social links */}
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
                <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] mb-4">Kết nối với chúng tôi</h3>
                <div className="grid grid-cols-2 gap-3">
                  {[
                    { name: 'Facebook', icon: FacebookIcon, href: '#' },
                    { name: 'Instagram', icon: InstagramIcon, href: '#' },
                    { name: 'TikTok', icon: TikTokIcon, href: '#' },
                    { name: 'Youtube', icon: YoutubeIcon, href: '#' },
                  ].map(social => (
                    <a
                      key={social.name}
                      href={social.href}
                      className="flex items-center gap-2.5 px-4 py-2.5 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8] text-sm font-semibold text-[#4A3728] hover:border-[#E8623A]/30 hover:text-[#E8623A] transition-all duration-300"
                    >
                      <img src={social.icon} alt={social.name} className="w-5 h-5 object-contain" />
                      {social.name}
                    </a>
                  ))}
                </div>
              </div>

              {/* FAQ shortcut */}
              <div className="bg-gradient-to-br from-[#E8623A] to-[#C04D2B] rounded-2xl p-5 text-white">
                <h3 className="font-[Baloo_2,sans-serif] font-bold mb-2">Câu hỏi thường gặp?</h3>
                <p className="text-sm text-white/80 mb-4">Hãy xem trung tâm hỗ trợ của chúng tôi</p>
                <a
                  href="/support"
                  className="inline-flex items-center gap-2 bg-white/15 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-semibold hover:bg-white/25 transition-colors"
                >
                  Trung tâm hỗ trợ
                </a>
              </div>
            </div>
          </FadeSection>
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

export default ContactPage;
