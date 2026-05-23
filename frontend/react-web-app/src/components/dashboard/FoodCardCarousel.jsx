import { useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { Badge, StarRating, Distance, PriceTag, Tag } from '../ui/index.jsx';
import { useLocation } from '../../context/LocationContext';

const DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&q=80';

// Helper: Haversine distance in km between two lat/lng points
const haversineDistance = (lat1, lon1, lat2, lon2) => {
  if (!lat1 || !lon1 || !lat2 || !lon2) return null;
  const toRad = (v) => (v * Math.PI) / 180;
  const R = 6371;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
};

// Helper: Format price as "40.000 đ"
const formatPriceVND = (val) => {
  if (val == null || val === '' || isNaN(val)) return null;
  return new Intl.NumberFormat('vi-VN').format(Number(val)) + ' đ';
};

// Helper: Extract image URL from various data shapes
const extractImageUrl = (images) => {
  if (!images || images.length === 0) return DEFAULT_IMAGE;
  const first = images[0];
  if (typeof first === 'string') return first || DEFAULT_IMAGE;
  if (first?.image_url) return first.image_url;
  return DEFAULT_IMAGE;
};

// ---- Scroll Arrow Button ----
const ScrollBtn = ({ direction, onClick }) => (
  <button
    onClick={onClick}
    aria-label={direction === 'left' ? 'Scroll left' : 'Scroll right'}
    className="flex-shrink-0 w-10 h-10 rounded-full bg-white border border-[#F5EDD8] shadow flex items-center justify-center text-[#2C1810] hover:bg-[#E8623A] hover:border-[#E8623A] hover:text-white hover:scale-105 transition-all z-10"
  >
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-4 h-4">
      {direction === 'left'
        ? <polyline points="15,18 9,12 15,6" />
        : <polyline points="9,18 15,12 9,6" />}
    </svg>
  </button>
);

// Helper: Check open status in real-time based on current local time
const checkIsOpenRealTime = (openTimeStr, closeTimeStr) => {
  if (!openTimeStr || !closeTimeStr) return false;
  try {
    const parseTime = (timeStr) => (timeStr || '').split(',').map(s => s.trim()).filter(Boolean);
    const openTimes = parseTime(openTimeStr);
    const closeTimes = parseTime(closeTimeStr);
    
    if (openTimes.length === 0 || closeTimes.length === 0) return false;
    
    const now = new Date();
    const cur = now.getHours() * 60 + now.getMinutes();

    const count = Math.min(openTimes.length, closeTimes.length);
    for (let i = 0; i < count; i++) {
      const [oh, om] = openTimes[i].split(':').map(Number);
      const [ch, cm] = closeTimes[i].split(':').map(Number);
      if (isNaN(oh) || isNaN(om) || isNaN(ch) || isNaN(cm)) continue;

      const open = oh * 60 + om;
      const close = ch * 60 + cm;
      if (close > open) {
        if (cur >= open && cur <= close) return true;
      } else {
        // Trường hợp qua nửa đêm
        if (cur >= open || cur <= close) return true;
      }
    }
    return false;
  } catch {
    return false;
  }
};

// ---- Single Food Card ----
export const FoodCard = ({ restaurant, featured = false, variant = 'trending' }) => {
  const navigate = useNavigate();
  const userLocation = useLocation();

  // API trả về flat structure
  const {
    id,
    name,
    rating,
    price_range,
    type,
    lat,
    lng,
    images,
    is_open,
    open_time,
    close_time,
  } = restaurant;

  const tags = type ? type.split(',').map(t => t.trim()) : [];
  const image_url = extractImageUrl(images);

  // Calculate real distance from user location
  const computedDistance = haversineDistance(userLocation.lat, userLocation.lon, lat, lng);
  const distanceDisplay = computedDistance != null
    ? (computedDistance < 1
        ? `${Math.round(computedDistance * 1000)} m`
        : `${computedDistance.toFixed(1)} km`)
    : null;

  const isSpots = variant === 'spots';

  // Tính trạng thái mở cửa theo thời gian thực tế của client
  const isOpenRealTime = checkIsOpenRealTime(open_time, close_time);

  if (featured) {
    return (
      <div
        className="bg-white rounded-2xl overflow-hidden shadow-sm hover:-translate-y-1.5 hover:shadow-md transition-all cursor-pointer flex-shrink-0 w-[200px]"
        onClick={() => navigate(`/detail/${id}`)}
      >
        <div className="relative h-[145px] overflow-hidden flex items-center justify-center">
          <img
            src={image_url}
            alt={name}
            loading="lazy"
            className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 hover:scale-105"
          />
          {/* Premium dark gradient overlay for text readability */}
          <div className="absolute inset-0 bg-gradient-to-br from-[rgba(61,26,10,0.65)] to-[rgba(107,45,21,0.92)] mix-blend-multiply" />
          <div className="absolute inset-0 bg-black/20" />

          {!isOpenRealTime && <Badge label="Đóng cửa" className="!left-auto right-2 animate-pulse" />}
          <div className="relative z-10 text-center px-3">
            <p className="text-[0.65rem] text-white/80 font-semibold tracking-widest uppercase mb-1">
              {name?.split(' ').slice(0, 2).join(' ')}
            </p>
            <span className="inline-block bg-[#F5A623] text-white text-[0.55rem] font-extrabold px-2 py-0.5 rounded tracking-widest uppercase mb-1">
              GOOD FOOD
            </span>
            <h3 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-white leading-none">
              {tags[0]?.toUpperCase()}
            </h3>
            <p className="text-[0.6rem] text-white/80 italic mt-1">ăn PHÚC, uống LỘC, sống THỌ</p>
          </div>
        </div>
        <div className="p-3">
          <h3 className="font-bold text-[0.88rem] text-[#2C1810] truncate mb-1">{name}</h3>
          <div className="flex flex-wrap gap-1 mb-1.5">
            {tags.map((t) => <Tag key={t} label={`• ${t}`} />)}
          </div>
          <div className="flex gap-2 flex-wrap mb-1.5">
            <StarRating rating={rating} count={null} />
            {distanceDisplay && <Distance km={distanceDisplay} raw />}
          </div>
          {!isSpots && formatPriceVND(price_range) && <PriceTag priceRange={formatPriceVND(price_range)} />}
          {open_time && close_time && (
            <p className="text-[0.72rem] text-[#7B7068] flex items-center gap-1.5 mt-2 flex-wrap">
              <span>🕐</span>
              <span>{open_time} - {close_time}</span>
              <span className={`text-[0.68rem] font-bold px-1.5 py-0.5 rounded transition-colors ${isOpenRealTime ? 'text-green-600 bg-green-50' : 'text-red-500 bg-red-50'}`}>
                {isOpenRealTime ? 'Đang mở cửa' : 'Đã đóng cửa'}
              </span>
            </p>
          )}
        </div>
      </div>
    );
  }

  return (
    <div
      className="bg-white rounded-2xl overflow-hidden shadow-sm hover:-translate-y-1.5 hover:shadow-md transition-all cursor-pointer flex-shrink-0 w-[200px]"
      onClick={() => navigate(`/detail/${id}`)}
      id={`food-card-${id}`}
    >
      {/* Image */}
      <div className="relative h-[155px] p-2.5 pb-0">
        <div className="w-full h-full rounded-[14px] overflow-hidden relative shadow-sm">
          <img
            src={image_url}
            alt={name}
            loading="lazy"
            className="w-full h-full object-cover transition-transform duration-500 hover:scale-105"
          />
          {!isOpenRealTime && <Badge label="Đóng cửa" className="!left-auto right-2 animate-pulse" />}
        </div>
      </div>

      {/* Body */}
      <div className="p-3">
        <h3 className="font-bold text-[0.88rem] text-[#2C1810] truncate mb-1">{name}</h3>
        <div className="flex flex-wrap gap-1 mb-1.5">
          {tags.slice(0, 2).map((t) => <Tag key={t} label={`• ${t}`} />)}
        </div>
        <div className="flex gap-2 flex-wrap mb-1.5">
          <StarRating rating={rating} count={null} />
          {distanceDisplay && <Distance km={distanceDisplay} raw />}
        </div>
        {!isSpots && formatPriceVND(price_range) && <PriceTag priceRange={formatPriceVND(price_range)} />}
        {open_time && close_time && (
          <p className="text-[0.72rem] text-[#7B7068] flex items-center gap-1.5 mt-2 flex-wrap">
            <span>🕐</span>
            <span>{open_time} - {close_time}</span>
            <span className={`text-[0.68rem] font-bold px-1.5 py-0.5 rounded transition-colors ${isOpenRealTime ? 'text-green-600 bg-green-50' : 'text-red-500 bg-red-50'}`}>
              {isOpenRealTime ? 'Đang mở cửa' : 'Đã đóng cửa'}
            </span>
          </p>
        )}
      </div>
    </div>
  );
};

// ---- Horizontal Carousel ----
const FoodCardCarousel = ({ restaurants = [], title, emoji, sectionId }) => {
  const scrollRef = useRef(null);
  const variant = sectionId === 'good-spots' ? 'spots' : 'trending';

  const scroll = (dir) => {
    if (!scrollRef.current) return;
    scrollRef.current.scrollBy({ left: dir * (218 * 2), behavior: 'smooth' });
  };

  return (
    <section className="py-12" id={sectionId}>
      <div className="max-w-[1200px] mx-auto px-6">
        <div className="mb-6">
          <h2 className="font-iciel text-2xl font-extrabold text-[#2C1810] tracking-wide inline-flex items-center gap-2">
            {title}
            {emoji && <span className="animate-flicker">{emoji}</span>}
          </h2>
        </div>

        <div className="flex items-center gap-3">
          <ScrollBtn direction="left" onClick={() => scroll(-1)} />
          <div ref={scrollRef} className="cards-scroll">
            {restaurants.map((r, i) => (
              <FoodCard
                key={r.id}
                restaurant={r}
                featured={false}
                variant={variant}
              />
            ))}
          </div>
          <ScrollBtn direction="right" onClick={() => scroll(1)} />
        </div>
      </div>
    </section>
  );
};

export default FoodCardCarousel;