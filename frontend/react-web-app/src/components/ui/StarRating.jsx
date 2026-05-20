import React from 'react';

const StarRating = ({ rating = 0, showMax = true }) => {
  // Đảm bảo rating nằm trong khoảng từ 0 đến 5
  const clampedRating = Math.max(0, Math.min(5, Number(rating) || 0));
  
  return (
    <div className="flex items-center gap-2">
      <div className="flex items-center gap-1">
        {[1, 2, 3, 4, 5].map((index) => {
          let percentage = 0;
          if (clampedRating >= index) {
            percentage = 100;
          } else if (clampedRating > index - 1) {
            percentage = Math.round((clampedRating - (index - 1)) * 100);
          }

          return (
            <div key={index} className="relative inline-block w-4 h-4">
              {/* Nền sao màu xám */}
              <svg className="absolute top-0 left-0 text-[#E0D3C8] w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
              </svg>
              {/* Phần được tô màu vàng */}
              <div className="absolute top-0 left-0 overflow-hidden h-full" style={{ width: `${percentage}%` }}>
                <svg className="text-[#f5a623] w-4 h-4 min-w-[16px]" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                </svg>
              </div>
            </div>
          );
        })}
      </div>
      <span className="text-sm font-semibold text-[#2C1810] ml-1">
        {clampedRating.toFixed(1)}{showMax ? ' / 5' : ''}
      </span>
    </div>
  );
};

export default StarRating;
