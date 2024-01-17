import './App.css';
import React from "react";
import "./index.css";
import Header from "./Header";
import Hero from "./Hero";
import Portfolio from "./Portfolio";
import About from "./About";
import Contact from "./Contact";
import Footer from "./Footer";

function App() {
  return (
      <div className="App">
        <Header/>
        <Hero/>
        <Portfolio/>
        <About/>
        <Contact/>
        <Footer/>
      </div>
  );
}

export default App;
