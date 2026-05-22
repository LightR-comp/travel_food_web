import { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { forumApi } from '../api/forumApi';


const TRENDING_TAGS = ['#bunbo', '#phobeo', '#reviewquanandian', '#comtam', '#giamgia'];

const CATEGORIES = [
  { id: 'all', label: 'Tất cả', icon: '🍽️' },
  { id: 'review', label: 'Đánh giá', icon: '⭐' },
  { id: 'recipe', label: 'Công thức', icon: '📖' },
  { id: 'tips', label: 'Mẹo vặt', icon: '💡' },
  { id: 'events', label: 'Sự kiện', icon: '🎉' },
  { id: 'question', label: 'Hỏi đáp', icon: '❓' },
];

/* ─── Intersection Observer hook ─── */
const useInView = (threshold = 0.15) => {
  const ref = useRef(null);
  const [visible, setVisible] = useState(false);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const obs = new IntersectionObserver(([e]) => { if (e.isIntersecting) { setVisible(true); obs.disconnect(); } }, { threshold });
    obs.observe(el);
    return () => obs.disconnect();
  }, [threshold]);
  return [ref, visible];
};

/* ─── Post Card ─── */
const PostCard = ({ post, index }) => {
  const [ref, visible] = useInView(0.1);
  const [liked, setLiked] = useState(false);
  const [likesCount, setLikesCount] = useState(post.likes || 0);
  const [isLiking, setIsLiking] = useState(false);

  useEffect(() => {
    setLikesCount(post.likes || 0);
  }, [post.likes]);

  const categoryColors = {
    review: 'bg-[#E8623A]/10 text-[#E8623A]',
    recipe: 'bg-emerald-50 text-emerald-600',
    tips: 'bg-amber-50 text-amber-600',
    events: 'bg-purple-50 text-purple-600',
    question: 'bg-blue-50 text-blue-600',
  };
  const catLabel = CATEGORIES.find(c => c.id === post.category);

  const handleLikeClick = async () => {
    if (isLiking) return;
    try {
      setIsLiking(true);
      const response = await forumApi.likePost(post.id);
      
      const apiData = response.data ? response.data : response;
      
      setLiked(apiData.liked);
      setLikesCount(apiData.like_count);
    } catch (error) {
      console.error("Lỗi khi tương tác nút thích bài viết:", error);
      alert("Thao tác thất bại. Bạn vui lòng đăng nhập để thực hiện chức năng này.");
    } finally {
      setIsLiking(false);
    }
  };

  return (
    <article
      ref={ref}
      className={`
        group relative bg-white rounded-2xl border border-[#F5EDD8]/80
        hover:border-[#E8623A]/25 hover:shadow-[0_12px_40px_rgba(232,98,58,0.1)]
        transition-all duration-500 ease-out overflow-hidden
        ${visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-8'}
      `}
      style={{ transitionDelay: `${index * 80}ms` }}
    >
      {post.pinned && (
        <div className="absolute top-0 right-0 bg-gradient-to-l from-[#E8623A] to-[#F4845A] text-white text-[0.6rem] font-bold uppercase tracking-wider px-3 py-1 rounded-bl-xl">
          📌 Ghim
        </div>
      )}

      <div className="p-5 sm:p-6">
        {/* Header */}
        <div className="flex items-center gap-3 mb-3">
          <div className="w-10 h-10 rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center text-xl
            ring-2 ring-[#F5EDD8] group-hover:ring-[#E8623A]/30 transition-all duration-300">
            {post.avatar}
          </div>
          <div className="flex-1 min-w-0">
            <p className="text-sm font-bold text-[#2C1810] truncate">{post.author}</p>
            <p className="text-xs text-[#7B7068]">{post.time}</p>
          </div>
          <span className={`px-2.5 py-0.5 rounded-full text-[0.65rem] font-semibold ${categoryColors[post.category]}`}>
            {catLabel?.icon} {catLabel?.label}
          </span>
        </div>

        {/* Title & excerpt */}
        <Link to={`/forum/${post.id}`}>
          <h3 className="text-base font-bold text-[#2C1810] mb-2 group-hover:text-[#E8623A] transition-colors duration-300 line-clamp-2">
            {post.title}
          </h3>
        </Link>
        <p className="text-sm text-[#7B7068] leading-relaxed mb-4 line-clamp-2">
          {post.excerpt}
        </p>

        {/* Tags */}
        <div className="flex flex-wrap gap-1.5 mb-4">
          {post.tags.map(tag => (
            <span key={tag} className="text-[0.7rem] font-medium text-[#E8623A]/80 bg-[#FFF8EE] px-2 py-0.5 rounded-md hover:bg-[#E8623A]/10 transition-colors cursor-pointer">
              {tag}
            </span>
          ))}
        </div>

        {/* Actions */}
        <div className="flex items-center gap-4 pt-3 border-t border-[#F5EDD8]/60">
          {/* Sửa lại hàm onClick gọi tới API đồng bộ thực tế */}
          <button
            onClick={handleLikeClick}
            disabled={isLiking}
            className={`flex items-center gap-1.5 text-xs font-semibold transition-all duration-300 ${liked ? 'text-[#E8623A] scale-105' : 'text-[#7B7068] hover:text-[#E8623A]'}`}
          >
            <span className={`text-base transition-transform duration-300 ${liked ? 'scale-125' : ''}`}>
              {liked ? '❤️' : '🤍'}
            </span>
            {likesCount}
          </button>
          <span className="flex items-center gap-1.5 text-xs font-semibold text-[#7B7068]">
            💬 {post.comments}
          </span>
          <button className="ml-auto text-xs text-[#7B7068] hover:text-[#E8623A] transition-colors font-medium">
            Chia sẻ ↗
          </button>
        </div>
      </div>
    </article>
  );
};

/* ─── Main ForumPage ─── */
const ForumPage = () => {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [activeCategory, setActiveCategory] = useState('all');
  const [heroRef, heroVisible] = useInView(0.2);

  // Gọi API lấy danh sách bài viết thực tế khi component được load
  useEffect(() => {
    const fetchPosts = async () => {
      try {
        setLoading(true);
        const response = await forumApi.getPosts(1, 10);
        
        // Map dữ liệu từ Backend phục vụ cấu trúc UI của Frontend
        const realPosts = (response.data || []).map(p => ({
          ...p,
          category: p.category || 'review', 
          excerpt: p.summary || 'Không có mô tả ngắn.',
          author: p.author_name || 'Thành viên YumMap', 
          avatar: p.avatar_url || '🧑‍🍳',
          comments: p.reply_count || 0,
          likes: p.like_count || 0,
          tags: p.tags || ['#YumMap', '#FoodReview']
        }));
        
        setPosts(realPosts);
      } catch (error) {
        console.error("Lỗi khi tải bài viết:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchPosts();
  }, []);

  // Lọc bài viết theo danh mục (category) đã chọn
  const filteredPosts = activeCategory === 'all'
    ? posts
    : posts.filter(p => p.category === activeCategory);

  // Hiển thị trạng thái Loading khi đợi API
  if (loading) {
    return (
      <div className="min-h-screen bg-[#FAFAF7] flex items-center justify-center">
        <p className="text-[#7B7068] font-medium animate-pulse">Đang tải danh sách bài viết từ hệ thống...</p>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Hero Section */}
      <section
        ref={heroRef}
        className={`relative overflow-hidden bg-gradient-to-br from-[#2C1810] via-[#4A3728] to-[#2C1810] text-white py-16 sm:py-20 transition-all duration-1000 ${heroVisible ? 'opacity-100' : 'opacity-0'}`}
      >
        <div className="absolute -top-20 -right-20 w-72 h-72 bg-[#E8623A]/20 rounded-full blur-[100px] animate-pulse" />
        <div className="absolute -bottom-20 -left-20 w-60 h-60 bg-[#F5A623]/15 rounded-full blur-[80px] animate-pulse" style={{ animationDelay: '1s' }} />

        <div className="relative max-w-[1200px] mx-auto px-6 text-center">
          <span className="inline-block text-5xl mb-4 animate-bounce" style={{ animationDuration: '2s' }}>💬</span>
          <h1 className="font-iciel text-3xl sm:text-4xl lg:text-5xl font-extrabold mb-4 text-[#F4845A] pb-2">
            Diễn Đàn Ẩm Thực
          </h1>
          <p className="text-white/70 max-w-lg mx-auto text-sm sm:text-base leading-relaxed">
            Chia sẻ trải nghiệm, khám phá công thức và kết nối với cộng đồng yêu ẩm thực Việt Nam
          </p>

          {/* Stats */}
          <div className="flex items-center justify-center gap-6 mt-8">
            {[
              { number: '12.5K', label: 'Thành viên' },
              { number: posts.length || '3.2K', label: 'Bài viết' },
              { number: '18K', label: 'Bình luận' },
            ].map(stat => (
              <div key={stat.label} className="text-center">
                <p className="text-xl sm:text-2xl font-extrabold text-[#F4845A]">{stat.number}</p>
                <p className="text-[0.7rem] text-white/50 mt-0.5">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Main Content Container */}
      <div className="max-w-[1200px] mx-auto px-6 py-10">
        <div className="flex flex-col lg:flex-row gap-8">

          {/* Left: Content column */}
          <div className="flex-1 min-w-0">
            {/* Category pills */}
            <div className="flex items-center gap-2 overflow-x-auto scrollbar-none pb-4 mb-6">
              {CATEGORIES.map(cat => (
                <button
                  key={cat.id}
                  onClick={() => setActiveCategory(cat.id)}
                  className={`
                    flex items-center gap-1.5 px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap
                    transition-all duration-300
                    ${activeCategory === cat.id
                      ? 'bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white shadow-[0_4px_14px_rgba(232,98,58,0.3)] scale-105'
                      : 'bg-white text-[#4A3728] border border-[#F5EDD8] hover:border-[#E8623A]/30 hover:shadow-sm'}
                  `}
                >
                  <span>{cat.icon}</span>
                  {cat.label}
                </button>
              ))}
            </div>

            {/* Create new post widget */}
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-4 mb-6 flex items-center gap-3 hover:border-[#E8623A]/20 transition-colors cursor-pointer group">
              <div className="w-10 h-10 rounded-full bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-white text-lg">
                ✍️
              </div>
              <Link to="/forum/new-post" className="flex-1 text-sm text-[#C8BEB5] group-hover:text-[#7B7068] transition-colors">
                Bạn đang nghĩ gì về ẩm thực hôm nay?
              </Link>
              <Link to="/forum/new-post" className="px-4 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-xs font-bold shadow-sm hover:shadow-md transition-shadow">
                Đăng bài
              </Link>
            </div>

            {/* Posts Grid Layout */}
            <div className="grid gap-5">
              {filteredPosts.map((post, i) => (
                <PostCard key={post.id} post={post} index={i} />
              ))}
            </div>

            {/* Empty state view */}
            {filteredPosts.length === 0 && (
              <div className="text-center py-16">
                <span className="text-5xl block mb-3">🍃</span>
                <p className="text-[#7B7068] font-medium">Chưa có bài viết nào trong danh mục này</p>
              </div>
            )}
          </div>

          {/* Right: Sidebar column */}
          <aside className="w-full lg:w-80 flex-shrink-0 space-y-6">
            {/* Trending tags card */}
            <div className="bg-white rounded-2xl border border-[#F5EDD8] p-5">
              <h3 className="font-bold text-[#2C1810] mb-4 flex items-center gap-2">
                🔥 Xu hướng
              </h3>
              <div className="flex flex-wrap gap-2">
                {TRENDING_TAGS.map(tag => (
                  <span key={tag} className="px-3 py-1.5 rounded-full bg-[#FFF8EE] text-[#E8623A] text-xs font-semibold border border-[#F5EDD8] hover:bg-[#E8623A] hover:text-white transition-all duration-300 cursor-pointer">
                    {tag}
                  </span>
                ))}
              </div>
            </div>

            {/* Rules card */}
            <div className="bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] rounded-2xl border border-[#F5EDD8] p-5">
              <h3 className="font-bold text-[#2C1810] mb-3 flex items-center gap-2">
                📋 Nội quy
              </h3>
              <ul className="space-y-2 text-xs text-[#4A3728]">
                <li className="flex items-start gap-2"><span className="text-[#E8623A] mt-0.5">•</span> Tôn trọng mọi thành viên</li>
                <li className="flex items-start gap-2"><span className="text-[#E8623A] mt-0.5">•</span> Không spam hoặc quảng cáo</li>
                <li className="flex items-start gap-2"><span className="text-[#E8623A] mt-0.5">•</span> Chia sẻ nội dung chính chủ</li>
                <li className="flex items-start gap-2"><span className="text-[#E8623A] mt-0.5">•</span> Gắn tag phù hợp cho bài viết</li>
              </ul>
            </div>
          </aside>

        </div>
      </div>
    </div>
  );
};

export default ForumPage;
