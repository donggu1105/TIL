import './App.css';
import Nav from "./components/Nav";
import styled from "styled-components";
import Banner from "./components/Banner";
import Cateogory from "./components/Cateogory";
import Row from "./components/Row";
import requests from "./api/requests";

function App() {


  return (
    <div className="App">
            <Container>
                <Nav />
                <Banner/>
                <Cateogory />
                <Row title="Tredning now" id="TN" fetchUrl={requests.fetchTrending} />
                <Row title="Top Rated" id="TR" fetchUrl={requests.fetchTopRated} />
                <Row title="Action movies" id="AM" fetchUrl={requests.fetchActionMovies} />
                <Row title="Comedy movies" id="CM" fetchUrl={requests.fetchComedyMovies} />
            </Container>
    </div>
  );
}


const Container = styled.main`
  position: relative;
  min-height: calc(100vh - 250px);
  overflow-x: hidden;
  display: block;
  top: 72px;
  padding: 0 calc(3.5vw + 5px);
  
  &:after {
    background: url("/images/home-background.png") center center / cover no-repeat fixed;
    content: "";
    position: absolute;
    inset: 0px;
    opacity: 1;
    z-index: -1;
  }
  
`

export default App;

