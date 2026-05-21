import React from 'react';

const LoginRequireModal = ({ isOpen, onClose, onLogin }) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 transition-opacity" onClick={onClose}>
      <div 
        className="bg-white rounded-3xl w-full max-w-sm flex flex-col items-center p-8 relative transform transition-transform scale-100 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Icon */}
        <div className="w-16 h-16 rounded-full bg-[#FFF8EE] flex items-center justify-center text-[#E8623A] mb-4">
          <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </div>

        {/* Text */}
        <h3 className="font-[Baloo_2,sans-serif] text-xl font-bold text-[#2C1810] mb-2 text-center">
          Đăng nhập để tiếp tục
        </h3>
        <p className="text-center text-[#7B7068] text-sm mb-6 leading-relaxed">
          Vui lòng đăng nhập để chia sẻ trải nghiệm và viết đánh giá của bạn.
        </p>

        {/* Actions */}
        <div className="w-full flex flex-col gap-3">
          <button 
            className="w-full py-3 rounded-xl bg-[#E8623A] hover:bg-[#D9552E] text-white font-bold transition-colors shadow-sm"
            onClick={onLogin}
          >
            Đăng nhập ngay
          </button>
          <button 
            className="w-full py-3 rounded-xl border border-[#E0D3C8] bg-white text-[#7B7068] font-bold hover:bg-[#FAFAF7] transition-colors"
            onClick={onClose}
          >
            Đóng
          </button>
        </div>
      </div>
    </div>
  );
};

export default LoginRequireModal;
