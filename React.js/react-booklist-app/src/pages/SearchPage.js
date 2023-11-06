import React from 'react';
import styled from "@emotion/styled";
import BookSearchForm from "../components/BookSearchForm";

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
    return (
        <>
        <Header>
            <HeaderContainer>
                <LogoText>Book List</LogoText>
                <HeaderSearchForm>
                    <BookSearchForm />
                </HeaderSearchForm>

            </HeaderContainer>

        </Header>
        </>
    );
};

export default SearchPage;