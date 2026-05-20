import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, GoogleAuthProvider, FacebookAuthProvider, signInWithPopup } from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyBwgVS1GBF6dFCzpH4zLsI5wtAyunE-Plk",
  authDomain: "smart-tourism-fdd57.firebaseapp.com",
  projectId: "smart-tourism-fdd57",
  storageBucket: "smart-tourism-fdd57.firebasestorage.app",
  messagingSenderId: "123458721823",
  appId: "1:123458721823:web:e6e4144c23a3b6bbc59d2a",
  measurementId: "G-CBGLEEZNRM"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
const googleProvider = new GoogleAuthProvider();
const facebookProvider = new FacebookAuthProvider();
facebookProvider.addScope('email');
facebookProvider.addScope('public_profile');

export { auth, googleProvider, facebookProvider, signInWithPopup };
