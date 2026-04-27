import axiosInstance from './axiosInstance';

// ============================================================
// Chatbot API – maps to Python AI service via Go proxy
// POST /api/chat/message  (Go proxies to Python RAG)
// ============================================================

const BOT_REPLIES = [
  { reply: 'Dạ, em đang tìm kiếm cho bạn những địa điểm phù hợp nhất... 🔍', suggested_places: [] },
  { reply: 'Với ngân sách đó, em gợi ý bạn thử **Bánh mì Huỳnh Hoa** – nổi tiếng và giá cả phải chăng! 🥖', suggested_places: [{ restaurant: { id: 1, res_name: 'Bánh mì Huỳnh Hoa', image_url: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300&q=80' }, ai_reason: 'Bánh mì thập cẩm nhân dày, giá hợp lý', allergy_friendly: true, tags: ['Giá rẻ', 'Nổi tiếng'] }] },
  { reply: 'Bạn có thể thử **Cơm tấm Sà Bì Chưởng**, quán rất đông khách và chất lượng ổn định 🍚', suggested_places: [] },
  { reply: 'Nếu bạn thích đồ uống, **TuTiMi** có trà sữa ngon và không gian thoải mái ☕', suggested_places: [] },
  { reply: 'Bún bò Huế là lựa chọn tuyệt vời nếu bạn muốn ăn no và đậm đà hương vị miền Trung! 🍜', suggested_places: [] },
  { reply: 'Em cần thêm thông tin về sở thích của bạn để gợi ý chính xác hơn 😊 Bạn muốn ăn gì và ngân sách khoảng bao nhiêu?', suggested_places: [] },
];

let replyIndex = 0;

/**
 * POST /api/chat/message
 * Matches the chatbot workflow in API-CONTRACT.md (Stage 1 → 4)
 */
export const sendChatMessageApi = async ({ user_id, message }) => {
  // --- MOCK ---
  await new Promise((r) => setTimeout(r, 900 + Math.random() * 600));
  const response = BOT_REPLIES[replyIndex % BOT_REPLIES.length];
  replyIndex++;
  return {
    success: true,
    message: 'Thành công',
    data: {
      reply: response.reply,
      suggested_places: response.suggested_places,
    },
    error: null,
  };

  // --- REAL (uncomment when backend ready) ---
  // const { data } = await axiosInstance.post('/chat/message', { user_id, message });
  // return data;
};

/**
 * GET /api/chat/history/:userId
 */
export const getChatHistoryApi = async (userId) => {
  await new Promise((r) => setTimeout(r, 300));
  return { success: true, data: { messages: [] }, error: null };
  // const { data } = await axiosInstance.get(`/chat/history/${userId}`);
  // return data;
};
