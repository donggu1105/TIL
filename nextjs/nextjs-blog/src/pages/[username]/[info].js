import { useEffect, useState } from 'react';
import SubLayout from "componets/SubLayout";
import Layout from "componets/Layout";
import {useRouter} from "next/router";

export default function UsernameInfo() {

  const router = useRouter();
  const { username, info, uid } = router.query;
  const [name, setName] = useState();


  /**
   * useEffect는 React의 Hook 중 하나로, 컴포넌트의 생명주기에 따른 부수 효과(side effects)를 수행하는 데 사용됩니다. "부수 효과"란 컴포넌트 내부에서 데이터 가져오기, 구독, 수동적으로 React DOM을 변경하는 것과 같은 작업을 의미합니다.
   *
   * 여기에는 다음과 같은 주요 사용 사례가 있을 수 있습니다:
   *
   * 컴포넌트 마운트 후 작업 수행: 컴포넌트가 화면에 처음 표시된 후 작업을 수행하려면 빈 종속성 배열 []을 사용합니다.
   *
   * 종속성이 변경될 때 작업 수행: 특정 변수나 상태가 변경될 때마다 작업을 수행하려면 해당 변수를 종속성 배열에 포함시킵니다.
   *
   * 컴포넌트 정리: 컴포넌트가 화면에서 사라질 때 (언마운트 될 때) 정리 작업을 수행하려면 useEffect 내부에서 정리 함수를 반환합니다.
   *
   *
   * useEffect(() => {
   *   // 컴포넌트가 마운트된 후에 실행될 코드
   *   console.log('Component mounted');
   *
   *   // 컴포넌트가 언마운트될 때 실행될 정리 코드 (옵션)
   *   return () => {
   *     console.log('Component will unmount');
   *   };
   * }, []); // 빈 배열은 이 효과가 한 번만 실행되어야 함을 의미
   *
   * 이와 같이 useEffect는 컴포넌트의 생명주기와 관련된 다양한 작업을 수행하는 데 유용한 도구입니다.
   * */

  // useEffect(() => {
  //     fetch('/api/user')
  //         .then((res) => res.json())
  //         .then((data) => {
  //           setName(data.name)
  //         })
  // })

    useEffect(() => {
        if (uid != null) {
            fetch(`/api/user-info/${uid}`)
                .then((res) => res.json())
                .then((data) => {
                    setName(data.name)
                })
        }
    })

  return (
    <>
      <h1 className="title">{username}'s {info}</h1>

    <h1 className="title">Name: {name}</h1>

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
