import axios from 'axios';

// ============================================================
// Axios Instance – swap BASE_URL to your Go backend
// ============================================================
const axiosInstance = axios.create({
  baseURL: import.meta.env.VITE_API_URL || '/api/v1',
  timeout: 15000,
  headers: { 'Content-Type': 'application/json' },
});

// ---- Request Interceptor: attach JWT ----
axiosInstance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('yummap_token');
    if (token) config.headers.Authorization = `Bearer ${token}`;
    return config;
  },
  (error) => Promise.reject(error)
);

// ---- Response Interceptor: handle 401 ----
axiosInstance.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('yummap_token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export default axiosInstance;
