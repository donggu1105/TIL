export const Type = ({orderType}) => {


    return (
        <>
            <h2>주문 종류</h2>
            <p>{orderTypeKorean} 하나의 가격</p>
            <p>{orderTypeKorean} 총 가격 : {orderDatas.totals[orderType]}</p>

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
