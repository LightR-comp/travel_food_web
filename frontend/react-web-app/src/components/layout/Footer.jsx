import { Link } from 'react-router-dom';
import YumMapLogo from '../../assets/YumMap-logo.svg';
import FacebookIcon from '../icon/Facebook-icon.png';
import InstagramIcon from '../icon/Instagram-icon.png';
import TikTokIcon from '../icon/TikTok-icon.png';
import YoutubeIcon from '../icon/Youtube-icon.png';

const FOOTER_LINKS = {
  'Trợ giúp': [
    { label: 'Trung tâm trợ giúp', to: '/support' },
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
  { name: 'Facebook', icon: FacebookIcon },
  { name: 'Instagram', icon: InstagramIcon },
  { name: 'Tiktok', icon: TikTokIcon },
  { name: 'Youtube', icon: YoutubeIcon },
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
                  className="flex items-center gap-2.5 text-sm text-white/65 hover:text-[#F4845A] hover:translate-x-1 transition-all"
                >
                  <img src={icon} alt={name} className="w-5 h-5 object-contain" />
                  {name}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Logo col */}
        <div className="relative flex flex-col items-center justify-center p-5 rounded-2xl bg-[#372017] border border-white/[0.08] transition-all duration-300 hover:border-[#F4845A]/30 hover:shadow-2xl hover:shadow-[#F4845A]/5 hover:-translate-y-1 h-full w-full overflow-hidden group">
          {/* Decorative subtle ambient glow */}
          <div className="absolute -inset-10 bg-gradient-to-r from-[#F4845A]/10 to-[#F29F05]/10 rounded-full blur-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-500 pointer-events-none" />
          
          <img 
            src={YumMapLogo} 
            alt="YumMap" 
            className="h-20 w-auto relative z-10 transition-transform duration-300 group-hover:scale-105" 
          />
          
          <p className="mt-4 text-[13px] font-medium tracking-wide text-white/80 group-hover:text-white relative z-10 italic text-center transition-colors duration-300">
            Ẩm thực Việt <span className="text-[#F4845A] font-bold mx-1">–</span> Đúng vị, đúng nơi
          </p>
        </div>

      </div>

      <div className="border-t border-white/10 py-4 text-center text-xs text-white/40">
        Copyright ©️ 2026 "YumMap". All rights reserved.
      </div>
    </div>
  </footer>
);

export default Footer;
