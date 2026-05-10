import axiosInstance from './axiosInstance';

// ============================================================
// Restaurant / Food API – maps to Go backend /api/v1/restaurants/*
// Base URL: http://localhost:8080/api  (set in axiosInstance)
// NOTE: axiosInstance.baseURL = /api  →  ta dùng /v1/... dưới đây
// ============================================================

/**
 * GET /api/v1/dishes/trending
 * Trả về danh sách món ăn đang hot (dùng cho khu vực TOP TRENDINGS ở trang chủ).
 * @param {number} limit - Số lượng kết quả (mặc định 6)
 */
export const getTrendingApi = async (limit = 6) => {
  const { data } = await axiosInstance.get('/v1/dishes/trending', {
    params: { limit },
  });
  return data; // { success, message, data: { dishes }, error }
};

/**
 * GET /api/v1/restaurants/popular
 * Trả về danh sách quán ăn phổ biến (dùng cho khu vực GOOD SPOTS FOR FOOD ở trang chủ).
 * @param {number} limit - Số lượng kết quả (mặc định 6)
 */
export const getGoodSpotsApi = async (limit = 6) => {
  const { data } = await axiosInstance.get('/v1/restaurants/popular', {
    params: { limit },
  });
  return data; // { success, message, data: { restaurants }, error }
};

/**
 * GET /api/v1/posts/popular
 * Trả về danh sách bài review hot.
 */
export const getPopularPostsApi = async () => {
  const { data } = await axiosInstance.get('/v1/posts/popular');
  return data; // { data: posts } hoặc { success, data: { posts }, error }
};

/**
 * GET /api/v1/restaurants/search
 * Tìm kiếm & lọc nhà hàng.
 * @param {{
 *   q?: string,
 *   min_price?: number,
 *   max_price?: number,
 *   lat?: number,
 *   lng?: number,
 *   sort?: string
 * }} params
 */
export const searchRestaurantsApi = async (params = {}) => {
  const { data } = await axiosInstance.get('/v1/restaurants/search', {
    params,
  });
  return data; // { success, message, data: { total, restaurants }, error }
};

/**
 * GET /api/v1/restaurants/:id
 * Lấy thông tin chi tiết của một nhà hàng.
 * @param {number|string} id
 */
export const getRestaurantByIdApi = async (id) => {
  const { data } = await axiosInstance.get(`/v1/restaurants/${id}`);
  return data; // { success, message, data: { ...restaurant }, error }
};
