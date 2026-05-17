import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { loginApi, registerApi, logoutApi, getMeApi } from '../api/AuthAPI';
import { auth, googleProvider, facebookProvider, signInWithPopup } from '../config/firebase';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const token = localStorage.getItem('yummap_token');
    if (token) {
      getMeApi()
        .then((res) => {
          if (res.success) {
            setUser(res.data);
          } else {
            localStorage.removeItem('yummap_token');
          }
        })
        .catch(() => localStorage.removeItem('yummap_token'))
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, []);

  const login = useCallback(async (credentials) => {
    setError(null);
    const res = await loginApi(credentials);
    if (res.success) {
      localStorage.setItem('yummap_token', res.data.token);
      setUser(res.data.user);
    }
    return res;
  }, []);

  const register = useCallback(async (payload) => {
    setError(null);
    return await registerApi(payload);
  }, []);

  const logout = useCallback(async () => {
    try {
      await logoutApi();
    } catch (error) {
      console.error('Logout API error:', error);
    } finally {
      localStorage.removeItem('yummap_token');
      setUser(null);
    }
  }, []);

  const updateUser = useCallback((updatedData) => {
    setUser(prev => ({ ...prev, ...updatedData }));
  }, []);

  const loginWithGoogle = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, googleProvider);
      const { email, displayName, uid, photoURL } = result.user;
      
      const response = await fetch(`${process.env.REACT_APP_API_URL}/auth/social-login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          email,
          fullName: displayName,
          socialId: uid,
          avatar: photoURL,
          provider: 'google'
        })
      });
      
      const data = await response.json();
      
      if (data.success) {
        localStorage.setItem('yummap_token', data.data.token);
        setUser(data.data.user);
        return { success: true, user: data.data.user };
      } else {
        return { success: false, error: data.message };
      }
    } catch (error) {
      console.error('Google login error:', error);
      return { success: false, error: 'Đăng nhập Google thất bại' };
    }
  }, []);

  const loginWithFacebook = useCallback(async () => {
    setError(null);
    try {
      const result = await signInWithPopup(auth, facebookProvider);
      const { email, displayName, uid, photoURL } = result.user;
      
      const response = await fetch(`${process.env.REACT_APP_API_URL}/auth/social-login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          email,
          fullName: displayName,
          socialId: uid,
          avatar: photoURL,
          provider: 'facebook'
        })
      });
      
      const data = await response.json();
      
      if (data.success) {
        localStorage.setItem('yummap_token', data.data.token);
        setUser(data.data.user);
        return { success: true, user: data.data.user };
      } else {
        return { success: false, error: data.message };
      }
    } catch (error) {
      console.error('Facebook login error:', error);
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
      isAuth: !!user 
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