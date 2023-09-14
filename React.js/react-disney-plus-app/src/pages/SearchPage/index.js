import React, {useEffect, useState} from 'react';
import {useLocation, useNavigate} from "react-router-dom";
import axios from "../../api/axios";
import "./SearchPage.css"

function SearchPage(props) {

    const [searchResults, setSearchResults] = useState([]);

    const useQuery = () => {
        return new URLSearchParams(useLocation().search)
    }

    const navigate = useNavigate();

    let query = useQuery();
    const searchTerm = query.get("q");


    useEffect(() => {
        if (searchTerm) {
            fetchSearchMovie(searchTerm);
        }
    }, [searchTerm]);

    const fetchSearchMovie = async (searchTerm) => {
        try {
            const request = await axios.get(
                `/search/multi?include_adult=false&query=${searchTerm}`
            );
            setSearchResults(request.data.results);

        } catch (error) {
            console.log("error", error);
        }
    }

    if (searchResults.length > 0) {
        return (
            <section className="search-container">
                {searchResults.map((movie) => {
                    if (movie.backdrop_path !== null && movie.media_type !== "person") {
                        const movieImageUrl = "https://image.tmdb.org/t/p/w500" + movie.backdrop_path;
                        return (
                            <div className="movie" key={movie.id}>
                                <div
                                    onClick={() => navigate(`/${movie.id}`)}
                                    className="movie__column-poster"
                                >
                                    <img
                                        src={movieImageUrl}
                                        alt="movie"
                                        className="movie__poster"
                                    />

                                </div>

                            </div>
                        );

                    }

                })}


            </section>


        )
    } else {
        return (
            <section className="no-results">
                <div className="no-results__text">
                    <p>
                        찾고자하는 검색어 "{searchTerm}"에 맞는 영화가 없습니다.
                    </p>
                </div>
            </section>



        )
    }
}

export default SearchPage;