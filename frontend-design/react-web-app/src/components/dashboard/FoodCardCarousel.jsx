import { useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { Badge, StarRating, Distance, PriceTag, Tag } from '../ui/index.jsx';

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

// ---- Single Food Card ----
export const FoodCard = ({ restaurant, featured = false }) => {
  const navigate = useNavigate();
  const { id, restaurant_info, meta, tags, image_url, badge } = restaurant;

  if (featured) {
    // Dark featured card (Phúc Lộc Thọ style)
    return (
      <div
        className="bg-white rounded-2xl overflow-hidden shadow-sm hover:-translate-y-1.5 hover:shadow-md transition-all cursor-pointer flex-shrink-0 w-[200px]"
        onClick={() => navigate(`/detail/${id}`)}
      >
        <div className="relative h-[145px] bg-gradient-to-br from-[#3D1A0A] to-[#6B2D15] flex items-center justify-center">
          <div className="text-center px-3">
            <p className="text-[0.65rem] text-white/70 font-semibold tracking-widest uppercase mb-1">
              {restaurant_info.name.split(' ').slice(0, 2).join(' ')}
            </p>
            <span className="inline-block bg-[#F5A623] text-white text-[0.55rem] font-extrabold px-2 py-0.5 rounded tracking-widest uppercase mb-1">
              GOOD FOOD
            </span>
            <h3 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-white leading-none">
              {tags[0]?.toUpperCase()}
            </h3>
            <p className="text-[0.6rem] text-white/70 italic mt-1">ăn PHÚC, uống LỘC, sống THỌ</p>
          </div>
        </div>
        <div className="p-3">
          <h3 className="font-bold text-[0.88rem] text-[#2C1810] truncate mb-1">{restaurant_info.name}</h3>
          <div className="flex flex-wrap gap-1 mb-1.5">
            {tags.map((t) => <Tag key={t} label={`• ${t}`} />)}
          </div>
          <div className="flex gap-2 flex-wrap mb-1.5">
            <StarRating rating={meta.rating} count={meta.review_count} />
            <Distance km={meta.distance_km} />
          </div>
          <PriceTag priceRange={meta.price_range} />
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
      <div className="relative h-[145px] overflow-hidden">
        <img
          src={image_url}
          alt={restaurant_info.name}
          loading="lazy"
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
        />
        {badge && <Badge label={badge} />}
      </div>

      {/* Body */}
      <div className="p-3">
        <h3 className="font-bold text-[0.88rem] text-[#2C1810] truncate mb-1">{restaurant_info.name}</h3>
        <div className="flex flex-wrap gap-1 mb-1.5">
          {tags.slice(0, 2).map((t) => <Tag key={t} label={`• ${t}`} />)}
        </div>
        <div className="flex gap-2 flex-wrap mb-1.5">
          <StarRating rating={meta.rating} count={meta.review_count} />
          <Distance km={meta.distance_km} />
        </div>
        <PriceTag priceRange={meta.price_range} />
      </div>
    </div>
  );
};

// ---- Horizontal Carousel ----
const FoodCardCarousel = ({ restaurants = [], title, emoji, sectionId }) => {
  const scrollRef = useRef(null);

  const scroll = (dir) => {
    if (!scrollRef.current) return;
    scrollRef.current.scrollBy({ left: dir * (218 * 2), behavior: 'smooth' });
  };

  return (
    <section className="py-12" id={sectionId}>
      <div className="max-w-[1200px] mx-auto px-6">
        {/* Section header */}
        <div className="mb-6">
          <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold text-[#2C1810] tracking-wide inline-flex items-center gap-2">
            {title}
            {emoji && <span className="animate-flicker">{emoji}</span>}
          </h2>
        </div>

        {/* Scroll wrapper */}
        <div className="flex items-center gap-3">
          <ScrollBtn direction="left" onClick={() => scroll(-1)} />
          <div ref={scrollRef} className="cards-scroll">
            {restaurants.map((r, i) => (
              <FoodCard
                key={r.id}
                restaurant={r}
                featured={i === 2 && sectionId === 'good-spots'}
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
