import React from 'react';
import styled from "@emotion/styled";

const Input = styled.input`
    outline: 0;
  padding: 0.6rem 1rem;
  border: 1px solid #eee;
  border-radius: 3px;
  min-width: 300px;
  &:focus, &:hover {
    border-color: #ddd;
  }
`

const Button = styled.button`
    background-color: #FCF6F5;
    color: #333;
    border: 1px solid rgba(34, 36, 38, 0.15);
    padding: 0.5rem 1rem;
    margin-left: 15px;
    border-radius: 0.25rem;
  cursor: pointer;
  
  &:hover {
    transform: translate(-2px);
  } 
`

const Form = styled.form`
    
`

const BookSearchForm = ({onChange, onSubmit, searchTerm}) => {
    return (
        <Form onSubmit={onSubmit}>
            <Input
                type="search"
                placeholder="Search for a book"
                required
                value={searchTerm}
                onChange={onChange}
            />

            <Button type="submit">
                Search
            </Button>


        </Form>
    );
};

export default BookSearchForm;