import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    id: "",
    email: "",
    photoURL: "",
    displayName: ""
}

export const userSlice = createSlice({
    name: 'user',
    initialState,
    reducers: {
        setUser: (state, action) => {
            state.id = action.payload.id;
            state.email = action.payload.email;
            state.photoURL = action.payload.photoURL;
            state.displayName = action.payload.displayName;
        },
        removeUser: (state) => {
            state.id = "";
            state.email = "";
            state.photoURL = "";
            state.displayName = "";
        }
    }
})


export const {setUser, removeUser} = userSlice.actions;

export default userSlice.reducer;