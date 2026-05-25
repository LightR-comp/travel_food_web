import axiosInstance from './axiosInstance';

// ============================================================
// Auth API – Go backend
// Base URL (axiosInstance): /api/v1
// ============================================================
axiosInstance.interceptors.response.use(
  (response) => {
    console.log('API Response:', response.config.url, response.data);
    return response;
  },
  (error) => {
    console.error('API Error:', error.config?.url, error.response?.data);
    return Promise.reject(error);
  }
);
/**
 * POST /api/v1/auth/login
 * Body: { username, password }
 * Response: { success, message, data: { token, user }, error }
 */
export const loginApi = async (credentials) => {
  const { data } = await axiosInstance.post('/auth/login', credentials);
  return data;
};

/**
 * POST /api/v1/auth/register
 * Body: { full_name, email, username, password, confirm_password }
 * Response: { success, message, data: { user_id }, error }
 */
export const registerApi = async (payload) => {
  const { data } = await axiosInstance.post('/auth/register', payload);
  return data;
};

/**
 * POST /api/v1/auth/logout
 */
export const logoutApi = async () => {
  const { data } = await axiosInstance.post('/auth/logout');
  return data;
};

/**
 * GET /api/v1/me
 * Response: { success, message, data: { id, username, full_name, email, avatar_url }, error }
 */
export const getMeApi = async () => {
  const { data } = await axiosInstance.get('/me');
  return data;
};

/**
 * PUT /api/v1/me
 * Body: { full_name, avatar_url } (các field cần cập nhật)
 * Response: { success, message, data: { id, username, full_name, email, avatar_url }, error }
 */
export const updateProfileApi = async (payload) => {
  const { data } = await axiosInstance.put('/me', payload);
  return data;
};

// ============================================================
// Avatar API – Thêm mới
// ============================================================

/**
 * POST /api/v1/me/avatar
 * Upload avatar file
 * Body: FormData với key 'avatar'
 * Response: { success, message, data: { avatar_url }, error }
 */
export const uploadAvatarApi = async (file) => {
  const formData = new FormData();
  formData.append('avatar', file);
  
  const { data } = await axiosInstance.post('/me/avatar', formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });
  
  return data;
};

/**
 * DELETE /api/v1/me/avatar
 * Xóa avatar
 * Response: { success, message, error }
 */
export const deleteAvatarApi = async () => {
  const { data } = await axiosInstance.delete('/me/avatar');
  return data;
};

/**
 * PUT /api/v1/me/avatar
 * Cập nhật avatar URL (nếu backend hỗ trợ update trực tiếp URL)
 * Body: { avatar_url }
 * Response: { success, message, data: { avatar_url }, error }
 */
export const updateAvatarApi = async (avatarUrl) => {
  const { data } = await axiosInstance.put('/me/avatar', { avatar_url: avatarUrl });
  return data;
};