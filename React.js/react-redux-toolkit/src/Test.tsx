import {useDispatch} from "react-redux";
import {useEffect} from "react";
import {fetchUsersAsync, incrementAsync} from "./features/counter/counterSlice";

export const Test = () => {

    const dispatch = useDispatch();

    useEffect(() => {

        const promise = dispatch(fetchUsersAsync())

        return () => {
            promise.abort();
        }
    }, [])

    return (
        <>Test</>
    );
};
