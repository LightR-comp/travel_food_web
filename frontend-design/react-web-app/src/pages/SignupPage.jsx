import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import InputField from '../components/ui/InputField';
import AuthButton from '../components/ui/AuthButton';
import { useAuth } from '../context/AuthContext';
import { isValidEmail } from '../utils/formatters';

const SignupPage = () => {
  const { register } = useAuth();
  const navigate = useNavigate();

  const [form, setForm] = useState({
    full_name: '', email: '', username: '', password: '', confirm_password: '',
  });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);
  const [toast, setToast] = useState(null);

  const showToast = (msg, type = 'error') => {
    setToast({ msg, type });
    setTimeout(() => setToast(null), 3500);
  };

  const validate = () => {
    const e = {};
    if (!form.full_name.trim()) e.full_name = 'Vui lòng nhập họ và tên';
    if (!form.email || !isValidEmail(form.email)) e.email = 'Email không hợp lệ';
    if (!form.username || form.username.length < 3) e.username = 'Tên đăng nhập tối thiểu 3 ký tự';
    if (!form.password || form.password.length < 8) e.password = 'Mật khẩu tối thiểu 8 ký tự';
    if (form.password !== form.confirm_password) e.confirm_password = 'Mật khẩu nhập lại không khớp';
    setErrors(e);
    return Object.keys(e).length === 0;
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
      await register(form);
      showToast('🎉 Tạo tài khoản thành công!', 'success');
      setTimeout(() => navigate('/login'), 1200);
    } catch (err) {
      showToast(err?.response?.data?.message || '❌ Có lỗi xảy ra, vui lòng thử lại');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      className="min-h-screen flex flex-col items-center justify-center px-5 py-16 relative"
      style={{
        background: '#F0786A',
        backgroundImage: 'radial-gradient(circle at 20% 20%, rgba(255,255,255,0.12) 0%, transparent 50%)',
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

      {/* Logo floating above card */}
      <div className="relative z-10 mb-[-28px]">
        <div className="w-[110px] h-[110px] rounded-full bg-white shadow-[0_6px_24px_rgba(60,20,10,0.18)] flex items-center justify-center p-2">
          <div className="flex flex-col items-center">
            <span className="text-4xl">🍜</span>
            <span className="font-[Baloo_2,sans-serif] text-xs font-extrabold text-[#E8623A] mt-0.5">YumMap</span>
          </div>
        </div>
      </div>

      {/* Card */}
      <div className="bg-white rounded-[28px] shadow-[0_24px_64px_rgba(60,20,10,0.22)] w-full max-w-[780px] overflow-hidden flex animate-fade-up pt-7">

        {/* Left: decorative white side */}
        <div className="hidden md:flex w-[220px] flex-shrink-0 bg-white items-center justify-center p-6">
          <div className="w-[180px] rounded-2xl overflow-hidden shadow-[0_8px_24px_rgba(60,20,10,0.14)]">
            <img
              src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&q=80"
              alt="Ẩm thực Việt"
              className="w-full h-[320px] object-cover hover:scale-105 transition-transform duration-700"
              id="deco-food-img"
            />
          </div>
        </div>

        {/* Right: peach form panel */}
        <div
          className="flex-1 flex flex-col items-center px-9 py-7 m-4 mr-5 ml-2 rounded-[20px]"
          style={{ background: '#FDECD8' }}
        >
          <h1 className="font-[Baloo_2,sans-serif] text-[1.6rem] font-extrabold text-[#5C2A1A] tracking-[2px] mb-5">
            ĐĂNG KÝ
          </h1>

          <form onSubmit={handleSubmit} className="w-full" id="signup-form">
            <InputField
              id="signup-fullname"
              label="Họ và tên"
              required
              value={form.full_name}
              onChange={handleChange('full_name')}
              placeholder="Nhập họ và tên"
              error={errors.full_name}
              inputClassName="bg-[#FAE0CC] focus:bg-white"
              icon={
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
                  <circle cx="12" cy="8" r="4" /><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7" />
                </svg>
              }
            />

            <InputField
              id="signup-email"
              label="Email"
              type="email"
              required
              value={form.email}
              onChange={handleChange('email')}
              placeholder="example@email.com"
              error={errors.email}
              inputClassName="bg-[#FAE0CC] focus:bg-white"
              icon={
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
                  <rect x="2" y="4" width="20" height="16" rx="2" /><polyline points="2,4 12,13 22,4" />
                </svg>
              }
            />

            <InputField
              id="signup-username"
              label="Tài khoản"
              required
              value={form.username}
              onChange={handleChange('username')}
              placeholder="Tên đăng nhập"
              error={errors.username}
              inputClassName="bg-[#FAE0CC] focus:bg-white"
              icon={
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
                  <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2" /><circle cx="12" cy="7" r="4" />
                </svg>
              }
            />

            <InputField
              id="signup-password"
              label="Mật khẩu"
              type="password"
              required
              value={form.password}
              onChange={handleChange('password')}
              placeholder="Tối thiểu 8 ký tự"
              error={errors.password}
              inputClassName="bg-[#FAE0CC] focus:bg-white"
            />

            <InputField
              id="signup-confirm"
              label="Nhập lại khẩu"
              type="password"
              required
              value={form.confirm_password}
              onChange={handleChange('confirm_password')}
              placeholder="Nhập lại mật khẩu"
              error={errors.confirm_password}
              inputClassName="bg-[#FAE0CC] focus:bg-white"
            />

            <AuthButton
              type="submit"
              loading={loading}
              variant="primary"
              className="w-full py-3.5 text-base tracking-wide mt-2 mb-4"
              id="signup-submit-btn"
            >
              Đăng ký
            </AuthButton>

            <p className="text-center text-sm text-[#6B3A2A]">
              Đã có tài khoản?{' '}
              <Link to="/login" className="text-[#E85D42] font-bold hover:underline" id="goto-login">
                Đăng nhập ngay
              </Link>
            </p>
          </form>
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

export default SignupPage;
