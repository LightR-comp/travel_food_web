import { useState } from 'react';

// ---- Eye SVG Icons ----
const EyeOpen = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
    <ellipse cx="12" cy="12" rx="9" ry="5.5" />
    <circle cx="12" cy="12" r="2.5" />
  </svg>
);
const EyeClosed = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="w-[18px] h-[18px]">
    <path d="M17.94 17.94A10.07 10.07 0 0112 20c-7 0-11-8-11-8a18.45 18.45 0 015.06-5.94M9.9 4.24A9.12 9.12 0 0112 4c7 0 11 8 11 8a18.5 18.5 0 01-2.16 3.19m-6.72-1.07a3 3 0 11-4.24-4.24" />
    <line x1="1" y1="1" x2="23" y2="23" />
  </svg>
);

/**
 * Reusable Input Field for Auth forms
 */
const InputField = ({
  id,
  label,
  type = 'text',
  value,
  onChange,
  onBlur,
  placeholder,
  error,
  required = false,
  icon,
  className = '',
  inputClassName = '',
}) => {
  const [showPassword, setShowPassword] = useState(false);
  const isPassword = type === 'password';
  const actualType = isPassword ? (showPassword ? 'text' : 'password') : type;

  return (
    <div className={`mb-4 ${className}`}>
      {label && (
        <label htmlFor={id} className="block text-sm font-bold text-[#3D1A0A] mb-[7px]">
          {label}
          {required && <span className="text-[#E85D42] ml-1">*</span>}
        </label>
      )}
      <div className="relative">
        <input
          id={id}
          name={id}
          type={actualType}
          value={value}
          onChange={onChange}
          onBlur={onBlur}
          placeholder={placeholder}
          className={`
            w-full py-[13px] pr-[48px] pl-5
            bg-[#FFE8E0] border-2 border-transparent rounded-full
            text-sm font-normal text-[#3D1A0A]
            placeholder:text-[rgba(93,42,26,0.38)]
            outline-none transition-all duration-200
            focus:border-[#F9A899] focus:bg-white focus:shadow-[0_0_0_3px_rgba(244,131,106,0.15)]
            ${error ? 'border-red-400 bg-red-50' : ''}
            ${inputClassName}
          `}
        />

        {/* Right icon – eye toggle for password, or custom icon */}
        <button
          type="button"
          tabIndex={-1}
          onClick={isPassword ? () => setShowPassword((v) => !v) : undefined}
          className="absolute right-4 top-1/2 -translate-y-1/2 flex items-center justify-center w-7 h-7 text-[rgba(93,42,26,0.45)] hover:text-[#E85D42] transition-colors rounded-full"
          aria-label={isPassword ? (showPassword ? 'Ẩn mật khẩu' : 'Hiện mật khẩu') : undefined}
        >
          {isPassword ? (showPassword ? <EyeOpen /> : <EyeClosed />) : icon}
        </button>
      </div>

      {error && (
        <p className="text-xs text-red-500 mt-1 pl-2">{error}</p>
      )}
    </div>
  );
};

export default InputField;
