import axiosInstance from './axiosInstance';

// ============================================================
// Auth API – Go backend
// Base URL (axiosInstance): /api/v1
// ============================================================

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