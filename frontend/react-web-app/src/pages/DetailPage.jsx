import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import PhotoGallery from '../components/detail/PhotoGallery';
import MenuSection from '../components/detail/MenuSection';
import ReviewSection from '../components/detail/ReviewSection';
import ReviewModal from '../components/detail/ReviewModal';
import LoginRequireModal from '../components/detail/LoginRequireModal';
import StarRating from '../components/ui/StarRating';
import BioModal from '../components/detail/BioModal';
import { useAuth } from '../context/AuthContext';
import { useLocation as useGeoLocation } from '../context/LocationContext';
import locationIcon from '../components/icon/location-icon.png';
import priceTagIcon from '../components/icon/price tag-icon.png';
import clockIcon from '../components/icon/Clock-icon.png';
import starIcon from '../components/icon/star-icon.png';

import { Spinner } from '../components/ui/index.jsx';
import { getRestaurantByIdApi } from '../api/restaurantApi';

// Helper: Haversine distance in km
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

// ============================================================
// Helper: map flat RestaurantDetail (từ backend) → các section
// Backend trả về:
//   res.data = { id, name, address, lat, lng, rating, price_range,
//                open_time, close_time, type, menu, user_ratings, images }
// ============================================================
function mapApiToSections(raw) {
  if (!raw) return null;

  const parseTime = (timeStr) => (timeStr || '').split(',').map(s => s.trim()).filter(Boolean);
  const openTimes = parseTime(raw.open_time);
  const closeTimes = parseTime(raw.close_time);

  let schedule = 'Chưa có thông tin';
  if (openTimes.length > 0 && closeTimes.length > 0) {
    const pairs = [];
    const count = Math.max(openTimes.length, closeTimes.length);
    for (let i = 0; i < count; i++) {
      const o = openTimes[i] || openTimes[0];
      const c = closeTimes[i] || closeTimes[0];
      if (o && c) pairs.push(`${o} – ${c}`);
    }
    if (pairs.length > 0) schedule = pairs.join(' và ');
  }

  // Tính is_open_now dựa trên mảng các khung giờ
  const isOpenNow = (() => {
    try {
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
  })();

  // Galleries: ưu tiên ảnh từ API, fallback rỗng
  const galleries = Array.isArray(raw.images)
    ? raw.images.map((img) => (typeof img === 'string' ? img : img?.image_url)).filter(Boolean)
    : [];

  // Menu: raw.menu là []MenuItem { id, name, description, price, food_type }
  const menu = Array.isArray(raw.menu) ? raw.menu : [];

  // restaurant_info: gom các trường cơ bản
  const restaurant_info = {
    name: raw.name || 'Không có tên',
    type: raw.type || '',
    established_year: raw.established_year || null,
    description: raw.description || null,
    history: raw.history || null,
    contact: {
      address: raw.address || 'Chưa có địa chỉ',
      phone: raw.phone || null,
      facebook: raw.facebook_url || null,
    },
    operating_hours: {
      schedule,
      is_open_now: isOpenNow,
    },
  };

  // meta: rating + review_count + price_range
  const meta = {
    rating: raw.rating ?? 0,
    review_count: Array.isArray(raw.user_ratings) ? raw.user_ratings.length : 0,
    price_range:
      raw.price_range != null
        ? Number(raw.price_range).toLocaleString('vi-VN') + ' đ'
        : 'Chưa có thông tin',
  };

  // ai_analysis: backend chưa trả, để null an toàn
  const ai_analysis = raw.ai_analysis ?? null;

  // signature_dish: backend chưa trả, lấy món đầu tiên nếu có
  const signature_dish = raw.signature_dish ?? (menu.length > 0 ? menu[0] : null);

  // tags: từ type hoặc mảng tags nếu có
  const tags = Array.isArray(raw.tags)
    ? raw.tags
    : raw.type
    ? [raw.type]
    : [];

  // user_ratings để ReviewSection dùng sau này
  const user_ratings = Array.isArray(raw.user_ratings) ? raw.user_ratings : [];

  return { restaurant_info, meta, ai_analysis, signature_dish, galleries, menu, tags, user_ratings, lat: raw.lat, lng: raw.lng };
}

const DetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [data, setData] = useState(null);   // mapped sections
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showBioModal, setShowBioModal] = useState(false);
  const [showReviewModal, setShowReviewModal] = useState(false);
  const [showLoginRequireModal, setShowLoginRequireModal] = useState(false);
  
  const { user } = useAuth();
  const isLoggedIn = !!user;
  const geoLocation = useGeoLocation();

  const handleReviewClick = () => {
    if (isLoggedIn) {
      setShowReviewModal(true);
    } else {
      setShowLoginRequireModal(true);
    }
  };

  const handleMockLogin = () => {
    setShowLoginRequireModal(false);
    navigate('/login');
  };

  const fetchRestaurantData = () => {
    getRestaurantByIdApi(id)
      .then((res) => {
        const raw = res?.data ?? null;
        if (!raw) throw new Error('Không có dữ liệu');
        const mapped = mapApiToSections(raw);
        setData(mapped);
      })
      .catch((err) => {
        const msg =
          err?.response?.data?.message ||
          err?.message ||
          'Không tìm thấy nhà hàng này';
        setError(msg);
      })
      .finally(() => setLoading(false));
  };

  useEffect(() => {
    if (!id) return;
    setLoading(true);
    setError(null);
    setData(null);
    fetchRestaurantData();
  }, [id]);

  // ── Loading ──
  if (loading) return (
    <div className="flex items-center justify-center min-h-screen bg-[#FAFAF7]">
      <Spinner size="lg" />
    </div>
  );

  // ── Error / Not found ──
  if (error || !data) return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-[#FAFAF7] gap-4">
      <div className="text-6xl">😕</div>
      <h2 className="text-xl font-bold text-[#2C1810]">{error || 'Không tìm thấy nhà hàng'}</h2>
      <button
        onClick={() => navigate(-1)}
        className="px-6 py-2 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity"
      >
        ← Quay lại
      </button>
    </div>
  );

  const { restaurant_info, meta, ai_analysis, galleries, tags } = data;
  const { name, contact, operating_hours } = restaurant_info;

  // Compute distance from user location to restaurant
  const computedDistance = haversineDistance(geoLocation.lat, geoLocation.lon, data.lat, data.lng);
  const distanceDisplay = computedDistance != null
    ? (computedDistance < 1
        ? `${Math.round(computedDistance * 1000)} m`
        : `${computedDistance.toFixed(1)} km`)
    : null;

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      <div className="max-w-[900px] mx-auto px-6 py-8">

        {/* Back button */}
        <button
          onClick={() => navigate(-1)}
          className="flex items-center gap-2 text-sm text-[#7B7068] hover:text-[#E8623A] transition-colors mb-6 group"
        >
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-4 h-4 group-hover:-translate-x-1 transition-transform">
            <polyline points="15,18 9,12 15,6" />
          </svg>
          Quay lại
        </button>

        {/* Photo gallery – dùng ảnh từ API, ẩn nếu không có ảnh */}
        {galleries.length > 0 && (
          <PhotoGallery images={galleries} restaurantName={name} />
        )}

        {/* Main info + map split */}
        <div className="flex flex-col lg:flex-row gap-6 mt-8">
          {/* Left: info */}
          <div className="flex-1">

            {/* ── Name ── */}
            <div className="mb-3">
              <h1 className="font-[Baloo_2,sans-serif] text-3xl font-extrabold text-[#2C1810] leading-tight">
                {name}
              </h1>
            </div>

            {/* ── Tags row + rating ── */}
            <div className="flex items-center justify-between mb-4 flex-wrap gap-2">
              <div className="flex items-center gap-2 flex-wrap">
                {tags.map((t) => (
                  <span key={t} className="px-3 py-1 rounded-full border border-[#E0D3C8] text-sm text-[#4A3728] font-medium">
                    {t}
                  </span>
                ))}
                {ai_analysis?.score && (
                  <span className="px-3 py-1 rounded-full border border-[#F5EDD8] bg-[#FFF8EE] text-sm text-[#8B6914] font-medium">
                    Must try
                  </span>
                )}
              </div>
              <div className="flex items-center gap-1.5 flex-shrink-0 bg-white px-3 py-1.5 rounded-full border border-[#E0D3C8] shadow-sm">
                <svg className="text-[#f5a623] w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                </svg>
                <span className="text-[#2C1810] text-sm font-bold">
                  {Number(meta.rating).toFixed(1)}
                </span>
                <span className="text-[#7B7068] text-sm">({meta.review_count})</span>
              </div>
            </div>

            {/* ── Address ── */}
            <p className="flex items-start gap-2 mb-4">
              <img src={locationIcon} alt="location" className="w-5 h-5 object-contain flex-shrink-0 mt-0.5" />
              <span className="text-[#4A3728] text-sm leading-relaxed">{contact.address}</span>
              {distanceDisplay && (
                <span className="inline-flex items-center gap-1 text-xs text-[#7B7068] bg-[#FFF8EE] px-2 py-0.5 rounded-md border border-[#F5EDD8] flex-shrink-0 mt-0.5">
                  <img src={locationIcon} alt="location" className="w-3.5 h-3.5 object-contain" /> {distanceDisplay}
                </span>
              )}
            </p>

            {/* ── Hours + Phone/Facebook (2 columns) ── */}
            <div className="grid grid-cols-2 gap-4 mb-5">
              {/* Left: hours */}
              <div className="flex items-start gap-2">
                <img src={clockIcon} alt="clock" className="w-5 h-5 object-contain flex-shrink-0 mt-0.5" />
                <div>
                  <p className="font-semibold text-[#2C1810] text-sm">Giờ mở cửa:</p>
                  <p className="text-sm text-[#4A3728]">• {operating_hours.schedule}</p>
                  <p className={`text-sm font-semibold ${operating_hours.is_open_now ? 'text-green-600' : 'text-red-500'}`}>
                    • {operating_hours.is_open_now ? 'Đang mở cửa' : 'Đã đóng cửa'}
                  </p>
                </div>
              </div>

              {/* Right: phone + facebook */}
              <div className="flex flex-col gap-2">
                {contact.phone && (
                  <div className="flex items-center gap-2">
                    <span className="text-[#E8623A] text-lg flex-shrink-0">📞</span>
                    <a href={`tel:${contact.phone}`} className="text-sm text-[#E8623A] font-semibold hover:underline">
                      Số hotline: {contact.phone}
                    </a>
                  </div>
                )}
                {contact.facebook && (
                  <div className="flex items-center gap-2">
                    <span className="text-lg flex-shrink-0">📘</span>
                    <a href={contact.facebook} target="_blank" rel="noreferrer" className="text-sm text-[#1877F2] hover:underline font-medium">{name}</a>
                  </div>
                )}
              </div>
            </div>

            {/* ── Action buttons ── */}
            <div className="flex items-center gap-3 flex-wrap">
              <a
                href={`https://maps.google.com/?q=${encodeURIComponent(contact.address)}`}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:bg-[#F5A623] hover:border-[#F5A623] hover:text-white transition-colors duration-300"
              >
                <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M3.4 20.4l17.45-7.48a1 1 0 000-1.84L3.4 3.6a.993.993 0 00-1.39.91L2 9.12c0 .5.37.93.87.99L17 12 2.87 13.88c-.5.07-.87.5-.87 1l.01 4.51c0 .71.73 1.2 1.39.91z"/>
                </svg>
                Chỉ đường
              </a>
              <button 
                onClick={() => setShowBioModal(true)}
                className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:bg-[#F5A623] hover:border-[#F5A623] hover:text-white transition-colors duration-300"
              >
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
                  <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
                </svg>
                Tiểu sử
              </button>

              <button 
                onClick={handleReviewClick}
                className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:bg-[#F5A623] hover:border-[#F5A623] hover:text-white transition-colors duration-300"
              >
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/>
                  <path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/>
                </svg>
                Đánh giá
              </button>
            </div>

            {/* Menu section */}
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 mt-6">
              <MenuSection menu={data.menu} />
            </div>

            <ReviewSection reviews={data.user_ratings} rating={meta.rating} />

          </div>

          {/* Right: Location card + Quick info */}
          <div className="lg:w-[280px] flex-shrink-0 flex flex-col gap-4">

            {/* ── Location card ── */}
            <div className="bg-[#E8F4FD] rounded-2xl border border-[#D0E8F8] p-5 text-center">
              <div className="flex justify-center mb-3">
                <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" fill="#3B82F6"/>
                  <circle cx="12" cy="9" r="2.5" fill="white" />
                </svg>
              </div>
              <p className="text-sm font-medium text-[#2C1810] mb-4 leading-snug">
                {contact.address}
              </p>
              <a
                href={`https://maps.google.com/?q=${encodeURIComponent(contact.address)}`}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 px-5 py-2 border-2 border-[#F5A623] text-[#E8960A] font-semibold text-sm rounded-full hover:bg-[#FFF8EE] transition-colors"
              >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M3.4 20.4l17.45-7.48a1 1 0 000-1.84L3.4 3.6a.993.993 0 00-1.39.91L2 9.12c0 .5.37.93.87.99L17 12 2.87 13.88c-.5.07-.87.5-.87 1l.01 4.51c0 .71.73 1.2 1.39.91z" />
                </svg>
                Mở Google Maps
              </a>
            </div>

            {/* ── Thông tin nhanh card ── */}
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
              <h3 className="font-bold text-[#2C1810] text-base mb-3">Thông tin nhanh</h3>
              <hr className="border-[#F5EDD8] mb-4" />

              {/* Rating */}
              <div className="flex items-start gap-3 mb-4">
                <img src={starIcon} alt="star" className="w-6 h-6 object-contain flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-xs text-[#7B7068] mb-1">Đánh giá</p>
                  <StarRating rating={meta.rating} showMax={false} />
                </div>
              </div>

              {/* Hours */}
              <div className="flex items-start gap-3 mb-4">
                <img src={clockIcon} alt="clock" className="w-6 h-6 object-contain flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-xs text-[#7B7068] mb-1">Giờ mở cửa</p>
                  <p className={`text-sm font-semibold mb-1 ${operating_hours.is_open_now ? 'text-green-600' : 'text-red-500'}`}>
                    {operating_hours.is_open_now ? 'Đang mở' : 'Đóng cửa'}
                  </p>
                  <p className="text-sm font-medium text-[#2C1810]">
                    {operating_hours.schedule}
                  </p>
                </div>
              </div>

              {/* Price range */}
              <div className="flex items-center gap-3 mb-4">
                <img src={priceTagIcon} alt="price tag" className="w-6 h-6 object-contain flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-xs text-[#7B7068] mb-0.5">Khoảng giá</p>
                  <p className="text-sm font-medium text-[#2C1810]">{meta.price_range}</p>
                </div>
              </div>

              {/* Tags */}
              {tags.length > 0 && (
                <div className="flex items-center gap-3 mb-4">
                  <span className="text-2xl flex-shrink-0">👥</span>
                  <div>
                    <p className="text-xs text-[#7B7068] mb-0.5">Phù hợp</p>
                    <p className="text-sm font-medium text-[#2C1810]">{tags.join(', ')}</p>
                  </div>
                </div>
              )}


            </div>

          </div>
        </div>

      </div>

      {/* ── Bio Modal ── */}
      <BioModal isOpen={showBioModal} onClose={() => setShowBioModal(false)} />

      {/* ── Review Modal ── */}
      <ReviewModal 
        isOpen={showReviewModal} 
        onClose={() => setShowReviewModal(false)} 
        restaurantName={name}
        onReviewSubmitted={fetchRestaurantData}
      />

      {/* ── Login Require Modal ── */}
      <LoginRequireModal
        isOpen={showLoginRequireModal}
        onClose={() => setShowLoginRequireModal(false)}
        onLogin={handleMockLogin}
      />

    </div>
  );
};

export default DetailPage;
