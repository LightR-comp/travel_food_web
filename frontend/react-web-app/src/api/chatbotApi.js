import axiosInstance from './axiosInstance';

export const sendChatMessageApi = async ({ user_id, message, image }) => {
  if (image) {
    const formData = new FormData();
    formData.append('user_id', String(user_id));
    formData.append('message', message || '');
    formData.append('image', image);

    const { data } = await axiosInstance.post('/chat/message', formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    });
    return data;
  }

  const { data } = await axiosInstance.post('/chat/message', { user_id, message });
  return data;
};

export const getChatHistoryApi = async (userId) => {
  const { data } = await axiosInstance.get(`/chat/history/${userId}`);
  return data;
};