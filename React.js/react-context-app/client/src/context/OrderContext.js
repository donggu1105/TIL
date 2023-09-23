import {createContext, useEffect, useMemo, useState} from "react";
import {options} from "axios";

export const OrderContext = createContext();


export function OrderContextProvider(props) {

    const [orderCounts, setOrderCounts] = useState({
        products: new Map(),
        options: new Map()
    })

    const [totals, setTotals] = useState({
        products: 0,
        options: 0,
        total: 0
    })

    useEffect(() => {
        const productsTotal = calculateSubtotal("products", orderCounts);
        const optionsTotal = calculateSubtotal("options", orderCounts)
        const total = productsTotal + optionsTotal;

        setTotals({
            products: productsTotal,
            options: optionsTotal,
            total: total
        });

    }, [orderCounts]);

    const pricePerItem = {
        products: 1000,
        options: 500
    }

    const calculateSubtotal = (orderType, orderCounts) => {
        let optionCount = 0;
        for (const count of orderCounts[orderType].values()) {
            optionCount += count;
        }

        return optionCount * pricePerItem[orderType]
    }



    const value = useMemo(() => {
        function updateItemCount(itemName, newItemCount, orderType) {
            const newOrderCounts = {...orderCounts}
            console.log(`newOrder Count before`, newOrderCounts);

            const orderCountMap = orderCounts[orderType]
            orderCountMap.set(itemName, parseInt(newItemCount));
            console.log(`newOrder Count after`, newOrderCounts);
            setOrderCounts(newOrderCounts)
        }


        return [{...orderCounts, updateItemCount}]
    }, [orderCounts])
    return <OrderContext.Provider value={value} {...props} />
}