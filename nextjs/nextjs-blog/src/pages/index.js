import Link from 'next/link';

export async function getServerSideProps() {
  console.log('getServerSideProps');
  return {
    props: { time: new Date().toISOString() }
  };
}

export default function Home({ time }) {
  return (
    <>
      <h1 className="title">{time}</h1>
      <h1>
        <Link href="/csr">crs로</Link>
      </h1>
      <h1>
        <Link href="/ssg">ssg로</Link>
      </h1>
      <h1>
        <Link href="/isr">isr로</Link>
      </h1>
    </>
  );
}
