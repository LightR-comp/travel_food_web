import { useState, useEffect, useCallback } from 'react';
import { useSearchParams } from 'react-router-dom';
import SearchSidebar, { SORT_OPTIONS } from '../components/search/SearchSidebar';
import RestaurantListItem from '../components/search/RestaurantListItem';
import { Spinner } from '../components/ui/index.jsx';
import { searchRestaurantsApi } from '../api/restaurantApi';
import { debounce } from '../utils/formatters';

const SearchPage = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const initialQ = searchParams.get('q') || '';

  const [query,      setQuery]      = useState(initialQ);
  const [results,    setResults]    = useState([]);
  const [loading,    setLoading]    = useState(false);
  const [priceRange, setPriceRange] = useState([0, 1000000]);
  const [filters,    setFilters]    = useState([]);
  const [sort,       setSort]       = useState('rating');
  const [total,      setTotal]      = useState(0);

  const fetchResults = useCallback(
    debounce(async (q, price, flt, srt) => {
      setLoading(true);
      try {
        const res = await searchRestaurantsApi({
          q,
          min_price: price[0],
          max_price: price[1],
          filters: flt.join(','),
          sort: srt,
        });
        setResults(res.data.restaurants);
        setTotal(res.data.total);
      } finally {
        setLoading(false);
      }
    }, 400),
    []
  );

  useEffect(() => {
    fetchResults(query, priceRange, filters, sort);
  }, [query, priceRange, filters, sort]);

  // Sync query to URL
  useEffect(() => {
    if (query) setSearchParams({ q: query });
    else setSearchParams({});
  }, [query]);

  const toggleFilter = (id) =>
    setFilters((prev) => prev.includes(id) ? prev.filter((f) => f !== id) : [...prev, id]);

  return (
    <div className="min-h-screen bg-[#FAFAF7]">
      {/* Clean header bar (matches Search.png) */}
      <div className="bg-[#F5EDD8] border-b border-[#EDD8C0] py-3 px-6">
        <div className="max-w-[1200px] mx-auto flex items-center justify-between flex-wrap gap-3">
          {/* Nav links */}
          <nav className="flex gap-8 text-sm font-medium text-[#4A3728]">
            {['Home', 'Search', 'Forum', 'About us', 'Support'].map((item) => (
              <a
                key={item}
                href={item === 'Home' ? '/' : item === 'Search' ? '/search' : '#'}
                className={`hover:text-[#E8623A] transition-colors ${item === 'Search' ? 'text-[#E8623A] font-bold' : ''}`}
              >
                {item}
              </a>
            ))}
          </nav>

          {/* Sort dropdown (desktop) */}
          <div className="hidden lg:flex items-center gap-2">
            <span className="text-sm text-[#7B7068]">Sắp xếp theo:</span>
            <select
              value={sort}
              onChange={(e) => setSort(e.target.value)}
              className="border border-[#E8D5C0] rounded-xl px-3 py-1.5 text-sm bg-[#FFF8EE] text-[#4A3728] outline-none focus:border-[#E8623A] cursor-pointer"
            >
              {SORT_OPTIONS.map((o) => (
                <option key={o.value} value={o.value}>{o.label}</option>
              ))}
            </select>
          </div>
        </div>
      </div>

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
            <div className="mb-6 flex items-center gap-2 flex-wrap">
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
              <div className="flex justify-center py-16"><Spinner size="lg" /></div>
            ) : results.length === 0 ? (
              <div className="text-center py-16 text-[#7B7068]">
                <div className="text-5xl mb-3">🔍</div>
                <p className="font-semibold">Không tìm thấy kết quả nào</p>
                <p className="text-sm mt-1">Thử tìm với từ khóa khác nhé!</p>
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
