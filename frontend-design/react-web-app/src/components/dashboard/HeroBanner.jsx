import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const HeroBanner = () => {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');

  const handleSearch = (e) => {
    e.preventDefault();
    navigate(`/search${query.trim() ? `?q=${encodeURIComponent(query.trim())}` : ''}`);
  };

  return (
    <section className="relative h-[380px] overflow-hidden" id="hero-section">
      {/* Background image */}
      <div className="absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=1600&q=80"
          alt="TP. Hồ Chí Minh"
          className="w-full h-full object-cover object-[center_30%] hover:scale-[1.04] transition-transform duration-[8s]"
        />
        {/* Gradient overlay */}
        <div className="absolute inset-0 bg-gradient-to-b from-black/15 to-[rgba(44,24,16,0.55)]" />
      </div>

      {/* Content */}
      <div className="relative z-10 flex flex-col items-center justify-center h-full px-6 text-center">
        <h1 className="font-[Baloo_2,sans-serif] text-[clamp(1.8rem,5vw,3rem)] font-extrabold text-white text-shadow-lg mb-3 animate-fade-up tracking-tight">
          Khám Phá Ẩm Thực Sài Gòn
        </h1>
        <p className="text-[clamp(0.9rem,2.5vw,1.15rem)] text-white/90 mb-7 font-light animate-fade-up" style={{ animationDelay: '0.15s' }}>
          AI gợi ý quán ngon – Đúng khẩu vị, đúng khoảnh khắc
        </p>

        {/* Search bar */}
        <form
          onSubmit={handleSearch}
          className="flex items-center bg-white rounded-full py-1.5 pl-5 pr-1.5 w-[min(560px,90%)] shadow-[0_16px_48px_rgba(44,24,16,0.18)] animate-fade-up"
          style={{ animationDelay: '0.3s' }}
          id="hero-search"
        >
          <input
            id="hero-search-input"
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Tìm món ăn, quán ăn, địa điểm..."
            className="flex-1 outline-none text-[0.95rem] text-[#2C1810] bg-transparent placeholder:text-[#C8BEB5] font-normal"
          />
          <button
            id="hero-search-btn"
            type="submit"
            className="w-10 h-10 rounded-full bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center flex-shrink-0 hover:scale-105 hover:shadow-[0_4px_14px_rgba(232,98,58,0.4)] transition-all"
          >
            <svg viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="2.5" className="w-4 h-4">
              <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
            </svg>
          </button>
        </form>
      </div>
    </section>
  );
};

export default HeroBanner;
