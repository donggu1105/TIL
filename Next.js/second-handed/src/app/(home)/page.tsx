import Image from 'next/image'
import getProducts, {IProductsParams} from "@/app/actions/getProducts";

interface HomeProps {
    searchParams: IProductsParams
}
export default async function Home({searchParams}: HomeProps) {

    const products = await getProducts(searchParams);

    console.log(products)

    return (
        <main>
            누구나볼수있는 페이지
        </main>
    )
}
