import React, { useState } from 'react';
import { StarRating } from '../ui/index.jsx';


const MOCK_REVIEWS = [
  {
    id: 1,
    user: {
      name: 'Dinh Dinh Vo',
      avatar: 'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/682397610_2498297627251965_6945813937769567925_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a0f3c3&_nc_ohc=f3Ptn9LnMv0Q7kNvwHjmfGj&_nc_oc=Adp-lTKj4Rx7BA87GwiC8UqY02XJ8vu1_58F5XTYYQRwtuCDPifdhepsY6aeU0EcfwsgVVJAOuu7PErQhOTBDQ-H&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=XtFWpEEg3q1kCkGpsM6OSg&_nc_ss=7b2a8&oh=00_Af0q3-s5JhWoWC9kr1zgMLBmKVDaomSM1Gxfr0A2xAn5MA&oe=69F67447',
      time: '6 tháng trước'
    },
    rating: 5,
    comment: 'Không gian quán sạch sẽ, thoáng mát. Thức ăn no bụng, ngon, chất lượng, giá cả phù hợp sự chu đáo từ không gian đến bữa ăn.',
    images: [
      'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/680718077_2496623994085995_3004369118705862204_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=13d280&_nc_ohc=2ash_cx_EcAQ7kNvwG-Lckt&_nc_oc=AdrFuxWXzgAAVOjo35rT14-BvMursrSUU8FT5HrbmHY4wGEu8hmHQK8hRt8W6GyOO2oD9cP1iFWuRhKn3RV6RKrh&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=OgCV5ju91PPMHPeo8-aI9w&_nc_ss=7b2a8&oh=00_Af1UIJPudF8rqYqitVfE_MbGB8-DU4WRkY0C8m3MbfG8rw&oe=69F68097',
      'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/679096346_2496624077419320_554599415698098513_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=13d280&_nc_ohc=BZOcHyIUaRIQ7kNvwGjqYyu&_nc_oc=AdopKIj9iIsri_rM4wiymwfehmYc3QMtJz4Pp9Fx_ORjzCUILXA20BDFnp0Gfyx94KJGtDtPQB3RYQ7tZo2SmiWB&_nc_zt=23&_nc_ht=scontent.fsgn17-1.fna&_nc_gid=9OWG2d2OFJ7kwstaSm5rSg&_nc_ss=7b2a8&oh=00_Af3kwdWsrIBfeiT06vS7qrOjSrrBrrT_Kjuwqh2kr-b4rg&oe=69F673B2'
    ]
  },
  {
    id: 2,
    user: {
      name: 'Minh Hoàng',
      avatar: 'https://i.pravatar.cc/150?u=minhhoang',
      time: '2 tháng trước'
    },
    rating: 5,
    comment: 'Đồ ăn ở đây rất đậm đà, chuẩn vị truyền thống. Nhân viên phục vụ rất nhiệt tình và chu đáo. Tuy quán hơi đông vào giờ cao điểm nhưng không phải chờ quá lâu.',
    images: []
  },
  {
    id: 3,
    user: {
      name: 'Lan Anh',
      avatar: 'https://i.pravatar.cc/150?u=lananh',
      time: '1 tháng trước'
    },
    rating: 4,
    comment: 'Không gian ấm cúng, thích hợp đi cùng gia đình. Món sườn nướng rất mềm và thơm. Giá cả hơi cao một chút so với mặt bằng chung nhưng chất lượng hoàn toàn xứng đáng.',
    images: []
  },
  {
    id: 4,
    user: {
      name: 'Quốc Bảo',
      avatar: 'https://i.pravatar.cc/150?u=quocbao',
      time: '3 tuần trước'
    },
    rating: 5,
    comment: 'Địa điểm tuyệt vời để thưởng thức ẩm thực Việt. Mình ấn tượng nhất là cách trình bày món ăn, trông rất bắt mắt và ngon miệng.',
    images: []
  },
  {
    id: 5,
    user: {
      name: 'Thanh Trúc',
      avatar: 'https://i.pravatar.cc/150?u=thanhtruc',
      time: '1 tuần trước'
    },
    rating: 4,
    comment: 'Quán có view đẹp, nhân viên thân thiện. Tuy nhiên món canh hôm mình ăn hơi nhạt một chút. Sẽ quay lại để thử các món khác.',
    images: []
  },
  {
    id: 6,
    user: {
      name: 'Tuấn Kiệt',
      avatar: 'https://i.pravatar.cc/150?u=tuankiet',
      time: '3 ngày trước'
    },
    rating: 5,
    comment: 'Rất hài lòng với trải nghiệm tại đây. Từ hương vị đến không gian đều hoàn hảo. Rất đáng để ghé thăm nếu bạn là người yêu thích ẩm thực.',
    images: []
  }
];

const RATING_STATS = [
  { stars: 5, percentage: 95 },
  { stars: 4, percentage: 10 },
  { stars: 3, percentage: 3 },
  { stars: 2, percentage: 1 },
  { stars: 1, percentage: 1 }
];

const ReviewSection = () => {
  const [likedReviews, setLikedReviews] = useState({});

  const toggleLike = (id) => {
    setLikedReviews(prev => ({
      ...prev,
      [id]: !prev[id]
    }));
  };

  return (

    <div className="mt-10">
      {/* Review Summary */}
      <section className="mb-10">
        <h2 className="text-2xl font-extrabold text-[#2C1810] mb-6 font-[Baloo_2,sans-serif]">
          Tóm tắt đánh giá
        </h2>
        <div className="flex flex-col md:flex-row items-center gap-8 md:gap-16">
          {/* Big Number */}
          <div className="flex items-center gap-4">
            <span className="text-7xl font-bold text-[#2C1810]">4,7</span>
            <span className="text-6xl text-[#F5A623]">★</span>
          </div>

          {/* Bars */}
          <div className="flex-1 w-full max-w-md">
            {RATING_STATS.map((stat) => (
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

      {/* Review List */}
      <section>
        <h2 className="text-2xl font-extrabold text-[#2C1810] mb-6 font-[Baloo_2,sans-serif]">
          Các bài đánh giá
        </h2>
        
        <div className="space-y-8">
          {MOCK_REVIEWS.map((review) => (
            <div key={review.id} className="bg-white rounded-2xl p-2">
              {/* Header */}
              <div className="flex items-start gap-3 mb-3">
                <img 
                  src={review.user.avatar} 
                  alt={review.user.name} 
                  className="w-12 h-12 rounded-full object-cover border-2 border-[#F5EDD8]"
                />
                <div>
                  <div className="flex items-center gap-2">
                    <h3 className="font-bold text-[#2C1810]">{review.user.name}</h3>
                    <span className="text-xs text-[#7B7068]">• {review.user.time}</span>
                  </div>
                  <div className="flex items-center mt-0.5">
                    {[...Array(5)].map((_, i) => (
                      <span key={i} className={`text-sm ${i < review.rating ? 'text-[#F5A623]' : 'text-[#E0D3C8]'}`}>
                        ★
                      </span>
                    ))}
                  </div>
                </div>
              </div>

              {/* Content */}
              <div className="ml-15 pl-1">
                <p className="text-[#4A3728] text-sm leading-relaxed mb-4">
                  {review.comment}
                </p>

                {/* Images */}
                {review.images && review.images.length > 0 && (
                  <div className="grid grid-cols-2 gap-3 mb-4 max-w-2xl">
                    {review.images.map((img, idx) => (
                      <div key={idx} className="aspect-[4/3] rounded-xl overflow-hidden shadow-sm">
                        <img 
                          src={img} 
                          alt={`Review ${idx}`} 
                          className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                        />
                      </div>
                    ))}
                  </div>
                )}

                {/* Helpful button */}
                <button 
                  onClick={() => toggleLike(review.id)}
                  className={`flex items-center gap-2 transition-colors text-sm font-medium ${
                    likedReviews[review.id] ? 'text-[#E8623A]' : 'text-[#7B7068] hover:text-[#E8623A]'
                  }`}
                >
                  <svg 
                    width="18" 
                    height="18" 
                    viewBox="0 0 24 24" 
                    fill={likedReviews[review.id] ? "currentColor" : "none"} 
                    stroke="currentColor" 
                    strokeWidth="2" 
                    strokeLinecap="round" 
                    strokeLinejoin="round"
                  >
                    <path d="M14 9V5a3 3 0 00-3-3l-4 9v11h11.28a2 2 0 002-1.7l1.38-9a2 2 0 00-2-2.3zM7 22H4a2 2 0 01-2-2v-7a2 2 0 012-2h3" />
                  </svg>
                  {likedReviews[review.id] ? 'Đã thích' : 'Hữu ích'}
                </button>

              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};

export default ReviewSection;
