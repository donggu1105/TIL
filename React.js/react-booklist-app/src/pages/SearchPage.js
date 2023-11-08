import React, {useState} from 'react';
import styled from "@emotion/styled";

import BookSearchForm from "../components/BookSearchForm";
import axios from "axios";
import Loader from "../components/Loader";
import BooksList from "../components/BooksList";

const LogoText = styled.h3`
  margin: 0;
`

const Container = styled.div`
    max-width: 960px;
    padding: 15px;
   margin: 0 auto;
`

const Header = styled.header`
  border-bottom: 1px solid #eee;
`

const HeaderContainer = styled.div`
  display: flex;
  align-items: center;
  @media (max-width: 768px) {
    flex-direction: column;
    align-items: center;
  }
`

const HeaderSearchForm = styled.div`
  margin-left: auto;
`


const SearchPage = () => {

    const [searchTerm, setSearchTerm] = useState("");
    const [books, setBooks] = useState({});
    const [loading, setLoading] = useState(false);

    const API_BASE_URL = 'https://www.googleapis.com/books';

    const fetchBooks = async () => {
        setLoading(true);
        try {
            const response = await axios.get(`${API_BASE_URL}/v1/volumes?q=${searchTerm}`);
            const data = await response.data;
            console.log(data);
            setBooks(data);
        } catch (error) {
            console.log(error);
        }
        setLoading(false);
    }

    const handleChange = e => {
        setSearchTerm(e.target.value);
    }

    const handleSubmit = e => {
        e.preventDefault();
        fetchBooks();
    }




    return (
        <>
        <Header>
            <HeaderContainer>
                <LogoText>Book List</LogoText>
                <HeaderSearchForm>
                    <BookSearchForm onChange={handleChange} onSubmit={handleSubmit} searchTerm={searchTerm}/>
                </HeaderSearchForm>
            </HeaderContainer>
        </Header>

        <Container>
            <Loader loading={loading} >
                "<strong>{searchTerm}</strong> 책을 찾는중입니다."
            </Loader>
            <BooksList books={books}/>
        </Container>
        </>
    );
};

export default SearchPage;