import { useState, useEffect, useRef } from 'react';
import { Link, useNavigate } from 'react-router-dom';

/* ─── Intersection Observer hook ─── */
const useInView = (threshold = 0.15) => {
  const ref = useRef(null);
  const [visible, setVisible] = useState(false);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const obs = new IntersectionObserver(([e]) => {
      if (e.isIntersecting) { setVisible(true); obs.disconnect(); }
    }, { threshold });
    obs.observe(el);
    return () => obs.disconnect();
  }, [threshold]);
  return [ref, visible];
};

const FadeSection = ({ children, className = '', delay = 0 }) => {
  const [ref, visible] = useInView(0.1);
  return (
    <div
      ref={ref}
      className={`transition-all duration-700 ease-out ${visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'} ${className}`}
      style={{ transitionDelay: `${delay}ms` }}
    >{children}</div>
  );
};

const CATEGORIES = [
  { id: 'review', label: 'Đánh giá', icon: '⭐', desc: 'Chia sẻ trải nghiệm ẩm thực' },
  { id: 'recipe', label: 'Công thức', icon: '📖', desc: 'Hướng dẫn nấu ăn' },
  { id: 'tips', label: 'Mẹo vặt', icon: '💡', desc: 'Mẹo hay về ẩm thực' },
  { id: 'events', label: 'Sự kiện', icon: '🎉', desc: 'Sự kiện ẩm thực' },
  { id: 'question', label: 'Hỏi đáp', icon: '❓', desc: 'Đặt câu hỏi cho cộng đồng' },
];

const POPULAR_TAGS = [
  '#PhởHàNội', '#BúnBòHuế', '#BánhMì', '#CơmTấm', '#ĂnVặtSàiGòn',
  '#QuánCaFe', '#FoodTour', '#ẨmThựcĐườngPhố', '#MonChay', '#NấuĂnTạiNhà',
  '#ReviewQuán', '#TPHCM', '#HàNội', '#ĐàNẵng', '#StreetFood',
];

const COMMUNITY_RULES = [
  { icon: '✅', text: 'Nội dung liên quan đến ẩm thực Việt Nam' },
  { icon: '🙏', text: 'Tôn trọng mọi thành viên trong cộng đồng' },
  { icon: '📷', text: 'Đính kèm hình ảnh chất lượng tốt (nếu có)' },
  { icon: '🏷️', text: 'Gắn tag phù hợp để dễ tìm kiếm' },
  { icon: '🚫', text: 'Không spam, quảng cáo hoặc nội dung không phù hợp' },
  { icon: '✍️', text: 'Viết chính tả đúng, nội dung rõ ràng' },
];

const ForumPostPage = () => {
  const navigate = useNavigate();
  const [form, setForm] = useState({
    title: '',
    category: '',
    content: '',
    tags: [],
  });
  const [tagInput, setTagInput] = useState('');
  const [preview, setPreview] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [showSuccess, setShowSuccess] = useState(false);
  const [charCount, setCharCount] = useState(0);
  const textareaRef = useRef(null);

  const handleChange = (field, value) => {
    setForm(prev => ({ ...prev, [field]: value }));
    if (field === 'content') setCharCount(value.length);
  };

  const addTag = (tag) => {
    const normalizedTag = tag.startsWith('#') ? tag : `#${tag}`;
    if (normalizedTag.length > 1 && !form.tags.includes(normalizedTag) && form.tags.length < 5) {
      setForm(prev => ({ ...prev, tags: [...prev.tags, normalizedTag] }));
    }
    setTagInput('');
  };

  const removeTag = (tag) => {
    setForm(prev => ({ ...prev, tags: prev.tags.filter(t => t !== tag) }));
  };

  const handleTagKeyDown = (e) => {
    if ((e.key === 'Enter' || e.key === ',') && tagInput.trim()) {
      e.preventDefault();
      addTag(tagInput.trim().replace(',', ''));
    }
    if (e.key === 'Backspace' && !tagInput && form.tags.length > 0) {
      removeTag(form.tags[form.tags.length - 1]);
    }
  };

  const isValid = form.title.trim().length >= 10 && form.category && form.content.trim().length >= 30;

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!isValid) return;
    setSubmitting(true);
    await new Promise(r => setTimeout(r, 2000));
    setSubmitting(false);
    setShowSuccess(true);
    setTimeout(() => navigate('/forum'), 2500);
  };

  const inputClass = `
    w-full px-4 py-3 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8]
    text-sm text-[#2C1810] placeholder:text-[#C8BEB5]
    focus:outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15
    transition-all duration-300 hover:border-[#E8623A]/30
  `;

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Header bar */}
      <FadeSection>
        <div className="bg-gradient-to-r from-[#2C1810] via-[#4A3728] to-[#2C1810] text-white py-10 sm:py-14 relative overflow-hidden">
          <div className="absolute -top-20 -right-20 w-60 h-60 bg-[#E8623A]/15 rounded-full blur-[80px] animate-pulse" />
          <div className="absolute -bottom-16 -left-16 w-48 h-48 bg-[#F5A623]/10 rounded-full blur-[60px] animate-pulse" style={{ animationDelay: '1s' }} />

          <div className="relative max-w-[1200px] mx-auto px-6">
            <Link to="/forum" className="inline-flex items-center gap-2 text-white/60 hover:text-white text-sm mb-4 transition-colors">
              ← Quay lại diễn đàn
            </Link>
            <h1 className="font-[Baloo_2,sans-serif] text-2xl sm:text-3xl lg:text-4xl font-extrabold bg-gradient-to-r from-white via-[#F4845A] to-[#F5A623] bg-clip-text text-transparent">
              ✍️ Tạo Bài Viết Mới
            </h1>
            <p className="text-white/55 text-sm mt-2">Chia sẻ trải nghiệm ẩm thực của bạn với cộng đồng</p>
          </div>
        </div>
      </FadeSection>

      {/* Success overlay */}
      {showSuccess && (
        <div className="fixed inset-0 z-[200] bg-black/50 backdrop-blur-sm flex items-center justify-center animate-fade-in">
          <div className="bg-white rounded-3xl p-8 max-w-sm w-full mx-4 text-center shadow-2xl animate-scale-in">
            <span className="text-6xl block mb-4">🎉</span>
            <h2 className="font-[Baloo_2,sans-serif] text-xl font-extrabold text-[#2C1810] mb-2">Đăng bài thành công!</h2>
            <p className="text-sm text-[#7B7068] mb-4">Bài viết của bạn đã được đăng lên diễn đàn</p>
            <div className="w-12 h-1 bg-gradient-to-r from-[#E8623A] to-[#F5A623] mx-auto rounded-full animate-pulse" />
          </div>
        </div>
      )}

      <div className="max-w-[1200px] mx-auto px-6 py-8">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main form */}
          <div className="flex-1 min-w-0">
            <form onSubmit={handleSubmit}>
              {/* Title */}
              <FadeSection>
                <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                  <label className="block text-xs font-bold uppercase tracking-wider text-[#7B7068] mb-2">
                    📌 Tiêu đề bài viết *
                  </label>
                  <input
                    type="text"
                    value={form.title}
                    onChange={e => handleChange('title', e.target.value)}
                    placeholder="VD: Top 5 quán phở ngon nhất Sài Gòn..."
                    maxLength={120}
                    className={`${inputClass} text-lg font-semibold`}
                  />
                  <div className="flex items-center justify-between mt-2">
                    <span className="text-[0.65rem] text-[#C8BEB5]">Tối thiểu 10 ký tự</span>
                    <span className={`text-[0.65rem] font-medium ${form.title.length < 10 ? 'text-[#C8BEB5]' : 'text-emerald-500'}`}>
                      {form.title.length}/120
                    </span>
                  </div>
                </div>
              </FadeSection>

              {/* Category */}
              <FadeSection delay={80}>
                <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                  <label className="block text-xs font-bold uppercase tracking-wider text-[#7B7068] mb-3">
                    📂 Chọn danh mục *
                  </label>
                  <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-3">
                    {CATEGORIES.map(cat => (
                      <button
                        key={cat.id}
                        type="button"
                        onClick={() => handleChange('category', cat.id)}
                        className={`
                          relative flex flex-col items-center gap-1.5 p-4 rounded-xl border-2 transition-all duration-300
                          ${form.category === cat.id
                            ? 'border-[#E8623A] bg-[#E8623A]/5 shadow-[0_4px_14px_rgba(232,98,58,0.15)] scale-[1.02]'
                            : 'border-[#F5EDD8] bg-white hover:border-[#E8623A]/30 hover:shadow-sm'}
                        `}
                      >
                        <span className="text-2xl">{cat.icon}</span>
                        <span className={`text-xs font-bold ${form.category === cat.id ? 'text-[#E8623A]' : 'text-[#2C1810]'}`}>
                          {cat.label}
                        </span>
                        <span className="text-[0.6rem] text-[#7B7068] text-center leading-tight">{cat.desc}</span>
                        {form.category === cat.id && (
                          <span className="absolute -top-2 -right-2 w-5 h-5 bg-[#E8623A] rounded-full text-white text-[0.6rem] flex items-center justify-center shadow-sm animate-scale-in">
                            ✓
                          </span>
                        )}
                      </button>
                    ))}
                  </div>
                </div>
              </FadeSection>

              {/* Content */}
              <FadeSection delay={160}>
                <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                  <div className="flex items-center justify-between mb-3">
                    <label className="text-xs font-bold uppercase tracking-wider text-[#7B7068]">
                      📝 Nội dung *
                    </label>
                    <div className="flex items-center gap-2">
                      <button
                        type="button"
                        onClick={() => setPreview(false)}
                        className={`px-3 py-1 rounded-lg text-xs font-semibold transition-all duration-300 ${!preview ? 'bg-[#E8623A] text-white' : 'text-[#7B7068] hover:bg-[#FFF8EE]'}`}
                      >
                        ✏️ Viết
                      </button>
                      <button
                        type="button"
                        onClick={() => setPreview(true)}
                        className={`px-3 py-1 rounded-lg text-xs font-semibold transition-all duration-300 ${preview ? 'bg-[#E8623A] text-white' : 'text-[#7B7068] hover:bg-[#FFF8EE]'}`}
                      >
                        👁 Xem trước
                      </button>
                    </div>
                  </div>

                  {/* Toolbar */}
                  {!preview && (
                    <div className="flex items-center gap-1 mb-3 p-2 bg-[#FFF8EE] rounded-xl border border-[#F5EDD8]">
                      {[
                        { label: 'B', title: 'In đậm', cls: 'font-extrabold' },
                        { label: 'I', title: 'In nghiêng', cls: 'italic' },
                        { label: 'H', title: 'Tiêu đề', cls: 'font-bold' },
                        { label: '—', title: 'Đường kẻ', cls: '' },
                        { label: '📷', title: 'Thêm ảnh', cls: '' },
                        { label: '🔗', title: 'Thêm link', cls: '' },
                        { label: '📋', title: 'Danh sách', cls: '' },
                      ].map(btn => (
                        <button
                          key={btn.label}
                          type="button"
                          title={btn.title}
                          className={`w-8 h-8 rounded-lg flex items-center justify-center text-sm text-[#4A3728] hover:bg-[#E8623A]/10 hover:text-[#E8623A] transition-all ${btn.cls}`}
                        >
                          {btn.label}
                        </button>
                      ))}
                    </div>
                  )}

                  {preview ? (
                    <div className="min-h-[300px] p-4 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8]">
                      {form.content ? (
                        <div className="text-sm text-[#4A3728] leading-relaxed whitespace-pre-line">{form.content}</div>
                      ) : (
                        <p className="text-sm text-[#C8BEB5] italic">Chưa có nội dung để xem trước...</p>
                      )}
                    </div>
                  ) : (
                    <textarea
                      ref={textareaRef}
                      value={form.content}
                      onChange={e => handleChange('content', e.target.value)}
                      placeholder="Chia sẻ trải nghiệm ẩm thực của bạn... &#10;&#10;Mẹo: Sử dụng dấu xuống dòng để tạo đoạn văn, mô tả chi tiết hương vị, không gian, giá cả..."
                      rows={14}
                      className={`${inputClass} resize-none min-h-[300px]`}
                    />
                  )}

                  <div className="flex items-center justify-between mt-2">
                    <span className="text-[0.65rem] text-[#C8BEB5]">Tối thiểu 30 ký tự</span>
                    <span className={`text-[0.65rem] font-medium ${charCount < 30 ? 'text-[#C8BEB5]' : 'text-emerald-500'}`}>
                      {charCount.toLocaleString()} ký tự
                    </span>
                  </div>
                </div>
              </FadeSection>

              {/* Tags */}
              <FadeSection delay={240}>
                <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                  <label className="block text-xs font-bold uppercase tracking-wider text-[#7B7068] mb-2">
                    🏷️ Tags (tối đa 5)
                  </label>

                  <div className="flex flex-wrap items-center gap-2 p-3 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8] focus-within:border-[#E8623A] focus-within:ring-2 focus-within:ring-[#E8623A]/15 transition-all min-h-[48px]">
                    {form.tags.map(tag => (
                      <span key={tag} className="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-[#E8623A] text-white text-xs font-semibold animate-scale-in">
                        {tag}
                        <button type="button" onClick={() => removeTag(tag)} className="hover:bg-white/20 rounded-full w-4 h-4 flex items-center justify-center text-[0.6rem] transition-colors">
                          ✕
                        </button>
                      </span>
                    ))}
                    {form.tags.length < 5 && (
                      <input
                        type="text"
                        value={tagInput}
                        onChange={e => setTagInput(e.target.value)}
                        onKeyDown={handleTagKeyDown}
                        placeholder={form.tags.length === 0 ? 'Nhập tag rồi nhấn Enter...' : 'Thêm tag...'}
                        className="flex-1 min-w-[120px] bg-transparent outline-none text-sm text-[#2C1810] placeholder:text-[#C8BEB5]"
                      />
                    )}
                  </div>

                  {/* Suggested tags */}
                  <div className="mt-3">
                    <span className="text-[0.65rem] text-[#7B7068] font-medium">Gợi ý:</span>
                    <div className="flex flex-wrap gap-1.5 mt-1.5">
                      {POPULAR_TAGS.filter(t => !form.tags.includes(t)).slice(0, 8).map(tag => (
                        <button
                          key={tag}
                          type="button"
                          onClick={() => addTag(tag)}
                          className="px-2.5 py-1 rounded-full bg-[#FFF8EE] text-[#E8623A] text-[0.65rem] font-semibold border border-[#F5EDD8] hover:bg-[#E8623A] hover:text-white transition-all duration-300"
                        >
                          + {tag}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
              </FadeSection>

              {/* Submit */}
              <FadeSection delay={320}>
                <div className="flex items-center gap-4">
                  <button
                    type="submit"
                    disabled={!isValid || submitting}
                    className={`
                      flex-1 sm:flex-none px-10 py-3.5 rounded-full text-sm font-bold text-white
                      bg-gradient-to-r from-[#E8623A] to-[#C04D2B]
                      shadow-[0_4px_14px_rgba(232,98,58,0.3)] hover:shadow-[0_8px_24px_rgba(232,98,58,0.4)]
                      hover:-translate-y-0.5 active:translate-y-0
                      transition-all duration-300
                      disabled:opacity-40 disabled:cursor-not-allowed disabled:hover:translate-y-0 disabled:hover:shadow-none
                    `}
                  >
                    {submitting ? (
                      <span className="flex items-center gap-2">
                        <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                        Đang đăng...
                      </span>
                    ) : (
                      '📤 Đăng bài viết'
                    )}
                  </button>
                  <Link
                    to="/forum"
                    className="px-6 py-3.5 rounded-full text-sm font-semibold text-[#7B7068] bg-white border border-[#F5EDD8] hover:border-[#E8623A]/30 hover:text-[#E8623A] transition-all duration-300"
                  >
                    Hủy bỏ
                  </Link>
                </div>

                {!isValid && (form.title || form.content) && (
                  <div className="mt-4 p-3 rounded-xl bg-amber-50 border border-amber-200 text-amber-700 text-xs font-medium flex items-center gap-2">
                    ⚠️ Vui lòng điền đầy đủ: tiêu đề (≥10 ký tự), danh mục, nội dung (≥30 ký tự)
                  </div>
                )}
              </FadeSection>
            </form>
          </div>

          {/* Sidebar */}
          <aside className="w-full lg:w-80 flex-shrink-0 space-y-6">
            {/* Tips */}
            <FadeSection delay={150}>
              <div className="bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] rounded-2xl border border-[#F5EDD8] p-5">
                <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] mb-3 flex items-center gap-2">
                  💡 Mẹo viết bài hay
                </h3>
                <ul className="space-y-2.5 text-xs text-[#4A3728]">
                  <li className="flex items-start gap-2">
                    <span className="text-[#E8623A] mt-0.5 flex-shrink-0">✦</span>
                    <span>Đặt tiêu đề hấp dẫn, cụ thể và gây tò mò</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-[#E8623A] mt-0.5 flex-shrink-0">✦</span>
                    <span>Chia sẻ chi tiết: địa chỉ, giá cả, hương vị</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-[#E8623A] mt-0.5 flex-shrink-0">✦</span>
                    <span>Thêm hình ảnh thực tế để tăng tính thuyết phục</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-[#E8623A] mt-0.5 flex-shrink-0">✦</span>
                    <span>Sử dụng đoạn văn ngắn, dễ đọc</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-[#E8623A] mt-0.5 flex-shrink-0">✦</span>
                    <span>Gắn tag phù hợp để nhiều người tìm thấy hơn</span>
                  </li>
                </ul>
              </div>
            </FadeSection>

            {/* Community rules */}
            <FadeSection delay={250}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
                <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] mb-3 flex items-center gap-2">
                  📋 Quy định đăng bài
                </h3>
                <ul className="space-y-2.5">
                  {COMMUNITY_RULES.map((rule, i) => (
                    <li key={i} className="flex items-start gap-2.5 text-xs text-[#4A3728]">
                      <span className="flex-shrink-0">{rule.icon}</span>
                      {rule.text}
                    </li>
                  ))}
                </ul>
              </div>
            </FadeSection>

            {/* Preview card */}
            <FadeSection delay={350}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
                <h3 className="font-[Baloo_2,sans-serif] font-bold text-[#2C1810] mb-3 flex items-center gap-2">
                  👁 Xem trước bài viết
                </h3>
                <div className="bg-[#FFF8EE] rounded-xl p-4 border border-[#F5EDD8]">
                  {form.title ? (
                    <>
                      {form.category && (
                        <span className="inline-block px-2 py-0.5 rounded-full text-[0.6rem] font-semibold bg-[#E8623A]/10 text-[#E8623A] mb-2">
                          {CATEGORIES.find(c => c.id === form.category)?.icon} {CATEGORIES.find(c => c.id === form.category)?.label}
                        </span>
                      )}
                      <h4 className="text-sm font-bold text-[#2C1810] mb-1 line-clamp-2">{form.title}</h4>
                      <p className="text-[0.65rem] text-[#7B7068] line-clamp-2">{form.content || 'Nội dung bài viết...'}</p>
                      {form.tags.length > 0 && (
                        <div className="flex flex-wrap gap-1 mt-2">
                          {form.tags.map(tag => (
                            <span key={tag} className="text-[0.6rem] text-[#E8623A] bg-white px-1.5 py-0.5 rounded-md">{tag}</span>
                          ))}
                        </div>
                      )}
                    </>
                  ) : (
                    <p className="text-xs text-[#C8BEB5] italic text-center py-4">
                      Bắt đầu viết để xem trước...
                    </p>
                  )}
                </div>
              </div>
            </FadeSection>
          </aside>
        </div>
      </div>
    </div>
  );
};

export default ForumPostPage;
