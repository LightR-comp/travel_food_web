import axiosInstance from './axiosInstance';

// ============================================================
// Restaurant / Food API – maps to Go backend /api/restaurants/*
// ============================================================

const MOCK_RESTAURANTS = [
  {
    id: 1,
    restaurant_info: {
      name: 'Bánh mì Huỳnh Hoa',
      contact: { address: '26-30-32 Lê Thị Riêng, P. Bến Thành, Quận 1, TP.HCM', phone: '028 3925 7488' },
      operating_hours: { schedule: '14:00 - 22:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Thương hiệu bánh mì nổi tiếng Sài Gòn hơn 40 năm.',
      fun_facts: ['Từng lọt top 10 bánh mì ngon nhất Sài Gòn', 'Nhân bánh dày và thơm đặc trưng'],
    },
    signature_dish: {
      dish_name: 'Bánh mì thập cẩm',
      cultural_origin: 'Ẩm thực Nam Bộ',
      flavor_profile: 'Thơm, béo, đậm đà',
      trivia: ['Nhân bánh gồm 7 loại thịt khác nhau'],
    },
    meta: { rating: 4.8, review_count: '90+', distance_km: 5.2, price_range: '38.000 – 78.000 đ' },
    ai_analysis: { score: 0.95, reason: 'Phù hợp bữa sáng hoặc trưa nhẹ nhàng' },
    tags: ['Bánh Mì', 'Ăn no', 'Món mặn'],
    image_url: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&q=80',
    badge: 'Popular',
  },
  {
    id: 2,
    restaurant_info: {
      name: 'Bún bò Huế Ô Thủy',
      contact: { address: '220/5 Lê Văn Sỹ, P. 14, Quận 3, TP.HCM', phone: '090 9123 456' },
      operating_hours: { schedule: '06:00 - 11:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Quán bún bò Huế gia truyền nổi tiếng hơn 20 năm.',
      fun_facts: ['Nước dùng ninh từ 5 giờ sáng', 'Sử dụng nguyên liệu nhập từ Huế'],
    },
    signature_dish: {
      dish_name: 'Bún bò Huế đặc biệt',
      cultural_origin: 'Ẩm thực miền Trung – Cố đô Huế',
      flavor_profile: 'Cay, đậm đà, thơm sả',
      trivia: ['Nước dùng có vị đặc trưng của mắm ruốc Huế'],
    },
    meta: { rating: 4.7, review_count: '80+', distance_km: 3.7, price_range: '35.000 – 60.000 đ' },
    ai_analysis: { score: 0.91, reason: 'Hương vị đậm đà đặc trưng miền Trung' },
    tags: ['Bún bò', 'Món nước', 'Ẩm thực Huế'],
    image_url: 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400&q=80',
    badge: 'Must try',
  },
  {
    id: 3,
    restaurant_info: {
      name: 'Cơm tấm Sà Bì Chưởng',
      contact: { address: '179 Trần Bình Trọng, P. 3, Quận 5, TP.HCM', phone: '097 1095 261' },
      operating_hours: { schedule: '07:00 - 21:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Chuỗi cơm tấm nổi tiếng nhất Sài Gòn.',
      fun_facts: ['6700+ đánh giá trên Google', 'Có 10+ chi nhánh trên toàn TP.HCM'],
    },
    signature_dish: {
      dish_name: 'Cơm sườn bì chả',
      cultural_origin: 'Ẩm thực Nam Bộ',
      flavor_profile: 'Ngọt thơm, đậm đà nước mắm',
      trivia: ['Sườn nướng trên than hoa đặc biệt'],
    },
    meta: { rating: 4.7, review_count: '6700+', distance_km: 1.8, price_range: '40.000 – 90.000 đ' },
    ai_analysis: { score: 0.89, reason: 'Cơm tấm đặc trưng Sài Gòn, no lâu' },
    tags: ['Cơm tấm', 'Sài Gòn'],
    image_url: 'https://images.unsplash.com/photo-1503764654157-72d979d9af2f?w=400&q=80',
    badge: null,
  },
  {
    id: 4,
    restaurant_info: {
      name: 'Bò bía Trần Hưng Đạo',
      contact: { address: 'Trần Hưng Đạo, Quận 5, TP.HCM', phone: null },
      operating_hours: { schedule: '10:00 - 20:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Hàng bò bía vỉa hè nổi tiếng lâu đời.',
      fun_facts: ['Giá siêu rẻ', 'Cuốn tươi ngay tại chỗ'],
    },
    signature_dish: {
      dish_name: 'Bò bía cuốn tươi',
      cultural_origin: 'Ẩm thực người Hoa – Sài Gòn',
      flavor_profile: 'Thanh mát, không cay',
      trivia: ['Ăn kèm tương hoisin đặc trưng'],
    },
    meta: { rating: 4.8, review_count: '52', distance_km: 2.0, price_range: '5.000 đ' },
    ai_analysis: { score: 0.82, reason: 'Món ăn vặt nhẹ nhàng, phù hợp buổi chiều' },
    tags: ['Cuốn', 'Ăn vặt'],
    image_url: 'https://images.unsplash.com/photo-1562802378-063ec186a863?w=400&q=80',
    badge: null,
  },
  {
    id: 5,
    restaurant_info: {
      name: 'Phở bò gia truyền Ông Tám',
      contact: { address: '123 Nguyễn Huệ, Quận 1, TP.HCM', phone: '090 9123 456' },
      operating_hours: { schedule: '05:30 - 12:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Quán phở gia truyền hơn 20 năm, nước dùng ninh 12 tiếng.',
      fun_facts: ['Nước dùng ninh hơn 12 tiếng', 'Khách nước ngoài rất ưa chuộng'],
    },
    signature_dish: {
      dish_name: 'Phở bò tái',
      cultural_origin: 'Ẩm thực miền Bắc Việt Nam',
      flavor_profile: 'Đậm đà, thơm mùi bò, nước dùng trong',
      trivia: ['Có thể ăn kèm trứng lòng đào', 'Thường ăn cùng quẩy'],
    },
    meta: { rating: 4.9, review_count: '210+', distance_km: 1.2, price_range: '50.000 – 90.000 đ' },
    ai_analysis: { score: 0.93, reason: 'Phở chuẩn vị miền Bắc, nước dùng trong và thơm' },
    tags: ['Phở', 'Ẩm thực Bắc'],
    image_url: 'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=400&q=80',
    badge: 'Trending',
  },
  {
    id: 6,
    restaurant_info: {
      name: 'TuTiMi – Trà Sữa, Cà Phê',
      contact: { address: '45 Nguyễn Trãi, Quận 1, TP.HCM', phone: '028 1234 5678' },
      operating_hours: { schedule: '07:00 - 22:00', is_open_now: true, status_text: 'Đang mở cửa' },
      history: 'Thương hiệu trà sữa nội địa nổi tiếng với không gian trẻ trung.',
      fun_facts: ['Menu thay đổi theo mùa', 'Nhân viên thân thiện'],
    },
    signature_dish: {
      dish_name: 'Trà sữa Oolong tươi',
      cultural_origin: 'Phong cách Đài Loan',
      flavor_profile: 'Thanh mát, không ngấy',
      trivia: ['Sử dụng trà Oolong nhập khẩu'],
    },
    meta: { rating: 5.0, review_count: '56', distance_km: 1.4, price_range: '20.000 – 70.000 đ' },
    ai_analysis: { score: 0.88, reason: 'Lý tưởng cho buổi chiều chill' },
    tags: ['Nước', 'Trà Sữa', 'Cà Phê'],
    image_url: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80',
    badge: null,
  },
];

const MOCK_POSTS = [
  {
    id: 1,
    title: 'Review bánh mì Huỳnh Hoa, đặt nhất Sài Gòn nhưng chất lượng có đỉnh nhất?',
    excerpt: 'Khi nhắc đến bánh mì Sài Gòn, không thể không nhắc đến cái tên Huỳnh Hoa – thương hiệu đã trở thành huyền thoại gắn liền với ký ức tuổi thơ của nhiều thế hệ...',
    author: 'Admin',
    date: '12/04/2026',
    image_url: 'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800&q=80',
    restaurant_id: 1,
  },
  {
    id: 2,
    title: 'Review mới nhất về quán cơm tấm Phúc Lộc Thọ Kha Vạn Cân',
    excerpt: 'Nếu là tín đồ cơm tấm và đang tìm kiếm một địa điểm ăn ngon, cơm tấm Phúc Lộc Thọ Kha Vạn Cân chắc chắn là một lựa chọn đáng thử...',
    author: 'Reviewer',
    date: '10/04/2026',
    image_url: 'https://images.unsplash.com/photo-1555126634-323283e090fa?w=800&q=80',
    restaurant_id: 3,
  },
];

/** GET /api/restaurants/trending */
export const getTrendingApi = async () => {
  await new Promise((r) => setTimeout(r, 600));
  return { success: true, data: { restaurants: MOCK_RESTAURANTS }, error: null };
  // const { data } = await axiosInstance.get('/restaurants/trending');
  // return data;
};

/** GET /api/restaurants/spots */
export const getGoodSpotsApi = async () => {
  await new Promise((r) => setTimeout(r, 400));
  return { success: true, data: { restaurants: [...MOCK_RESTAURANTS].reverse() }, error: null };
};

/** GET /api/posts/popular */
export const getPopularPostsApi = async () => {
  await new Promise((r) => setTimeout(r, 500));
  return { success: true, data: { posts: MOCK_POSTS }, error: null };
};

/**
 * GET /api/restaurants/search
 * @param {{ q: string, min_price: number, max_price: number, filters: string[], sort: string }} params
 */
export const searchRestaurantsApi = async (params) => {
  await new Promise((r) => setTimeout(r, 700));
  const query = (params.q || '').toLowerCase();
  let results = MOCK_RESTAURANTS;
  if (query) {
    results = results.filter(
      (r) =>
        r.restaurant_info.name.toLowerCase().includes(query) ||
        r.tags.some((t) => t.toLowerCase().includes(query))
    );
  }
  return { success: true, data: { restaurants: results, total: results.length }, error: null };
  // const { data } = await axiosInstance.get('/restaurants/search', { params });
  // return data;
};

/**
 * GET /api/restaurants/:id
 */
export const getRestaurantByIdApi = async (id) => {
  await new Promise((r) => setTimeout(r, 500));
  const found = MOCK_RESTAURANTS.find((r) => r.id === Number(id));
  if (!found) throw new Error('Not found');
  return { success: true, data: { restaurant: found }, error: null };
  // const { data } = await axiosInstance.get(`/restaurants/${id}`);
  // return data;
};
