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
  requestAnimationFrame(() => { t.style.opacity = '1'; t.style.transform = 'translateX(-50%) translateY(0)'; });
  setTimeout(() => {
    t.style.opacity = '0'; t.style.transform = 'translateX(-50%) translateY(8px)';
    setTimeout(() => t.remove(), 300);
  }, 2800);
}

// ---- Gallery ----
const galleryPhotos = [
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/592188762_1170454531901258_2007691320621081505_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=13d280&_nc_ohc=ZaIM4B1-zm8Q7kNvwH7K8I_&_nc_oc=AdqxAlIh-tBFd-rJbvq6ggNBrh6shMkdH9KHInYa5x-RAHistdqvHBbN7RnN39FQOwQ&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=VVQFX3iggT75oJvbWT6tCQ&_nc_ss=7a3a8&oh=00_Af2MhSRkCi1goXbFbY5bUAFFy8Lm8PoL5T8Gn-tHNKzWjQ&oe=69E4CC59',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/476912150_942135224733191_8095130890254302257_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=_1KzGuio2A4Q7kNvwGHUKE_&_nc_oc=AdpKbQFD5RuWvGyuHZDiOAE6BW0WazDcX5mOQ7lk7K0HhZVOWgHrt_nCF2Kbz3i_RDk&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=A2CNQdmL07TBaW9Ore4_5A&_nc_ss=7a3a8&oh=00_Af08eNVk1y484PxDR6sn3022ttHRGdHe2sC6mJqD3_aPqw&oe=69E4D998',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/481998289_955681783378535_7002310910430892755_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=13d280&_nc_ohc=bDPtoHMp--wQ7kNvwF_0ZtB&_nc_oc=AdrEmkeO0g5XpEIUtywV15-LQwsTzkgisX4lb9HZtuFwDSO2tcXd_2sfyh3Z1BG2dZM&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=iZYK8q57mdzJPee5-qGkMA&_nc_ss=7a3a8&oh=00_Af2rDZaMywdi0ANqyjVuizKpZgK_tnntk4b08pZ5JRf_Ew&oe=69E4BB11',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t1.6435-9/191409082_120013160213115_6387530588433904048_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=13d280&_nc_ohc=6LYF3IGRZ0EQ7kNvwEMuq-Y&_nc_oc=AdommhpFgGYXx0fJXHQT7Ql4f31MFOvBF_1WMzRz3PM8EMAsk55RgbTLSzocl0W_8RY&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=SgI2-7hWYLp94OEJQpDh8g&_nc_ss=7a3a8&oh=00_Af3SB1I_oFhr5rMKgblTGSSe3QQN67HtLGFR7t9fb3w4VQ&oe=6A068C9A',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t1.6435-9/210190502_136838851863879_5335509313524999332_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=13d280&_nc_ohc=eR9dNhmgjGgQ7kNvwEhEhGy&_nc_oc=AdpF96y_ziCrtnT0oaDp1SpNLc1sdrXevF8-7LtL5hh_2WVXNaLGpLAF5r9q2ZFF04s&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=G19gmGfdoJpweS0_J1WYyg&_nc_ss=7a3a8&oh=00_Af3b0zLqjWEkRaJGxNhOI_g2QglwknrDiEXu_q5h46PmBg&oe=6A065DF4',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t1.6435-9/190397143_120012436879854_6885151246835106554_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=13d280&_nc_ohc=PxbYDDtDDdkQ7kNvwFxWeGZ&_nc_oc=Adr1ehF_K_4N2qwPFlfnEHlYOB3Q71DIBstU9v7irYQ14fFPzefw6HrvtT2DwdZZHuc&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=qI8bapk9oskiRaZtzwPfpA&_nc_ss=7a3a8&oh=00_Af1sOEmzo51ANQh6ooBzz8RwIYhJsKmse6J8v7Q-qGgYaQ&oe=6A066192',
  'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/471946489_918807290333694_7170150079774332134_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=13d280&_nc_ohc=QGoIdj89414Q7kNvwEQZoXq&_nc_oc=AdrrGWPxx04JzKzjGnCdCVfFBSyd3gFb9FiazVOGkzvs4zyrAMprS_HYFwoy_7iLKd4&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=xcCvkIU6mzJpCFl55bS0ZQ&_nc_ss=7a3a8&oh=00_Af11YtQIwzEfOzSJxVyWPMhkycxyKbJtZRDhyp0O2LPrTw&oe=69E4D1F3',
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
  if (e.key === 'ArrowLeft') lightboxNav(-1);
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
      title: 'Cơm tấm Sà Bì Chưởng – YumMap',
      text: 'Quán cơm tấm ngon tại Quận 5, TP.HCM. Đánh giá 4.7 ⭐',
      url: window.location.href
    }).catch(() => { });
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

console.log('%c🍚 YumMap Detail', 'font-size:16px;font-weight:bold;color:#E8623A');
