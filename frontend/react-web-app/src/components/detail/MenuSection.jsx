import { useState } from 'react';

const formatPrice = (n) => n != null ? Number(n).toLocaleString('vi-VN') + 'đ' : '';

// Group mảng menu theo food_type
function groupByFoodType(menuItems) {
  const groups = {};
  (menuItems || []).forEach((item) => {
    const key = item.food_type || 'Khác';
    if (!groups[key]) groups[key] = [];
    groups[key].push(item);
  });
  return groups;
}

const MenuSection = ({ menu = [], isLoading = false, isError = false }) => {
  const [activeTab, setActiveTab] = useState(null);

  if (isLoading) {
    return (
      <div id="menu-section" className="">
        <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold text-[#2C1810] mb-6">Menu</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          {[1, 2, 3].map(i => (
            <div key={i} className="animate-pulse flex flex-col rounded-2xl shadow-sm border border-[#F0E8DF] overflow-hidden bg-white">
              <div className="w-full aspect-[4/3] bg-[#F5EDD8] bg-opacity-50"></div>
              <div className="p-4 space-y-3">
                <div className="h-4 bg-[#E0D3C8] rounded w-3/4"></div>
                <div className="h-4 bg-[#E0D3C8] rounded w-1/2"></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  if (isError) {
    return (
      <div id="menu-section" className="">
        <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold text-[#2C1810] mb-6">Menu</h2>
        <p className="text-sm text-[#E8623A] italic font-medium">Không thể tải menu</p>
      </div>
    );
  }

  if (!menu || menu.length === 0) {
    return (
      <div id="menu-section" className="">
        <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold text-[#2C1810] mb-6">Menu</h2>
        <p className="text-sm text-[#7B7068] italic">Quán chưa cập nhật menu</p>
      </div>
    );
  }

  const grouped = groupByFoodType(menu);
  const tabs = Object.keys(grouped);
  const currentTab = activeTab || tabs[0];
  const items = grouped[currentTab] || [];

  return (
    <div id="menu-section" className="">
      <h2 className="font-[Baloo_2,sans-serif] text-2xl font-extrabold text-[#2C1810] mb-6">Menu</h2>

      {/* Category tabs */}
      {tabs.length > 1 && (
        <div className="flex gap-2 mb-6 overflow-x-auto pb-2 scrollbar-none">
          {tabs.map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={`px-4 py-1.5 rounded-full text-sm font-bold border-2 transition-colors flex-shrink-0 ${
                currentTab === tab
                  ? 'bg-[#F5A623] border-[#F5A623] text-white'
                  : 'bg-white border-[#E0D3C8] text-[#4A3728] hover:border-[#F5A623] hover:text-[#F5A623]'
              }`}
            >
              {tab.toUpperCase()}
            </button>
          ))}
        </div>
      )}

      {/* Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
        {items.map((item, idx) => {
          const imageSrc = (item.images && item.images.length > 0 && item.images[0].image_url) 
                            ? item.images[0].image_url 
                            : item.image_url; // Dành cho trường hợp backend trả trực tiếp ảnh qua image_url

          return (
            <div key={item.id ?? idx} className="flex flex-col rounded-2xl shadow-[0_2px_8px_rgba(44,24,16,0.06)] border border-[#F0E8DF] overflow-hidden bg-white hover:shadow-[0_4px_12px_rgba(44,24,16,0.1)] transition-shadow">
              {/* Ảnh món ăn */}
              <div className="w-full aspect-[4/3] bg-[#FAFAF7] relative">
                {imageSrc ? (
                  <img src={imageSrc} alt={item.name} className="w-full h-full object-cover" />
                ) : (
                  <div className="w-full h-full flex flex-col items-center justify-center text-[#C2B5A7]">
                    <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="mb-2">
                      <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                      <circle cx="8.5" cy="8.5" r="1.5"/>
                      <polyline points="21 15 16 10 5 21"/>
                    </svg>
                    <span className="text-xs font-medium">Chưa có ảnh</span>
                  </div>
                )}
              </div>
              
              {/* Thông tin */}
              <div className="p-4 flex flex-col flex-1 justify-between">
                <div>
                  <h3 className="font-bold text-[#2C1810] text-base line-clamp-2 leading-tight mb-1">{item.name}</h3>
                  {item.description && (
                    <p className="text-sm text-[#7B7068] line-clamp-2 mb-3">{item.description}</p>
                  )}
                </div>
                <div className="font-extrabold text-[#E8623A] text-lg mt-2">
                  {formatPrice(item.price)}
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default MenuSection;
