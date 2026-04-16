import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import PhotoGallery from '../components/detail/PhotoGallery';
import MenuSection from '../components/detail/MenuSection';
import { StarRating, OpenStatus, Spinner } from '../components/ui/index.jsx';
import { getRestaurantByIdApi } from '../api/restaurantApi';

// Mock gallery images for detail (would come from API in production)
const GALLERY_IMAGES = [
  'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800&q=80',
  'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&q=80',
  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&q=80',
  'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=400&q=80',
  'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=400&q=80',
  'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&q=80',
];

const DetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [restaurant, setRestaurant] = useState(null);
  const [loading,    setLoading]    = useState(true);
  const [error,      setError]      = useState(null);

  useEffect(() => {
    setLoading(true);
    getRestaurantByIdApi(id)
      .then((res) => setRestaurant(res.data.restaurant))
      .catch(() => setError('Không tìm thấy nhà hàng này'))
      .finally(() => setLoading(false));
  }, [id]);

  if (loading) return (
    <div className="flex items-center justify-center min-h-screen bg-[#FAFAF7]">
      <Spinner size="lg" />
    </div>
  );

  if (error || !restaurant) return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-[#FAFAF7] gap-4">
      <div className="text-6xl">😕</div>
      <h2 className="text-xl font-bold text-[#2C1810]">{error || 'Không tìm thấy'}</h2>
      <button onClick={() => navigate(-1)} className="px-6 py-2 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity">
        ← Quay lại
      </button>
    </div>
  );

  const { restaurant_info, signature_dish, meta, ai_analysis, tags } = restaurant;
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

        {/* Photo gallery */}
        <PhotoGallery images={GALLERY_IMAGES} restaurantName={name} />

        {/* Main info + map split */}
        <div className="flex flex-col lg:flex-row gap-6 mt-8">
          {/* Left: info */}
          <div className="flex-1">
            {/* Name + tags */}
            <div className="mb-4">
              {tags?.map((t) => (
                <span key={t} className="inline-block mr-2 mb-1 px-3 py-1 rounded-full bg-[#FFF8EE] border border-[#F5EDD8] text-xs font-semibold text-[#4A3728]">
                  {t}
                </span>
              ))}
              {ai_analysis?.score && (
                <span className="inline-block mr-2 mb-1 px-3 py-1 rounded-full bg-[#FFF8EE] border border-[#E8623A] text-xs font-bold text-[#E8623A]">
                  Must try
                </span>
              )}
            </div>

            <h1 className="font-[Baloo_2,sans-serif] text-4xl font-extrabold text-[#2C1810] leading-tight mb-3">
              {name}
            </h1>

            {/* Rating row */}
            <div className="flex items-center gap-3 mb-4">
              <StarRating rating={meta.rating} count={meta.review_count} size="lg" />
              <span className="text-[#E8623A] font-semibold text-sm">{meta.price_range}</span>
            </div>

            {/* Address */}
            <p className="flex items-start gap-2 text-sm text-[#4A3728] mb-4">
              <span className="text-xl flex-shrink-0">📍</span>
              <span>{contact.address}</span>
            </p>

            {/* Hours + phone */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-6">
              <div className="flex items-start gap-2">
                <span className="text-xl flex-shrink-0 mt-0.5">🕐</span>
                <div>
                  <p className="text-xs text-[#7B7068] font-medium mb-0.5">Giờ mở cửa:</p>
                  <p className="text-sm text-[#4A3728]">• {operating_hours.schedule}</p>
                  <OpenStatus isOpen={operating_hours.is_open_now} statusText={operating_hours.status_text} />
                </div>
              </div>

              {contact.phone && (
                <div className="flex items-center gap-2">
                  <span className="text-xl">📞</span>
                  <div>
                    <p className="text-xs text-[#7B7068] font-medium mb-0.5">Số hotline:</p>
                    <a href={`tel:${contact.phone}`} className="text-sm text-[#E8623A] font-semibold hover:underline">
                      {contact.phone}
                    </a>
                  </div>
                </div>
              )}
            </div>

            {/* Facebook link placeholder */}
            <div className="flex items-center gap-2 mb-6">
              <span className="text-xl">📘</span>
              <a href="#" className="text-sm text-[#1877F2] hover:underline font-medium">{name}</a>
            </div>

            {/* AI Analysis */}
            {ai_analysis && (
              <div className="bg-gradient-to-r from-[#FFF8EE] to-[#FFF2E5] border border-[#F5EDD8] rounded-2xl p-4 mb-6">
                <p className="text-xs font-bold text-[#E8623A] mb-1.5">🤖 AI YumMap phân tích</p>
                <p className="text-sm text-[#4A3728]">{ai_analysis.reason}</p>
                <div className="mt-2 flex items-center gap-2">
                  <div className="flex-1 bg-[#F5EDD8] rounded-full h-2">
                    <div
                      className="bg-gradient-to-r from-[#E8623A] to-[#F5A623] h-2 rounded-full transition-all"
                      style={{ width: `${(ai_analysis.score || 0) * 100}%` }}
                    />
                  </div>
                  <span className="text-xs font-bold text-[#E8623A]">{Math.round((ai_analysis.score || 0) * 100)}%</span>
                </div>
              </div>
            )}

            {/* Signature dish */}
            {signature_dish && (
              <div className="bg-white border border-[#F5EDD8] rounded-2xl p-5 mb-6">
                <h3 className="font-bold text-[#2C1810] mb-3">✨ Món đặc trưng</h3>
                <p className="font-semibold text-[#E8623A] mb-1">{signature_dish.dish_name}</p>
                <p className="text-sm text-[#7B7068] italic mb-2">{signature_dish.flavor_profile}</p>
                <p className="text-xs text-[#7B7068]">📌 {signature_dish.cultural_origin}</p>
                {signature_dish.trivia?.length > 0 && (
                  <ul className="mt-3 flex flex-col gap-1">
                    {signature_dish.trivia.map((t, i) => (
                      <li key={i} className="text-xs text-[#4A3728] flex gap-2">
                        <span className="text-[#F5A623]">💡</span> {t}
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            )}
          </div>

          {/* Right: Mini map */}
          <div className="lg:w-[280px] flex-shrink-0">
            <div className="h-[200px] lg:h-full min-h-[180px] bg-[#E8F4FD] rounded-2xl border border-[#D0E8F8] flex items-center justify-center">
              <div className="text-center p-4">
                <div className="text-5xl mb-2">🗺️</div>
                <p className="text-sm font-medium text-[#4A3728]">Xem trên bản đồ</p>
                <p className="text-xs text-[#7B7068] mt-1">{contact.address}</p>
                <a
                  href={`https://maps.google.com/?q=${encodeURIComponent(contact.address)}`}
                  target="_blank"
                  rel="noreferrer"
                  className="inline-block mt-3 px-4 py-1.5 bg-[#E8623A] text-white text-xs font-semibold rounded-full hover:opacity-90 transition-opacity"
                >
                  Mở Google Maps
                </a>
              </div>
            </div>
          </div>
        </div>

        {/* Menu section */}
        <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 mt-6">
          <MenuSection />
        </div>

      </div>
    </div>
  );
};

export default DetailPage;
