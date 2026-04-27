import { useState, useRef, useEffect } from 'react';
import { sendChatMessageApi } from '../../api/chatbotApi';
import { useAuth } from '../../context/AuthContext';

// ---- Chat Bubble ----
const ChatBubble = ({ role, text, timestamp, suggestedPlaces = [] }) => {
  const isBot = role === 'bot';
  return (
    <div className={`flex items-end gap-2 ${isBot ? 'flex-row' : 'flex-row-reverse'}`}>
      {/* Avatar */}
      {isBot && (
        <div className="w-8 h-8 rounded-full bg-[#F9A899] flex items-center justify-center flex-shrink-0 text-sm">
          🤖
        </div>
      )}

      <div className={`max-w-[80%] flex flex-col gap-1 ${isBot ? 'items-start' : 'items-end'}`}>
        <div
          className={`
            px-3.5 py-2.5 rounded-2xl text-sm leading-relaxed
            ${isBot
              ? 'bg-[#FDECD8] text-[#3D1A0A] rounded-bl-sm'
              : 'bg-gradient-to-br from-[#F4836A] to-[#E85D42] text-white rounded-br-sm'}
          `}
        >
          {text}
        </div>

        {/* Suggested places cards */}
        {isBot && suggestedPlaces.length > 0 && (
          <div className="flex flex-col gap-2 mt-1 w-full">
            {suggestedPlaces.map(({ restaurant, ai_reason, tags }) => (
              <div key={restaurant.id} className="bg-white border border-[#F5EDD8] rounded-xl p-3 shadow-sm">
                <div className="flex items-center gap-2 mb-1.5">
                  {restaurant.image_url && (
                    <img src={restaurant.image_url} alt={restaurant.res_name} className="w-10 h-10 rounded-lg object-cover flex-shrink-0" />
                  )}
                  <span className="font-semibold text-xs text-[#2C1810]">{restaurant.res_name}</span>
                </div>
                {ai_reason && <p className="text-xs text-[#7B7068] italic">{ai_reason}</p>}
                {tags && (
                  <div className="flex flex-wrap gap-1 mt-1.5">
                    {tags.map((t) => (
                      <span key={t} className="text-[0.65rem] bg-[#FFF8EE] text-[#E8623A] px-2 py-0.5 rounded-full border border-[#F5EDD8]">{t}</span>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        {timestamp && (
          <span className="text-[0.65rem] text-[#C8BEB5]">{timestamp}</span>
        )}
      </div>

      {/* User avatar */}
      {!isBot && (
        <div className="w-8 h-8 rounded-full bg-[#E8623A] flex items-center justify-center flex-shrink-0 text-white font-bold text-xs">
          U
        </div>
      )}
    </div>
  );
};

// ---- Typing indicator ----
const TypingIndicator = () => (
  <div className="flex items-end gap-2">
    <div className="w-8 h-8 rounded-full bg-[#F9A899] flex items-center justify-center text-sm">🤖</div>
    <div className="bg-[#FDECD8] px-4 py-3 rounded-2xl rounded-bl-sm">
      <div className="flex gap-1 items-center">
        {[0, 1, 2].map((i) => (
          <span
            key={i}
            className="w-1.5 h-1.5 rounded-full bg-[#F4836A] animate-bounce"
            style={{ animationDelay: `${i * 0.15}s` }}
          />
        ))}
      </div>
    </div>
  </div>
);

// ---- Chatbot Modal ----
const ChatbotModal = ({ onClose }) => {
  const { user } = useAuth();
  const [messages, setMessages] = useState([
    { id: 1, role: 'bot', text: 'Xin chào! Tôi là trợ lý ẩm thực YumMap 🍜 Bạn muốn tìm quán gì hôm nay?', timestamp: 'Vừa xong', suggestedPlaces: [] },
    { id: 2, role: 'bot', text: 'Hãy cho tôi biết: ngân sách, số người, và bạn muốn ăn gì?', timestamp: null, suggestedPlaces: [] },
  ]);
  const [input, setInput] = useState('');
  const [typing, setTyping] = useState(false);
  const bodyRef = useRef(null);
  const inputRef = useRef(null);

  // Auto scroll to bottom
  useEffect(() => {
    if (bodyRef.current) bodyRef.current.scrollTop = bodyRef.current.scrollHeight;
  }, [messages, typing]);

  // Focus input on open
  useEffect(() => inputRef.current?.focus(), []);

  const handleSend = async () => {
    const msg = input.trim();
    if (!msg || typing) return;

    const userMsg = { id: Date.now(), role: 'user', text: msg, timestamp: null, suggestedPlaces: [] };
    setMessages((prev) => [...prev, userMsg]);
    setInput('');
    setTyping(true);

    try {
      const res = await sendChatMessageApi({ user_id: user?.id || 0, message: msg });
      const botMsg = {
        id: Date.now() + 1,
        role: 'bot',
        text: res.data.reply,
        timestamp: new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }),
        suggestedPlaces: res.data.suggested_places || [],
      };
      setMessages((prev) => [...prev, botMsg]);
    } catch {
      setMessages((prev) => [...prev, { id: Date.now() + 1, role: 'bot', text: '😅 Xin lỗi, có lỗi xảy ra. Vui lòng thử lại!', timestamp: null, suggestedPlaces: [] }]);
    } finally {
      setTyping(false);
    }
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); handleSend(); }
  };

  return (
    <div
      className="fixed bottom-[88px] right-7 z-[200] w-[340px] bg-white rounded-3xl shadow-2xl border border-[rgba(244,131,106,0.15)] flex flex-col overflow-hidden"
      style={{ animation: 'slideUp 0.3s ease', maxHeight: '480px' }}
      id="chatbot-modal"
    >
      {/* Header */}
      <div className="flex items-center gap-3 px-4 py-3.5 bg-gradient-to-r from-[#F4836A] to-[#E85D42] text-white flex-shrink-0">
        <div className="w-9 h-9 rounded-full bg-white/20 flex items-center justify-center text-xl">🤖</div>
        <div className="flex-1">
          <p className="font-bold text-sm">Trợ lý ẩm thực</p>
          <p className="text-xs opacity-80">YumMap AI • Đang hoạt động</p>
        </div>
        <button
          onClick={onClose}
          className="w-7 h-7 rounded-full bg-white/20 hover:bg-white/30 flex items-center justify-center text-sm transition-colors"
          aria-label="Đóng chatbot"
        >
          ✕
        </button>
      </div>

      {/* Date divider */}
      <div className="flex items-center gap-3 px-4 py-2 flex-shrink-0">
        <div className="flex-1 h-px bg-[#F5EDD8]" />
        <span className="text-[0.65rem] text-[#C8BEB5]">Th5. 4 Th 3</span>
        <div className="flex-1 h-px bg-[#F5EDD8]" />
      </div>

      {/* Messages body */}
      <div ref={bodyRef} className="flex-1 overflow-y-auto px-4 py-2 flex flex-col gap-3 min-h-0">
        {messages.map((m) => (
          <ChatBubble key={m.id} {...m} />
        ))}
        {typing && <TypingIndicator />}
      </div>

      {/* Input area */}
      <div className="flex items-center gap-2 px-3 py-3 border-t border-[#F5EDD8] flex-shrink-0 bg-white">
        <button className="w-8 h-8 rounded-full border border-[#F5EDD8] flex items-center justify-center text-[#7B7068] hover:border-[#E8623A] hover:text-[#E8623A] transition-colors flex-shrink-0 text-lg">
          +
        </button>
        <input
          ref={inputRef}
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="Nhập tin nhắn..."
          className="flex-1 bg-[#F5F5F5] rounded-full px-4 py-2 text-sm text-[#2C1810] outline-none focus:bg-white focus:ring-2 focus:ring-[rgba(244,131,106,0.3)] transition-all"
          id="chatbot-input"
        />
        <button
          onClick={handleSend}
          disabled={!input.trim() || typing}
          id="chatbot-send"
          className="w-8 h-8 rounded-full bg-[#F4836A] flex items-center justify-center text-white flex-shrink-0 hover:bg-[#E85D42] disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
        >
          <svg viewBox="0 0 24 24" fill="currentColor" className="w-4 h-4 translate-x-0.5">
            <path d="M2 21l21-9L2 3v7l15 2-15 2v7z" />
          </svg>
        </button>
      </div>
    </div>
  );
};

// ---- Floating Chatbot Button ----
export const ChatbotButton = ({ onClick, isOpen }) => (
  <button
    onClick={onClick}
    id="chatbot-btn"
    title="Gợi ý AI"
    className={`
      fixed bottom-7 right-7 z-[200]
      flex items-center gap-2
      bg-gradient-to-r from-[#E8623A] to-[#C04D2B] text-white
      px-5 py-3 rounded-full text-sm font-bold
      shadow-[0_8px_28px_rgba(232,98,58,0.4)]
      hover:-translate-y-0.5 hover:scale-[1.03] hover:shadow-[0_14px_36px_rgba(232,98,58,0.5)]
      transition-all duration-200
      ${!isOpen ? 'animate-pulse-glow' : ''}
    `}
  >
    <span className="text-xl">{isOpen ? '💬' : '🤖'}</span>
    <span>AI Gợi ý</span>
  </button>
);

export default ChatbotModal;
