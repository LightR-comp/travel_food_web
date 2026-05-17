import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import InputField from '../components/ui/InputField';
import AuthButton from '../components/ui/AuthButton';
import { useAuth } from '../context/AuthContext';
import YumMapLogo from '../assets/YumMap-logo.svg';

// Facebook icon
const FacebookIcon = () => (
  <svg viewBox="0 0 24 24" fill="currentColor" className="w-4 h-4">
    <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z" />
  </svg>
);

// Google icon
const GoogleIcon = () => (
  <svg viewBox="0 0 24 24" className="w-4 h-4">
    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
  </svg>
);

const LoginPage = () => {
  const { login, loginWithGoogle } = useAuth();
  const navigate = useNavigate();

  const [form, setForm] = useState({ username: '', password: '' });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);
  const [toast, setToast] = useState(null);
  const [googleLoading, setGoogleLoading] = useState(false);

  const showToast = (msg, type = 'error') => {
    setToast({ msg, type });
    setTimeout(() => setToast(null), 3000);
  };

  const validate = () => {
    const e = {};
    if (!form.username.trim()) e.username = 'Vui lòng nhập tài khoản';
    if (!form.password) e.password = 'Vui lòng nhập mật khẩu';
    else if (form.password.length < 6) e.password = 'Mật khẩu tối thiểu 6 ký tự';
    setErrors(e);
    return Object.keys(e).length === 0;
  };

  const handleGoogleLogin = async () => {
    setGoogleLoading(true);
    const result = await loginWithGoogle();
    
    if (result.success) {
      showToast('✅ Đăng nhập bằng Google thành công!', 'success');
      setTimeout(() => navigate('/'), 800);
    } else {
      showToast(result.error || '❌ Đăng nhập Google thất bại');
    }
    setGoogleLoading(false);
  };

  const handleChange = (field) => (e) => {
    setForm((prev) => ({ ...prev, [field]: e.target.value }));
    if (errors[field]) setErrors((prev) => ({ ...prev, [field]: '' }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validate()) return;
    setLoading(true);
    try {
      await login({ username: form.username, password: form.password });
      showToast('✅ Đăng nhập thành công!', 'success');
      setTimeout(() => navigate('/'), 800);
    } catch (err) {
      showToast(err?.response?.data?.message || '❌ Sai tài khoản hoặc mật khẩu');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      className="min-h-screen flex items-center justify-center px-5 py-16 relative"
      style={{
        background: '#F0786A',
        backgroundImage: 'radial-gradient(circle at 20% 20%, rgba(255,255,255,0.12) 0%, transparent 50%), radial-gradient(circle at 80% 80%, rgba(200,60,30,0.18) 0%, transparent 50%)',
      }}
    >
      {/* Back button */}
      <Link
        to="/"
        className="fixed top-5 left-6 z-50 flex items-center gap-1.5 px-4 py-2 bg-white/20 backdrop-blur border border-white/35 rounded-full text-white text-xs font-semibold hover:bg-white/35 hover:-translate-x-1 transition-all"
      >
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" className="w-3.5 h-3.5">
          <polyline points="15,18 9,12 15,6" />
        </svg>
        Về trang chủ
      </Link>

      {/* Card */}
      <div className="bg-white rounded-[28px] shadow-[0_24px_64px_rgba(60,20,10,0.22)] w-full max-w-[860px] overflow-hidden flex animate-fade-up">

        {/* Left – form */}
        <div className="flex-1 px-10 py-11 flex flex-col items-center">
          {/* Logo */}
          <div className="mb-4 flex justify-center">
            <img src={YumMapLogo} alt="YumMap" className="h-14 w-auto object-contain" />
          </div>

          <h1 className="font-[Baloo_2,sans-serif] text-[1.7rem] font-extrabold text-[#5C2A1A] tracking-[2px] mb-7">
            ĐĂNG NHẬP
          </h1>

          <form onSubmit={handleSubmit} className="w-full max-w-[380px]" id="login-form">
            <InputField
              id="login-username"
              label="Tài khoản"
              required
              value={form.username}
              onChange={handleChange('username')}
              placeholder="Email hoặc tên đăng nhập"
              error={errors.username}
              icon={
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
                  <circle cx="12" cy="8" r="4" /><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7" />
                </svg>
              }
            />

            <InputField
              id="login-password"
              label="Mật khẩu"
              type="password"
              required
              value={form.password}
              onChange={handleChange('password')}
              placeholder="Nhập mật khẩu"
              error={errors.password}
            />

            <AuthButton
              type="submit"
              loading={loading}
              variant="primary"
              className="w-full py-3.5 text-base tracking-wide mb-3"
            >
              Đăng nhập
            </AuthButton>

            <p className="text-center text-sm text-[#E08B20] font-semibold mb-4">
              <a href="#" className="hover:underline" id="forgot-link">Quên mật khẩu?</a>
            </p>

            {/* Divider */}
            <div className="flex items-center gap-3 my-4 text-[#C9957E] text-xs font-medium">
              <div className="flex-1 h-px bg-gradient-to-r from-[#F4C4B0] to-[#E8A090]" />
              <span>Hoặc đăng nhập bằng</span>
              <div className="flex-1 h-px bg-gradient-to-r from-[#E8A090] to-[#F4C4B0]" />
            </div>

            {/* Social login */}
            <div className="flex gap-3 mb-4" id="social-login-btns">
              <AuthButton variant="facebook" className="flex-1 py-2.5" id="login-facebook-btn">
                <FacebookIcon /> Facebook
              </AuthButton>
              <AuthButton variant="google" className="flex-1 py-2.5" id="login-google-btn" 
              onClick={handleGoogleLogin}  
              loading={googleLoading}       
              disabled={googleLoading} 
              >
                <GoogleIcon /> Google
              </AuthButton>
            </div>

            {/* Register link */}
            <div className="flex items-center gap-3 my-3 text-[#C9957E] text-xs">
              <div className="flex-1 h-px bg-[#F4C4B0]" />
              <span>Tạo tài khoản mới</span>
              <div className="flex-1 h-px bg-[#F4C4B0]" />
            </div>
            <p className="text-center text-sm text-[#6B3A2A] mt-1">
              Chưa có tài khoản?{' '}
              <Link to="/signup" className="text-[#E85D42] font-bold hover:underline" id="goto-signup">
                Đăng ký ngay
              </Link>
            </p>
          </form>
        </div>

        {/* Right – welcome panel */}
        <div
          className="hidden md:flex w-[300px] flex-shrink-0 flex-col items-center justify-center gap-2.5 px-6 py-9"
          style={{ background: 'linear-gradient(160deg, #FEF3C0 0%, #FDEAA0 100%)' }}
        >
          <h2 className="font-[Dancing_Script,cursive] text-[1.65rem] font-bold text-[#5C2A1A] text-center leading-snug">
            Chào mừng trở lại
          </h2>
          <p className="font-[Dancing_Script,cursive] text-base text-[#8B4513] italic text-center -mt-1 mb-2">
            Du lịch thả ga cùng tớ nha
          </p>
          <div className="relative w-[220px] rounded-[20px_20px_60px_20px] overflow-hidden border-[3px] border-white/70 shadow-[0_12px_36px_rgba(60,20,10,0.2)]">
            <img
              src="https://images.unsplash.com/photo-1555126634-323283e090fa?w=400&q=80"
              alt="Ẩm thực Việt Nam"
              className="w-full h-[280px] object-cover"
              id="welcome-food-img"
            />
            <div className="absolute bottom-3 right-3 w-7 h-7 bg-white/90 rounded-full flex items-center justify-center shadow text-[#F5A340] text-xs">
              ⭐
            </div>
          </div>
        </div>
      </div>

      {/* Toast */}
      {toast && (
        <div className={`fixed bottom-8 left-1/2 -translate-x-1/2 z-[999] px-6 py-3 rounded-full text-white text-sm font-semibold shadow-xl animate-fade-up ${toast.type === 'success' ? 'bg-green-600' : 'bg-red-600'}`}>
          {toast.msg}
        </div>
      )}
    </div>
  );
};

export default LoginPage;
