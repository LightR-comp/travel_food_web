const FILTER_OPTIONS = [
  { id: 'favorite',  label: 'Được yêu thích' },
  { id: 'good_rating', label: 'Đánh giá tốt' },
  { id: 'restaurant',  label: 'Nhà hàng' },
  { id: 'popular',     label: 'Bình dân' },
  { id: 'cheapest',    label: 'Giá thấp nhất' },
  { id: 'family',      label: 'Phù hợp cho gia đình' },
];

const SORT_OPTIONS = [
  { value: 'rating',    label: 'Điểm đánh giá' },
  { value: 'distance',  label: 'Khoảng cách' },
  { value: 'price_asc', label: 'Giá thấp → cao' },
  { value: 'price_desc','label': 'Giá cao → thấp' },
];

/**
 * Left sidebar for Search page
 */
const SearchSidebar = ({ priceRange, onPriceChange, filters, onFilterToggle, sort, onSortChange }) => {
  const [min, max] = priceRange;

  return (
    <aside className="w-full lg:w-[280px] flex-shrink-0 flex flex-col gap-5" id="search-sidebar">

      {/* Map Embed */}
      <div className="h-[180px] rounded-2xl overflow-hidden border border-[#D0E8F8] relative shadow-inner">
        <iframe
          title="Bản đồ TP.HCM"
          src="https://maps.google.com/maps?q=Hồ%20Chí%20Minh,%20Việt%20Nam&t=&z=12&ie=UTF8&iwloc=&output=embed"
          width="100%"
          height="100%"
          style={{ border: 0 }}
          allowFullScreen=""
          loading="lazy"
          className="absolute inset-0"
        ></iframe>
      </div>

      {/* Price range */}
      <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
        <h3 className="font-bold text-[#E8623A] text-base mb-4">Khoảng giá</h3>

        {/* Dual range slider combined into one visual track */}
        <div className="relative h-6 flex items-center mb-2 mt-2">
          {/* Custom track background */}
          <div className="absolute w-full h-1.5 bg-[#F5EDD8] rounded-full pointer-events-none"></div>
          {/* Colored track slice */}
          <div
            className="absolute h-1.5 bg-[#E8623A] rounded-full pointer-events-none"
            style={{
              left: `${(min / 1000000) * 100}%`,
              width: `${((max - min) / 1000000) * 100}%`,
            }}
          ></div>
          
          <input
            type="range"
            min={0}
            max={1000000}
            step={10000}
            value={min}
            onChange={(e) => onPriceChange([Math.min(+e.target.value, max - 10000), max])}
            className="absolute w-full appearance-none bg-transparent pointer-events-none [&::-webkit-slider-runnable-track]:appearance-none [&::-webkit-slider-thumb]:pointer-events-auto [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-4 [&::-webkit-slider-thumb]:h-4 [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-[#E8623A] [&::-webkit-slider-thumb]:cursor-pointer z-10"
          />
          <input
            type="range"
            min={0}
            max={1000000}
            step={10000}
            value={max}
            onChange={(e) => onPriceChange([min, Math.max(+e.target.value, min + 10000)])}
            className="absolute w-full appearance-none bg-transparent pointer-events-none [&::-webkit-slider-runnable-track]:appearance-none [&::-webkit-slider-thumb]:pointer-events-auto [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-4 [&::-webkit-slider-thumb]:h-4 [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-[#E8623A] [&::-webkit-slider-thumb]:cursor-pointer z-20"
          />
        </div>

        <div className="flex justify-between mt-3">
          <span className="text-xs font-semibold text-[#4A3728] bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-3 py-1">
            {min.toLocaleString('vi-VN')} VND
          </span>
          <span className="text-xs text-[#7B7068]">——</span>
          <span className="text-xs font-semibold text-[#4A3728] bg-[#FFF8EE] border border-[#F5EDD8] rounded-full px-3 py-1">
            {max === 1000000 ? '1.000.000' : max.toLocaleString('vi-VN')} VND
          </span>
        </div>
      </div>

      {/* Sort (mobile-friendly dropdown) */}
      <div className="lg:hidden bg-white rounded-2xl border border-[#F5EDD8] p-5">
        <h3 className="font-bold text-[#4A3728] text-sm mb-3">Sắp xếp theo</h3>
        <select
          value={sort}
          onChange={(e) => onSortChange(e.target.value)}
          className="w-full border border-[#F5EDD8] rounded-xl px-3 py-2 text-sm text-[#4A3728] bg-[#FFF8EE] outline-none focus:border-[#E8623A]"
        >
          {SORT_OPTIONS.map((o) => (
            <option key={o.value} value={o.value}>{o.label}</option>
          ))}
        </select>
      </div>

      {/* Popular filters */}
      <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
        <h3 className="font-bold text-[#4A3728] text-base mb-4">Lọc phổ biến</h3>
        <ul className="flex flex-col gap-3">
          {FILTER_OPTIONS.map(({ id, label }) => (
            <li key={id} className="flex items-center gap-3 cursor-pointer group" onClick={() => onFilterToggle(id)}>
              <div className={`
                w-5 h-5 rounded border-2 flex items-center justify-center flex-shrink-0 transition-colors
                ${filters.includes(id)
                  ? 'bg-[#E8623A] border-[#E8623A]'
                  : 'border-[#C8BEB5] group-hover:border-[#E8623A]'}
              `}>
                {filters.includes(id) && (
                  <svg viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="3" className="w-3 h-3">
                    <polyline points="20,6 9,17 4,12" />
                  </svg>
                )}
              </div>
              <span className={`text-sm transition-colors ${filters.includes(id) ? 'text-[#E8623A] font-semibold' : 'text-[#4A3728] group-hover:text-[#E8623A]'}`}>
                {label}
              </span>
            </li>
          ))}
        </ul>
      </div>
    </aside>
  );
};

export { SORT_OPTIONS };
export default SearchSidebar;
