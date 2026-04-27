import { Link } from 'react-router-dom';
import YumMapLogo from '../../assets/YumMap-logo.svg';

const FOOTER_LINKS = {
  'Trợ giúp': [
    { label: 'Trung tâm trợ giúp', to: '/support' },
    { label: 'Câu hỏi thường gặp', to: '/support' },
    { label: 'Chính sách bảo mật', to: '/policy' },
    { label: 'Điều khoản sử dụng', to: '/terms' },
  ],
  'Công ty': [
    { label: 'Về chúng tôi', to: '/about' },
    { label: 'Liên hệ chúng tôi', to: '/contact' },
    { label: 'Diễn đàn', to: '/forum' },
  ],
};

const SOCIAL_LINKS = [
  { name: 'Facebook', icon: '🔵', bg: '#1877F2', char: 'f' },
  { name: 'Instagram', icon: '📷', bg: 'linear-gradient(135deg, #f09433, #dc2743, #bc1888)' },
  { name: 'Tiktok', icon: '🎵', bg: '#000' },
  { name: 'Youtube', icon: '▶', bg: '#FF0000' },
];

const Footer = () => (
  <footer className="bg-[#2C1810] text-white/85 pt-12 mt-0">
    <div className="max-w-[1200px] mx-auto px-6">
      <div className="grid grid-cols-2 md:grid-cols-4 gap-8 pb-10">

        {/* Help & Company columns */}
        {Object.entries(FOOTER_LINKS).map(([title, links]) => (
          <div key={title}>
            <h4 className="font-[Baloo_2,sans-serif] font-bold text-white text-base mb-4">{title}</h4>
            <ul className="flex flex-col gap-2.5">
              {links.map(({ label, to }) => (
                <li key={label}>
                  <Link to={to} className="text-sm text-white/65 hover:text-[#F4845A] transition-colors">
                    {label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ))}

        {/* Social links */}
        <div>
          <h4 className="font-[Baloo_2,sans-serif] font-bold text-white text-base mb-4">Theo dõi chúng tôi trên</h4>
          <ul className="flex flex-col gap-3">
            {SOCIAL_LINKS.map(({ name, icon }) => (
              <li key={name}>
                <Link
                  to="#"
                  className="flex items-center gap-2.5 text-sm text-white/75 hover:text-white hover:translate-x-1 transition-all"
                >
                  <span className="text-base">{icon}</span>
                  {name}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Logo col */}
        <div className="flex flex-col gap-3">
          <img src={YumMapLogo} alt="YumMap" className="h-20 w-auto" />
          <p className="text-xs text-white/50 italic">Ẩm thực Việt – Đúng vị, đúng nơi</p>
        </div>

      </div>

      <div className="border-t border-white/10 py-4 text-center text-xs text-white/40">
        Copyright ©️ 2026 "YumMap". All rights reserved.
      </div>
    </div>
  </footer>
);

export default Footer;
