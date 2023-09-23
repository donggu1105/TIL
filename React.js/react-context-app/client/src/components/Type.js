import {useContext, useEffect, useState} from "react";
import axios from "axios";
import {Products} from "./Products";
import {Options} from "./Options";
import {ErrorBanner} from "./ErrorBanner";
import {OrderContext} from "../context/OrderContext";

export const Type = ({orderType}) => {


    const [items, setItems] = useState([]);
    const [error, setError] = useState(false);
    const [orderData, updateItemCount] = useContext(OrderContext)

    console.log("orderData, updateItemCount", orderData, updateItemCount)


    useEffect(() => {
        loadItems(orderType)
    }, [orderType]);

    const loadItems = async (orderType) => {
        try {
            const response = await axios.get(`http://localhost:4000/${orderType}`)
            setItems(response.data);
        } catch (error) {
            console.log(error)
            setError(true)
        }
    }

    const ItemComponent = orderType === "products" ? Products : Options;

    const optionItems = items.map((item) => (
        <ItemComponent
            key={item.name}
            name={item.name}
            imagePath={item.imagePath}
            updateItemCount={(itemName, newItemCount) => updateItemCount(itemName, newItemCount, orderType)}
        />
    ))

    if (error) {
        return (
            <ErrorBanner message="Error is occured"></ErrorBanner>
            )
    }

    return (
        <>
            <h2>주문 종류</h2>
            <p>하나의 가격</p>
            <p>총 가격 : {orderData.totals[orderType]}</p>

            <div
                style={{
                    display: "flex",
                    fireDirection: orderType === "options" && "column"
                }}
            >
                {optionItems}
            </div>

        </>
    )
}
