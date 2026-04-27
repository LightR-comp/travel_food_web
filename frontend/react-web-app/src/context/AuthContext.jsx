import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { loginApi, registerApi, logoutApi, getMeApi } from '../api/authApi';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Restore session on mount
  useEffect(() => {
    const token = localStorage.getItem('yummap_token');
    if (token) {
      getMeApi()
        .then((res) => setUser(res.data))
        .catch(() => localStorage.removeItem('yummap_token'))
        .finally(() => setLoading(false));
    } else {
      setLoading(false);
    }
  }, []);

  const login = useCallback(async (credentials) => {
    setError(null);
    const res = await loginApi(credentials);
    localStorage.setItem('yummap_token', res.data.token);
    setUser(res.data.user);
    return res;
  }, []);

  const register = useCallback(async (payload) => {
    setError(null);
    return await registerApi(payload);
  }, []);

  const logout = useCallback(async () => {
    await logoutApi();
    localStorage.removeItem('yummap_token');
    setUser(null);
  }, []);

  return (
    <AuthContext.Provider value={{ user, loading, error, login, register, logout, isAuth: !!user }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used inside AuthProvider');
  return ctx;
};
