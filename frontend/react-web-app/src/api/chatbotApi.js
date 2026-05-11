import axiosInstance from './axiosInstance';
 
// ============================================================
// Chatbot API – Go backend
// Base URL (axiosInstance): http://localhost:8080/api/v1
// ============================================================
 
/**
 * POST /api/chat/message
 * Body: { user_id, message }
 * Response: { success, message, data: { reply, suggested_places }, error }
 */
export const sendChatMessageApi = async ({ user_id, message }) => {
  const { data } = await axiosInstance.post('/chat/message', { user_id, message });
  return data;
};
 
/**
 * GET /api/chat/history/:userId
 * Response: { success, message, data: { messages }, error }
 */
export const getChatHistoryApi = async (userId) => {
  const { data } = await axiosInstance.get(`/chat/history/${userId}`);
  return data;
};
 