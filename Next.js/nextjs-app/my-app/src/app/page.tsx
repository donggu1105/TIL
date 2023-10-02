import Image from 'next/image'
import Head from "next/head";
import homeStyles from './Home.module.css'
export default function Home() {
  return (
    <div>

        <Head>
            <title>Joey Kang</title>
        </Head>

        <section className={homeStyles.headingMd}>

            <p>hi</p>
            <p>it's me</p>
        </section>

        <section>
            <h2>blog</h2>
            <ul>
                <li></li>
            </ul>

        </section>




    </div>
  )
}
