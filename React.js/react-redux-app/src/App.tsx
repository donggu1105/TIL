import React, {useEffect, useState} from 'react';
import logo from './logo.svg';
import './App.css';
import {useDispatch, useSelector} from "react-redux";
import {RootState} from "./reducers";
import axios from "axios";
import {fetchPosts} from "./actions/posts";

type Props = {
    value: any;
    onIncrement: () => void;
    onDecrement: () => void;
}

interface Post {
    userId: number;
    id: number;
    title: string;
}

function App({value, onIncrement, onDecrement}: Props) {
    const dispatch = useDispatch();
    const [todoValue, setTodoValue] = useState("");
    const counter = useSelector((state: RootState) => state.counter)
    const todos: string[] = useSelector((state: RootState) => state.todos)
    const posts: Post[] = useSelector((state: RootState) => state.posts);
    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setTodoValue(e.target.value);
    }

    useEffect(() => {
        dispatch(fetchPosts());
    }, [dispatch])



    const addTodo = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        setTodoValue("");
        dispatch({type: "ADD_TODO", text: todoValue})
    }

  return (
    <div className="App">
      Clicked : {counter} times
      <button onClick={onIncrement}>+</button>
      <button onClick={onDecrement}>-</button>

        <ul>
            {todos.map((todo, index) => (
               <li key={index}>{todo}</li>
            ))}

        </ul>

        <form onSubmit={addTodo}>
            <input type="text" value={todoValue} onChange={handleChange}/>
            <input type="submit"/>
        </form>

        <ul>
            {posts.map((post, index) => (
                <li key={index}>{post.title}</li>
            ))}

        </ul>

    </div>
  );
}

export default App;
