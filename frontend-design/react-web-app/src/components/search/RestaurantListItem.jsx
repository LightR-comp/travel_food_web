import { useNavigate } from 'react-router-dom';
import { StarRating, Distance, PriceTag, Tag, Badge } from '../ui/index.jsx';

/**
 * Single search result row – matches the Search page mockup
 */
const RestaurantListItem = ({ restaurant }) => {
  const navigate = useNavigate();
  const { id, restaurant_info, meta, tags, image_url, badge, ai_analysis } = restaurant;

  return (
    <div
      className="flex gap-5 bg-[#FEFDF9] border border-[#F5EDD8] rounded-2xl overflow-hidden hover:shadow-md hover:-translate-y-0.5 transition-all cursor-pointer"
      onClick={() => navigate(`/detail/${id}`)}
      id={`result-item-${id}`}
    >
      {/* Food image */}
      <div className="relative w-[180px] h-[160px] flex-shrink-0">
        <img
          src={image_url}
          alt={restaurant_info.name}
          loading="lazy"
          className="w-full h-full object-cover"
        />
        {badge && <Badge label={badge} />}
      </div>

      {/* Info */}
      <div className="flex-1 py-4 pr-4 flex flex-col justify-between">
        <div>
          <h3 className="font-[Baloo_2,sans-serif] text-xl font-bold text-[#2C1810] mb-1.5">
            {restaurant_info.name}
          </h3>

          {/* Rating */}
          <StarRating rating={meta.rating} count={meta.review_count} size="md" />

          {/* Address */}
          <p className="flex items-start gap-1.5 mt-2 text-sm text-[#4A3728]">
            <span className="flex-shrink-0 mt-0.5">📍</span>
            <span>
              {restaurant_info.contact.address}
              {meta.distance_km && (
                <span className="text-[#7B7068]"> • {meta.distance_km} km</span>
              )}
            </span>
          </p>

          {/* Price */}
          <p className="flex items-center gap-1.5 mt-2 text-sm text-[#4A3728]">
            <span>🏷️</span>
            <span className="font-medium">{meta.price_range}</span>
          </p>

          {/* AI reason badge */}
          {ai_analysis?.reason && (
            <p className="mt-2 text-xs text-[#7B7068] italic bg-[#FFF8EE] px-3 py-1.5 rounded-lg inline-block">
              🤖 {ai_analysis.reason}
            </p>
          )}
        </div>

        {/* Tags row */}
        <div className="flex flex-wrap gap-1.5 mt-3">
          {tags.map((t) => (
            <span
              key={t}
              className="px-3 py-1 rounded-full bg-[#FFF8EE] border border-[#F5EDD8] text-xs text-[#4A3728] font-medium"
            >
              {t}
            </span>
          ))}
        </div>
      </div>
    </div>
  );
};

export default RestaurantListItem;
