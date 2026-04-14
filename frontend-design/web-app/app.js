/* ================================================
   FOODMAP - JavaScript
   ================================================ */

// ---- Scroll Cards ----
function scrollCards(containerId, direction) {
  const container = document.getElementById(containerId);
  if (!container) return;
  const cardWidth = container.querySelector('.food-card')?.offsetWidth || 220;
  container.scrollBy({ left: direction * (cardWidth + 18) * 2, behavior: 'smooth' });
}

// ---- Nav Tabs ----
function setActiveTab(tabEl) {
  document.querySelectorAll('.nav-tab').forEach(t => t.classList.remove('active'));
  tabEl.classList.add('active');
}

// ---- Mobile Menu ----
function toggleMobileMenu() {
  const menu = document.getElementById('mobile-menu');
  menu.classList.toggle('open');
}

// Close mobile menu on outside click
document.addEventListener('click', (e) => {
  const menu = document.getElementById('mobile-menu');
  const btn  = document.getElementById('hamburger-btn');
  if (menu && menu.classList.contains('open') && !menu.contains(e.target) && !btn.contains(e.target)) {
    menu.classList.remove('open');
  }
});

// ---- Login Modal ----
function openLoginModal() {
  document.getElementById('login-modal-overlay').classList.add('open');
  document.body.style.overflow = 'hidden';
}
function closeAllModals() {
  document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
  document.body.style.overflow = '';
}
function openSignupModal() {
  // Placeholder - có thể thêm modal đăng ký sau
  openLoginModal();
}

// Close modal on Escape
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') closeAllModals();
});

// ---- Chatbot ----
function toggleChatbot() {
  const modal = document.getElementById('chatbot-modal');
  modal.classList.toggle('open');
  if (modal.classList.contains('open')) {
    document.getElementById('chatbot-input').focus();
  }
}

const botReplies = [
  "Tôi đang tìm kiếm cho bạn những địa điểm phù hợp... 🔍",
  "Với ngân sách đó, tôi gợi ý bạn thử **Bánh mì Huỳnh Hoa** – nổi tiếng và giá cả phải chăng! 🥖",
  "Bạn có thể thử cơm tấm Phúc Lộc Thọ, quán rất đông khách và chất lượng ổn định 🍚",
  "Nếu bạn thích đồ uống, TuTiMi có trà sữa ngon và không gian thoải mái ☕",
  "Bún bò Huế là lựa chọn tuyệt vời nếu bạn muốn ăn no và đậm đà hương vị miền Trung!",
  "Tôi cần thêm thông tin về sở thích của bạn để gợi ý chính xác hơn 😊"
];
let botReplyIndex = 0;

function sendChat() {
  const input = document.getElementById('chatbot-input');
  const body  = document.getElementById('chatbot-body');
  const msg   = input.value.trim();
  if (!msg) return;

  // Add user message
  const userBubble = document.createElement('div');
  userBubble.className = 'chat-bubble user';
  userBubble.textContent = msg;
  body.appendChild(userBubble);
  input.value = '';
  body.scrollTop = body.scrollHeight;

  // Bot reply with typing indicator
  setTimeout(() => {
    const typingBubble = document.createElement('div');
    typingBubble.className = 'chat-bubble bot';
    typingBubble.innerHTML = '<em>Đang nhập...</em>';
    body.appendChild(typingBubble);
    body.scrollTop = body.scrollHeight;

    setTimeout(() => {
      typingBubble.innerHTML = botReplies[botReplyIndex % botReplies.length];
      botReplyIndex++;
      body.scrollTop = body.scrollHeight;
    }, 1000);
  }, 400);
}

// ---- Password Toggle ----
function togglePassword(inputId) {
  const input = document.getElementById(inputId);
  input.type = input.type === 'password' ? 'text' : 'password';
}

// ---- Header Scroll Behavior ----
let lastScrollY = 0;
window.addEventListener('scroll', () => {
  const header = document.getElementById('main-header');
  const scrollY = window.scrollY;

  if (scrollY > 80) {
    header.style.background = 'rgba(255,255,255,0.98)';
    header.style.boxShadow = '0 2px 20px rgba(44,24,16,0.12)';
  } else {
    header.style.background = 'rgba(255,255,255,0.95)';
    header.style.boxShadow = '0 2px 8px rgba(44,24,16,0.08)';
  }
  lastScrollY = scrollY;
}, { passive: true });

// ---- Intersection Observer for animations ----
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -40px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

// Observe cards and posts
document.querySelectorAll('.food-card, .post-card, .footer-col').forEach((el, i) => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(24px)';
  el.style.transition = `opacity 0.5s ease ${i * 0.07}s, transform 0.5s ease ${i * 0.07}s`;
  observer.observe(el);
});

// ---- Food card click ----
document.querySelectorAll('.food-card').forEach(card => {
  card.addEventListener('click', function() {
    window.location.href = 'detail.html';
  });
});

// ---- Toast notification ----
function showToast(message, type = 'info') {
  const existing = document.querySelector('.toast-notification');
  if (existing) existing.remove();

  const toast = document.createElement('div');
  toast.className = 'toast-notification';
  toast.innerHTML = message;
  toast.style.cssText = `
    position: fixed;
    bottom: 100px;
    left: 50%;
    transform: translateX(-50%) translateY(20px);
    background: rgba(44, 24, 16, 0.9);
    color: white;
    padding: 12px 24px;
    border-radius: 50px;
    font-size: 0.88rem;
    font-weight: 600;
    z-index: 999;
    backdrop-filter: blur(8px);
    box-shadow: 0 8px 24px rgba(0,0,0,0.25);
    opacity: 0;
    transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
    white-space: nowrap;
    font-family: 'Inter', sans-serif;
  `;
  document.body.appendChild(toast);

  requestAnimationFrame(() => {
    toast.style.opacity = '1';
    toast.style.transform = 'translateX(-50%) translateY(0)';
  });

  setTimeout(() => {
    toast.style.opacity = '0';
    toast.style.transform = 'translateX(-50%) translateY(10px)';
    setTimeout(() => toast.remove(), 350);
  }, 2500);
}

// ---- Hero search ----
document.getElementById('hero-search-btn')?.addEventListener('click', () => {
  const query = document.getElementById('hero-search-input').value.trim();
  window.location.href = 'search.html' + (query ? `?q=${encodeURIComponent(query)}` : '');
});

document.getElementById('hero-search-input')?.addEventListener('keydown', (e) => {
  if (e.key === 'Enter') {
    const query = e.target.value.trim();
    window.location.href = 'search.html' + (query ? `?q=${encodeURIComponent(query)}` : '');
  }
});

// ---- Login form submit ----
document.getElementById('login-submit')?.addEventListener('click', () => {
  const user = document.getElementById('login-username').value.trim();
  const pass = document.getElementById('login-password').value.trim();
  if (!user || !pass) {
    showToast('⚠️ Vui lòng nhập đầy đủ tài khoản và mật khẩu');
    return;
  }
  showToast('✅ Đăng nhập thành công!');
  closeAllModals();
});

console.log('%c🍜 FoodMap Dashboard', 'font-size: 18px; font-weight: bold; color: #E8623A;');
console.log('%cKhám phá ẩm thực Việt Nam!', 'color: #4A3728;');
