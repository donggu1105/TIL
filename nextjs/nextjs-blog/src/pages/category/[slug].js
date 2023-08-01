import { useEffect, useState } from 'react';
import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";
import {useRouter} from "next/router";

export default function CategorySlug() {

    const router = useRouter();
    const { slug, from, age } = router.query;



    return (
        <>
            <h1 className="title">Category { slug } from  {from} age {age}</h1>
        </>
    );
}

CategorySlug.getLayout = function getLayout(page) {
    return (
        <Layout>
            <SubLayout>{page}</SubLayout>
        </Layout>
    );
};
