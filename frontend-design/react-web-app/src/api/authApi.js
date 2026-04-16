import axiosInstance from './axiosInstance';

// ============================================================
// Auth API – maps to Go backend /api/auth/*
// ============================================================

/**
 * POST /api/auth/login
 * @param {{ username: string, password: string }} credentials
 */
export const loginApi = async (credentials) => {
  // --- MOCK (remove when Go backend is ready) ---
  await new Promise((r) => setTimeout(r, 800));
  if (credentials.username && credentials.password) {
    return {
      success: true,
      message: 'Đăng nhập thành công',
      data: {
        token: 'mock_jwt_token_' + Date.now(),
        user: {
          id: 1,
          username: credentials.username,
          full_name: 'Người dùng demo',
          email: credentials.username + '@yummap.vn',
          avatar_url: null,
        },
      },
      error: null,
    };
  }
  throw { response: { data: { success: false, message: 'Sai tài khoản hoặc mật khẩu', error: { code: 'INVALID_CREDENTIALS' } } } };

  // --- REAL (uncomment when backend ready) ---
  // const { data } = await axiosInstance.post('/auth/login', credentials);
  // return data;
};

/**
 * POST /api/auth/register
 */
export const registerApi = async (payload) => {
  await new Promise((r) => setTimeout(r, 1000));
  return {
    success: true,
    message: 'Đăng ký thành công',
    data: { user_id: 99 },
    error: null,
  };
  // const { data } = await axiosInstance.post('/auth/register', payload);
  // return data;
};

/**
 * POST /api/auth/logout
 */
export const logoutApi = async () => {
  await new Promise((r) => setTimeout(r, 200));
  return { success: true };
  // const { data } = await axiosInstance.post('/auth/logout');
  // return data;
};

/**
 * GET /api/auth/me
 */
export const getMeApi = async () => {
  // const { data } = await axiosInstance.get('/auth/me');
  // return data;
  const token = localStorage.getItem('yummap_token');
  if (!token) throw new Error('No token');
  return {
    success: true,
    data: {
      id: 1,
      username: 'demo_user',
      full_name: 'Người dùng demo',
      email: 'demo@yummap.vn',
      avatar_url: null,
    },
  };
};
