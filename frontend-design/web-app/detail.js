/* ================================================
   DETAIL PAGE - detail.js
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
document.addEventListener('keydown', e => { if (e.key === 'Escape') { closeAllModals(); closeLightbox(); } });

const botReplies = [
  'Cơm tấm Sà Bì Chưởng là lựa chọn tuyệt vời! Đặc biệt combo sườn cốt lết rất đáng thử 🍚',
  'Tôi gợi ý bạn thêm canh chua và nước ngọt để có bữa ăn đầy đủ hơn 😊',
  'Quán mở từ 7h – 21h, bạn có thể ghé bất cứ lúc nào trong ngày!',
  'Nếu bạn muốn tìm quán tương tự, tôi có thể gợi ý thêm một số địa điểm gần đây.',
];
let botIdx = 0;

function sendChat() {
  const input = document.getElementById('chatbot-input');
  const body  = document.getElementById('chatbot-body');
  const msg   = input.value.trim();
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
function addBubble(c, html, who) {
  const d = document.createElement('div');
  d.className = `chat-bubble ${who}`;
  d.innerHTML = html;
  c.appendChild(d);
  c.scrollTop = c.scrollHeight;
  return d;
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
  requestAnimationFrame(() => { t.style.opacity='1'; t.style.transform='translateX(-50%) translateY(0)'; });
  setTimeout(() => {
    t.style.opacity='0'; t.style.transform='translateX(-50%) translateY(8px)';
    setTimeout(() => t.remove(), 300);
  }, 2800);
}

// ---- Gallery ----
const galleryPhotos = [
  'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=900&q=85',
  'https://images.unsplash.com/photo-1503764654157-72d979d9af2f?w=900&q=85',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=900&q=85',
  'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=900&q=85',
  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=900&q=85',
  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=900&q=85',
];
let currentPhoto = 0;
let lightboxOpen = false;

function switchPhoto(idx, thumbEl) {
  currentPhoto = idx;
  const mainImg = document.getElementById('gallery-main-img');
  mainImg.style.opacity = '0';
  mainImg.style.transform = 'scale(0.97)';
  setTimeout(() => {
    mainImg.src = galleryPhotos[idx];
    mainImg.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
    mainImg.style.opacity = '1';
    mainImg.style.transform = 'scale(1)';
  }, 200);
  document.querySelectorAll('.gallery-thumb').forEach(t => t.classList.remove('active'));
  if (thumbEl) thumbEl.classList.add('active');
}

function openLightbox(idx) {
  currentPhoto = idx;
  document.getElementById('lightbox-img').src = galleryPhotos[idx];
  document.getElementById('lightbox').classList.add('open');
  document.body.style.overflow = 'hidden';
  lightboxOpen = true;
}
function closeLightbox() {
  document.getElementById('lightbox').classList.remove('open');
  document.body.style.overflow = '';
  lightboxOpen = false;
}
function lightboxNav(dir) {
  currentPhoto = (currentPhoto + dir + galleryPhotos.length) % galleryPhotos.length;
  const img = document.getElementById('lightbox-img');
  img.style.opacity = '0';
  setTimeout(() => {
    img.src = galleryPhotos[currentPhoto];
    img.style.transition = 'opacity 0.25s ease';
    img.style.opacity = '1';
  }, 180);
}

// Keyboard nav for lightbox
document.addEventListener('keydown', e => {
  if (!lightboxOpen) return;
  if (e.key === 'ArrowLeft')  lightboxNav(-1);
  if (e.key === 'ArrowRight') lightboxNav(1);
});

// ---- Bookmark ----
let bookmarked = false;
function toggleBookmark() {
  bookmarked = !bookmarked;
  const btn = document.getElementById('btn-bookmark');
  btn.classList.toggle('bookmarked', bookmarked);
  showToast(bookmarked ? '❤️ Đã lưu vào danh sách yêu thích!' : '🗑️ Đã bỏ lưu');
}

// ---- Menu Tabs ----
function switchMenuTab(tabEl, panelId) {
  document.querySelectorAll('.menu-tab').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.menu-panel').forEach(p => p.classList.remove('active'));
  tabEl.classList.add('active');
  document.getElementById('panel-' + panelId).classList.add('active');
}

// ---- Share ----
function shareRestaurant() {
  if (navigator.share) {
    navigator.share({
      title: 'Cơm tấm Sà Bì Chưởng – FoodMap',
      text: 'Quán cơm tấm ngon tại Quận 5, TP.HCM. Đánh giá 4.7 ⭐',
      url: window.location.href
    }).catch(() => {});
  } else {
    // Fallback: copy link
    navigator.clipboard.writeText(window.location.href).then(() => {
      showToast('🔗 Đã sao chép link!');
    }).catch(() => showToast('🔗 Chia sẻ: ' + window.location.href));
  }
}

// ---- Header scroll ----
window.addEventListener('scroll', () => {
  const h = document.getElementById('main-header');
  h.style.boxShadow = window.scrollY > 40 ? '0 2px 20px rgba(44,24,16,.12)' : '';
}, { passive: true });

// ---- Animate on load ----
window.addEventListener('DOMContentLoaded', () => {
  // Animate gallery slides
  const sections = ['.info-section', '.menu-section', '.ai-section', '.detail-right'];
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.info-section, .menu-section, .ai-section, .detail-map-card, .quick-stats, .similar-section').forEach((el, i) => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = `opacity 0.5s ease ${i * 0.1}s, transform 0.5s ease ${i * 0.1}s`;
    observer.observe(el);
  });

  // Header scroll indicator
  const scrollBar = document.createElement('div');
  scrollBar.style.cssText = `position:fixed;top:0;left:0;height:3px;background:linear-gradient(90deg,#E8623A,#F5A623);z-index:999;width:0;transition:width .1s linear;`;
  document.body.appendChild(scrollBar);
  window.addEventListener('scroll', () => {
    const pct = (window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100;
    scrollBar.style.width = pct + '%';
  }, { passive: true });
});

console.log('%c🍚 FoodMap Detail', 'font-size:16px;font-weight:bold;color:#E8623A');
