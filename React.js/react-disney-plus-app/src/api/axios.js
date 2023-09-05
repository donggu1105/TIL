import axios from "axios";


const instance = axios.create({
    baseURL: "https://api.themoviedb.org/3",
    params: {
        api_key: "1a7e2afbbe3687ecb4a79594b6347cfe",
        language: "ko-KR",

    }
})

export default instance;