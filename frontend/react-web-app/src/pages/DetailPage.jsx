import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import PhotoGallery from '../components/detail/PhotoGallery';
import MenuSection from '../components/detail/MenuSection';
import ReviewSection from '../components/detail/ReviewSection';
import ReviewModal from '../components/detail/ReviewModal';
import LoginRequireModal from '../components/detail/LoginRequireModal';
import StarRating from '../components/ui/StarRating';

import { Spinner } from '../components/ui/index.jsx';
import { getRestaurantByIdApi } from '../api/restaurantApi';

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

  return { restaurant_info, meta, ai_analysis, signature_dish, galleries, menu, tags, user_ratings };
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
  
  // Giả lập trạng thái đăng nhập (đổi thành logic thực tế của project sau)
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleReviewClick = () => {
    if (isLoggedIn) {
      setShowReviewModal(true);
    } else {
      setShowLoginRequireModal(true);
    }
  };

  const handleMockLogin = () => {
    // Giả lập đăng nhập thành công
    setIsLoggedIn(true);
    setShowLoginRequireModal(false);
    // Tùy chọn mở luôn form đánh giá sau khi đăng nhập xong
    setShowReviewModal(true);
  };

  useEffect(() => {
    if (!id) return;
    setLoading(true);
    setError(null);
    setData(null);

    getRestaurantByIdApi(id)
      .then((res) => {
        // Backend: { success, data: RestaurantDetail, ... }
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

            {/* ── Name + bookmark ── */}
            <div className="flex items-start justify-between mb-3">
              <h1 className="font-[Baloo_2,sans-serif] text-3xl font-extrabold text-[#2C1810] leading-tight pr-3">
                {name}
              </h1>
              <button className="flex-shrink-0 w-9 h-9 rounded-full border border-[#E0D3C8] flex items-center justify-center hover:bg-[#FFF8EE] transition-colors mt-1">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#7B7068" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M19 21l-7-5-7 5V5a2 2 0 012-2h10a2 2 0 012 2z" />
                </svg>
              </button>
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
                <StarRating rating={meta.rating} showMax={false} />
                <span className="text-[#7B7068] text-sm">({meta.review_count})</span>
              </div>
            </div>

            {/* ── Address ── */}
            <p className="flex items-start gap-2 mb-4">
              <span className="text-pink-500 text-lg flex-shrink-0 mt-0.5">📍</span>
              <span className="text-[#4A3728] text-sm leading-relaxed">{contact.address}</span>
            </p>

            {/* ── Hours + Phone/Facebook (2 columns) ── */}
            <div className="grid grid-cols-2 gap-4 mb-5">
              {/* Left: hours */}
              <div className="flex items-start gap-2">
                <span className="text-lg flex-shrink-0 mt-0.5">🕐</span>
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
              <button className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:bg-[#F5A623] hover:border-[#F5A623] hover:text-white transition-colors duration-300">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/>
                  <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/>
                </svg>
                Chia sẻ
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
                <span className="text-2xl flex-shrink-0 mt-0.5">⭐</span>
                <div>
                  <p className="text-xs text-[#7B7068] mb-1">Đánh giá</p>
                  <StarRating rating={meta.rating} showMax={false} />
                </div>
              </div>

              {/* Hours */}
              <div className="flex items-start gap-3 mb-4">
                <span className="text-2xl flex-shrink-0 mt-0.5">🕐</span>
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
                <span className="text-2xl flex-shrink-0">🏷️</span>
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

              {/* Parking */}
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 bg-[#2563EB] rounded-lg flex items-center justify-center text-white font-bold text-sm flex-shrink-0">
                  P
                </div>
                <div>
                  <p className="text-xs text-[#7B7068] mb-0.5">Bãi đỗ xe</p>
                  <p className="text-sm font-medium text-[#2C1810]">Có (xe máy)</p>
                </div>
              </div>
            </div>

          </div>
        </div>

      </div>

      {/* ── Bio Modal ── */}
      {showBioModal && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 md:p-6 transition-opacity" onClick={() => setShowBioModal(false)}>
          <div 
            className="bg-white rounded-3xl w-full max-w-2xl max-h-[90vh] overflow-hidden shadow-2xl flex flex-col relative transform transition-transform scale-100"
            onClick={(e) => e.stopPropagation()}
          >
            {/* Modal Header */}
            <div className="flex items-center justify-between p-6 pb-4 border-b border-[#F5EDD8]">
              <div>
                <h2 className="font-[Baloo_2,sans-serif] text-2xl font-bold text-[#2C1810]">
                  Tiểu sử {name}
                </h2>
                <p className="text-sm text-[#7B7068] mt-1 flex items-center gap-2">
                  {restaurant_info.established_year && (
                    <>
                      <span className="font-medium">Thành lập: {restaurant_info.established_year}</span>
                      <span className="w-1 h-1 rounded-full bg-[#E0D3C8]"></span>
                    </>
                  )}
                  <span className="truncate max-w-[200px] sm:max-w-xs">{contact.address}</span>
                </p>
              </div>
              <button 
                onClick={() => setShowBioModal(false)}
                className="w-10 h-10 rounded-full bg-[#FAFAF7] text-[#7B7068] flex items-center justify-center hover:bg-[#FDECE4] hover:text-[#E8623A] transition-colors flex-shrink-0"
              >
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                  <line x1="18" y1="6" x2="6" y2="18" />
                  <line x1="6" y1="6" x2="18" y2="18" />
                </svg>
              </button>
            </div>

            {/* Modal Body */}
            <div className="p-6 overflow-y-auto space-y-8" style={{ scrollbarWidth: 'thin' }}>
              
              {/* Lịch sử */}
              {restaurant_info.history && (
                <section>
                  <div className="flex items-center gap-3 mb-3">
                    <div className="w-9 h-9 rounded-full bg-[#FFF8EE] flex items-center justify-center text-[#E8623A] shadow-sm">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M4 22h14a2 2 0 0 0 2-2V7.5L14.5 2H6a2 2 0 0 0-2 2v4" />
                        <polyline points="14 2 14 8 20 8" />
                        <path d="M2 15h10" />
                        <path d="M9 18v-6H5v6z" />
                      </svg>
                    </div>
                    <h3 className="text-lg font-bold text-[#2C1810]">Câu chuyện hình thành</h3>
                  </div>
                  <p className="text-[#4A3728] leading-relaxed text-[15px] bg-[#FAFAF7] p-5 rounded-2xl border border-[#F5EDD8] shadow-inner">
                    {restaurant_info.history}
                  </p>
                </section>
              )}

              {/* Món ăn đặc trưng */}
              {data.signature_dish && (
                <section>
                  <div className="flex items-center gap-3 mb-4">
                    <div className="w-9 h-9 rounded-full bg-[#FFF8EE] flex items-center justify-center text-[#E8623A] shadow-sm">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                      </svg>
                    </div>
                    <h3 className="text-lg font-bold text-[#2C1810]">Món ăn đặc trưng</h3>
                  </div>
                  <div className="flex flex-col sm:flex-row gap-5 bg-white border border-[#F5EDD8] p-4 rounded-2xl hover:shadow-md transition-shadow">
                    <div className="w-full sm:w-32 h-40 sm:h-32 rounded-xl bg-[#FAFAF7] flex-shrink-0 overflow-hidden shadow-sm">
                      {data.signature_dish.image_url ? (
                        <img src={data.signature_dish.image_url} alt={data.signature_dish.name} className="w-full h-full object-cover hover:scale-105 transition-transform duration-500" />
                      ) : (
                        <div className="w-full h-full flex items-center justify-center text-4xl">🍲</div>
                      )}
                    </div>
                    <div className="flex flex-col justify-center">
                      <h4 className="font-bold text-[#2C1810] text-lg mb-1">{data.signature_dish.name}</h4>
                      <p className="text-[#E8623A] font-bold text-sm mb-2">
                        {data.signature_dish.price ? Number(data.signature_dish.price).toLocaleString('vi-VN') + ' đ' : 'Liên hệ'}
                      </p>
                      <p className="text-[15px] text-[#7B7068] line-clamp-2 sm:line-clamp-3">
                        {data.signature_dish.description}
                      </p>
                    </div>
                  </div>
                </section>
              )}

              {/* Hình ảnh */}
              {galleries.length > 0 && (
                <section>
                  <div className="flex items-center gap-3 mb-4">
                    <div className="w-9 h-9 rounded-full bg-[#FFF8EE] flex items-center justify-center text-[#E8623A] shadow-sm">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2" />
                        <circle cx="8.5" cy="8.5" r="1.5" />
                        <polyline points="21 15 16 10 5 21" />
                      </svg>
                    </div>
                    <h3 className="text-lg font-bold text-[#2C1810]">Hình ảnh nổi bật</h3>
                  </div>
                  <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                    {galleries.slice(0, 3).map((img, idx) => (
                      <div key={idx} className="aspect-square rounded-xl overflow-hidden shadow-sm border border-[#F5EDD8]">
                        <img src={img} alt={`Gallery ${idx + 1}`} className="w-full h-full object-cover hover:scale-110 transition-transform duration-500" />
                      </div>
                    ))}
                  </div>
                </section>
              )}
            </div>
          </div>
        </div>
      )}

      {/* ── Review Modal ── */}
      <ReviewModal 
        isOpen={showReviewModal} 
        onClose={() => setShowReviewModal(false)} 
        restaurantName={name}
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
