import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { getRecommendationsApi } from '../../api/restaurantApi';

// ─── Constants ────────────────────────────────────────────────────
const MOODS = [
  { value: 'happy',     label: 'Vui vẻ',     emoji: '😄' },
  { value: 'romantic',  label: 'Lãng mạn',   emoji: '🥰' },
  { value: 'chill',     label: 'Thư giãn',   emoji: '😌' },
  { value: 'stress',    label: 'Công việc',  emoji: '💼' },
  { value: 'excited',   label: 'Khám phá',   emoji: '🌟' },
  { value: 'family',    label: 'Ấm cúng',    emoji: '🏠' },
];

const FOOD_TYPES = [
  { value: 'Vietnamese', label: 'Việt Nam',   emoji: '🍜' },
  { value: 'BBQ',        label: 'BBQ / Nướng',emoji: '🔥' },
  { value: 'Seafood',    label: 'Hải sản',    emoji: '🦞' },
  { value: 'Japanese',   label: 'Nhật Bản',   emoji: '🍣' },
  { value: 'Korean',     label: 'Hàn Quốc',   emoji: '🥘' },
  { value: 'Western',    label: 'Âu Mỹ',      emoji: '🍔' },
  { value: 'Vegetarian', label: 'Chay',        emoji: '🥗' },
  { value: 'Dessert',    label: 'Tráng miệng', emoji: '🍰' },
];

const DIETARY = [
  { value: 'vegetarian',  label: 'Chay' },
  { value: 'vegan',       label: 'Thuần chay' },
  { value: 'halal',       label: 'Halal' },
  { value: 'gluten-free', label: 'Không gluten' },
  { value: 'none',        label: 'Không hạn chế' },
];

const DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&q=80';

// Helper to determine active preset based on budget amount
const getActivePreset = (b) => {
  if (b < 100000) return 1;
  if (b >= 100000 && b <= 250000) return 2;
  if (b > 250000 && b <= 500000) return 3;
  return 4;
};

// ─── Step indicator ────────────────────────────────────────────────
const StepDot = ({ active, done, label }) => (
  <div className="flex flex-col items-center gap-1">
    <div className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold transition-all duration-300
      ${done ? 'bg-[#E8623A] text-white' : active ? 'bg-[#2C1810] text-white ring-2 ring-[#E8623A] ring-offset-1' : 'bg-[#F5EDD8] text-[#C8BEB5]'}`}>
      {done ? '✓' : label}
    </div>
  </div>
);

// ─── Result Card ───────────────────────────────────────────────────
const ResultCard = ({ r, onClick }) => {
  const info    = r.restaurant_info || {};
  const dish    = r.signature_dish  || {};
  const meta    = r.meta            || {};
  const ai      = r.ai_analysis     || {};
  const contact = info.contact      || {};

  return (
    <div
      onClick={() => onClick(r.id)}
      className="group bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-lg hover:-translate-y-1 transition-all duration-300 cursor-pointer border border-[#F5EDD8]"
      id={`rec-card-${r.id}`}
    >
      <div className="h-[130px] bg-gradient-to-br from-[#3D1A0A] to-[#8B3A1A] relative overflow-hidden">
        <img
          src={info.image_url || DEFAULT_IMAGE}
          alt={info.name}
          className="w-full h-full object-cover opacity-60 group-hover:scale-105 transition-transform duration-500"
        />
        <div className="absolute inset-0 flex flex-col justify-end p-3">
          <span className="text-[0.6rem] text-white/80 font-semibold tracking-widest uppercase mb-0.5">
            {dish.dish_name || 'Món đặc trưng'}
          </span>
          <h3 className="font-bold text-white text-[0.95rem] leading-tight line-clamp-2">{info.name}</h3>
        </div>
        {/* AI score badge */}
        {ai.score > 0 && (
          <div className="absolute top-2 right-2 bg-[#E8623A] text-white text-[0.6rem] font-extrabold px-1.5 py-0.5 rounded-full">
            AI {Math.round(ai.score * 100)}%
          </div>
        )}
      </div>
      <div className="p-3">
        <p className="text-[0.72rem] text-[#8B6F5E] line-clamp-2 mb-2">{ai.reason || dish.description}</p>
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-1.5">
            <span className="text-yellow-400 text-sm">★</span>
            <span className="text-[0.75rem] font-semibold text-[#2C1810]">{meta.rating?.toFixed(1) || '—'}</span>
          </div>
          <span className="text-[0.7rem] text-[#8B6F5E]">{meta.price_range || ''}</span>
          {meta.distance_km > 0 && (
            <span className="text-[0.7rem] text-[#8B6F5E]">{meta.distance_km?.toFixed(1)} km</span>
          )}
        </div>
        {contact.address && (
          <p className="text-[0.68rem] text-[#C8BEB5] mt-1.5 truncate">{contact.address}</p>
        )}
      </div>
    </div>
  );
};

// ─── Main Modal ────────────────────────────────────────────────────
const AIRecommendModal = ({ onClose }) => {
  const navigate = useNavigate();
  const { user } = useAuth();

  const [step, setStep]         = useState(1); // 1=mood, 2=food, 3=options, 4=results
  const [loading, setLoading]   = useState(false);
  const [error, setError]       = useState('');
  const [results, setResults]   = useState([]);

  const [form, setForm] = useState({
    mood:       '',
    food_types: [],
    budget:     180000, // Mặc định ở giữa mức 100k-250k (được đổi sang VNĐ thực tế)
    people:     2,
    dietary:    [],
    radius:     5, // Default 5km
  });

  // Close on Escape
  useEffect(() => {
    const handler = (e) => { if (e.key === 'Escape') onClose(); };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, [onClose]);

  // Prevent body scroll
  useEffect(() => {
    document.body.style.overflow = 'hidden';
    return () => { document.body.style.overflow = ''; };
  }, []);

  const toggleArr = (key, val) => {
    setForm(prev => {
      const arr = prev[key];
      return { ...prev, [key]: arr.includes(val) ? arr.filter(v => v !== val) : [...arr, val] };
    });
  };

  const handleSubmit = useCallback(async () => {
    setLoading(true);
    setError('');
    try {
      // Try to get user location
      let lat = 10.7769, lng = 106.7009; // default: Quận 1, TP.HCM
      try {
        const pos = await new Promise((res, rej) =>
          navigator.geolocation.getCurrentPosition(res, rej, { timeout: 3000 })
        );
        lat = pos.coords.latitude;
        lng = pos.coords.longitude;
      } catch (_) { /* dùng default */ }

      const payload = {
        user_id: user?.id || 0,
        location: { lat, lng, radius_km: form.radius },
        preferences: {
          budget:     form.budget,
          people:     form.people,
          dietary:    form.dietary.length ? form.dietary : ['none'],
          food_types: form.food_types.length ? form.food_types : [],
          mood:       form.mood || 'chill',
          weather:    'sunny',
        },
      };

      const res = await getRecommendationsApi(payload);
      if (res.success) {
        setResults(res.data?.restaurants || []);
        setStep(4);
      } else {
        setError(res.message || 'Có lỗi xảy ra, vui lòng thử lại.');
      }
    } catch (err) {
      setError('Không thể kết nối AI engine. Vui lòng thử lại sau.');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, [form, user]);

  const goToDetail = (id) => {
    onClose();
    navigate(`/detail/${id}`);
  };

  // ── Render steps ────────────────────────────────────────────────
  const renderStep1 = () => (
    <div className="animate-fade-up">
      <h3 className="text-[1.05rem] font-bold text-[#2C1810] mb-1">Hôm nay bạn đang cảm thấy thế nào? 😊</h3>
      <p className="text-[0.8rem] text-[#8B6F5E] mb-5">Chọn mood để AI hiểu bạn hơn</p>
      <div className="grid grid-cols-3 gap-2.5">
        {MOODS.map(m => (
          <button
            key={m.value}
            id={`mood-btn-${m.value}`}
            onClick={() => setForm(p => ({ ...p, mood: m.value }))}
            className={`p-3 rounded-xl border-2 transition-all duration-200 flex flex-col items-center gap-1.5
              ${form.mood === m.value
                ? 'border-[#E8623A] bg-[#FFF3EE] shadow-sm scale-[1.03]'
                : 'border-[#F5EDD8] bg-white hover:border-[#E8623A]/40 hover:bg-[#FFF9F5]'}`}
          >
            <span className="text-2xl">{m.emoji}</span>
            <span className="text-[0.75rem] font-semibold text-[#2C1810]">{m.label}</span>
          </button>
        ))}
      </div>
    </div>
  );

  const renderStep2 = () => (
    <div className="animate-fade-up">
      <h3 className="text-[1.05rem] font-bold text-[#2C1810] mb-1">Bạn thích ăn gì? 🍽️</h3>
      <p className="text-[0.8rem] text-[#8B6F5E] mb-5">Chọn một hoặc nhiều loại món</p>
      <div className="grid grid-cols-4 gap-2">
        {FOOD_TYPES.map(f => (
          <button
            key={f.value}
            id={`food-btn-${f.value}`}
            onClick={() => toggleArr('food_types', f.value)}
            className={`p-2.5 rounded-xl border-2 transition-all duration-200 flex flex-col items-center gap-1
              ${form.food_types.includes(f.value)
                ? 'border-[#E8623A] bg-[#FFF3EE] scale-[1.04]'
                : 'border-[#F5EDD8] bg-white hover:border-[#E8623A]/40'}`}
          >
            <span className="text-xl">{f.emoji}</span>
            <span className="text-[0.68rem] font-medium text-[#2C1810] text-center leading-tight">{f.label}</span>
          </button>
        ))}
      </div>
    </div>
  );

  const renderStep3 = () => (
    <div className="animate-fade-up space-y-5">
      {/* Budget */}
      <div>
        <div className="flex justify-between items-center mb-2">
          <h3 className="text-[0.95rem] font-bold text-[#2C1810]">💰 Ngân sách mỗi người</h3>
          <span className="text-sm font-extrabold text-[#E8623A] bg-[#FFF3EE] border border-[#F5EDD8] rounded-full px-3.5 py-0.5 shadow-sm">
            {form.budget.toLocaleString('vi-VN')} đ
          </span>
        </div>

        {/* Thanh trượt ngân sách thông minh (Budget Slider) */}
        <div className="px-1 py-3 mb-4">
          <input
            type="range"
            min={20000}
            max={1000000}
            step={10000}
            value={form.budget}
            onChange={(e) => setForm(p => ({ ...p, budget: Number(e.target.value) }))}
            className="w-full h-1.5 bg-[#F5EDD8] rounded-full appearance-none outline-none cursor-pointer accent-[#E8623A]"
          />
          <div className="flex justify-between text-[0.68rem] text-[#7B7068] mt-1.5">
            <span>20k đ</span>
            <span>200k đ</span>
            <span>400k đ</span>
            <span>600k đ</span>
            <span>800k đ</span>
            <span>1.0M đ</span>
          </div>
        </div>

        {/* Thẻ Preset chọn nhanh ngân sách */}
        <div className="grid grid-cols-4 gap-2">
          {[
            { value: 80000,   presetId: 1, label: 'Dưới 100k', desc: 'Bình dân' },
            { value: 180000,  presetId: 2, label: '100k–250k', desc: 'Trung bình' },
            { value: 350000,  presetId: 3, label: '250k–500k', desc: 'Khá' },
            { value: 750000,  presetId: 4, label: 'Trên 500k', desc: 'Cao cấp' },
          ].map(b => {
            const activePreset = getActivePreset(form.budget);
            const isActive = activePreset === b.presetId;
            return (
              <button
                key={b.presetId}
                id={`budget-btn-${b.presetId}`}
                onClick={() => setForm(p => ({ ...p, budget: b.value }))}
                className={`p-2 rounded-xl border-2 text-center transition-all duration-200
                  ${isActive
                    ? 'border-[#E8623A] bg-[#FFF3EE] scale-[1.02] shadow-sm'
                    : 'border-[#F5EDD8] bg-white hover:border-[#E8623A]/40'}`}
              >
                <p className="font-bold text-[0.75rem] text-[#2C1810] leading-snug">{b.label}</p>
                <p className="text-[0.62rem] text-[#8B6F5E]">{b.desc}</p>
              </button>
            );
          })}
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        {/* People */}
        <div>
          <h3 className="text-[0.95rem] font-bold text-[#2C1810] mb-3">👥 Số người ăn</h3>
          <div className="flex items-center gap-2">
            <button
              onClick={() => setForm(p => ({ ...p, people: Math.max(1, p.people - 1) }))}
              className="w-8 h-8 rounded-full border-2 border-[#F5EDD8] bg-white font-bold text-[#2C1810] hover:border-[#E8623A] hover:bg-[#FFF3EE] transition-all flex items-center justify-center"
            >−</button>
            <span className="text-lg font-extrabold text-[#2C1810] w-6 text-center">{form.people}</span>
            <button
              onClick={() => setForm(p => ({ ...p, people: Math.min(20, p.people + 1) }))}
              className="w-8 h-8 rounded-full border-2 border-[#F5EDD8] bg-white font-bold text-[#2C1810] hover:border-[#E8623A] hover:bg-[#FFF3EE] transition-all flex items-center justify-center"
            >+</button>
          </div>
        </div>
        
        {/* Radius */}
        <div>
          <h3 className="text-[0.95rem] font-bold text-[#2C1810] mb-3">📍 Khoảng cách</h3>
          <select 
            value={form.radius} 
            onChange={(e) => setForm(p => ({ ...p, radius: Number(e.target.value) }))}
            className="w-full p-2 rounded-xl border-2 border-[#F5EDD8] outline-none focus:border-[#E8623A] text-[#2C1810] text-[0.85rem] font-medium bg-white"
          >
            <option value={2}>Dưới 2 km</option>
            <option value={5}>Dưới 5 km</option>
            <option value={10}>Dưới 10 km</option>
            <option value={20}>Dưới 20 km</option>
          </select>
        </div>
      </div>

      {/* Dietary */}
      <div>
        <h3 className="text-[0.95rem] font-bold text-[#2C1810] mb-3">🥦 Chế độ ăn</h3>
        <div className="flex flex-wrap gap-2">
          {DIETARY.map(d => (
            <button
              key={d.value}
              id={`dietary-btn-${d.value}`}
              onClick={() => toggleArr('dietary', d.value)}
              className={`px-3.5 py-1.5 rounded-full border-2 text-[0.78rem] font-medium transition-all duration-200
                ${form.dietary.includes(d.value)
                  ? 'border-[#E8623A] bg-[#E8623A] text-white'
                  : 'border-[#F5EDD8] bg-white text-[#2C1810] hover:border-[#E8623A]/60'}`}
            >
              {d.label}
            </button>
          ))}
        </div>
      </div>
    </div>
  );

  const renderResults = () => (
    <div className="animate-fade-up">
      {results.length === 0 ? (
        <div className="text-center py-10">
          <p className="text-4xl mb-3">😔</p>
          <p className="font-semibold text-[#2C1810]">Không tìm thấy quán phù hợp</p>
          <p className="text-[0.82rem] text-[#8B6F5E] mt-1">Thử thay đổi sở thích và tìm lại nhé!</p>
          <button
            onClick={() => setStep(1)}
            className="mt-4 px-5 py-2 rounded-full bg-[#E8623A] text-white text-[0.85rem] font-semibold hover:bg-[#C04D2B] transition-colors"
          >
            Tìm lại
          </button>
        </div>
      ) : (
        <>
          <div className="flex items-center justify-between mb-4">
            <div>
              <h3 className="font-bold text-[#2C1810] text-[1rem]">✨ Gợi ý dành cho bạn</h3>
              <p className="text-[0.75rem] text-[#8B6F5E]">{results.length} quán ăn phù hợp nhất</p>
            </div>
            <button
              onClick={() => setStep(1)}
              className="text-[0.75rem] text-[#E8623A] font-semibold hover:underline"
            >
              Tìm lại
            </button>
          </div>
          <div className="grid grid-cols-2 gap-3 max-h-[380px] overflow-y-auto pr-1 custom-scroll">
            {results.map(r => (
              <ResultCard key={r.id} r={r} onClick={goToDetail} />
            ))}
          </div>
        </>
      )}
    </div>
  );

  const canProceed = {
    1: !!form.mood,
    2: true, // optional
    3: true,
  };

  return (
    <div
      className="fixed inset-0 z-[200] flex items-center justify-center p-4"
      id="ai-recommend-overlay"
      onClick={(e) => e.target === e.currentTarget && onClose()}
    >
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" />

      {/* Panel */}
      <div className="relative bg-white rounded-3xl shadow-2xl w-full max-w-[520px] overflow-hidden animate-fade-up">
        {/* Header */}
        <div className="bg-gradient-to-r from-[#2C1810] to-[#5C2A14] px-6 py-5 flex items-center justify-between">
          <div>
            <h2 className="font-extrabold text-white text-[1.1rem]">✨ AI Gợi Ý Quán Ăn</h2>
            <p className="text-white/70 text-[0.75rem] mt-0.5">
              {step < 4 ? `Bước ${step}/3 – Cho chúng tôi biết thêm về bạn` : 'Đây là những quán dành riêng cho bạn'}
            </p>
          </div>
          <button
            onClick={onClose}
            id="ai-modal-close"
            className="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white transition-colors"
          >
            ✕
          </button>
        </div>

        {/* Step indicator */}
        {step < 4 && (
          <div className="px-6 pt-4 pb-0 flex items-center gap-2">
            {[1, 2, 3].map(s => (
              <div key={s} className="flex items-center gap-2 flex-1">
                <StepDot active={step === s} done={step > s} label={s} />
                {s < 3 && (
                  <div className={`h-[2px] flex-1 rounded-full transition-all duration-500 ${step > s ? 'bg-[#E8623A]' : 'bg-[#F5EDD8]'}`} />
                )}
              </div>
            ))}
          </div>
        )}

        {/* Body */}
        <div className="px-6 py-5">
          {step === 1 && renderStep1()}
          {step === 2 && renderStep2()}
          {step === 3 && renderStep3()}
          {step === 4 && renderResults()}

          {/* Error */}
          {error && (
            <div className="mt-3 p-3 rounded-xl bg-red-50 border border-red-200 text-red-600 text-[0.8rem]">
              {error}
            </div>
          )}
        </div>

        {/* Footer nav */}
        {step < 4 && (
          <div className="px-6 pb-6 flex items-center justify-between">
            <button
              onClick={() => step > 1 ? setStep(s => s - 1) : onClose()}
              className="px-5 py-2 rounded-full border-2 border-[#F5EDD8] text-[#8B6F5E] text-[0.85rem] font-medium hover:border-[#2C1810] hover:text-[#2C1810] transition-colors"
            >
              {step === 1 ? 'Huỷ' : '← Quay lại'}
            </button>

            {step < 3 ? (
              <button
                onClick={() => setStep(s => s + 1)}
                disabled={!canProceed[step]}
                className="px-6 py-2 rounded-full bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white text-[0.85rem] font-semibold shadow-md hover:shadow-lg hover:scale-[1.02] transition-all disabled:opacity-40 disabled:cursor-not-allowed disabled:scale-100"
              >
                Tiếp theo →
              </button>
            ) : (
              <button
                id="ai-recommend-submit"
                onClick={handleSubmit}
                disabled={loading}
                className="px-6 py-2.5 rounded-full bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white text-[0.85rem] font-semibold shadow-md hover:shadow-lg hover:scale-[1.02] transition-all disabled:opacity-70 disabled:cursor-not-allowed flex items-center gap-2"
              >
                {loading ? (
                  <>
                    <svg className="animate-spin w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
                      <circle cx="12" cy="12" r="10" strokeOpacity="0.25" />
                      <path d="M12 2a10 10 0 0 1 10 10" />
                    </svg>
                    AI đang phân tích...
                  </>
                ) : '✨ Gợi ý cho tôi!'}
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
};

export default AIRecommendModal;
