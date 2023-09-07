import React, {useEffect, useState} from 'react';
import requests from "../api/requests";
import axios from "../api/axios";

function Banner() {


    useEffect(() => {
        fetchData();
    }, []);

    const [movie, setMovie] = useState();
    const fetchData = async () => {
        const request =  await axios.get(requests.fetchNowPlaying);


        const movieId = request.data.results[
            Math.floor(Math.random() * request.data.results.length)
            ].id

        console.log(`movieId:  ${movieId}`);

        const {data: movieDetail} = await axios.get(`movie/${movieId}`, {
            params: {append_to_response: "videos"}
        });

        setMovie(movieDetail)
    }


    return (
        <div></div>
    );
}

export default Banner;