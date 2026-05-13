import { useState } from 'react';

// Tính phân phối sao từ mảng reviews
function calcRatingStats(reviews) {
  const counts = { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 };
  (reviews || []).forEach((r) => {
    const s = Math.round(r.rating ?? r.stars ?? 0);
    if (s >= 1 && s <= 5) counts[s]++;
  });
  const total = reviews?.length || 0;
  return [5, 4, 3, 2, 1].map((star) => ({
    stars: star,
    percentage: total > 0 ? Math.round((counts[star] / total) * 100) : 0,
  }));
}

// Format thời gian ISO → "x ngày/tháng/năm trước"
function timeAgo(dateStr) {
  if (!dateStr) return '';
  try {
    const diff = Date.now() - new Date(dateStr).getTime();
    const days = Math.floor(diff / 86400000);
    if (days < 1) return 'Hôm nay';
    if (days < 7) return `${days} ngày trước`;
    if (days < 30) return `${Math.floor(days / 7)} tuần trước`;
    if (days < 365) return `${Math.floor(days / 30)} tháng trước`;
    return `${Math.floor(days / 365)} năm trước`;
  } catch {
    return '';
  }
}

const ReviewSection = ({ reviews = [], rating = 0 }) => {
  const [likedReviews, setLikedReviews] = useState({});
  const ratingStats = calcRatingStats(reviews);

  const toggleLike = (id) => {
    setLikedReviews((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  return (
    <div className="mt-10">
      {/* Rating summary */}
      <section className="mb-10">
        <h2 className="text-2xl font-extrabold text-[#2C1810] mb-6 font-[Baloo_2,sans-serif]">
          Tóm tắt đánh giá
        </h2>
        <div className="flex flex-col md:flex-row items-center gap-8 md:gap-16">
          {/* Số lớn */}
          <div className="flex items-center gap-4">
            <span className="text-7xl font-bold text-[#2C1810]">{Number(rating).toFixed(1)}</span>
            <span className="text-6xl text-[#F5A623]">★</span>
          </div>

          {/* Thanh phần trăm */}
          <div className="flex-1 w-full max-w-md">
            {ratingStats.map((stat) => (
              <div key={stat.stars} className="flex items-center gap-3 mb-1">
                <span className="text-sm font-medium text-[#4A3728] w-3">{stat.stars}</span>
                <div className="flex-1 h-3 bg-[#E0D3C8] bg-opacity-30 rounded-full overflow-hidden">
                  <div
                    className="h-full bg-[#F5A623] rounded-full"
                    style={{ width: `${stat.percentage}%` }}
                  />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Danh sách đánh giá */}
      <section>
        <h2 className="text-2xl font-extrabold text-[#2C1810] mb-6 font-[Baloo_2,sans-serif]">
          Các bài đánh giá
        </h2>

        {reviews.length === 0 ? (
          <p className="text-sm text-[#7B7068] italic">Chưa có đánh giá nào.</p>
        ) : (
          <div className="space-y-8">
            {reviews.map((review, idx) => {
              const reviewId = review.id ?? idx;
              const userName = review.user_name ?? review.user?.name ?? 'Ẩn danh';
              const avatar = review.avatar ?? review.user?.avatar ?? null;
              const stars = review.rating ?? review.stars ?? 0;
              const comment = review.comment ?? review.content ?? '';
              const images = Array.isArray(review.images) ? review.images : [];
              const createdAt = review.created_at ?? review.user?.time ?? '';

              return (
                <div key={reviewId} className="bg-white rounded-2xl p-2">
                  {/* Header */}
                  <div className="flex items-start gap-3 mb-3">
                    {avatar ? (
                      <img
                        src={avatar}
                        alt={userName}
                        className="w-12 h-12 rounded-full object-cover border-2 border-[#F5EDD8]"
                      />
                    ) : (
                      <div className="w-12 h-12 rounded-full bg-[#F5EDD8] flex items-center justify-center text-[#E8623A] font-bold text-lg flex-shrink-0">
                        {userName.charAt(0).toUpperCase()}
                      </div>
                    )}
                    <div>
                      <div className="flex items-center gap-2">
                        <h3 className="font-bold text-[#2C1810]">{userName}</h3>
                        {createdAt && (
                          <span className="text-xs text-[#7B7068]">• {timeAgo(createdAt)}</span>
                        )}
                      </div>
                      <div className="flex items-center mt-0.5">
                        {[...Array(5)].map((_, i) => (
                          <span key={i} className={`text-sm ${i < Math.round(stars) ? 'text-[#F5A623]' : 'text-[#E0D3C8]'}`}>
                            ★
                          </span>
                        ))}
                      </div>
                    </div>
                  </div>

                  {/* Nội dung */}
                  <div className="ml-15 pl-1">
                    <p className="text-[#4A3728] text-sm leading-relaxed mb-4">{comment}</p>

                    {/* Ảnh review */}
                    {images.length > 0 && (
                      <div className="grid grid-cols-2 gap-3 mb-4 max-w-2xl">
                        {images.map((img, i) => (
                          <div key={i} className="aspect-[4/3] rounded-xl overflow-hidden shadow-sm">
                            <img
                              src={typeof img === 'string' ? img : img?.image_url}
                              alt={`Review ${i}`}
                              className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                            />
                          </div>
                        ))}
                      </div>
                    )}

                    {/* Nút hữu ích */}
                    <button
                      onClick={() => toggleLike(reviewId)}
                      className={`flex items-center gap-2 transition-colors text-sm font-medium ${
                        likedReviews[reviewId] ? 'text-[#E8623A]' : 'text-[#7B7068] hover:text-[#E8623A]'
                      }`}
                    >
                      <svg
                        width="18" height="18" viewBox="0 0 24 24"
                        fill={likedReviews[reviewId] ? 'currentColor' : 'none'}
                        stroke="currentColor" strokeWidth="2"
                        strokeLinecap="round" strokeLinejoin="round"
                      >
                        <path d="M14 9V5a3 3 0 00-3-3l-4 9v11h11.28a2 2 0 002-1.7l1.38-9a2 2 0 00-2-2.3zM7 22H4a2 2 0 01-2-2v-7a2 2 0 012-2h3" />
                      </svg>
                      {likedReviews[reviewId] ? 'Đã thích' : 'Hữu ích'}
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </section>
    </div>
  );
};

export default ReviewSection;
