'use client'

import './globals.css'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import React from "react";
import Navbar from "@/components/Navbar";
import {SessionProvider} from "next-auth/react";

const inter = Inter({ subsets: ['latin'] })

// export const metadata: Metadata = {
//   title: 'Create Next App',
//   description: 'Generated by create next app',
// }

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
      {/*session 정보가져오려면 이거 써야함*/}
      <SessionProvider>
        <Navbar />
        {children}
      </SessionProvider>
      </body>
    </html>
  )
}