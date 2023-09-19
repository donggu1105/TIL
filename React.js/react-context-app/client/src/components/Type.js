import {useEffect, useState} from "react";
import axios from "axios";
import {Products} from "./Products";
import {Options} from "./Options";
import {ErrorBanner} from "./ErrorBanner";

export const Type = ({orderType}) => {


    const [items, setItems] = useState([]);
    const [error, setError] = useState(false);

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
            {/*<p>{orderTypeKorean} 하나의 가격</p>*/}
            {/*<p>{orderTypeKorean} 총 가격 : {orderDatas.totals[orderType]}</p>*/}

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
