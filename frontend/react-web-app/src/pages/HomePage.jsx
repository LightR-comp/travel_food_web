import { useState, useEffect } from 'react';
import HeroBanner from '../components/dashboard/HeroBanner';
import NavTabs from '../components/layout/NavTabs';
import FoodCardCarousel from '../components/dashboard/FoodCardCarousel';
import PopularPosts from '../components/dashboard/PopularPosts';
import { Spinner } from '../components/ui/index.jsx';
import { getTrendingApi, getGoodSpotsApi, getPopularPostsApi } from '../api/restaurantApi';

const HomePage = () => {
  const [trending, setTrending]     = useState([]);
  const [spots,    setSpots]        = useState([]);
  const [posts,    setPosts]        = useState([]);
  const [loading,  setLoading]      = useState(true);

  useEffect(() => {
    Promise.all([getTrendingApi(), getGoodSpotsApi(), getPopularPostsApi()])
      .then(([t, s, p]) => {
        setTrending(t.data.restaurants);
        setSpots(s.data.restaurants);
        setPosts(p.data.posts);
      })
      .finally(() => setLoading(false));
  }, []);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      <HeroBanner />
      <NavTabs />

      {loading ? (
        <div className="flex justify-center items-center py-24">
          <Spinner size="lg" />
        </div>
      ) : (
        <main id="main-content">
          <FoodCardCarousel
            restaurants={trending}
            title="TOP TRENDINGS"
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
    </div>
  );
};

export default HomePage;
