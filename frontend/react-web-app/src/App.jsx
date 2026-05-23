import { useState } from 'react';
import { BrowserRouter, Routes, Route, useLocation } from 'react-router-dom';
import { AuthProvider } from './context/AuthContext';
import { LocationProvider } from './context/LocationContext';
import Header from './components/layout/Header';
import Footer from './components/layout/Footer';
import NavTabs from './components/layout/NavTabs';
import ChatbotModal, { ChatbotButton } from './components/chatbot/ChatbotModal';

// ---- Pages ----
import HomePage   from './pages/HomePage';
import SearchPage from './pages/SearchPage';
import DetailPage from './pages/DetailPage';
import LoginPage  from './pages/LoginPage';
import SignupPage from './pages/SignupPage';
import ForumPage  from './pages/ForumPage';
import ForumDetailPage from './pages/ForumDetailPage';
import ForumPostPage from './pages/ForumPostPage';
import AboutPage  from './pages/AboutPage';
import ContactPage from './pages/ContactPage';
import PolicyPage from './pages/PolicyPage';
import SupportPage from './pages/SupportPage';
import TermsPage  from './pages/TermsPage';
import ProfilePage from './pages/ProfilePage';

// Pages that should NOT show the main layout (header/footer/chatbot)
const AUTH_ROUTES = ['/login', '/signup'];

const AppLayout = () => {
  const location = useLocation();
  const isAuthPage = AUTH_ROUTES.includes(location.pathname);
  const [chatOpen, setChatOpen] = useState(false);

  if (isAuthPage) {
    return (
      <Routes>
        <Route path="/login"  element={<LoginPage />} />
        <Route path="/signup" element={<SignupPage />} />
      </Routes>
    );
  }

  return (
    <div className="flex flex-col min-h-screen pb-20">
      <Header />
      <NavTabs />

      <main className="flex-1">
        <Routes>
          <Route path="/"          element={<HomePage />} />
          <Route path="/search"    element={<SearchPage />} />
          <Route path="/detail/:id" element={<DetailPage />} />
          <Route path="/profile" element={<ProfilePage />} />
          <Route path="/forum"     element={<ForumPage />} />
          <Route path="/forum/new-post" element={<ForumPostPage />} />
          <Route path="/forum/:id" element={<ForumDetailPage />} />
          <Route path="/about"     element={<AboutPage />} />
          <Route path="/contact"   element={<ContactPage />} />
          <Route path="/policy"    element={<PolicyPage />} />
          <Route path="/support"   element={<SupportPage />} />
          <Route path="/terms"     element={<TermsPage />} />
          {/* Catch-all */}
          <Route path="*" element={
            <div className="flex flex-col items-center justify-center min-h-[60vh] gap-4">
              <div className="text-6xl">🍽️</div>
              <h2 className="text-2xl font-bold text-[#2C1810]">Trang không tồn tại</h2>
              <a href="/" className="px-6 py-2.5 bg-[#E8623A] text-white rounded-full font-semibold hover:opacity-90 transition-opacity">
                Về trang chủ
              </a>
            </div>
          } />
        </Routes>
      </main>

      <Footer />

      {/* Floating Chatbot */}
      {chatOpen && <ChatbotModal onClose={() => setChatOpen(false)} />}
      <ChatbotButton onClick={() => setChatOpen((v) => !v)} isOpen={chatOpen} />
    </div>
  );
};

const App = () => (
  <BrowserRouter>
    <AuthProvider>
      <LocationProvider>
        <AppLayout />
      </LocationProvider>
    </AuthProvider>
  </BrowserRouter>
);

export default App;
