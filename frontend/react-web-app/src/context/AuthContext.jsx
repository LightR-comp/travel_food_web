import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { loginApi, registerApi, logoutApi, getMeApi, uploadAvatarApi, deleteAvatarApi } from '../api/authApi';
import { auth, googleProvider, facebookProvider } from '../config/firebase';
import { signInWithPopup, signInWithRedirect, getRedirectResult } from 'firebase/auth';

const AuthContext = createContext(null);

const API_URL = import.meta.env.VITE_API_URL || '/api/v1';

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [uploadingAvatar, setUploadingAvatar] = useState(false);

  // Helper chuẩn hóa dữ liệu user
  const normalizeUserData = useCallback((u) => {
    if (!u) return null;
    const avatar = u.avatar_url || u.avatar || '';
    return {
      ...u,
      username: u.username || u.name || u.email?.split('@')[0] || 'User',
      full_name: u.full_name || u.name || 'User',
      avatar_url: u.avatar_url || u.avatar || null,
    };
  }, []);

  // Restore session on mount
  useEffect(() => {
    const token = localStorage.getItem('yummap_token');
    if (token) {
      getMeApi()
        .then((res) => {
          if (res.success) setUser(normalizeUserData(res.data));
          else localStorage.removeItem('yummap_token');
        })
        .catch(() => localStorage.removeItem('yummap_token'))
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, [normalizeUserData]);

  // useEffect để bắt redirect result (fix duplicate)
  useEffect(() => {
    getRedirectResult(auth).then(async (result) => {
      if (!result) return;
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, result.providerId === 'google.com' ? 'google' : 'facebook');
      localStorage.setItem('yummap_token', data.data.token);
      setUser(normalizeUserData(data.data.user));
    }).catch(console.error);
  }, [normalizeUserData]);

  // ---- Local login ----
  const login = useCallback(async (credentials) => {
    setError(null);
    const res = await loginApi(credentials);
    if (res.success) {
      localStorage.setItem('yummap_token', res.data.token);
      setUser(normalizeUserData(res.data.user));
    }
    return res;
  }, [normalizeUserData]);

  // ---- Register ----
  const register = useCallback(async (payload) => {
    setError(null);
    return await registerApi(payload);
  }, []);

  // ---- Logout ----
  const logout = useCallback(async () => {
    try { await logoutApi(); } catch (e) { console.error('Logout error:', e); }
    localStorage.removeItem('yummap_token');
    setUser(null);
  }, []);

  // ---- Update user state ----
  const updateUser = useCallback((updatedData) => {
    setUser(prev => ({ ...prev, ...updatedData }));
  }, []);

  // ========== AVATAR FUNCTIONS ==========
  
  // Upload avatar
  const uploadAvatar = useCallback(async (file) => {
    setUploadingAvatar(true);
    setError(null);
    
    try {
      const response = await uploadAvatarApi(file);
      
      if (response.success) {
        const newAvatarUrl = response.data?.avatar_url;
        
        // Cập nhật user state
        setUser(prev => ({ 
          ...prev, 
          avatar_url: newAvatarUrl,
          avatar: newAvatarUrl 
        }));
        
        // Cập nhật localStorage nếu cần
        const storedUser = localStorage.getItem('yummap_user');
        if (storedUser) {
          const userData = JSON.parse(storedUser);
          userData.avatar_url = newAvatarUrl;
          localStorage.setItem('yummap_user', JSON.stringify(userData));
        }
        
        return { success: true, avatar_url: newAvatarUrl };
      }
      
      return { success: false, error: response.message };
    } catch (err) {
      console.error('Upload avatar error:', err);
      setError(err.message || 'Upload avatar thất bại');
      return { success: false, error: err.message };
    } finally {
      setUploadingAvatar(false);
    }
  }, []);

  // Delete avatar
  const deleteAvatar = useCallback(async () => {
    setUploadingAvatar(true);
    setError(null);
    
    try {
      const response = await deleteAvatarApi();
      
      if (response.success) {
        // Cập nhật user state
        setUser(prev => ({ 
          ...prev, 
          avatar_url: null,
          avatar: null 
        }));
        
        // Cập nhật localStorage
        const storedUser = localStorage.getItem('yummap_user');
        if (storedUser) {
          const userData = JSON.parse(storedUser);
          userData.avatar_url = null;
          localStorage.setItem('yummap_user', JSON.stringify(userData));
        }
        
        return { success: true };
      }
      
      return { success: false, error: response.message };
    } catch (err) {
      console.error('Delete avatar error:', err);
      setError(err.message || 'Xóa avatar thất bại');
      return { success: false, error: err.message };
    } finally {
      setUploadingAvatar(false);
    }
  }, []);

  // Refresh user data (lấy thông tin mới nhất từ server)
  const refreshUser = useCallback(async () => {
    try {
      const response = await getMeApi();
      if (response.success) {
        setUser(normalizeUserData(response.data));
        return { success: true, user: response.data };
      }
      return { success: false, error: response.message };
    } catch (err) {
      console.error('Refresh user error:', err);
      return { success: false, error: err.message };
    }
  }, [normalizeUserData]);

  // ---- Helper: send idToken to Go backend ----
  const sendOAuthToken = async (idToken, provider) => {
    const response = await fetch(`${API_URL}/auth/oauth`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id_token: idToken, provider }),
    });

    if (!response.ok) {
        const errorBody = await response.text().catch(() => '');
        throw new Error(`HTTP ${response.status} - ${errorBody}`);
    }

    const data = await response.json();

    // Wrap cho khớp với format backend trả về
    return {
        success: true,
        data: {
            token: data.data?.token,
            user:  data.data?.user,
        }
    };
  };
  
  // ---- Google login ----
  const loginWithGoogle = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, googleProvider);
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'google');

      if (data.success) {
        localStorage.setItem('yummap_token', data.data.token);
        const normalized = normalizeUserData(data.data.user);
        setUser(normalized);
        return { success: true, user: normalized };
      }
      return { success: false, error: data.message };
    } catch (err) {
      console.error('Google login error:', err);
      return { success: false, error: 'Đăng nhập Google thất bại' };
    }
  }, [normalizeUserData]);

  // ---- Facebook login ----
  const loginWithFacebook = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, facebookProvider);
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'facebook');
      localStorage.setItem('yummap_token', data.data.token);
      const normalized = normalizeUserData(data.data.user);
      setUser(normalized);
      return { success: true, user: normalized };
    } catch (err) {
      console.error('Facebook login error:', err.code, err.message);
      return { success: false, error: 'Đăng nhập Facebook thất bại' };
    }
  }, [normalizeUserData]);

  return (
    <AuthContext.Provider value={{
      user,
      setUser,
      updateUser,
      uploadAvatar,      // Thêm function upload avatar
      deleteAvatar,      // Thêm function xóa avatar
      refreshUser,       // Thêm function refresh user data
      uploadingAvatar,   // Thêm state upload status
      loading,
      error,
      login,
      register,
      logout,
      loginWithGoogle,
      loginWithFacebook,
      isAuth: !!user,
    }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used inside AuthProvider');
  return ctx;
};