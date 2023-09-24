enum ActionType {
    ADD_TODO = "ADD_TODO",
    DELETE_TODO = "DELETE_TODO"
}

interface Action {
    type: ActionType;
    text: String
}

const todos = (state = [], action: Action) => {
    switch (action.type) {
        case "ADD_TODO":
            return [...state, action.text]
        // case "DELETE_TODO":
        //     return state - 1;
        default:
            return state;
    }
}

export default todos;