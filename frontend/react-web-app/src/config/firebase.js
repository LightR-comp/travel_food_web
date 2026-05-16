import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';
import {
  getAuth,
  GoogleAuthProvider,
  FacebookAuthProvider,
  signInWithPopup,
  signOut,
} from 'firebase/auth';

const firebaseConfig = {
  apiKey:            "AIzaSyAC9FFEliG2FFIjuXa9ZinbBLgGGK8Xt9Q",
  authDomain:        "travelfoodweb.firebaseapp.com",
  projectId:         "travelfoodweb",
  storageBucket:     "travelfoodweb.firebasestorage.app",
  messagingSenderId: "1092946104589",
  appId:             "1:1092946104589:web:a6b6c7208c06d31cdea044",
  measurementId:     "G-XP94H69BNB",
};

// Khởi tạo Firebase
const app       = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth = getAuth(app);

// Providers
export const googleProvider   = new GoogleAuthProvider();
export const facebookProvider = new FacebookAuthProvider();

// Thêm scope để lấy email và profile
googleProvider.addScope('email');
googleProvider.addScope('profile');
facebookProvider.addScope('email');
facebookProvider.addScope('public_profile');

// ============================================================
// Helper: Đăng nhập Google → lấy id_token → gửi lên Go
// ============================================================
export const signInWithGoogle = async () => {
  const result  = await signInWithPopup(auth, googleProvider);
  const idToken = await result.user.getIdToken();
  return { idToken, user: result.user };
};

// ============================================================
// Helper: Đăng nhập Facebook → lấy id_token → gửi lên Go
// ============================================================
export const signInWithFacebook = async () => {
  const result  = await signInWithPopup(auth, facebookProvider);
  const idToken = await result.user.getIdToken();
  return { idToken, user: result.user };
};

// ============================================================
// Helper: Đăng xuất Firebase
// ============================================================
export const firebaseSignOut = async () => {
  await signOut(auth);
};

export default app;