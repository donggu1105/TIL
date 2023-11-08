import React from 'react';

const Book = ({book}) => {

    return (
        <li>
            <div>
                <h3>{book.volumeInfo.title}</h3>
                <p>{book.volumeInfo.authors}</p>
                <p>{book.volumeInfo.publishedDate}</p>
                <p>{book.volumeInfo.description}</p>
            </div>
        </li>
    )


}
const BooksList = ({books}) => {

    if (!books.totalItems) {
        return (
            <div>
                No books found for your search term.
            </div>
        );
    } else if (books.totalItems === 0) {
        return (
            <div>
                찾고있는 책 이 없습니다.
            </div>
        );
    } else {
        console.log('tes')
        return <ul>
            {books.items.map(book => {
                return <Book book={book} key={book.id} />
                })}
        </ul>
    }

    return (
        <></>
    );
};

export default BooksList;