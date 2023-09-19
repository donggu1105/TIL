export const ErrorBanner = ({message}) => {

    let errorMessage = message || "에러입니다.";
    return (
        <div style={{backgroundColor: 'red'}}>
            {errorMessage}
        </div>
    )
}
