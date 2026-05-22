import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { getRestaurantByIdApi } from '../../api/restaurantApi';

const BioModal = ({ isOpen, onClose }) => {
  const { id } = useParams();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    if (!isOpen || !id) return;

    setLoading(true);
    setError(false);

    getRestaurantByIdApi(id)
      .then((res) => {
        if (res.success && res.data) {
          setData(res.data);
        } else {
          setError(true);
        }
      })
      .catch(() => {
        setError(true);
      })
      .finally(() => {
        setLoading(false);
      });
  }, [id, isOpen]);

  if (!isOpen) return null;

  // Xử lý Render Content
  const renderContent = () => {
    if (loading) {
      return (
        <div className="animate-pulse space-y-4">
          <div className="h-6 bg-gray-200 rounded w-1/3 mb-4"></div>
          <div className="w-full h-48 bg-gray-200 rounded-xl mb-4"></div>
          <div className="space-y-2">
            <div className="h-4 bg-gray-200 rounded w-full"></div>
            <div className="h-4 bg-gray-200 rounded w-full"></div>
            <div className="h-4 bg-gray-200 rounded w-5/6"></div>
          </div>
        </div>
      );
    }

    if (error) {
      return (
        <div className="p-6 bg-red-50 text-red-600 rounded-xl text-center border border-red-100">
          <p className="font-medium">Không thể tải tiểu sử</p>
        </div>
      );
    }

    const story = data?.story;
    
    if (!story || story.trim() === '') {
      return (
        <div className="p-8 bg-[#FAFAF7] text-[#7B7068] rounded-xl text-center border border-[#F5EDD8]">
          <p className="italic font-medium">Chưa có tiểu sử</p>
        </div>
      );
    }

    // Lấy ảnh minh hoạ (nếu có)
    let imageUrl = null;
    if (data?.images && data.images.length > 0) {
      imageUrl = data.images[0].image_url;
    }

    return (
      <section>
        <div className="flex items-center gap-3 mb-4">
          <div className="w-9 h-9 rounded-full bg-[#FFF8EE] flex items-center justify-center text-[#E8623A] shadow-sm">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M4 22h14a2 2 0 0 0 2-2V7.5L14.5 2H6a2 2 0 0 0-2 2v4" />
              <polyline points="14 2 14 8 20 8" />
              <path d="M2 15h10" />
              <path d="M9 18v-6H5v6z" />
            </svg>
          </div>
          <h3 className="text-lg font-bold text-[#2C1810]">Câu chuyện hình thành</h3>
        </div>

        {imageUrl && (
          <div className="w-full h-48 sm:h-64 rounded-2xl overflow-hidden mb-6 shadow-sm border border-[#F5EDD8]">
            <img 
              src={imageUrl} 
              alt="Minh hoạ" 
              className="w-full h-full object-cover hover:scale-105 transition-transform duration-500" 
              onError={(e) => { e.target.style.display = 'none'; }}
            />
          </div>
        )}

        <p className="text-[#4A3728] leading-relaxed text-[15px] bg-[#FAFAF7] p-5 rounded-2xl border border-[#F5EDD8] shadow-inner whitespace-pre-line">
          {story}
        </p>
      </section>
    );
  };

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 md:p-6 transition-opacity" onClick={onClose}>
      <div 
        className="bg-white rounded-3xl w-full max-w-2xl max-h-[90vh] overflow-hidden shadow-2xl flex flex-col relative transform transition-transform scale-100"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Modal Header */}
        <div className="flex items-center justify-between p-6 pb-4 border-b border-[#F5EDD8]">
          <div>
            <h2 className="font-[Baloo_2,sans-serif] text-2xl font-bold text-[#2C1810]">
              Tiểu sử {data ? data.name : ''}
            </h2>
            {data && data.address && (
              <p className="text-sm text-[#7B7068] mt-1 truncate max-w-[200px] sm:max-w-xs">
                {data.address}
              </p>
            )}
          </div>
          <button 
            onClick={onClose}
            className="w-10 h-10 rounded-full bg-[#FAFAF7] text-[#7B7068] flex items-center justify-center hover:bg-[#FDECE4] hover:text-[#E8623A] transition-colors flex-shrink-0"
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
              <line x1="18" y1="6" x2="6" y2="18" />
              <line x1="6" y1="6" x2="18" y2="18" />
            </svg>
          </button>
        </div>

        {/* Modal Body */}
        <div className="p-6 overflow-y-auto space-y-8" style={{ scrollbarWidth: 'thin' }}>
          {renderContent()}
        </div>
      </div>
    </div>
  );
};

export default BioModal;
