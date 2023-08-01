import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";
import {useRouter} from "next/router";
import Link from "next/link";

export default function CartDateSlug() {

    const router = useRouter();
    const {date} = router.query;


    return (
        <>
            <h1 className="title">CartDateSlug {JSON.stringify(date)}</h1>

            <Link href="/cart/2021/01/01">2021년 1월 1일로</Link>

            <br/>

            <button onClick={() => router.push('/cart/2023/08/02')}>2023년 8월 2일로</button>


        </>
    );
}

CartDateSlug.getLayout = function getLayout(page) {
    return (
        <Layout>
            <SubLayout>{page}</SubLayout>
        </Layout>
    );
};
