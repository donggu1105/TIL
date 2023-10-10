'use client';
import { AiFillHeart, AiOutlineHeart } from "react-icons/ai";
import { TUser } from "@/types";
import useFavorite from "@/hooks/userFavorite";

interface HeartButtonProps {
    productId: string
    currentUser?: TUser | null
}

const HeartButton: React.FC<HeartButtonProps> = ({
    productId,
    currentUser
}) => {
    const { hasFavorited, toggleFavorite } = useFavorite({
        productId,
        currentUser
    });

    return (
        <div
            onClick={toggleFavorite}
            className="relative transition cursor-pointer hover:opacity-80"
        >
            <AiOutlineHeart
                size={28}
                className="
          fill-white
          absolute
          -top-[2px]
          -right-[2px]
        "
            />
            <AiFillHeart
                size={24}
                className={
                    hasFavorited ? 'fill-rose-500' : 'fill-neutral-500/70'
                }
            />
        </div>
    );
}

export default HeartButton;


