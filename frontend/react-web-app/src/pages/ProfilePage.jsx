import { useState, useEffect, useRef } from 'react';
import { useAuth } from '../context/AuthContext';
import { Link } from 'react-router-dom';
import { getMeApi, updateProfileApi, uploadAvatarApi, deleteAvatarApi } from '../api/AuthAPI';

const ProfilePage = () => {
  const { user, updateUser } = useAuth();
  const [loading, setLoading] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [userData, setUserData] = useState(null);
  const [formData, setFormData] = useState({ full_name: '', email: '' });
  const [message, setMessage] = useState({ type: '', text: '' });
  const fileInputRef = useRef(null);
  
  // 👉 THÊM: State để force reload avatar
  const [avatarTimestamp, setAvatarTimestamp] = useState(Date.now());

  useEffect(() => {
    if (!user) return;
    const fetch = async () => {
      setLoading(true);
      try {
        const res = await getMeApi();
        if (res.success) {
          setUserData(res.data);
          setFormData({ full_name: res.data.name || '', email: res.data.email || '' });
        }
      } catch {
        setMessage({ type: 'error', text: 'Không thể tải thông tin người dùng' });
      } finally {
        setLoading(false);
      }
    };
    fetch();
  }, [user]);

  // 👉 THÊM: Helper function lấy URL avatar đầy đủ
  const getFullAvatarUrl = (avatarPath) => {
    if (!avatarPath) return null;
    if (avatarPath.startsWith('http')) return avatarPath;
    const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080';
    return `${API_BASE_URL}${avatarPath}`;
  };

  const handleAvatarUpload = async (file) => {
  if (!file) return;
  
  if (!file.type.startsWith('image/')) {
    setMessage({ type: 'error', text: 'Vui lòng chọn file ảnh' });
    return;
  }
  
  if (file.size > 5 * 1024 * 1024) {
    setMessage({ type: 'error', text: 'Ảnh không được vượt quá 5MB' });
    return;
  }
  
  setUploading(true);
  setMessage({ type: '', text: '' });
  
  try {
    const res = await uploadAvatarApi(file);
    console.log('Upload response:', res);
    
    if (res.success) {
      // ✅ Cập nhật từ response data
      let newAvatarUrl = null;
      let updatedUser = null;
      
      if (res.data?.avatar_url) {
        newAvatarUrl = res.data.avatar_url;
      }
      
      if (res.data?.user) {
        updatedUser = res.data.user;
      }
      
      if (updatedUser) {
        setUserData(updatedUser);
        updateUser(updatedUser);
      } else if (newAvatarUrl) {
        // Fallback: chỉ cập nhật avatar_url
        setUserData(prev => ({ ...prev, avatar_url: newAvatarUrl }));
        updateUser({ avatar_url: newAvatarUrl });
      } else {
        // Nếu không có data, gọi lại API
        const userRes = await getMeApi();
        if (userRes.success) {
          setUserData(userRes.data);
          updateUser(userRes.data);
        }
      }
      
      setAvatarTimestamp(Date.now());
      setMessage({ type: 'success', text: 'Cập nhật avatar thành công!' });
      setTimeout(() => setMessage({ type: '', text: '' }), 3000);
    } else {
      setMessage({ type: 'error', text: res.message || 'Upload thất bại' });
    }
  } catch (err) {
    console.error('Upload error:', err);
    setMessage({ type: 'error', text: err.response?.data?.message || 'Có lỗi xảy ra' });
  } finally {
    setUploading(false);
  }
};

  const handleDeleteAvatar = async () => {
    if (!confirm('Bạn có chắc muốn xóa avatar?')) return;
    
    setUploading(true);
    try {
      const res = await deleteAvatarApi();
      if (res.success) {
        const userRes = await getMeApi();
        if (userRes.success) {
          setUserData(userRes.data);
          updateUser({ avatar_url: null });
          // 👉 THÊM: Force reload avatar
          setAvatarTimestamp(Date.now());
        }
        setMessage({ type: 'success', text: 'Xóa avatar thành công!' });
        setTimeout(() => setMessage({ type: '', text: '' }), 3000);
      } else {
        setMessage({ type: 'error', text: res.message || 'Xóa thất bại' });
      }
    } catch (err) {
      console.error('Delete avatar error:', err);
      setMessage({ type: 'error', text: err.response?.data?.message || 'Có lỗi xảy ra' });
    } finally {
      setUploading(false);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleUpdateProfile = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMessage({ type: '', text: '' });
    try {
      const res = await updateProfileApi({ name: formData.full_name });
      if (res.success) {
        setMessage({ type: 'success', text: 'Cập nhật thông tin thành công!' });
        setIsEditing(false);
        updateUser({ name: formData.full_name });
        setUserData(prev => ({ ...prev, name: formData.full_name }));
        // 👉 THÊM: Tự động ẩn thông báo sau 3 giây
        setTimeout(() => setMessage({ type: '', text: '' }), 3000);
      } else {
        setMessage({ type: 'error', text: res.message || 'Cập nhật thất bại' });
      }
    } catch (err) {
      console.error('Update profile error:', err);
      setMessage({ type: 'error', text: err.response?.data?.message || 'Có lỗi xảy ra' });
    } finally {
      setLoading(false);
    }
  };

  const handleCancelEdit = () => {
    setIsEditing(false);
    setFormData({ full_name: userData?.name || '', email: userData?.email || '' });
  };

  if (!user) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4">
        <div className="text-6xl">🔒</div>
        <h2 className="text-2xl font-bold text-[#2C1810]">Vui lòng đăng nhập</h2>
        <p className="text-[#7B7068]">Bạn cần đăng nhập để xem trang cá nhân</p>
        <Link to="/login" className="px-6 py-2.5 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity">
          Đăng nhập ngay
        </Link>
      </div>
    );
  }

  if (loading && !userData) {
    return (
      <div className="flex justify-center items-center min-h-[60vh]">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#E8623A]" />
      </div>
    );
  }

  const displayName = userData?.name || user?.name || 'U';
  const displayEmail = userData?.email || user?.email || '';
  const avatarUrl = userData?.avatar_url || user?.avatar_url;
  const fullAvatarUrl = getFullAvatarUrl(avatarUrl);
  const initials = displayName[0]?.toUpperCase() || 'U';

  return (
    <div className="max-w-[1200px] mx-auto px-6 py-8">
      <div className="bg-white rounded-2xl shadow-lg border border-[#F5EDD8] overflow-hidden">

        <div className="bg-gradient-to-r from-[#E8623A] to-[#C04D2B] px-6 py-8">
          <div className="flex items-center gap-4">

            <div className="relative group">
              <div className="w-20 h-20 rounded-full bg-white/20 backdrop-blur flex items-center justify-center text-white text-3xl font-bold overflow-hidden">
                {fullAvatarUrl ? (
                  <img 
                    src={`${fullAvatarUrl}?t=${avatarTimestamp}`} 
                    alt="avatar" 
                    className="w-full h-full object-cover"
                    onError={(e) => {
                      console.error('Avatar load error:', e.target.src);
                      e.target.src = '';
                      e.target.onerror = null;
                    }}
                  />
                ) : (
                  initials
                )}
              </div>
              {uploading && (
                <div className="absolute inset-0 rounded-full bg-black/50 flex items-center justify-center">
                  <div className="w-6 h-6 border-2 border-white border-t-transparent rounded-full animate-spin" />
                </div>
              )}
              <button
                onClick={() => fileInputRef.current?.click()}
                disabled={uploading}
                className="absolute inset-0 rounded-full bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-white text-xs font-medium disabled:opacity-0"
              >
                📷
              </button>
              <input
                ref={fileInputRef}
                type="file"
                accept="image/*"
                className="hidden"
                onChange={async (e) => {
                  const file = e.target.files[0];
                  if (!file) return;
                  await handleAvatarUpload(file);
                  e.target.value = '';
                }}
              />
            </div>

            <div className="flex-1">
              <h1 className="text-2xl font-bold text-white">{displayName}</h1>
              <p className="text-white/80 text-sm">{displayEmail}</p>
            </div>

            <div className="flex gap-2">
              {fullAvatarUrl && (
                <button
                  onClick={handleDeleteAvatar}
                  disabled={uploading}
                  className="px-3 py-2 bg-white/20 hover:bg-white/30 rounded-full text-white text-sm transition-colors disabled:opacity-50"
                  title="Xóa avatar"
                >
                  🗑️
                </button>
              )}
              {!isEditing && (
                <button
                  onClick={() => setIsEditing(true)}
                  className="px-4 py-2 bg-white/20 hover:bg-white/30 rounded-full text-white text-sm font-semibold transition-colors"
                >
                  ✏️ Chỉnh sửa
                </button>
              )}
            </div>
          </div>
        </div>

        <div className="p-6">
          {message.text && (
            <div className={`mb-6 p-4 rounded-xl ${
              message.type === 'success'
                ? 'bg-green-50 text-green-700 border border-green-200'
                : 'bg-red-50 text-red-700 border border-red-200'
            }`}>
              {message.text}
            </div>
          )}

          {isEditing ? (
            <form onSubmit={handleUpdateProfile} className="space-y-6">
              <div>
                <h2 className="text-lg font-semibold text-[#2C1810] mb-3">Chỉnh sửa thông tin</h2>
                <div className="bg-[#FFF8EE] rounded-xl p-4 space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-[#4A3728] mb-1">Họ và tên</label>
                    <input
                      type="text"
                      name="full_name"
                      value={formData.full_name}
                      onChange={handleInputChange}
                      className="w-full px-4 py-2 border border-[#F5EDD8] rounded-lg focus:outline-none focus:border-[#E8623A] focus:ring-2 focus:ring-[#E8623A]/20 bg-white"
                      placeholder="Nhập họ và tên"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#4A3728] mb-1">Email</label>
                    <input
                      type="email"
                      name="email"
                      value={formData.email}
                      disabled
                      className="w-full px-4 py-2 border border-[#F5EDD8] rounded-lg bg-gray-100 text-gray-500 cursor-not-allowed"
                    />
                    <p className="text-xs text-[#7B7068] mt-1">Email không thể thay đổi</p>
                  </div>
                </div>
              </div>

              <div className="flex gap-3">
                <button
                  type="submit"
                  disabled={loading}
                  className="px-6 py-2.5 bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white rounded-full font-semibold hover:opacity-90 transition-opacity disabled:opacity-50"
                >
                  {loading ? 'Đang lưu...' : 'Lưu thay đổi'}
                </button>
                <button
                  type="button"
                  onClick={handleCancelEdit}
                  className="px-6 py-2.5 border border-[#E8623A] text-[#E8623A] rounded-full font-semibold hover:bg-[#E8623A]/10 transition-colors"
                >
                  Hủy
                </button>
              </div>
            </form>
          ) : (
            <div className="space-y-6">
              <div>
                <h2 className="text-lg font-semibold text-[#2C1810] mb-3">Thông tin cá nhân</h2>
                <div className="bg-[#FFF8EE] rounded-xl p-4 space-y-3">
                  <div className="flex flex-col sm:flex-row sm:justify-between py-2 border-b border-[#F5EDD8]">
                    <span className="text-[#7B7068]">Email:</span>
                    <span className="font-medium text-[#2C1810]">{displayEmail}</span>
                  </div>
                  <div className="flex flex-col sm:flex-row sm:justify-between py-2">
                    <span className="text-[#7B7068]">Họ và tên:</span>
                    <span className="font-medium text-[#2C1810]">{displayName}</span>
                  </div>
                  {/* 👉 THÊM: Hiển thị thông tin avatar URL để debug */}
                  {fullAvatarUrl && (
                    <div className="flex flex-col sm:flex-row sm:justify-between py-2 border-t border-[#F5EDD8] mt-2 pt-2">
                      <span className="text-[#7B7068] text-sm">Avatar URL:</span>
                      <span className="font-mono text-xs text-[#2C1810] break-all">{fullAvatarUrl}</span>
                    </div>
                  )}
                </div>
              </div>

              <div>
                <h2 className="text-lg font-semibold text-[#2C1810] mb-3">Hoạt động gần đây</h2>
                <div className="bg-[#FFF8EE] rounded-xl p-8 text-center text-[#7B7068]">
                  🍽️ Chưa có hoạt động nào
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default ProfilePage;