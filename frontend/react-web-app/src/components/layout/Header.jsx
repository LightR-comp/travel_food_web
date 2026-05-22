import { useState, useEffect } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import axiosInstance from '../../api/axiosInstance';
import YumMapLogo from '../../assets/YumMap-logo.svg';

// ---- Location Pin Icon ----
const LocationIcon = () => (
  <svg viewBox="0 0 24 24" fill="currentColor" className="w-3.5 h-3.5 text-[#E8623A] flex-shrink-0">
    <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
  </svg>
);

// ---- Search Icon ----
const SearchIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-4 h-4">
    <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
  </svg>
);



const Header = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const [scrolled, setScrolled] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [searchQ, setSearchQ] = useState('');
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const [address, setAddress] = useState('Đang tìm vị trí...');
  const [weather, setWeather] = useState(null);

  const fetchWeather = async (lat, lng) => {
    try {
      const response = await axiosInstance.get(`/utils/weather?lat=${lat}&lng=${lng}`);
      if (response.data && response.data.success) {
        setWeather(response.data.data);
      }
    } catch (err) {
      console.error("Lỗi khi tải thời tiết từ API:", err);
    }
  };

  useEffect(() => {
    const defaultLat = 21.0285;
    const defaultLng = 105.8542;

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        async (position) => {
          const { latitude, longitude } = position.coords;
          // 1. Fetch address
          try {
            const res = await fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}`);
            const data = await res.json();
            if (data && data.display_name) {
              const parts = data.display_name.split(',').map(s => s.trim());
              setAddress(parts.slice(0, 3).join(', '));
            } else {
              setAddress('Vị trí hiện tại');
            }
          } catch (error) {
            setAddress('Vị trí hiện tại');
          }
          // 2. Fetch weather
          fetchWeather(latitude, longitude);
        },
        (error) => {
          setAddress('Hà Nội, Việt Nam');
          fetchWeather(defaultLat, defaultLng);
        }
      );
    } else {
      setAddress('Hà Nội, Việt Nam');
      fetchWeather(defaultLat, defaultLng);
    }
  }, []);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 60);
    window.addEventListener('scroll', onScroll, { passive: true });
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  // Close mobile on route change
  useEffect(() => setMobileOpen(false), [location]);

  const handleSearch = (e) => {
    e.preventDefault();
    if (searchQ.trim()) navigate(`/search?q=${encodeURIComponent(searchQ.trim())}`);
  };

  const handleLogout = async () => {
    await logout();
    navigate('/');
  };

  return (
    <header
      className={`
        sticky top-0 z-[100] w-full
        transition-all duration-300
        ${scrolled
          ? 'bg-white/98 shadow-[0_2px_20px_rgba(44,24,16,0.12)]'
          : 'bg-white/95 shadow-[0_2px_8px_rgba(44,24,16,0.08)]'}
        backdrop-blur-md border-b border-[rgba(232,98,58,0.12)]
      `}
    >
      <div className="max-w-[1200px] mx-auto px-6 py-3 flex items-center justify-between gap-4">

        {/* Logo + Address */}
        <div className="flex items-center gap-3 flex-shrink-0">
          <Link to="/" className="flex items-center cursor-pointer group" aria-label="YumMap Home">
            <img
              src={YumMapLogo}
              alt="YumMap"
              className="h-16 w-auto group-hover:scale-105 transition-transform"
            />
          </Link>
          {/* Address display */}
          <div className="hidden md:flex items-center gap-1.5 bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-3 py-2 transition-all group cursor-default" title={address}>
            <LocationIcon />
            <span className="w-44 truncate bg-transparent text-xs font-medium text-[#2C1810]">
              {address}
            </span>
          </div>
        </div>

        {/* Center search (hidden on mobile) */}
        <form onSubmit={handleSearch} className="hidden md:flex flex-1 max-w-sm mx-4">
          <div className="flex w-full items-center bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-4 py-2 gap-2 focus-within:border-[#E8623A] focus-within:shadow-[0_0_0_2px_rgba(232,98,58,0.15)] transition-all">
            <SearchIcon />
            <input
              type="text"
              value={searchQ}
              onChange={(e) => setSearchQ(e.target.value)}
              placeholder="Tìm món ăn, quán ăn..."
              className="flex-1 bg-transparent outline-none text-sm text-[#2C1810] placeholder:text-[#C8BEB5]"
            />
          </div>
        </form>

        {/* Right: widgets + auth */}
        <div className="flex items-center gap-3">
          {/* Weather widget - kết nối backend */}
          <div className="hidden lg:flex items-center gap-2">
            {weather ? (
              <span 
                className="flex items-center gap-1 bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-2.5 py-1 text-xs font-semibold text-[#4A3728] transition-all hover:bg-[#F5EDD8] cursor-default"
                title={`${weather.description || 'Thời tiết'}, Độ ẩm: ${weather.humidity || 0}%`}
              >
                {weather.icon_url ? (
                  <img 
                    src={weather.icon_url} 
                    alt={weather.condition} 
                    className="w-6 h-6 object-contain"
                  />
                ) : (
                  <span className="mr-0.5">🌤️</span>
                )}
                <span>{Math.round(weather.temperature)}°C</span>
              </span>
            ) : (
              <span className="flex items-center gap-1.5 bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-3 py-1.5 text-xs font-semibold text-[#4A3728] animate-pulse">
                🌤️ Đang tải...
              </span>
            )}
          </div>

          {user ? (
            /* User avatar + dropdown */
            <div className="relative">
              <button
                onClick={() => setDropdownOpen((v) => !v)}
                className="flex items-center gap-2 bg-[#FFF8EE] hover:bg-[#F5EDD8] border border-[#F5EDD8] rounded-full px-3 py-1.5 transition-colors"
              >
                <div className="w-7 h-7 rounded-full bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-white font-bold text-xs">
                  {user.username?.[0]?.toUpperCase() || 'U'}
                </div>
                <span className="hidden sm:block text-sm font-semibold text-[#4A3728] max-w-[80px] truncate">
                  {user.username}
                </span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="w-3 h-3 text-[#7B7068]">
                  <polyline points="6,9 12,15 18,9" />
                </svg>
              </button>

              {dropdownOpen && (
                <div className="absolute right-0 top-full mt-2 min-w-[200px] max-w-[280px] bg-white rounded-2xl shadow-xl border border-[#F5EDD8] py-2 z-50">
                  <div className="px-4 py-2 border-b border-[#F5EDD8]">
                  <p className="text-sm font-bold text-[#2C1810] truncate">{user.full_name}</p>
                  <p className="text-xs text-[#7B7068] truncate">{user.email}</p>
                </div>

                {/* Profile page */}
                <Link
                  to="/profile"
                  className="w-full flex items-center gap-2 px-4 py-2 text-sm text-[#2C1810] hover:bg-[#FFF8EE] transition-colors"
                  onClick={() => setDropdownOpen(false)}
                >
                  👤 Trang cá nhân
                </Link>


                  <button
                    onClick={handleLogout}
                    className="w-full text-left px-4 py-2 text-sm text-red-500 hover:bg-red-50 transition-colors"
                  >
                    🚪 Đăng xuất
                  </button>
                </div>
              )}
            </div>
          ) : (
            /* Login / Signup buttons */
            <>
              <Link
                to="/login"
                className="hidden sm:inline-flex items-center justify-center px-5 py-2 border-2 border-[#E8623A] text-[#E8623A] rounded-full text-sm font-semibold hover:bg-[#E8623A] hover:text-white transition-all"
              >
                Đăng nhập
              </Link>
              <Link
                to="/signup"
                className="inline-flex items-center justify-center px-5 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-sm font-bold shadow-[0_4px_14px_rgba(232,98,58,0.3)] hover:shadow-[0_8px_24px_rgba(232,98,58,0.4)] hover:-translate-y-0.5 transition-all"
              >
                Đăng ký
              </Link>
            </>
          )}

          {/* Hamburger */}
          <button
            className="md:hidden flex flex-col gap-1.5 p-2 rounded-lg hover:bg-[#FFF8EE] transition-colors"
            onClick={() => setMobileOpen((v) => !v)}
            aria-label="Menu"
          >
            <span className={`block w-5 h-0.5 bg-[#2C1810] rounded transition-all ${mobileOpen ? 'rotate-45 translate-y-2' : ''}`} />
            <span className={`block w-5 h-0.5 bg-[#2C1810] rounded transition-all ${mobileOpen ? 'opacity-0' : ''}`} />
            <span className={`block w-5 h-0.5 bg-[#2C1810] rounded transition-all ${mobileOpen ? '-rotate-45 -translate-y-2' : ''}`} />
          </button>
        </div>
      </div>

      {/* Mobile Menu */}
      {mobileOpen && (
        <nav className="md:hidden px-6 pb-4 border-t border-[#F5EDD8] bg-white flex flex-col gap-1">
          <form onSubmit={handleSearch} className="flex items-center bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-4 py-2 gap-2 mt-3 mb-2">
            <SearchIcon />
            <input
              type="text"
              value={searchQ}
              onChange={(e) => setSearchQ(e.target.value)}
              placeholder="Tìm món ăn..."
              className="flex-1 bg-transparent outline-none text-sm text-[#2C1810] placeholder:text-[#C8BEB5]"
            />
          </form>
          {[
            { to: '/', label: '🏠 Dashboard' },
            { to: '/search', label: '🔍 Tìm kiếm' },
            { to: '/forum', label: '💬 Diễn đàn' },
            { to: '/about', label: 'ℹ️ Về chúng tôi' },
            { to: '/support', label: '🎧 Hỗ trợ' },
          ].map(({ to, label }) => (
            <Link
              key={label}
              to={to}
              className="px-4 py-2.5 rounded-xl text-sm font-medium text-[#4A3728] hover:bg-[#FFF8EE] hover:text-[#E8623A] transition-colors"
            >
              {label}
            </Link>
          ))}
          {!user && (
            <Link to="/login" className="px-4 py-2.5 rounded-xl text-sm font-semibold text-[#E8623A] hover:bg-[#FFF8EE] transition-colors">
              🔑 Đăng nhập
            </Link>
          )}
          {/* Address display in mobile menu */}
          <div className="flex items-center gap-1.5 bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-4 py-2 gap-2 mb-1" title={address}>
            <LocationIcon />
            <span className="flex-1 truncate bg-transparent text-sm font-medium text-[#2C1810]">
              {address}
            </span>
          </div>
        </nav>
      )}

    </header>
  );
};

export default Header;
