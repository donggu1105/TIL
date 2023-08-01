import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";
import {useState} from "react";
import {useRouter} from "next/router";

export default function MyInfo() {

  const router = useRouter();
  const [clicked, setClicked] = useState(false);
  const {status = 'initial'} = router.query;



  return (
    <>
      <h1 className="title">MyInfo</h1>
      <h1 className="title">clicked: {String(clicked)}</h1>
      <h1 className="title">status: {status}</h1>
      <button onClick={() => {
          alert('edit')
          setClicked(true)
          location.replace('/settings/my/info?status=editing')
      }}>Click me</button>
    </>
  );
}

MyInfo.getLayout = function getLayout(page) {
  return (
    <Layout>
      <SubLayout>{page}</SubLayout>
    </Layout>
  );
};
