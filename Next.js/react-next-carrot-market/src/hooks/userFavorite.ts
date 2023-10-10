import { TUser } from "@/types";
import axios from "axios";
import { useRouter } from "next/navigation";
import { useMemo } from "react";
import { toast } from 'react-toastify';

interface IUseFavorite {
    productId: string;
    currentUser?: TUser | null
}

const useFavorite = ({ productId, currentUser }: IUseFavorite) => {
    const router = useRouter();

    const hasFavorited = useMemo(() => {
        const list = currentUser?.favoriteIds || [];

        return list.includes(productId);
    }, [currentUser, productId]);

    const toggleFavorite = async (e: React.MouseEvent<HTMLDivElement>) => {
        e.stopPropagation();

        if (!currentUser) {
            toast.error('로그인이 필요합니다.');
            return;
        }

        try {
            let request;

            if (hasFavorited) {
                request = () => axios.delete(`/api/favorites/${productId}`);
            } else {
                request = () => axios.post(`/api/favorites/${productId}`);
            }

            await request();
            router.refresh();
            toast.success('Success');
        } catch (error) {
            toast.error('Something went wrong.');
        }
    }

    return {
        hasFavorited,
        toggleFavorite,
    }
}

export default useFavorite;


