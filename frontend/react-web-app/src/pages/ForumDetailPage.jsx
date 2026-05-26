import { useState, useEffect, useRef } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { forumApi } from '../api/forumApi';

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

/* ─── Bản đồ danh mục ─── */
const CATEGORIES_MAP = {
  review: { label: 'Đánh giá', icon: '⭐', color: 'bg-[#E8623A]/10 text-[#E8623A]' },
  recipe: { label: 'Công thức', icon: '📖', color: 'bg-emerald-50 text-emerald-600' },
  tips:   { label: 'Mẹo vặt', icon: '💡', color: 'bg-amber-50 text-amber-600' },
  events: { label: 'Sự kiện', icon: '🎉', color: 'bg-purple-50 text-purple-600' },
  question: { label: 'Hỏi đáp', icon: '❓', color: 'bg-blue-50 text-blue-600' },
};

/* ─── Star rating ─── */
const StarDisplay = ({ score }) => {
  const full = Math.floor(score);
  const hasHalf = score % 1 >= 0.5;
  return (
    <span className="inline-flex items-center gap-0.5">
      {Array.from({ length: full }).map((_, i) => <span key={i} className="text-[#F5A623]">★</span>)}
      {hasHalf && <span className="text-[#F5A623]">★</span>}
      {Array.from({ length: 5 - full - (hasHalf ? 1 : 0) }).map((_, i) => <span key={`e${i}`} className="text-[#F5EDD8]">★</span>)}
      <span className="ml-1 text-xs font-bold text-[#4A3728]">{score}</span>
    </span>
  );
};

/* ─── Component hiển thị từng bình luận ─── */
const CommentItem = ({ comment, isReply = false, postId, onReplySubmit }) => {
  const [liked, setLiked] = useState(false);
  const [likesCount, setLikesCount] = useState(comment.like_count || 0);
  const [showReplyInput, setShowReplyInput] = useState(false);
  const [replyText, setReplyText] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [isLiking, setIsLiking] = useState(false);

  useEffect(() => {
    setLikesCount(comment.like_count || 0);
  }, [comment.like_count]);

  const formatCommentTime = (timeStr) => {
    if (!timeStr) return 'Vừa xong';
    const dateObj = new Date(timeStr);
    return isNaN(dateObj.getTime()) ? timeStr : dateObj.toLocaleDateString('vi-VN');
  };

  const handleLikeCommentClick = async () => {
    if (isLiking) return;
    try {
      setIsLiking(true);
      // Gọi API sang hàm vừa sửa ở Bước 1
      const response = await forumApi.likeComment(comment.id);
      const apiData = response.data ? response.data : response;

      setLiked(apiData.liked);
      setLikesCount(prev => apiData.liked ? prev + 1 : (prev > 0 ? prev - 1 : 0));
    } catch (error) {
      console.error("Lỗi khi tương tác nút like comment:", error);
      alert("Thao tác thất bại. Bạn vui lòng đăng nhập để thích bình luận.");
    } finally {
      setIsLiking(false);
    }
  };

  const handleReplySubmit = async () => {
    if (!replyText.trim() || submitting) return;
    try {
      setSubmitting(true);
      const response = await forumApi.addComment(postId, replyText, comment.id); 

      const apiReply = response.data ? response.data : response;

      const newReply = {
        id: Number(apiReply.id || apiReply.ID || Date.now()),
        content: replyText,
        author_name: 'Bạn', 
        avatar_url: '👤',
        parent_id: Number(comment.id),
        like_count: 0,
        created_at: new Date().toISOString(),
        replies: []
      };

      if (onReplySubmit) {
        onReplySubmit(comment.id, newReply);
      }

      setReplyText('');
      setShowReplyInput(false);
    } catch (err) {
      console.error("Lỗi gửi reply:", err);
      alert("Đăng phản hồi thất bại. Vui lòng kiểm tra lại đăng nhập.");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className={`${isReply ? 'ml-12 pl-4 border-l-2 border-[#F5EDD8]' : ''}`}>
      <div className="flex gap-3 group">
        <div className={`${isReply ? 'w-8 h-8 text-sm' : 'w-10 h-10 text-lg'} rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center flex-shrink-0 ring-2 ring-[#F5EDD8] group-hover:ring-[#E8623A]/20 transition-all duration-300`}>
          {comment.avatar_url || '👤'}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 mb-1">
            <span className="text-sm font-bold text-[#2C1810]">{comment.author_name || 'Thành viên'}</span>
            <span className="text-[0.65rem] text-[#C8BEB5]"> • </span>
            <span className="text-[0.65rem] text-[#7B7068]">{formatCommentTime(comment.created_at)}</span>
          </div>
          <p className="text-sm text-[#4A3728] leading-relaxed mb-2">{comment.content}</p>
          <div className="flex items-center gap-4">
            {/* Thay đổi hàm onClick gọi tới API đồng bộ database */}
            <button
              onClick={handleLikeCommentClick}
              disabled={isLiking}
              className={`flex items-center gap-1 text-xs font-semibold transition-all duration-300 ${
                liked
                  ? 'bg-[#E8623A] text-white shadow-[0_4px_14px_rgba(232,98,58,0.3)] scale-105 px-3 py-1.5 rounded-full'
                  : 'text-[#C8BEB5] hover:text-[#E8623A]'
              }`}
            >
              {liked ? '❤️' : '🤍'} {likesCount}
            </button>
            <button
              onClick={() => setShowReplyInput(!showReplyInput)}
              className="text-xs font-semibold text-[#C8BEB5] hover:text-[#E8623A] transition-colors"
            >
              💬 Trả lời
            </button>
          </div>

          {showReplyInput && (
            <div className="mt-3 flex gap-2 animate-fade-up">
              <input
                type="text"
                value={replyText}
                onChange={e => setReplyText(e.target.value)}
                onKeyDown={e => e.key === 'Enter' && handleReplySubmit()}
                placeholder="Viết trả lời..."
                disabled={submitting}
                className="flex-1 px-4 py-2 rounded-full bg-[#FFF8EE] border border-[#F5EDD8] text-sm text-[#2C1810] placeholder:text-[#C8BEB5] outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15 transition-all"
              />
              <button 
                onClick={handleReplySubmit}
                disabled={submitting || !replyText.trim()}
                className="px-4 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-xs font-bold hover:shadow-md transition-shadow disabled:opacity-50"
              >
                {submitting ? '...' : 'Gửi'}
              </button>
            </div>
          )}
        </div>
      </div>

      {comment.replies && comment.replies.length > 0 && (
        <div className="mt-4 space-y-4">
          {comment.replies.map(reply => (
            <CommentItem 
              key={reply.id} 
              comment={reply} 
              isReply={true} 
              postId={postId}
              onReplySubmit={onReplySubmit} 
            />
          ))}
        </div>
      )}
    </div>
  );
};

/* ─── Hàm dựng cây dữ liệu từ mảng thô phẳng ─── */
const buildCommentTree = (flatComments) => {
  if (!flatComments || flatComments.length === 0) return [];

  const commentMap = {};
  const roots = [];

  flatComments.forEach(comment => {
    const id = comment.id || comment.ID;
    commentMap[id] = { 
      id: Number(id),
      post_id: Number(comment.post_id || comment.PostID),
      author_id: Number(comment.author_id || comment.AuthorID),
      author_name: comment.author_name || comment.AuthorName || 'Thành viên',
      parent_id: comment.parent_id || comment.ParentID ? Number(comment.parent_id || comment.ParentID) : null,
      content: comment.content || comment.Content,
      like_count: comment.like_count || comment.LikeCount || 0,
      created_at: comment.created_at || comment.CreatedAt,
      avatar_url: comment.avatar_url || comment.AvatarUrl || '👤',
      replies: [] 
    };
  });

  flatComments.forEach(comment => {
    const id = Number(comment.id || comment.ID);
    const parentId = comment.parent_id || comment.ParentID ? Number(comment.parent_id || comment.ParentID) : null;
    const mappedComment = commentMap[id];

    if (parentId && parentId !== id) {
      if (commentMap[parentId]) {
        commentMap[parentId].replies.push(mappedComment);
      } else {
        roots.push(mappedComment);
      }
    } else {
      if (!parentId) roots.push(mappedComment);
    }
  });

  return roots;
};

/* ─── Hàm tính tổng số lượng bình luận chuẩn đệ quy ─── */
const countTotalComments = (commentsList) => {
  if (!commentsList) return 0;
  let count = 0;
  commentsList.forEach(c => {
    count++;
    if (c.replies && c.replies.length > 0) {
      count += countTotalComments(c.replies);
    }
  });
  return count;
};

/* ─── Component chính ForumDetailPage ─── */
const ForumDetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  
  const [post, setPost] = useState(null); 
  const [loading, setLoading] = useState(true); 
  const [liked, setLiked] = useState(false); 
  const [bookmarked, setBookmarked] = useState(false); 
  const [commentText, setCommentText] = useState(''); 
  const [submittingComment, setSubmittingComment] = useState(false);

  useEffect(() => { window.scrollTo({ top: 0, behavior: 'smooth' }); }, [id]);

  useEffect(() => {
    // 💡 Chặn bảo vệ nếu id từ URL không tồn tại (Ví dụ khi ở route /forum tổng)
    if (!id) {
      setLoading(false);
      return;
    }

    const fetchPostData = async () => {
      try {
        setLoading(true);
        const res = await forumApi.getPostDetail(id);
        const data = res.data ? res.data : res;

        if (!data) {
          setPost(null);
          return;
        }

        let parsedContent = [];
        const rawContent = data.content || data.Content;
        try {
          parsedContent = typeof rawContent === 'string' ? JSON.parse(rawContent) : rawContent;
        } catch (e) {
          parsedContent = [{ type: 'text', value: String(rawContent) }];
        }

        const rawComments = data.comments || data.Comments || [];
        const treeComments = buildCommentTree(rawComments);

        setPost({
          ...data,
          content: parsedContent,
          comments: treeComments 
        });
      } catch (err) {
        console.error("Lỗi lấy chi tiết bài viết:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchPostData();
  }, [id]);

  const handleLikeToggle = async () => {
    try {
      const data = await forumApi.likePost(id); 
      setLiked(data.liked); 
      setPost(prev => ({
        ...prev,
        like_count: data.like_count
      }));
    } catch (err) {
      alert("Không thể thực hiện thao tác thích bài viết. Vui lòng kiểm tra lại đăng nhập.");
    }
  };

  const handleCommentSubmit = async () => {
    if (!commentText.trim() || submittingComment) return;
    try {
      setSubmittingComment(true);
      const response = await forumApi.addComment(id, commentText); 

      const apiComment = response.data ? response.data : response;

      const newComment = {
        id: Number(apiComment.id || apiComment.ID || Date.now()),
        content: commentText,
        author_name: 'Bạn', 
        avatar_url: '👤',
        parent_id: null,
        replies: []
      }; 

      setPost(prev => ({
        ...prev,
        comments: [...(prev.comments || []), newComment]
      }));
      setCommentText(''); 
    } catch (err) {
      alert("Đăng bình luận thất bại. Bạn cần đăng nhập để thực hiện chức năng này.");
    } finally {
      setSubmittingComment(false);
    }
  };

  // 💡 CHẶN KHI ĐANG TẢI DỮ LIỆU
  if (loading) {
    return (
      <div className="min-h-screen bg-[#FAFAF7] flex items-center justify-center">
        <p className="text-[#4A3728] font-semibold animate-pulse">Đang tải nội dung bài viết...</p>
      </div>
    );
  }

  // 💡 CHẶN BẢO VỆ TUYỆT ĐỐI NẾU KHÔNG CÓ BÀI VIẾT (Link lỗi hoặc route tổng /forum)
  if (!post) {
    return (
      <div className="min-h-screen bg-[#FAFAF7] flex flex-col items-center justify-center gap-4">
        <span className="text-6xl">🍃</span>
        <h2 className="text-xl font-bold text-[#2C1810]">Bài viết không tồn tại</h2>
        <Link to="/forum" className="px-6 py-2.5 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity text-sm">
          ← Quay lại diễn đàn
        </Link>
      </div>
    );
  }

  const cat = CATEGORIES_MAP[post.category] || CATEGORIES_MAP['review'];

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Breadcrumb */}
      <FadeSection>
        <div className="bg-white border-b border-[#F5EDD8]/60">
          <div className="max-w-[1200px] mx-auto px-6 py-3 flex items-center gap-2 text-xs text-[#7B7068]">
            <Link to="/forum" className="hover:text-[#E8623A] transition-colors font-medium">💬 Diễn đàn</Link>
            <span className="text-[#C8BEB5]">/</span>
            <span className={`px-2 py-0.5 rounded-full text-[0.65rem] font-semibold ${cat?.color}`}>
              {cat?.icon} {cat?.label}
            </span>
            <span className="text-[#C8BEB5]">/</span>
            <span className="truncate max-w-[200px] text-[#4A3728] font-medium">{post.title}</span>
          </div>
        </div>
      </FadeSection>

      <div className="max-w-[1200px] mx-auto px-6 py-8">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main content */}
          <article className="flex-1 min-w-0">
            {/* Post header */}
            <FadeSection>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8 mb-6">
                <div className="flex items-center gap-3 mb-5">
                  <div className="w-12 h-12 rounded-full bg-gradient-to-br from-[#FFF8EE] to-[#FDECD8] flex items-center justify-center text-2xl ring-2 ring-[#F5EDD8]">
                    {post.avatar || '🧑‍🍳'}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-[#2C1810]">{post.author}</p>
                    <div className="flex items-center gap-2 text-xs text-[#7B7068]">
                      <span>{post.created_at ? new Date(post.created_at).toLocaleDateString('vi-VN') : 'Vừa xong'}</span>
                      <span className="w-1 h-1 rounded-full bg-[#C8BEB5]" />
                      <span>👁 {post.view_count || 0} lượt xem</span>
                    </div>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-xs font-semibold ${cat?.color}`}>
                    {cat?.icon} {cat?.label}
                  </span>
                </div>

                <h1 className="font-[Baloo_2,sans-serif] text-xl sm:text-2xl lg:text-3xl font-extrabold text-[#2C1810] mb-4 leading-tight">
                  {post.title}
                </h1>

                <div className="flex flex-wrap gap-2 mb-6">
                  {post.tags && post.tags.map(tag => (
                    <span key={tag} className="px-3 py-1 rounded-full bg-[#FFF8EE] text-[#E8623A] text-xs font-semibold border border-[#F5EDD8] hover:bg-[#E8623A] hover:text-white transition-all duration-300 cursor-pointer">
                      {tag}
                    </span>
                  ))}
                </div>

                {/* Content Render */}
                <div className="space-y-4">
                  {post.content && post.content.map((block, i) => {
                    if (block.type === 'heading') {
                      return (
                        <h2 key={i} className="text-lg font-bold text-[#2C1810] mt-6 mb-2 flex items-center gap-2 border-l-3 border-[#E8623A] pl-3">
                          {block.value}
                        </h2>
                      );
                    }
                    if (block.type === 'rating') {
                      return (
                        <div key={i} className="flex items-center gap-3 bg-[#FFF8EE] rounded-xl px-4 py-2">
                          <span className="text-sm font-semibold text-[#4A3728] w-24">{block.label}</span>
                          <StarDisplay score={block.score} />
                        </div>
                      );
                    }
                    return (
                      <p key={i} className="text-sm text-[#4A3728] leading-relaxed whitespace-pre-line">
                        {block.value}
                      </p>
                    );
                  })}
                </div>

                {/* Attached Images */}
                {post.images && post.images.length > 0 && (
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-6">
                    {post.images.map((img) => (
                      <div 
                        key={img.id || img.image_url} 
                        className="rounded-xl overflow-hidden border border-[#F5EDD8] shadow-sm bg-white aspect-video relative group cursor-pointer"
                        onClick={() => window.open(img.image_url, '_blank')}
                      >
                        <img
                          src={img.image_url}
                          alt="Attached content"
                          className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                        />
                      </div>
                    ))}
                  </div>
                )}

                {/* Action bar bài viết */}
                <div className="flex items-center gap-4 mt-8 pt-5 border-t border-[#F5EDD8]">
                  <button
                    onClick={handleLikeToggle}
                    className={`flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-bold transition-all duration-300 ${
                      liked
                        ? 'bg-[#E8623A] text-white shadow-[0_4px_14px_rgba(232,98,58,0.3)] scale-105'
                        : 'bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#E8623A]/30'
                    }`}
                  >
                    {liked ? '❤️' : '🤍'} {post.like_count || 0}
                  </button>
                  <button
                    onClick={() => setBookmarked(!bookmarked)}
                    className={`flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold transition-all duration-300 ${
                      bookmarked
                        ? 'bg-[#F5A623] text-white shadow-md'
                        : 'bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#F5A623]/30'
                    }`}
                  >
                    {bookmarked ? '🔖' : '📑'} {bookmarked ? 'Đã lưu' : 'Lưu bài'}
                  </button>
                  <button className="flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold bg-[#FFF8EE] text-[#4A3728] border border-[#F5EDD8] hover:border-[#E8623A]/30 transition-all duration-300 ml-auto">
                    ↗ Chia sẻ
                  </button>
                </div>
              </div>
            </FadeSection>

            {/* Comments section */}
            <FadeSection delay={100}>
              <div className="bg-white rounded-2xl border border-[#F5EDD8] p-6 sm:p-8">
                {/* 💡 Sử dụng hàm đếm tổng comment đệ quy */}
                <h2 className="font-[Baloo_2,sans-serif] text-lg font-extrabold text-[#2C1810] mb-6 flex items-center gap-2">
                  💬 Bình luận ({countTotalComments(post.comments)})
                </h2>

                {/* Ô nhập bình luận mới */}
                <div className="flex gap-3 mb-8 pb-6 border-b border-[#F5EDD8]/60">
                  <div className="w-10 h-10 rounded-full bg-gradient-to-br from-[#E8623A] to-[#C04D2B] flex items-center justify-center text-white text-sm font-bold flex-shrink-0">
                    U
                  </div>
                  <div className="flex-1">
                    <textarea
                      value={commentText}
                      onChange={e => setCommentText(e.target.value)}
                      placeholder="Viết bình luận..."
                      rows={3}
                      className="w-full px-4 py-3 rounded-xl bg-[#FFF8EE] border border-[#F5EDD8] text-sm text-[#2C1810] placeholder:text-[#C8BEB5] outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/15 transition-all resize-none"
                    />
                    <div className="flex justify-end mt-2">
                      <button 
                        onClick={handleCommentSubmit}
                        disabled={submittingComment || !commentText.trim()}
                        className="px-5 py-2 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full text-xs font-bold shadow-sm hover:shadow-md hover:-translate-y-0.5 transition-all duration-300 disabled:opacity-50"
                      >
                        {submittingComment ? 'Đang gửi...' : 'Gửi bình luận 📤'}
                      </button>
                    </div>
                  </div>
                </div>

                {/* Danh sách bình luận động */}
                <div className="space-y-6">
                  {post.comments && post.comments.map(comment => (
                    <CommentItem 
                      key={comment.id} 
                      comment={comment} 
                      postId={id}
                      onReplySubmit={(commentId, replyFromApi) => {
                        const apiReply = replyFromApi.data ? replyFromApi.data : replyFromApi;
                        
                        const newReply = {
                          id: Number(apiReply.id || apiReply.ID),
                          content: apiReply.content || apiReply.Content,
                          author_name: 'Bạn',
                          avatar_url: '👤',
                          parent_id: Number(commentId), // Gắn chuẩn ID của tầng vừa được bấm reply
                          like_count: 0,
                          created_at: new Date().toISOString(),
                          replies: []
                        };

                        setPost(prev => {
                          // Hàm đệ quy tìm kiếm sâu vào mọi ngóc ngách của cây bình luận
                          const updateTree = (list) => {
                            return list.map(c => {
                              if (Number(c.id) === Number(commentId)) {
                                // Tìm thấy đúng đích danh cha (dù ở tầng mấy), push con vào mảng replies của nó
                                return { ...c, replies: [...(c.replies || []), newReply] };
                              } else if (c.replies && c.replies.length > 0) {
                                // Nếu chưa thấy nhưng có nhánh con, chui tiếp vào tầng sâu hơn để tìm
                                return { ...c, replies: updateTree(c.replies) };
                              }
                              return c;
                            });
                          };
                          
                          return {
                            ...prev,
                            comments: updateTree(prev.comments || [])
                          };
                        });
                      }}
                    />
                  ))}
                </div>
              </div>
            </FadeSection>
          </article>

          {/* Sidebar */}
          <aside className="w-full lg:w-80 flex-shrink-0 space-y-6">
            <FadeSection delay={350}>
              <Link
                to="/forum"
                className="flex items-center justify-center gap-2 w-full py-3 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-2xl text-sm font-bold shadow-md hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300"
              >
                ← Quay lại Diễn đàn
              </Link>
            </FadeSection>
          </aside>
        </div>
      </div>
    </div>
  );
};

export default ForumDetailPage;