/* ================================================
   SEARCH PAGE - search.js
   ================================================ */

// ---- Shared helpers ----
function toggleMobileMenu() {
  document.getElementById('mobile-menu').classList.toggle('open');
}
function toggleChatbot() {
  document.getElementById('chatbot-modal').classList.toggle('open');
}
function openLoginModal() {
  document.getElementById('login-modal-overlay').classList.add('open');
  document.body.style.overflow = 'hidden';
}
function closeAllModals() {
  document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
  document.body.style.overflow = '';
}
function togglePassword(id) {
  const el = document.getElementById(id);
  el.type = el.type === 'password' ? 'text' : 'password';
}
function submitLogin() {
  showToast('✅ Đăng nhập thành công!');
  closeAllModals();
}
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeAllModals(); });

const botReplies = [
  'Tôi đang tìm kiếm cho bạn những địa điểm phù hợp... 🔍',
  'Bạn muốn ăn món gì? Hãy cho tôi biết ngân sách và vị trí nhé!',
  'Với ngân sách đó, tôi gợi ý bạn thử Bánh mì Huỳnh Hoa – chất lượng số 1! 🥖',
  'Cơm tấm Sà Bì Chưởng rất được yêu thích tại Quận 5. Đánh giá 4.7 ⭐',
];
let botIdx = 0;

function sendChat() {
  const input = document.getElementById('chatbot-input');
  const body = document.getElementById('chatbot-body');
  const msg = input.value.trim();
  if (!msg) return;
  addBubble(body, msg, 'user');
  input.value = '';
  setTimeout(() => {
    const typing = addBubble(body, '<em>Đang nhập...</em>', 'bot');
    setTimeout(() => {
      typing.innerHTML = botReplies[botIdx++ % botReplies.length];
      body.scrollTop = body.scrollHeight;
    }, 1000);
  }, 400);
}

function addBubble(container, html, who) {
  const div = document.createElement('div');
  div.className = `chat-bubble ${who}`;
  div.innerHTML = html;
  container.appendChild(div);
  container.scrollTop = container.scrollHeight;
  return div;
}

function showToast(msg) {
  const old = document.querySelector('.toast-notification');
  if (old) old.remove();
  const t = document.createElement('div');
  t.className = 'toast-notification';
  t.textContent = msg;
  t.style.cssText = `position:fixed;bottom:90px;left:50%;transform:translateX(-50%) translateY(16px);
    background:rgba(44,24,16,0.9);color:white;padding:11px 22px;border-radius:50px;
    font-size:.87rem;font-weight:600;z-index:999;opacity:0;transition:all .3s ease;
    white-space:nowrap;font-family:'Inter',sans-serif;box-shadow:0 8px 24px rgba(0,0,0,.25);`;
  document.body.appendChild(t);
  requestAnimationFrame(() => { t.style.opacity = '1'; t.style.transform = 'translateX(-50%) translateY(0)'; });
  setTimeout(() => {
    t.style.opacity = '0'; t.style.transform = 'translateX(-50%) translateY(8px)';
    setTimeout(() => t.remove(), 300);
  }, 2500);
}

// ---- Search Logic ----
const suggestions = [
  { icon: '🥖', text: 'Bánh mì Huỳnh Hoa', type: 'Quán ăn' },
  { icon: '🍜', text: 'Bún bò Huế', type: 'Món ăn' },
  { icon: '🍚', text: 'Cơm tấm sườn bì chả', type: 'Món ăn' },
  { icon: '🍝', text: 'Phở bò gia truyền', type: 'Quán ăn' },
  { icon: '🧋', text: 'Trà sữa TuTiMi', type: 'Đồ uống' },
  { icon: '🥘', text: 'Lẩu Thái hải sản', type: 'Quán ăn' },
  { icon: '🍡', text: 'Ăn vặt gỏi cuốn', type: 'Món ăn' },
  { icon: '🔥', text: 'Món ăn no', type: 'Từ khóa' },
];

function onSearchInput(val) {
  const drop = document.getElementById('autocomplete-drop');
  if (!val.trim()) { drop.classList.remove('open'); return; }
  const filtered = suggestions.filter(s => s.text.toLowerCase().includes(val.toLowerCase()));
  if (!filtered.length) { drop.classList.remove('open'); return; }
  drop.innerHTML = filtered.map(s =>
    `<div class="autocomplete-item" onclick="selectSuggestion('${s.text}')">
      <span class="ac-icon">${s.icon}</span>
      <span class="ac-text">${s.text}</span>
      <span class="ac-type">${s.type}</span>
    </div>`
  ).join('');
  drop.classList.add('open');
}

function selectSuggestion(text) {
  document.getElementById('search-input').value = text;
  document.getElementById('autocomplete-drop').classList.remove('open');
  doSearch();
}

function clearSearch() {
  document.getElementById('search-input').value = '';
  document.getElementById('autocomplete-drop').classList.remove('open');
  document.getElementById('search-query-display').textContent = '"Tất cả"';
  showAllResults();
}

function doSearch() {
  const q = document.getElementById('search-input').value.trim();
  document.getElementById('autocomplete-drop').classList.remove('open');
  document.getElementById('search-query-display').textContent = q ? `"${q}"` : '"Tất cả"';

  // simulate loading
  showSkeleton();
  setTimeout(() => {
    hideSkeleton();
    filterAndRender();
  }, 600);
}

// Close autocomplete on outside click
document.addEventListener('click', e => {
  if (!document.getElementById('search-bar-wrap').contains(e.target)) {
    document.getElementById('autocomplete-drop').classList.remove('open');
  }
});

function showSkeleton() {
  document.getElementById('skeleton-list').style.display = 'flex';
  document.getElementById('results-list').style.display = 'none';
  document.getElementById('no-results').style.display = 'none';
}
function hideSkeleton() {
  document.getElementById('skeleton-list').style.display = 'none';
}
function showAllResults() {
  document.querySelectorAll('.result-card').forEach(c => c.classList.remove('hidden'));
  updateCount();
}

// ---- Filters ----
let selectedCategory = 'all';

function selectCategory(btn, cat) {
  document.querySelectorAll('.chip').forEach(c => c.classList.remove('chip-active'));
  btn.classList.add('chip-active');
  selectedCategory = cat;
  filterAndRender();
}

function applyFilters() { filterAndRender(); }
function resetFilters() {
  document.querySelectorAll('.filter-check input').forEach(cb => cb.checked = false);
  document.getElementById('price-min').value = 0;
  document.getElementById('price-max').value = 1000000;
  updatePriceRange();
  filterAndRender();
}
function resetAll() {
  resetFilters();
  document.getElementById('search-input').value = '';
  document.getElementById('search-query-display').textContent = '"Tất cả"';
  selectedCategory = 'all';
  document.querySelectorAll('.chip').forEach(c => c.classList.remove('chip-active'));
  document.getElementById('chip-all').classList.add('chip-active');
}

function filterAndRender() {
  const query = document.getElementById('search-input').value.toLowerCase();
  const priceMin = parseInt(document.getElementById('price-min').value);
  const priceMax = parseInt(document.getElementById('price-max').value);

  const checks = {
    favorite: document.getElementById('check-favorite').checked,
    goodRating: document.getElementById('check-good-rating').checked,
    restaurant: document.getElementById('check-restaurant').checked,
    budget: document.getElementById('check-budget').checked,
    cheapest: document.getElementById('check-cheapest').checked,
    family: document.getElementById('check-family').checked,
  };

  const cards = document.querySelectorAll('.result-card');
  let visible = 0;

  cards.forEach(card => {
    const name = card.querySelector('.result-name').textContent.toLowerCase();
    const cat = card.dataset.category || '';
    const tags = card.dataset.tags || '';
    const price = parseInt(card.dataset.price);
    const rating = parseFloat(card.dataset.rating);

    let show = true;

    // Query filter
    if (query && !name.includes(query) && !cat.toLowerCase().includes(query)) show = false;

    // Category filter
    if (selectedCategory !== 'all' && cat !== selectedCategory) show = false;

    // Price filter
    if (price < priceMin || price > priceMax) show = false;

    // Checkbox filters
    if (checks.favorite && !tags.includes('favorite')) show = false;
    if (checks.goodRating && rating < 4.7) show = false;
    if (checks.restaurant && !tags.includes('restaurant')) show = false;
    if (checks.budget && !tags.includes('budget')) show = false;
    if (checks.cheapest && !tags.includes('cheapest')) show = false;
    if (checks.family && !tags.includes('family')) show = false;

    card.classList.toggle('hidden', !show);
    if (show) visible++;
  });

  document.getElementById('results-list').style.display = 'flex';
  const noRes = document.getElementById('no-results');
  noRes.style.display = visible === 0 ? 'block' : 'none';
  updateCount(visible);
}

function updateCount(n) {
  if (n === undefined) n = document.querySelectorAll('.result-card:not(.hidden)').length;
  document.getElementById('results-count').textContent = `${n} kết quả`;
}

// ---- Sorting ----
function applySorting(val) {
  const list = document.getElementById('results-list');
  const cards = Array.from(list.querySelectorAll('.result-card'));

  cards.sort((a, b) => {
    if (val === 'rating') return parseFloat(b.dataset.rating) - parseFloat(a.dataset.rating);
    if (val === 'distance') return parseFloat(a.dataset.distance) - parseFloat(b.dataset.distance);
    if (val === 'price_asc') return parseInt(a.dataset.price) - parseInt(b.dataset.price);
    if (val === 'price_desc') return parseInt(b.dataset.price) - parseInt(a.dataset.price);
    return 0;
  });
  cards.forEach(c => list.appendChild(c));
  showToast(`📊 Đã sắp xếp theo: ${document.getElementById('sort-select').options[document.getElementById('sort-select').selectedIndex].text}`);
}

// ---- Price Range ----
function updatePriceRange() {
  const min = parseInt(document.getElementById('price-min').value);
  const max = parseInt(document.getElementById('price-max').value);

  if (min > max) {
    document.getElementById('price-min').value = max;
    document.getElementById('price-max').value = min;
  }

  const fmt = n => n >= 1000000 ? '1.000.000' : n.toLocaleString('vi-VN');
  document.getElementById('price-min-label').textContent = fmt(Math.min(min, max)) + ' VND';
  document.getElementById('price-max-label').textContent = fmt(Math.max(min, max)) + ' VND';

  // Update track
  const total = 1000000;
  const left = (Math.min(min, max) / total) * 100;
  const right = (Math.max(min, max) / total) * 100;
  const track = document.getElementById('price-track');
  if (track) { track.style.left = left + '%'; track.style.width = (right - left) + '%'; }

  filterAndRender();
}

// ---- Navigate to detail ----
function goToDetail(id) {
  window.location.href = 'detail.html?id=' + id;
}

// ---- Header scroll ----
window.addEventListener('scroll', () => {
  const h = document.getElementById('main-header');
  h.style.boxShadow = window.scrollY > 40 ? '0 2px 20px rgba(44,24,16,0.12)' : '';
}, { passive: true });

// ---- Animate on load ----
window.addEventListener('DOMContentLoaded', () => {
  updatePriceRange();

  // Read query from URL eg: search.html?q=banh+mi
  const params = new URLSearchParams(window.location.search);
  const qParam = params.get('q');
  if (qParam) {
    document.getElementById('search-input').value = qParam;
    document.getElementById('search-query-display').textContent = `"${qParam}"`;
  }

  // Simulate initial load
  setTimeout(() => {
    hideSkeleton();
    // Show all results initially without filtering
    document.getElementById('results-list').style.display = 'flex';
    document.querySelectorAll('.result-card').forEach(c => c.classList.remove('hidden'));
    updateCount();

    // If there's a query param, run search
    if (qParam) {
      filterAndRender();
    }

    // Animate cards in
    document.querySelectorAll('.result-card').forEach((card, i) => {
      card.style.opacity = '0';
      card.style.transform = 'translateY(20px)';
      setTimeout(() => {
        card.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
        card.style.opacity = '1';
        card.style.transform = 'translateY(0)';
      }, i * 100 + 50);
    });
  }, 800);
});

console.log('%c🔍 FoodMap Search', 'font-size:16px;font-weight:bold;color:#E8623A');
