import {Component} from "react";
import "./Square.css";
export default class Square extends Component {
    render() {
        return (
            <button className="square" onClick={() => console.log("click")}>
                {this.props.value}
            </button>
        );
    }
};