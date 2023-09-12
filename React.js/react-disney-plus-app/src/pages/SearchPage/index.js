import React, {useEffect, useState} from 'react';
import {useLocation} from "react-router-dom";
import async from "async";
import axios from "../../api/axios";

function SearchPage(props) {

    const [searchResults, setSearchResults] = useState([]);

    const useQuery = () => {
        return new URLSearchParams(useLocation().search)
    }

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

    return (
        <div></div>
    );
}

export default SearchPage;