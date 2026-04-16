/** Menu section for Detail page – matches Detail.png mockup exactly */

const MENU_MOCK = {
  sections: [
    {
      title: 'MÓN CƠM',
      columns: ['Cốt lết', 'Sườn cây'],
      items: [
        { name: 'Cơm sườn', prices: [49000, 64000] },
        { name: 'Cơm sườn bì', prices: [59000, 74000] },
        { name: 'Cơm sườn chả', prices: [59000, 74000] },
        { name: 'Cơm sườn bì chả', prices: [69000, 84000], highlight: true },
        { name: 'Cơm tấm bì', prices: [29000, null] },
        { name: 'Cơm tấm chả', prices: [34000, null] },
        { name: 'Cơm tấm bì chả', prices: [34000, null] },
        { name: 'Cơm tấm trứng ốp la', prices: [19000, null] },
      ],
    },
    {
      title: 'GIẢI KHÁT',
      items: [
        { name: 'Pepsi', price: 15000 },
        { name: 'Sting', price: 15000 },
        { name: 'Mirinda kem', price: 15000 },
        { name: 'Nước suối', price: 10000 },
      ],
    },
    {
      title: 'MÓN THÊM',
      half: true,
      items: [
        { name: 'Bì thịt', price: 18000 },
        { name: 'Chả hấp', price: 18000 },
        { name: 'Trứng ốp la', price: 10000 },
        { name: 'Lạp xưởng tươi', price: 12000 },
        { name: 'Sườn cốt lết thêm', price: 44000, accent: true },
        { name: 'Sườn cây thêm', price: 59000, accent: true },
        { name: 'Tóp mỡ', price: 10000, accent: true },
        { name: 'Cơm thêm', price: 5000, accent: true },
      ],
    },
    {
      title: 'MÓN CANH',
      items: [
        { name: 'Canh chua', price: 10000 },
        { name: 'Canh rong biển', price: 15000 },
      ],
    },
  ],
  combo: {
    name: 'COMBO SƯỜN CỐT LẾT',
    price: 79000,
    description: 'Cơm tấm, Sườn cốt lết, Bì, Chả, Trứng ốp la, Canh chua, Nước ngọt',
  },
};

const formatVND = (n) => n?.toLocaleString('vi-VN') + ' đồng';

const MenuSection = ({ menuData = MENU_MOCK }) => {
  const { sections, combo } = menuData;

  return (
    <div className="mt-6" id="menu-section">
      {/* Menu icon + label */}
      <div className="flex items-center gap-2 mb-5">
        <span className="text-2xl">🍱</span>
        <h2 className="font-[Baloo_2,sans-serif] text-lg font-bold text-[#2C1810]">Menu</h2>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {sections.map((section) => (
          <div key={section.title}>
            <h3 className="font-extrabold text-sm text-[#2C1810] tracking-wider mb-3 uppercase">
              {section.title}
            </h3>

            {/* Table with optional columns */}
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                {section.columns && (
                  <thead>
                    <tr>
                      <th className="text-left text-[#7B7068] font-medium pb-2 w-1/2" />
                      {section.columns.map((col) => (
                        <th key={col} className="text-[#E8623A] font-bold pb-2 text-right">{col}</th>
                      ))}
                    </tr>
                  </thead>
                )}
                <tbody>
                  {section.items.map((item) => (
                    <tr
                      key={item.name}
                      className={`border-b border-[#F5EDD8] last:border-0 ${item.highlight ? 'font-bold' : ''}`}
                    >
                      <td className={`py-2 pr-2 ${item.accent ? 'text-[#E8623A] font-semibold' : 'text-[#4A3728]'}`}>
                        {item.highlight && <span className="mr-1">🏆</span>}
                        {item.name}
                      </td>
                      {section.columns ? (
                        item.prices.map((p, i) => (
                          <td key={i} className="py-2 text-right text-[#2C1810] font-semibold">
                            {p ? formatVND(p) : '—'}
                          </td>
                        ))
                      ) : (
                        <td className="py-2 text-right text-[#2C1810] font-semibold">
                          {item.price ? formatVND(item.price) : ''}
                        </td>
                      )}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ))}
      </div>

      {/* Combo section */}
      {combo && (
        <div className="mt-8 pt-6 border-t-2 border-dashed border-[#F5EDD8]">
          <div className="flex items-center gap-2 mb-2">
            <span className="text-2xl">🎁</span>
            <span className="bg-[#FFF8EE] border border-[#F5EDD8] px-4 py-1 rounded-full font-extrabold text-[#4A3728] tracking-widest text-sm">
              COMBO
            </span>
          </div>
          <h3 className="font-[Baloo_2,sans-serif] font-extrabold text-[#E8623A] text-lg tracking-widest uppercase">
            {combo.name}{' '}
            <span className="text-3xl text-[#2C1810]">{combo.price?.toLocaleString('vi-VN')} đồng</span>
          </h3>
          <p className="text-sm text-[#7B7068] mt-1">{combo.description}</p>
        </div>
      )}
    </div>
  );
};

export default MenuSection;
