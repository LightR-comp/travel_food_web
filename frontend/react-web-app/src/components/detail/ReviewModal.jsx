import { useState, useRef, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';

const ReviewModal = ({ isOpen, onClose, restaurantName, onReviewSubmitted }) => {
  const { id } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [overallRating, setOverallRating] = useState(0);
  const [hoverOverall, setHoverOverall] = useState(0);


  const [reviewText, setReviewText] = useState("");
  const [files, setFiles] = useState([]);
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isUploading, setIsUploading] = useState(false);
  
  const fileInputRef = useRef(null);

  // Reset form when modal opens/closes
  useEffect(() => {
    if (isOpen) {
      if (!user) {
        onClose();
        navigate('/login');
        return;
      }
      setOverallRating(0);
      setHoverOverall(0);
      setReviewText("");
      setFiles([]);
      setIsSubmitting(false);
    }
  }, [isOpen, user, navigate, onClose]);

  if (!isOpen || !user) return null;

  const handleFileChange = (e) => {
    const selectedFiles = Array.from(e.target.files);
    const imageFiles = selectedFiles.filter(f => f.type.startsWith('image/'));
    if (imageFiles.length > 0) {
      const newFiles = imageFiles.map(file => ({
        file,
        preview: URL.createObjectURL(file),
        type: 'image'
      }));
      setFiles(prev => [...prev, ...newFiles]);
    }
    // reset input
    e.target.value = null;
  };

  const removeFile = (index) => {
    setFiles(prev => {
      const updated = [...prev];
      URL.revokeObjectURL(updated[index].preview);
      updated.splice(index, 1);
      return updated;
    });
  };

  const handleSubmit = async () => {
    if (overallRating === 0) {
      alert("Vui lòng chọn số sao đánh giá tổng quan!");
      return;
    }
    
    try {
      const token = localStorage.getItem('yummap_token');
      if (!token) {
        alert("Vui lòng đăng nhập để đánh giá.");
        return;
      }

      let uploadedUrls = [];

      // Bước 1: Upload ảnh/video
      if (files.length > 0) {
        setIsUploading(true);
        
        const uploadPromises = files.map(async (item) => {
          const formData = new FormData();
          formData.append('image', item.file);

          const res = await fetch('/api/v1/posts/upload', {
            method: 'POST',
            headers: {
              'Authorization': `Bearer ${token}`
            },
            body: formData
          });

          const data = await res.json();
          if (!res.ok) {
            throw new Error(data.error || data.message || 'Upload ảnh thất bại');
          }
          return data.url;
        });

        uploadedUrls = await Promise.all(uploadPromises);
        setIsUploading(false);
      }

      // Bước 2: Gửi đánh giá
      setIsSubmitting(true);
      const reviewPayload = {
        rating: overallRating,
        comment: reviewText,
        images: uploadedUrls.map(url => ({ image_url: url }))
      };

      const reviewRes = await fetch(`/api/v1/restaurants/${id}/rating`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(reviewPayload)
      });

      const reviewData = await reviewRes.json();
      if (!reviewRes.ok || !reviewData.success) {
        throw new Error(reviewData.message || 'Gửi đánh giá thất bại');
      }

      onClose();
      if (onReviewSubmitted) onReviewSubmitted();

    } catch (error) {
      console.error(error);
      alert(`Lỗi: ${error.message}`);
    } finally {
      setIsUploading(false);
      setIsSubmitting(false);
    }
  };

  const getFullAvatarUrl = (avatarPath) => {
    if (!avatarPath) return null;
    if (avatarPath.startsWith('http')) return avatarPath;
    const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080';
    return `${API_BASE_URL}${avatarPath}`;
  };

  const StarIcon = ({ filled, onMouseEnter, onMouseLeave, onClick, size = "md" }) => {
    const baseClass = size === "lg" ? "w-10 h-10" : "w-7 h-7";
    return (
      <svg 
        className={`${baseClass} cursor-pointer transition-colors duration-200`}
        viewBox="0 0 24 24" 
        fill={filled ? "#F5A623" : "none"} 
        stroke={filled ? "#F5A623" : "#C4C4C4"} 
        strokeWidth="1.5"
        onMouseEnter={onMouseEnter}
        onMouseLeave={onMouseLeave}
        onClick={onClick}
      >
        <path strokeLinecap="round" strokeLinejoin="round" d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
      </svg>
    );
  };


  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 transition-opacity" onClick={!isSubmitting ? onClose : undefined}>
      <div 
        className="bg-[#FDF9F1] rounded-3xl w-full max-w-xl max-h-[90vh] flex flex-col relative transform transition-transform scale-100 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="p-4 pt-6 text-center relative">
          <h2 className="font-[Baloo_2,sans-serif] text-xl font-bold text-[#2C1810]">
            {restaurantName}
          </h2>
        </div>

        {/* Body */}
        <div className="px-6 pb-6 overflow-y-auto custom-scrollbar flex-1 space-y-5">
          
          {/* User Info */}
          <div className="flex items-center gap-3 mt-2">
            <div className="w-10 h-10 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
              {(user.avatar_url || user.avatar) ? (
                <img 
                  src={getFullAvatarUrl(user.avatar_url || user.avatar)} 
                  alt="Avatar" 
                  referrerPolicy="no-referrer" 
                  className="w-full h-full object-cover" 
                />
              ) : (
                <img 
                  src={`https://ui-avatars.com/api/?name=${encodeURIComponent(user.full_name || user.username || user.name || 'User')}&background=random`} 
                  alt="Avatar" 
                  referrerPolicy="no-referrer" 
                  className="w-full h-full object-cover" 
                />
              )}
            </div>
            <div>
              <p className="font-bold text-sm text-[#2C1810]">{user.full_name || user.username || user.name}</p>
              <p className="text-[11px] text-[#7B7068] flex items-center gap-1 mt-0.5">
                Đăng công khai trên YumMap
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <circle cx="12" cy="12" r="10"></circle>
                  <line x1="12" y1="16" x2="12" y2="12"></line>
                  <line x1="12" y1="8" x2="12.01" y2="8"></line>
                </svg>
              </p>
            </div>
          </div>

          {/* Overall Rating */}
          <div className="flex justify-center gap-1 py-1">
            {[1, 2, 3, 4, 5].map((star) => (
              <StarIcon 
                key={star}
                size="lg"
                filled={star <= (hoverOverall || overallRating)}
                onMouseEnter={() => setHoverOverall(star)}
                onMouseLeave={() => setHoverOverall(0)}
                onClick={() => setOverallRating(star)}
              />
            ))}
          </div>


          {/* Textarea */}
          <div>
            <textarea 
              className="w-full h-32 p-4 rounded-2xl border border-[#E8DFC9] bg-white resize-none focus:outline-none focus:border-[#F5A623] focus:ring-1 focus:ring-[#F5A623] placeholder-[#B5A496] text-[#2C1810] shadow-sm"
              placeholder="Mô tả cụ thể trải nghiệm của bạn tại địa điểm này"
              value={reviewText}
              onChange={(e) => setReviewText(e.target.value)}
            />
          </div>

          {/* Photos/Videos */}
          <div>
            <button 
              className="w-full flex items-center justify-center gap-2 py-3 rounded-2xl border border-[#E8DFC9] bg-white text-[#4A3728] font-semibold hover:bg-[#FDF9F1] hover:border-[#F5A623] hover:text-[#F5A623] transition-colors shadow-sm"
              onClick={() => fileInputRef.current?.click()}
            >
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#F5A623" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                <circle cx="8.5" cy="8.5" r="1.5"/>
                <polyline points="21 15 16 10 5 21"/>
              </svg>
              Thêm hình ảnh
            </button>
            <input 
              type="file" 
              multiple 
              accept="image/*" 
              className="hidden" 
              ref={fileInputRef} 
              onChange={handleFileChange}
            />

            {/* Previews */}
            {files.length > 0 && (
              <div className="flex gap-3 flex-wrap mt-4">
                {files.map((item, idx) => (
                  <div key={idx} className="relative w-20 h-20 rounded-xl overflow-hidden border border-[#D9D9D9] shadow-sm group">
                    <img src={item.preview} alt="preview" className="w-full h-full object-cover" />
                    <button 
                      className="absolute top-1 right-1 w-5 h-5 bg-black/60 text-white rounded-full flex items-center justify-center text-xs opacity-0 group-hover:opacity-100 transition-opacity hover:bg-black"
                      onClick={() => removeFile(idx)}
                    >
                      ✕
                    </button>
                  </div>
                ))}
              </div>
            )}
          </div>

        </div>

        {/* Footer */}
        <div className="p-4 flex justify-end gap-3 pt-0 pb-6 pr-6">
          <button 
            className="px-6 py-2.5 rounded-full font-semibold text-[#4A3728] hover:bg-[#F5EFE1] transition-colors"
            onClick={onClose}
            disabled={isSubmitting}
          >
            Huỷ
          </button>
          <button 
            className={`px-8 py-2.5 rounded-full font-semibold transition-colors flex items-center gap-2 ${
              overallRating > 0 && !isSubmitting && !isUploading
                ? 'bg-[#F5A623] text-white hover:bg-[#E8960A] shadow-md' 
                : 'bg-[#D9D9D9] text-white/70 cursor-not-allowed'
            }`}
            onClick={handleSubmit}
            disabled={overallRating === 0 || isSubmitting || isUploading}
          >
            {isUploading ? (
              <>
                <svg className="animate-spin h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Đang upload ảnh...
              </>
            ) : isSubmitting ? (
              <>
                <svg className="animate-spin h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Đang đăng...
              </>
            ) : "Đăng"}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ReviewModal;
