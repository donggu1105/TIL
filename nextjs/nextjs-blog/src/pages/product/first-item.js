import { useEffect, useState } from 'react';
import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";

export default function FirstItem() {
  const [time, setTime] = useState();

  useEffect(() => {
    console.log('client');
    setTime(new Date().toISOString());
  }, []);

  return (
    <>
      <h1 className="title">{time}</h1>
    </>
  );
}

FirstItem.getLayout = function getLayout(page) {
  return (
    <Layout>
      <SubLayout>{page}</SubLayout>
    </Layout>
  );
};
