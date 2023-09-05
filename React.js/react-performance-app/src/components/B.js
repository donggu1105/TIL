import React, {useCallback} from "react";


const B = ({message, posts}) => {

    const Message = React.memo(({message}) => {
        return <p>{message}</p>;
    })

    const ListItem = React.memo(({post}) => {
        return (
            <li key={post.id}>
                <p>{post.title}</p>
            </li>
        )
    })

    const List = React.memo(({posts}) => {
        return (
            <ul>
                {posts.map(post => {
                    return <ListItem key={post.id} post={post} />
                })}
            </ul>
        )
    })


    const testFunction = useCallback(() => {
    }, []);

    return (
        <div>
            <h1>B Component</h1>
            <Message message={message}/>
            <List posts={posts} />

        </div>


    );
}

export default B;