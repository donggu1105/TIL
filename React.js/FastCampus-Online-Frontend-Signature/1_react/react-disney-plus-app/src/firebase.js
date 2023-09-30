// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import "firebase/auth"
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAh1xLZXKT3Em6Ey7lbuB8E5NdDfRTB9x4",
  authDomain: "react-disney-app-donggu.firebaseapp.com",
  projectId: "react-disney-app-donggu",
  storageBucket: "react-disney-app-donggu.appspot.com",
  messagingSenderId: "613464304431",
  appId: "1:613464304431:web:f729fb6d900d002d244fda",
  measurementId: "G-SHX658GERW"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);


export default app;