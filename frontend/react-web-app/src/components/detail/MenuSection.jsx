/** Menu section for Detail page – tabbed UI matching reference design */
import { useState } from 'react';

const MENU_DATA = {
  tabs: ['MÓN CƠM', 'GIẢI KHÁT', 'MÓN CANH', 'MÓN THÊM', 'COMBO'],
  sections: {
    'MÓN CƠM': {
      columns: ['Cốt lết', 'Sườn cây'],
      items: [
        { name: 'Cơm sườn',         prices: [49000, 64000] },
        { name: 'Cơm sườn bì',      prices: [59000, 74000] },
        { name: 'Cơm sườn chả',     prices: [59000, 74000] },
        { name: 'Cơm sườn bì chả',  prices: [69000, 84000], highlight: true },
        { name: 'Cơm tấm bì',       prices: [29000, null] },
        { name: 'Cơm tấm chả',      prices: [34000, null] },
        { name: 'Cơm tấm bì chả',   prices: [34000, null] },
        { name: 'Cơm tấm trứng ốp la', prices: [19000, null] },
      ],
    },
    'GIẢI KHÁT': {
      items: [
        { name: 'Pepsi',        price: 15000 },
        { name: 'Sting',        price: 15000 },
        { name: 'Mirinda kem',  price: 15000 },
        { name: 'Nước suối',    price: 10000 },
      ],
    },
    'MÓN CANH': {
      items: [
        { name: 'Canh chua',      price: 10000 },
        { name: 'Canh rong biển', price: 15000 },
      ],
    },
    'MÓN THÊM': {
      items: [
        { name: 'Bì thịt',             price: 18000 },
        { name: 'Chả hấp',             price: 18000 },
        { name: 'Trứng ốp la',         price: 10000 },
        { name: 'Lạp xưởng tươi',      price: 12000 },
        { name: 'Sườn cốt lết thêm',   price: 44000 },
        { name: 'Sườn cây thêm',       price: 59000 },
        { name: 'Tóp mỡ',              price: 10000 },
        { name: 'Cơm thêm',            price: 5000  },
      ],
    },
    'COMBO': {
      items: [
        {
          name: 'COMBO SƯỜN CỐT LẾT',
          price: 79000,
          desc: 'Cơm tấm, Sườn cốt lết, Bì, Chả, Trứng ốp la, Canh chua, Nước ngọt',
          highlight: true,
        },
      ],
    },
  },
};

const fmt = (n) => n != null ? n.toLocaleString('vi-VN') + ' đồng' : '';

const MenuSection = ({ menuData = MENU_DATA }) => {
  const { tabs, sections } = menuData;
  const [activeTab, setActiveTab] = useState(tabs[0]);
  const section = sections[activeTab];

  return (
    <div id="menu-section">
      {/* ── Header ── */}
      <div className="flex items-center gap-2 mb-5">
        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#2C1810" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <rect x="3" y="3" width="18" height="18" rx="2" />
          <line x1="7" y1="8"  x2="17" y2="8"  />
          <line x1="7" y1="12" x2="17" y2="12" />
          <line x1="7" y1="16" x2="13" y2="16" />
        </svg>
        <h2 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-[#2C1810]">Menu</h2>
      </div>

      {/* ── Category tabs ── */}
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
            {tab}
          </button>
        ))}
      </div>

      {/* ── Divider ── */}
      <hr className="border-[#F0E8DF] mb-4" />

      {/* ── Table content ── */}
      {section && (
        <table className="w-full text-sm">
          {/* Column headers (only when multi-price) */}
          {section.columns && (
            <thead>
              <tr>
                <th className="text-left pb-3 w-1/2" />
                {section.columns.map((col) => (
                  <th key={col} className="text-right pb-3 font-bold text-[#F5A623] pr-2">
                    {col}
                  </th>
                ))}
              </tr>
            </thead>
          )}

          <tbody>
            {section.items.map((item, idx) => {
              const isMulti = !!section.columns;
              return (
                <tr
                  key={idx}
                  className={`border-b border-[#F5EDD8] last:border-0 ${
                    item.highlight ? 'bg-[#FFF8EE]' : ''
                  }`}
                >
                  {/* Item name */}
                  <td className="py-2.5 pr-4">
                    <div className={`flex items-center gap-1.5 ${item.highlight ? 'border-l-4 border-[#F5A623] pl-2' : ''}`}>
                      {item.highlight && <span>🎉</span>}
                      <span className="font-semibold text-[#F5A623]">{item.name}</span>
                    </div>
                    {item.desc && (
                      <p className="text-xs text-[#7B7068] mt-0.5 pl-2">{item.desc}</p>
                    )}
                  </td>

                  {/* Prices */}
                  {isMulti ? (
                    item.prices.map((p, i) => (
                      <td key={i} className="py-2.5 text-right text-[#2C1810] font-medium pr-2 whitespace-nowrap">
                        {p != null ? fmt(p) : ''}
                      </td>
                    ))
                  ) : (
                    <td className="py-2.5 text-right text-[#2C1810] font-medium whitespace-nowrap">
                      {fmt(item.price)}
                    </td>
                  )}
                </tr>
              );
            })}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default MenuSection;
