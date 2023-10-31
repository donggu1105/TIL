import './globals.css'
import { Inter } from 'next/font/google'
import React from "react";
import Navbar from "@/components/Navbar";
import getCurrentUser from "./actions/getCurrentUser";
import {Metadata} from "next";
import Script from "next/script";


export const metadata: Metadata = {
  title: '중고마켓',
  description: '중고마켓 클론',
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {

    const currentUser = await getCurrentUser();

    console.log('currentUser', currentUser);

    return (
        <html lang="en">
        <body>
        <Navbar currentUser={currentUser}/>
        {children}

        <Script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ffaeacf6d3cc3827abb93dbe25a0659&libraries=services,clusterer&autoload=false"/>

        </body>
        </html>
    );
}
