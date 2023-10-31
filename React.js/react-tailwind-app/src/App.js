import logo from './logo.svg';
import './App.css';
import Navbar from "./components/Navbar";
import Home from "./components/Home";
import About from "./components/About";
import Support from "./components/Support";
import Feedback from "./components/Feedback";
import Footer from "./components/Footer";
import Contact from "./components/Contact";

function App() {
  return (
      <>
        <Navbar/>
          <Home/>
          <About/>
          <Support/>
          <Feedback/>
          <Footer/>
          <Contact/>
          <Footer/>
      </>
  );
}

export default App;
