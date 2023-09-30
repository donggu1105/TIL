import {combineReducers, configureStore} from "@reduxjs/toolkit";
import userReducer from "./userSlice"
import {persistReducer, persistStore} from "redux-persist";
import storage from "redux-persist/lib/storage"
import {FLUSH, PAUSE, PERSIST, PURGE, REGISTER, REHYDRATE} from "redux-persist/es/constants";


// 서로 다른 리듀싱 함수들을 값으로 가지는 객체를 받아서 createStore에 넘길 수 있는 하나의 리듀싱 함수로 변환
export const rootReducer = combineReducers({
    user: userReducer
})

const persistConfig = {
    key: "root",
    storage, // localStorage 에 저장합니다.
};

const persistedReducer = persistReducer(persistConfig, rootReducer);


export const store = configureStore({
    reducer: persistedReducer,
    middleware: getDefaultMiddleware => getDefaultMiddleware({serializableCheck: {
            ignoreActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
        }})
})

export const persistor = persistStore(store);