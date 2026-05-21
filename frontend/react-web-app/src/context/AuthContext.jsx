import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { loginApi, registerApi, logoutApi, getMeApi } from '../api/AuthAPI';
<<<<<<< HEAD
//import { auth, googleProvider, facebookProvider } from '../config/firebase';
//import { signInWithPopup } from 'firebase/auth';
=======
import { auth, googleProvider, facebookProvider } from '../config/firebase';
import { signInWithPopup, signInWithRedirect, getRedirectResult } from 'firebase/auth';
>>>>>>> nlakien

const AuthContext = createContext(null);

const API_URL = import.meta.env.VITE_API_URL || '/api/v1';

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Restore session on mount
  useEffect(() => {
    const token = localStorage.getItem('yummap_token');
    if (token) {
      getMeApi()
        .then((res) => {
          if (res.success) setUser(res.data);
          else localStorage.removeItem('yummap_token');
        })
        .catch(() => localStorage.removeItem('yummap_token'))
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, []);

  //useEffect để bắt redirect result
  useEffect(() => {
    getRedirectResult(auth).then(async (result) => {
      if (!result) return;
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'facebook');
      localStorage.setItem('yummap_token', data.data.token);
      setUser(data.data.user);
    }).catch(console.error);
  }, []);

  useEffect(() => {
  getRedirectResult(auth)
    .then(async (result) => {
      if (!result) return; // không phải redirect flow, bỏ qua
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'facebook');
      localStorage.setItem('yummap_token', data.data.token);
      setUser(data.data.user);
    })
    .catch((err) => console.error('Redirect result error:', err));
  }, []);

  // ---- Local login ----
  const login = useCallback(async (credentials) => {
    setError(null);
    const res = await loginApi(credentials);
    if (res.success) {
      localStorage.setItem('yummap_token', res.data.token);
      setUser(res.data.user);
    }
    return res;
  }, []);

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

  // ---- Helper: send idToken to Go backend ----
  const sendOAuthToken = async (idToken, provider) => {
    const response = await fetch(`${API_URL}/auth/oauth`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
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
            token: data.token,
            user:  data.user,
        }
    };
  };
  // ---- Google login ----
  const loginWithGoogle = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, googleProvider);
      // Force refresh token
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'google');

      if (data.success) {
        localStorage.setItem('yummap_token', data.data.token);
        setUser(data.data.user);
        return { success: true, user: data.data.user };
      }
      return { success: false, error: data.message };
    } catch (err) {
      console.error('Google login error:', err);
      return { success: false, error: 'Đăng nhập Google thất bại' };
    }
  }, []);

  // ---- Facebook login ----
  const loginWithFacebook = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, facebookProvider);
      const idToken = await result.user.getIdToken(true);
      const data = await sendOAuthToken(idToken, 'facebook');
      localStorage.setItem('yummap_token', data.data.token);
      setUser(data.data.user);
      return { success: true, user: data.data.user };
    } catch (err) {
      console.error('Facebook login error:', err.code, err.message);
      return { success: false, error: 'Đăng nhập Facebook thất bại' };
    }
  }, []);

  return (
    <AuthContext.Provider value={{
      user,
      setUser,
      updateUser,
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