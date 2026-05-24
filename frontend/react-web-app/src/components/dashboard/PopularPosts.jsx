import { useNavigate } from 'react-router-dom';

const PostCard = ({ post }) => {
  const navigate = useNavigate();
  const { id, title, excerpt, author, date, image_url, restaurant_id } = post;

  return (
    <article
      className="bg-white rounded-2xl overflow-hidden shadow-sm hover:-translate-y-1 hover:shadow-md transition-all cursor-pointer group"
      onClick={() => navigate(`/forum/${id}`)}
      id={`post-card-${id}`}
    >
      {/* Image */}
      <div className="relative h-[220px] overflow-hidden">
        <img
          src={image_url}
          alt={title}
          loading="lazy"
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
        />
      </div>

      {/* Body */}
      <div className="p-5">
        <h3 className="text-base font-bold text-[#E8623A] leading-snug line-clamp-2 mb-2.5">{title}</h3>
        <p className="text-sm text-[#7B7068] leading-relaxed line-clamp-3 mb-4">{excerpt}</p>
        <div className="flex gap-4 text-xs text-[#C8BEB5] font-medium">
          <span>✍️ {author}</span>
          <span>📅 {date}</span>
        </div>
      </div>
    </article>
  );
};

const PopularPosts = ({ posts = [] }) => (
  <section className="py-12 bg-[#FFF8EE]" id="popular-posts">
    <div className="max-w-[1200px] mx-auto px-6">
      <div className="max-w-[960px] mx-auto">
        <div className="mb-6 text-right">
          <h2 className="font-iciel text-2xl font-extrabold text-[#2C1810] tracking-wide">
            BÀI ĐĂNG PHỔ BIẾN
          </h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {posts.map((post) => (
            <PostCard key={post.id} post={post} />
          ))}
        </div>
      </div>
    </div>
  </section>
);

export default PopularPosts;
