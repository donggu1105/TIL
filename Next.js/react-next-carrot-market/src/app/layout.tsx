import Navbar from '@/components/Navbar'
import './globals.css'
import getCurrentUser from './actions/getCurrentUser';
import Script from 'next/script';
import ToastProvider from '@/components/ToastProvider';
import SwrProvider from '@/providers/SwrProvider';

export const metadata = {
  title: '중고마켓',
  description: '중고마켓 Clone',
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const currentUser = await getCurrentUser();

  return (
    <html lang="en">
      <body>

          <Navbar currentUser={currentUser} />
          <ToastProvider />

        <div>
          <SwrProvider>
            {children}
          </SwrProvider>
        </div>
        <Script
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b361f30858671336928732a243bb7b96&libraries=services,clusterer&autoload=false"
        />
      </body>
    </html>
  )
}

