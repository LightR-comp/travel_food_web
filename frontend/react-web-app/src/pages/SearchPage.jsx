import { useState, useEffect, useCallback } from 'react';
import { useSearchParams } from 'react-router-dom';
import SearchSidebar, { SORT_OPTIONS } from '../components/search/SearchSidebar';
import RestaurantListItem from '../components/search/RestaurantListItem';
import { Spinner } from '../components/ui/index.jsx';
import { searchRestaurantsApi } from '../api/restaurantApi';
import { debounce } from '../utils/formatters';
import { useLocation as useGeoLocation } from '../context/LocationContext';

const SearchPage = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const initialQ = searchParams.get('q') || '';

  const [query, setQuery] = useState(initialQ);
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);
  const [priceRange, setPriceRange] = useState([0, 1000000]);
  const [filters, setFilters] = useState([]);
  const [sort, setSort] = useState('rating');
  const [total, setTotal] = useState(0);
  
  const geoLocation = useGeoLocation();

  const fetchResults = useCallback(
    debounce(async (q, price, flt, srt, lat, lng) => {
      setLoading(true);
      setError(false);
      try {
        const res = await searchRestaurantsApi({
          q,
          min_price: price[0],
          max_price: price[1],
          filters: flt.join(','),
          sort_by: srt,
          lat: lat || undefined,
          lng: lng || undefined,
        });
        if (res.success === false) {
          setResults([]);
          setTotal(0);
        } else {
          setResults(res.data?.restaurants || []);
          setTotal(res.data?.total || 0);
        }
      } catch (err) {
        setError(true);
      } finally {
        setLoading(false);
      }
    }, 400),
    []
  );

  useEffect(() => {
    fetchResults(query, priceRange, filters, sort, geoLocation.lat, geoLocation.lon);
  }, [query, priceRange, filters, sort, geoLocation.lat, geoLocation.lon]);

  // Sync query to URL
  useEffect(() => {
    if (query) setSearchParams({ q: query });
    else setSearchParams({});
  }, [query]);

  const toggleFilter = (id) =>
    setFilters((prev) => prev.includes(id) ? prev.filter((f) => f !== id) : [...prev, id]);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">

      <div className="max-w-[1200px] mx-auto px-6 py-8">
        <div className="flex gap-8 flex-col lg:flex-row">

          {/* Sidebar */}
          <SearchSidebar
            priceRange={priceRange}
            onPriceChange={setPriceRange}
            filters={filters}
            onFilterToggle={toggleFilter}
            sort={sort}
            onSortChange={setSort}
          />

          {/* Results */}
          <div className="flex-1">
            {/* Search header */}
            <div className="mb-6 flex items-center justify-between flex-wrap gap-4">
              <div className="flex items-center gap-2 flex-wrap">
                <h1 className="font-[Baloo_2,sans-serif] text-lg font-bold text-[#E8623A]">
                  Search results for{' '}
                  <em className="font-androgyne text-2xl not-italic font-normal">
                    "{query || 'Tất cả'}"
                  </em>
                </h1>
                {!loading && (
                  <span className="text-sm text-[#7B7068] ml-2">({total} kết quả)</span>
                )}
              </div>

              {/* Sort dropdown */}
              <div className="hidden lg:flex items-center gap-2">
                <span className="text-sm text-[#7B7068]">Sắp xếp theo:</span>
                <select
                  value={sort}
                  onChange={(e) => setSort(e.target.value)}
                  className="border border-[#E8D5C0] rounded-xl px-3 py-1.5 text-sm bg-white text-[#4A3728] outline-none focus:border-[#E8623A] cursor-pointer shadow-sm"
                >
                  {SORT_OPTIONS.map((o) => (
                    <option key={o.value} value={o.value}>{o.label}</option>
                  ))}
                </select>
              </div>
            </div>

            {/* Search input */}
            <div className="flex items-center bg-white border border-[#F5EDD8] rounded-2xl px-4 py-3 gap-3 mb-6 shadow-sm">
              <svg viewBox="0 0 24 24" fill="none" stroke="#7B7068" strokeWidth="2" className="w-4 h-4 flex-shrink-0">
                <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
              </svg>
              <input
                type="text"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Tìm kiếm món ăn, nhà hàng..."
                className="flex-1 outline-none text-sm text-[#2C1810] placeholder:text-[#C8BEB5] bg-transparent"
                id="search-input"
              />
              {query && (
                <button onClick={() => setQuery('')} className="text-[#C8BEB5] hover:text-[#7B7068] transition-colors">✕</button>
              )}
            </div>

            {loading ? (
              <div className="flex flex-col gap-5">
                {[1, 2, 3].map((i) => (
                  <div key={i} className="flex gap-5 bg-white border border-[#F5EDD8] rounded-2xl p-4 animate-pulse">
                    <div className="w-[180px] h-[160px] bg-gray-200 rounded-[14px]"></div>
                    <div className="flex-1 py-2">
                      <div className="h-6 bg-gray-200 rounded w-1/3 mb-4"></div>
                      <div className="h-4 bg-gray-200 rounded w-1/4 mb-4"></div>
                      <div className="h-4 bg-gray-200 rounded w-2/3 mb-4"></div>
                      <div className="h-4 bg-gray-200 rounded w-1/2"></div>
                    </div>
                  </div>
                ))}
              </div>
            ) : error ? (
              <div className="text-center py-16 text-red-500">
                <p className="font-semibold">Không thể tải danh sách quán</p>
              </div>
            ) : results.length === 0 ? (
              <div className="text-center py-16 text-[#7B7068]">
                <p className="font-semibold">Không tìm thấy quán nào phù hợp</p>
              </div>
            ) : (
              <div className="flex flex-col gap-5" id="results-list">
                {results.map((r) => (
                  <RestaurantListItem key={r.id} restaurant={r} />
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default SearchPage;
