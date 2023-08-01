export async function getStaticProps() {
  console.log('getStaticProps');
  return {
    props: { time: new Date().toISOString() },
    revalidate: 1
  };
}

// Static Site Generation - 미리 그려둔다.
export default function ISR({ time }) {
  return (
    <>
      <h1 className="title">{time}</h1>
    </>
  );
}
