/**
 * AuthButton – Orange gradient pill button for Login/Signup forms
 */
const AuthButton = ({
  children,
  type = 'button',
  onClick,
  loading = false,
  variant = 'primary', // 'primary' | 'facebook' | 'google' | 'outline'
  className = '',
  disabled = false,
}) => {
  const variants = {
    primary:
      'bg-gradient-to-r from-[#F5A340] to-[#E08B20] text-white shadow-[0_6px_20px_rgba(245,163,64,0.45)] hover:shadow-[0_10px_28px_rgba(245,163,64,0.55)] hover:-translate-y-0.5',
    facebook:
      'border-2 border-[#1877F2] text-[#1877F2] hover:bg-[#1877F2] hover:text-white hover:shadow-[0_6px_18px_rgba(24,119,242,0.3)]',
    google:
      'border-2 border-[#D4D0CC] text-[#3D1A0A] hover:border-[#EA4335] hover:bg-[#F8F6F4]',
    outline:
      'border-2 border-[#E8623A] text-[#E8623A] hover:bg-[#E8623A] hover:text-white',
  };

  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled || loading}
      className={`
        inline-flex items-center justify-center gap-2
        rounded-full font-bold font-[Inter] text-sm
        transition-all duration-200 cursor-pointer
        disabled:opacity-60 disabled:cursor-not-allowed active:translate-y-0
        ${variants[variant]}
        ${className}
      `}
    >
      {loading ? (
        <span className="inline-flex items-center gap-2">
          <svg className="animate-spin w-4 h-4 text-current" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="3" />
            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
          </svg>
          Đang xử lý...
        </span>
      ) : children}
    </button>
  );
};

export default AuthButton;
