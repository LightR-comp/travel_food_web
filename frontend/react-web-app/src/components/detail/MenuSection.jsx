/** Menu section for Detail page – dùng dữ liệu thực từ API */
import { useState } from 'react';

const fmt = (n) => n != null ? Number(n).toLocaleString('vi-VN') + ' đồng' : '';

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

const MenuSection = ({ menu = [] }) => {
  const grouped = groupByFoodType(menu);
  const tabs = Object.keys(grouped);
  const [activeTab, setActiveTab] = useState(tabs[0] || '');

  // Không có menu
  if (tabs.length === 0) {
    return (
      <div id="menu-section">
        <div className="flex items-center gap-2 mb-5">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2C1810" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="3" y="3" width="18" height="18" rx="2" />
            <line x1="7" y1="8"  x2="17" y2="8"  />
            <line x1="7" y1="12" x2="17" y2="12" />
            <line x1="7" y1="16" x2="13" y2="16" />
          </svg>
          <h2 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-[#2C1810]">Menu</h2>
        </div>
        <p className="text-sm text-[#7B7068] italic">Chưa có thông tin menu.</p>
      </div>
    );
  }

  const items = grouped[activeTab] || [];

  return (
    <div id="menu-section">
      {/* Header */}
      <div className="flex items-center gap-2 mb-5">
        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2C1810" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <rect x="3" y="3" width="18" height="18" rx="2" />
          <line x1="7" y1="8"  x2="17" y2="8"  />
          <line x1="7" y1="12" x2="17" y2="12" />
          <line x1="7" y1="16" x2="13" y2="16" />
        </svg>
        <h2 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-[#2C1810]">Menu</h2>
      </div>

      {/* Category tabs */}
      <div className="flex gap-2 mb-5 overflow-x-auto pb-1 scrollbar-none">
        {tabs.map((tab) => (
          <button
            key={tab}
            onClick={() => setActiveTab(tab)}
            className={`px-3 py-1 rounded-full text-xs font-bold border-2 transition-colors flex-shrink-0 ${
              activeTab === tab
                ? 'bg-[#F5A623] border-[#F5A623] text-white'
                : 'bg-white border-[#E0D3C8] text-[#4A3728] hover:border-[#F5A623] hover:text-[#F5A623]'
            }`}
          >
            {tab.toUpperCase()}
          </button>
        ))}
      </div>

      <hr className="border-[#F0E8DF] mb-4" />

      {/* Table */}
      <table className="w-full text-sm">
        <tbody>
          {items.map((item, idx) => (
            <tr key={item.id ?? idx} className="border-b border-[#F5EDD8] last:border-0">
              {/* Tên + mô tả */}
              <td className="py-2.5 pr-4">
                <span className="font-semibold text-[#F5A623]">{item.name}</span>
                {item.description && (
                  <p className="text-xs text-[#7B7068] mt-0.5">{item.description}</p>
                )}
              </td>
              {/* Giá */}
              <td className="py-2.5 text-right text-[#2C1810] font-medium whitespace-nowrap">
                {fmt(item.price)}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default MenuSection;
