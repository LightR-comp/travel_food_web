import { useState, useEffect } from 'react';
import HeroBanner from '../components/dashboard/HeroBanner';
import FoodCardCarousel from '../components/dashboard/FoodCardCarousel';
import PopularPosts from '../components/dashboard/PopularPosts';
import AIRecommendModal from '../components/dashboard/AIRecommendModal';
import { Spinner } from '../components/ui/index.jsx';
import { getTrendingApi, getGoodSpotsApi, getPopularPostsApi } from '../api/restaurantApi';

const HomePage = () => {
  const [trending, setTrending] = useState([]);
  const [spots, setSpots] = useState([]);
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showRecommend, setShowRecommend] = useState(false);

  useEffect(() => {
    Promise.allSettled([getTrendingApi(), getGoodSpotsApi(), getPopularPostsApi()])
      .then(([tRes, sRes, pRes]) => {
        if (tRes.status === 'fulfilled') {
          const dishes = (tRes.value?.data?.dishes || []).map((item) => ({
            id: item.restaurant_info?.id,
            name: item.dish_info?.name,
            rating: item.restaurant_info?.rating,
            price_range: item.dish_info?.price,
            type: item.restaurant_info?.type,
            lat: item.restaurant_info?.lat,
            lng: item.restaurant_info?.lng,
            images: [item.dish_info?.image_url],
            badge: item.dish_info?.badge,
            is_open: item.restaurant_info?.is_open,
            open_time: item.restaurant_info?.open_time,
            close_time: item.restaurant_info?.close_time,
          }));
          setTrending(dishes);
        }
        if (sRes.status === 'fulfilled') {
          setSpots(sRes.value?.data?.restaurants || []);
        }
        if (pRes.status === 'fulfilled') {
          const rawPosts = Array.isArray(pRes.value?.data) ? pRes.value.data : [];
          const mappedPosts = rawPosts.map((post) => ({
            id: post.id,
            title: post.title,
            excerpt: post.summary || post.title,
            author: post.author_name || 'An danh',
            date: post.created_at ? new Date(post.created_at).toLocaleDateString('vi-VN') : '',
            image_url: post.thumbnail_url || 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&q=80',
            restaurant_id: post.restaurant_id || post.id,
          }));
          setPosts(mappedPosts);
        }
      })
      .finally(() => setLoading(false));
  }, []);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      <HeroBanner onOpenRecommend={() => setShowRecommend(true)} />

      {loading ? (
        <div className="flex justify-center items-center py-24">
          <Spinner size="lg" />
        </div>
      ) : (
        <main id="main-content">
          <FoodCardCarousel
            restaurants={trending}
            title="XU HƯỚNG"
            emoji="🔥"
            sectionId="top-trendings"
          />
          <PopularPosts posts={posts} />
          <FoodCardCarousel
            restaurants={spots}
            title="GOOD SPOTS FOR FOOD"
            sectionId="good-spots"
          />
        </main>
      )}

      {/* AI Recommend Modal */}
      {showRecommend && (
        <AIRecommendModal onClose={() => setShowRecommend(false)} />
      )}
    </div>
  );
};

export default HomePage;
