import starIcon from '../icon/star-icon.png';
import locationIcon from '../icon/location-icon.png';
import priceTagIcon from '../icon/price tag-icon.png';

/** Badge chip – Popular / Must try / Trending */
export const Badge = ({ label, className = '' }) => {
  const colors = {
    Popular:   'bg-[#E8623A] text-white',
    'Must try': 'bg-[#F5A623] text-white',
    Trending:  'bg-[#E8623A] text-white',
    'Cơm tấm': 'bg-[#FFF8EE] text-[#E8623A] border border-[#E8623A]',
    'Must try badge': 'bg-[#4A3728] text-[#F5A623]',
    'Đóng cửa': 'bg-[#EF4444] text-white',
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
  const iconSizes = { sm: 'w-3 h-3', md: 'w-3.5 h-3.5', lg: 'w-4 h-4' };
  return (
    <span className={`inline-flex items-center gap-1 ${sizes[size]}`}>
      <img src={starIcon} alt="star" className={`${iconSizes[size]} object-contain`} />
      <span className="font-semibold text-[#4A3728]">{rating}</span>
      {count && <span className="text-[#7B7068]">({count})</span>}
    </span>
  );
};

/** Distance display */
export const Distance = ({ km, raw = false }) => (
  <span className="inline-flex items-center gap-1 text-xs text-[#7B7068]">
    <img src={locationIcon} alt="location" className="w-3 h-3 object-contain" />
    <span>{raw ? km : `${km} km`}</span>
  </span>
);

/** Price display */
export const PriceTag = ({ priceRange }) => (
  <span className="inline-flex items-center gap-1 text-xs font-bold text-[#E8623A] bg-[rgba(232,98,58,0.08)] px-2 py-0.5 rounded-md">
    <img src={priceTagIcon} alt="price tag" className="w-3 h-3 object-contain" />
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
      <svg className="animate-spin text-[#E8623A] w-full h-full" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="3" />
        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
      </svg>
    </div>
  );
};
