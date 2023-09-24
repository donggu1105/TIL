import React, {useState} from 'react';
import logo from './logo.svg';
import './App.css';
import {useDispatch, useSelector} from "react-redux";
import {RootState} from "./reducers";

type Props = {
    value: any;
    onIncrement: () => void;
    onDecrement: () => void;

}

function App({value, onIncrement, onDecrement}: Props) {
    const dispatch = useDispatch();
    const [todoValue, setTodoValue] = useState("");
    const counter = useSelector((state: RootState) => state.counter)
    const todos: string[] = useSelector((state: RootState) => state.todos)
    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setTodoValue(e.target.value);
    }

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

    </div>
  );
}

export default App;
