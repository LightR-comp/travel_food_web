import { useState, useEffect, useRef } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';


const TABS = [
  { id: 'dashboard', label: 'Dashboard', path: '/' },
  { id: 'search',    label: 'Search',    path: '/search' },
  { id: 'forum',     label: 'Forum',     path: '/forum' },
  { id: 'about',     label: 'About us',  path: '/about' },
  { id: 'support',   label: 'Support',   path: '/support' },
];

const NavTabs = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const [isVisible, setIsVisible] = useState(true);
  const lastScrollY = useRef(0);

  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;

      // Always show when close to the top
      if (currentScrollY <= 10) {
        setIsVisible(true);
        lastScrollY.current = currentScrollY;
        return;
      }

      // Avoid jitter on small scrolls
      const diff = Math.abs(currentScrollY - lastScrollY.current);
      if (diff < 5) return;

      if (currentScrollY > lastScrollY.current) {
        // Scrolling down -> hide
        setIsVisible(false);
      } else {
        // Scrolling up -> show
        setIsVisible(true);
      }

      lastScrollY.current = currentScrollY;
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);

  const isActive = (path) => {
    if (path === '/') {
      return location.pathname === '/';
    }
    return location.pathname.startsWith(path);
  };

  return (
    <div className={`fixed bottom-6 left-1/2 -translate-x-1/2 z-[100] w-[92%] sm:w-auto max-w-[700px] bg-[#FFFCE6]/90 backdrop-blur-md border border-[#EDD8C0] rounded-full px-5 py-2 flex items-center justify-between sm:justify-around overflow-x-auto scrollbar-none gap-2 shadow-[0_12px_40px_rgba(44,24,16,0.16)] transition-all duration-300 font-sarabun ${
      isVisible ? 'translate-y-0 opacity-100' : 'translate-y-24 opacity-0 pointer-events-none'
    }`}>
      {TABS.map((tab) => (
        <button
          key={tab.id}
          onClick={() => navigate(tab.path)}
          className={`
            px-5 py-1.5 rounded-full text-[0.85rem] font-bold italic transition-all duration-300 whitespace-nowrap flex-shrink-0 cursor-pointer
            ${isActive(tab.path)
              ? 'bg-[#FFFDEB] border border-[#2C1810]/30 text-[#2C1810] shadow-[0_2px_6px_rgba(44,24,16,0.08)] scale-[1.04]'
              : 'text-[#7B7068] hover:text-[#E8623A] hover:bg-white/40'}
          `}
          id={`nav-tab-${tab.id}`}
        >
          {tab.label}
        </button>
      ))}
    </div>
  );
};

export default NavTabs;
