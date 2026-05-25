import { useNavigate } from 'react-router-dom';
import { StarRating, Distance, PriceTag, Tag, Badge } from '../ui/index.jsx';
import locationIcon from '../icon/location-icon.png';
import priceTagIcon from '../icon/price tag-icon.png';
import clockIcon from '../icon/Clock-icon.png';

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

/**
 * Single search result row – matches the Search page mockup
 */
const RestaurantListItem = ({ restaurant }) => {
  const navigate = useNavigate();
  const { id, name, address, rating, price_range, type, distance_km, ai_analysis, badge, is_open, open_time, close_time } = restaurant;
  
  // Xử lý giá tiền (price_range đang là số, VD: 150000 -> 150.000 đ)
  const formattedPrice = price_range ? new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price_range) : 'Đang cập nhật';
  
  // Dùng ảnh từ CSDL (nếu có) hoặc dùng ảnh placeholder
  let imageUrl = `https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&q=80`;
  if (restaurant.images && restaurant.images.length > 0 && restaurant.images[0].image_url) {
    imageUrl = restaurant.images[0].image_url;
  } else if (restaurant.image_url) {
    imageUrl = restaurant.image_url;
  }

  const tags = type ? [type] : [];

  // Tính trạng thái mở cửa theo thời gian thực tế của client
  const isOpenRealTime = checkIsOpenRealTime(open_time, close_time);

  return (
    <div
      className="flex gap-5 bg-[#FEFDF9] border border-[#F5EDD8] rounded-2xl overflow-hidden hover:shadow-md hover:-translate-y-0.5 transition-all cursor-pointer group"
      onClick={() => navigate(`/detail/${id}`)}
      id={`result-item-${id}`}
    >
      {/* Food image */}
      <div className="relative w-[180px] h-[160px] flex-shrink-0 p-2.5 pr-0">
        <div className="w-full h-full rounded-[14px] overflow-hidden relative shadow-sm">
          <img
            src={imageUrl}
            alt={name}
            loading="lazy"
            className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
          />
          {badge && <Badge label={badge} />}
          {!isOpenRealTime && <Badge label="Đóng cửa" className="!left-auto right-2 animate-pulse" />}
        </div>
      </div>

      {/* Info */}
      <div className="flex-1 py-4 pr-4 flex flex-col justify-between">
        <div>
          <h3 className="font-[Baloo_2,sans-serif] text-xl font-bold text-[#2C1810] mb-1.5">
            {name}
          </h3>

          {/* Rating */}
          <StarRating rating={rating} count={"+"} size="md" />

          {/* Address */}
          <p className="flex items-start gap-1.5 mt-2 text-sm text-[#4A3728]">
            <img src={locationIcon} alt="location" className="w-4 h-4 object-contain flex-shrink-0 mt-0.5" />
            <span>
              {address}
              {distance_km > 0 && (
                <span className="text-[#7B7068]"> • {distance_km.toFixed(1)} km</span>
              )}
            </span>
          </p>

          {/* Price */}
          <p className="flex items-center gap-1.5 mt-2 text-sm text-[#4A3728]">
            <img src={priceTagIcon} alt="price tag" className="w-4 h-4 object-contain flex-shrink-0" />
            <span className="font-medium">{formattedPrice}</span>
          </p>

          {/* Operating hours */}
          {open_time && close_time && (
            <p className="flex items-center gap-1.5 mt-2 text-sm text-[#4A3728]">
              <img src={clockIcon} alt="clock" className="w-4 h-4 object-contain flex-shrink-0" />
              <span>
                {open_time} - {close_time}
                <span className={`ml-2 text-xs font-semibold ${isOpenRealTime ? 'text-green-600' : 'text-red-500'}`}>
                  • {isOpenRealTime ? 'Đang mở cửa' : 'Đã đóng cửa'}
                </span>
              </span>
            </p>
          )}

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
              className="px-3 py-1 rounded-full bg-[#FFF8EE] border border-[#F5EDD8] text-xs text-[#4A3728] font-medium uppercase"
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
