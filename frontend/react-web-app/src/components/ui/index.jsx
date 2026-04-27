/** Badge chip – Popular / Must try / Trending */
export const Badge = ({ label, className = '' }) => {
  const colors = {
    Popular:   'bg-[#E8623A] text-white',
    'Must try': 'bg-[#F5A623] text-white',
    Trending:  'bg-[#E8623A] text-white',
    'Cơm tấm': 'bg-[#FFF8EE] text-[#E8623A] border border-[#E8623A]',
    'Must try badge': 'bg-[#4A3728] text-[#F5A623]',
  };
  const cls = colors[label] || 'bg-[#FFF8EE] text-[#4A3728]';

  return (
    <span
      className={`
        absolute top-2 left-2 z-10
        px-2.5 py-0.5 rounded-md
        text-[0.65rem] font-bold uppercase tracking-wide
        ${cls} ${className}
      `}
    >
      {label}
    </span>
  );
};

/** Inline tag chip */
export const Tag = ({ label }) => (
  <span className="px-2.5 py-0.5 rounded-md bg-[#FFF8EE] text-[#4A3728] text-xs font-medium border border-[#F5EDD8]">
    {label}
  </span>
);

/** Star rating display */
export const StarRating = ({ rating, count, size = 'sm' }) => {
  const sizes = { sm: 'text-xs', md: 'text-sm', lg: 'text-base' };
  return (
    <span className={`inline-flex items-center gap-1 ${sizes[size]}`}>
      <span className="text-[#F5A623]">⭐</span>
      <span className="font-semibold text-[#4A3728]">{rating}</span>
      {count && <span className="text-[#7B7068]">({count})</span>}
    </span>
  );
};

/** Distance display */
export const Distance = ({ km }) => (
  <span className="inline-flex items-center gap-1 text-xs text-[#7B7068]">
    <span>📍</span>
    <span>{km} km</span>
  </span>
);

/** Price display */
export const PriceTag = ({ priceRange }) => (
  <span className="inline-flex items-center gap-1 text-xs font-bold text-[#E8623A] bg-[rgba(232,98,58,0.08)] px-2 py-0.5 rounded-md">
    <span>🔥</span>
    {priceRange}
  </span>
);

/** Open status pill */
export const OpenStatus = ({ isOpen, statusText }) => (
  <span className={`text-xs font-semibold ${isOpen ? 'text-green-600' : 'text-red-500'}`}>
    {isOpen ? '✅' : '🔴'} {statusText}
  </span>
);

/** Toast notification */
export const Toast = ({ message, type = 'info', onClose }) => {
  const colors = {
    info:    'bg-[rgba(44,24,16,0.9)]',
    success: 'bg-[rgba(30,140,60,0.92)]',
    error:   'bg-[rgba(200,40,40,0.92)]',
  };
  return (
    <div className={`fixed bottom-8 left-1/2 -translate-x-1/2 z-[999] flex items-center gap-3 px-6 py-3 rounded-full text-white text-sm font-semibold shadow-xl backdrop-blur-sm animate-fade-up ${colors[type]}`}>
      {message}
      {onClose && (
        <button onClick={onClose} className="ml-2 opacity-70 hover:opacity-100 transition-opacity">✕</button>
      )}
    </div>
  );
};

/** Loading spinner */
export const Spinner = ({ size = 'md', className = '' }) => {
  const sizes = { sm: 'w-4 h-4', md: 'w-8 h-8', lg: 'w-12 h-12' };
  return (
    <div className={`${sizes[size]} ${className}`}>
      <svg className="animate-spin text-[#E8623A]" viewBox="0 0 24 24" fill="none">
        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4l3-3-3-3v4a10 10 0 100 10l-2-2a8 8 0 01-6-6z" />
      </svg>
    </div>
  );
};
