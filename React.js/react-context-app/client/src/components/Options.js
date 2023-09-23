export const Options = ({name, updateItemCount}) => {
    return (
        <form>
            <input type="checkbox" id={`${name} option`}
                onChange={(event) => updateItemCount(name, event.target.checked ? 1 : 0 )}
            />{" "}
            <label htmlFor={`${name} option`}>{name}</label>


        </form>
    )
}
