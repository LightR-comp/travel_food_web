import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import PhotoGallery from '../components/detail/PhotoGallery';
import MenuSection from '../components/detail/MenuSection';
import { StarRating, OpenStatus, Spinner } from '../components/ui/index.jsx';
import { getRestaurantByIdApi } from '../api/restaurantApi';

// Mock gallery images for detail (would come from API in production)
const GALLERY_IMAGES = [
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/680447409_2496624150752646_5733658399108806712_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=13d280&_nc_ohc=nNAVbXGc54QQ7kNvwFXhzR5&_nc_oc=AdopDkYwTgLGRJfGpfP4zUR3oycxPPtX3B8lelmaHDnROLUij-VpKCA4wRPbhfGjO6iKuqEw-pQ09Tcnx6SDIJiz&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=Chvx6-wWcVxuEr9ZMa9N-g&_nc_ss=7b2a8&oh=00_Af2I5KLOZk9CWHHcMcuoM4aw1aQpexTBgd8K0ZoswFXVVA&oe=69F2A006',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/680718077_2496623994085995_3004369118705862204_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=13d280&_nc_ohc=Je55gEk5biQQ7kNvwFvq8Hc&_nc_oc=AdoCgF4sUMNZSNa21ZXDOZ0RyNgJyGNN0Rx1J_2AFUk87VfO7v0Kxrn7gPnQdB2KQbh0WYN-dNF8bCqbuKZczjz3&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=txV1jhk7-F1B2xj7U0i0RA&_nc_ss=7b2a8&oh=00_Af0g1K3jprLohFWf1ym_9c4brAd9G8ye72BQdscnEbuYew&oe=69F2C457',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/682198551_2496623974085997_339940597237661833_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=13d280&_nc_ohc=txtYryWusn0Q7kNvwEzjWQe&_nc_oc=AdozUB5wEFKA1m4IA_C3jSzbnUkwpJJ1PSAIEP_RUW_dZxB7sFp-U2zVsQM8Rdny0qgwuPykYGWH-hwopvhgX7lG&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=uOSwYEO2gQ_6DiiS9IK6SA&_nc_ss=7b2a8&oh=00_Af0vwzPRuQ4rZvAg4QSeDILy7Z_qrzBO4JdfiQeWcrmF7Q&oe=69F2AE06',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/678788383_2496623954085999_9041755802111341267_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=13d280&_nc_ohc=TlUJKzOxHjEQ7kNvwFrO-Xr&_nc_oc=AdoporqfIbY29bhY4tgYqLZZA3Fkf8d_4SbLGt7OMjzrthf_9zw8q-3NJi9_D49TJLYfZRh6zgaVM3__2TaJvTAu&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=_9jrwn7KoA4V5nHYx1mX5g&_nc_ss=7b2a8&oh=00_Af20_58zgrOwuUE-DIgH9VUUFAR21gV4H3a_3md-yVWqHA&oe=69F2A572',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/682131563_2496624090752652_6299885406740940689_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=13d280&_nc_ohc=Pd3k2fmSETIQ7kNvwH691V9&_nc_oc=Adq2dml50_MF2hvJfGkv8BRg_sM4ibViXOjJy_E6g7BI_PipUfq-mShL7Jh9426l1sVYvIx4xJryW6psGW1q3twQ&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=2xklPQZbeklznVOQzkDORw&_nc_ss=7b2a8&oh=00_Af1k89IbOsCIRVUb0T9Qrr-EFOocCe0J7bC49DW3x25SBg&oe=69F2AF1E',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/680377267_2496624094085985_805073932068142165_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=13d280&_nc_ohc=DEAqQ_hwWSsQ7kNvwFRAJie&_nc_oc=Adpj8n0HVCRQHVjRvKpoZw47c9uoZsIOr_c_FzfION48zvHZHqkdhX8hAtTLvqgoxP9xht98BBFYBg0h47A019DI&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=RCUHWKhU1Ahg0LY3dbRLAQ&_nc_ss=7b2a8&oh=00_Af052xa1G90jKfww0NCK2_KDbC99j6KkxVeM8JbBn8eZVQ&oe=69F2C914',
  'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/679096346_2496624077419320_554599415698098513_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=13d280&_nc_ohc=sPEAW88GaEsQ7kNvwFqZlBm&_nc_oc=AdrlhPB41NofdZ4sF6QxpIgf5dY8IsIpqrOJvamTJud9G9dqvwJHuEEl0O8p9-Ai--eMlKrSiAOiNewVlA-Mk25m&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=6odYk3e3-QHYLeCVVy5oeQ&_nc_ss=7b2a8&oh=00_Af0Brd7N4rcxzLW4GWYL3z8bUD5EkoWfGFLRPgx09y6VMQ&oe=69F2B772',
];

const DetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [restaurant, setRestaurant] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

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
                {tags?.map((t) => (
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
              <div className="flex items-center gap-1 flex-shrink-0">
                <span className="text-[#F5A623] text-lg">⭐</span>
                <span className="font-bold text-[#2C1810] text-base">{meta.rating}</span>
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
                <div className="flex items-center gap-2">
                  <span className="text-lg flex-shrink-0">📘</span>
                  <a href="https://www.facebook.com/SaBiChuongbyBrothers/photos" className="text-sm text-[#1877F2] hover:underline font-medium">{name}</a>
                </div>
              </div>
            </div>

            {/* ── Action buttons ── */}
            <div className="flex items-center gap-3 flex-wrap">
              <a
                href={`https://maps.google.com/?q=${encodeURIComponent(contact.address)}`}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 px-5 py-2.5 bg-[#F5A623] text-white font-bold text-sm rounded-full hover:bg-[#E8960A] transition-colors shadow-sm"
              >
                <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M3.4 20.4l17.45-7.48a1 1 0 000-1.84L3.4 3.6a.993.993 0 00-1.39.91L2 9.12c0 .5.37.93.87.99L17 12 2.87 13.88c-.5.07-.87.5-.87 1l.01 4.51c0 .71.73 1.2 1.39.91z"/>
                </svg>
                Chỉ đường
              </a>
              <button className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:border-[#F5A623] hover:text-[#F5A623] transition-colors">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/>
                  <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/>
                </svg>
                Chia sẻ
              </button>
              <button className="inline-flex items-center gap-2 px-5 py-2.5 border border-[#E0D3C8] text-[#4A3728] font-semibold text-sm rounded-full hover:border-[#F5A623] hover:text-[#F5A623] transition-colors">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/>
                  <path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/>
                </svg>
                Đánh giá
              </button>
            </div>

            {/* Menu section – same width as left info */}
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 mt-6">
              <MenuSection />
            </div>

          </div>

          {/* Right: Location card + Quick info */}
          <div className="lg:w-[280px] flex-shrink-0 flex flex-col gap-4">

            {/* ── Location card ── */}
            <div className="bg-[#E8F4FD] rounded-2xl border border-[#D0E8F8] p-5 text-center">
              {/* Pin icon */}
              <div className="flex justify-center mb-3">
                <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                  <path
                    d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z"
                    fill="#3B82F6"
                  />
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
                {/* Navigation arrow icon */}
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
              <div className="flex items-center gap-3 mb-4">
                <span className="text-2xl flex-shrink-0">⭐</span>
                <div>
                  <p className="text-xs text-[#7B7068] mb-0.5">Đánh giá</p>
                  <p className="text-sm font-semibold text-[#2C1810]">
                    {'★'.repeat(Math.round(meta.rating))}{'☆'.repeat(5 - Math.round(meta.rating))}{' '}
                    <span className="text-[#F5A623]">{meta.rating} / 5</span>
                  </p>
                </div>
              </div>

              {/* Hours */}
              <div className="flex items-center gap-3 mb-4">
                <span className="text-2xl flex-shrink-0">🕐</span>
                <div>
                  <p className="text-xs text-[#7B7068] mb-0.5">Giờ mở cửa</p>
                  <p className={`text-sm font-semibold ${operating_hours.is_open_now ? 'text-green-600' : 'text-red-500'}`}>
                    {operating_hours.is_open_now ? 'Đang mở' : 'Đóng cửa'} • {operating_hours.schedule}
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

              {/* Suitable for (from tags) */}
              {tags?.length > 0 && (
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
    </div>
  );
};

export default DetailPage;
