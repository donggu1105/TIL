import { useEffect, useState } from 'react';
import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";
import {useRouter} from "next/router";

export default function UsernameInfo() {

  const router = useRouter();
  const { username, info } = router.query;

  return (
    <>
      <h1 className="title">{username}'s {info}</h1>
    </>
  );
}

UsernameInfo.getLayout = function getLayout(page) {
  return (
    <Layout>
      <SubLayout>{page}</SubLayout>
    </Layout>
  );
};
