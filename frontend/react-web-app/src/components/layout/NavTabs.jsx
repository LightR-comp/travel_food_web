import { useNavigate, useLocation } from 'react-router-dom';

const TABS = [
  { id: 'dashboard', label: 'Dashboard', icon: '🏠', path: '/' },
  { id: 'search',    label: 'Tìm kiếm',  icon: '🔍', path: '/search' },
  { id: 'forum',     label: 'Diễn đàn',  icon: '💬', path: '/forum' },
  { id: 'about',     label: 'Về chúng tôi', icon: 'ℹ️', path: '/about' },
  { id: 'support',   label: 'Hỗ trợ',    icon: '🎧', path: '/support' },
];

const NavTabs = () => {
  const navigate = useNavigate();
  const location = useLocation();

  const isActive = (path) =>
    path === '/' ? location.pathname === '/' : location.pathname.startsWith(path);

  return (
    <section className="bg-white shadow-[0_2px_8px_rgba(44,24,16,0.06)] sticky top-[65px] z-[90]">
      <div className="max-w-[1200px] mx-auto px-6">
        <div className="flex items-center justify-around overflow-x-auto scrollbar-none py-2 gap-1">
          {TABS.map((tab) => (
            <button
              key={tab.id}
              onClick={() => navigate(tab.path)}
              className={`
                relative flex flex-col items-center gap-1 px-6 py-2 rounded-xl
                text-xs font-semibold transition-all duration-200 whitespace-nowrap flex-shrink-0
                ${isActive(tab.path)
                  ? 'text-[#E8623A]'
                  : 'text-[#7B7068] hover:text-[#E8623A] hover:bg-[#FFF8EE]'}
              `}
              id={`nav-tab-${tab.id}`}
            >
              <span className="text-[1.35rem]">{tab.icon}</span>
              <span>{tab.label}</span>
              {isActive(tab.path) && (
                <span className="absolute bottom-0 left-1/2 -translate-x-1/2 w-7 h-0.5 bg-[#E8623A] rounded-full" />
              )}
            </button>
          ))}
        </div>
      </div>
    </section>
  );
};

export default NavTabs;
