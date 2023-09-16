import React, {useCallback, useEffect, useState} from 'react';
import axios from "../api/axios";
import MovieModal from "./MovieModal";
import "./Row.css"

import {Navigation, Pagination, Scrollbar, A11y} from "swiper/modules";
import {Swiper, SwiperSlide} from "swiper/react";


// import swiper style
import "swiper/css"
import "swiper/css/navigation"
import "swiper/css/scrollbar"
import "swiper/css/pagination"
import styled from "styled-components";

function Row({title, id, fetchUrl}) {

    const [movies, setMovies] = useState([]);
    const [modalOpen, setModalOpen] = useState(false);
    const [movieSelected, setMovieSelected] = useState({})


    const fetchMovieData = useCallback(async () => {
        const response = await axios.get(fetchUrl);
        // console.log(response.data.results)
        setMovies(response.data.results);
    }, [fetchUrl])

    const handleClick = (movie) => {
        setModalOpen(true);
        setMovieSelected(movie);
    }
    useEffect(() => {
        fetchMovieData();
    }, [fetchMovieData]);


    return (
        <div>
            <h2>{title}</h2>

            <Swiper
                modules={[Navigation, Pagination, Scrollbar, A11y]}
                loop={true} // loop
                navigation // use arrow button
                pagination={{ clickable: true}} // 페이지 버튼 보이게 할지
                breakpoints={{
                    1378: {
                        slidersPerView: 6,
                        slidesPerGroup: 6
                    },
                    998: {
                        slidersPerView: 6,
                        slidesPerGroup: 6
                    },
                    625: {
                        slidersPerView: 6,
                        slidesPerGroup: 6
                    },
                    0: {
                        slidersPerView: 6,
                        slidesPerGroup: 6
                    }

                }}
            >
                <Content id={id}>
                    {movies.map((movie) => (
                        <SwiperSlide>
                            <Wrap>
                            <img key={movie.id}
                            src={`https://image.tmdb.org/t/p/original${movie.backdrop_path}`}
                            alt={movie.name}
                            onClick={() => handleClick(movie)}
                            />
                            </Wrap>
                        </SwiperSlide>
                ))}
                </Content>
            </Swiper>

            {modalOpen &&
                <MovieModal
                    {...movieSelected}
                    setModalOpen={setModalOpen}
                />
             }

        </div>
    );
}

export default Row;

const Container = styled.div`
    padding: 0 0 26px;
`

const Content = styled.div``

const Wrap = styled.div`
  width: 95%;
  height: 95%;
  padding-top: 56.25%;
  border-radius: 10px;
  box-shadow: rgb(0 0 0/69%) 0px 26px 30px -10px,
  rgb(0 0 0/73%) 0px 16px 10px -10px;
  cursor: pointer;
  overflow: hidden;
  position: relative;
  transition: all 250ms cubic-bezier(0.25, 0.46, 0.45, 0.94) 0s;
  border: 3px solid rgba(249, 249, 249, 0.1);

  img {
    inset: 0px;
    display: block;
    height: 100%;
    object-fit: cover;
    opacity: 1;
    position: absolute;
    width: 100%;
    transition: opacity 500ms ease-in-out;
    z-index:1;
  }
  &:hover {
    box-shadow: rgb(0 0 0 / 80%) 0px 40px 58px -16px,
    rgb(0 0 0 / 72%) 0px 30px 22px -10px;
    transform: scale(0.98);
    border-color: rgba(249, 249, 249, 0.8);
  }
`;