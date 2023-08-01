export async function getStaticProps() {
  console.log('getStaticProps');
  return {
    props: { time: new Date().toISOString() }
  };
}

// Static Site Generation - 미리 그려둔다.
export default function SSG({ time }) {
  return (
    <>
      <h1 className="title">{time}</h1>
    </>
  );
}
