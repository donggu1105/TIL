// export { default } from 'next-auth/middleware';

import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { getToken } from "next-auth/jwt";

export async function middleware(req: NextRequest) {
    const session = await getToken({ req, secret: process.env.JWT_SECRET });
    console.log('session', session);
    const pathname = req.nextUrl.pathname;

    // 로그인된 유저만 접근 가능
    if (req.nextUrl.pathname.startsWith("/user") && !session) {
        return NextResponse.redirect(new URL("/auth/login", req.url));
    }

    // 어드민 유저만 접근 가능
    if (pathname.startsWith("/admin") && (session?.role !== 'admin')) {
        return NextResponse.redirect(new URL("/", req.url));
    }

    // 로그인된 유저는 로그인, 회원가입 페이지에 접근 X
    if (pathname.startsWith("/auth") && session) {
        return NextResponse.redirect(new URL("/", req.url));
    }

    return NextResponse.next();
}


// 이 경로 안에 있는 것들만 middleware에서 처리하게 됩니다.
export const config = {
    matcher:
        [
            "/admin/:path*",
            '/auth/:path*',
            '/chat',
            '/products/upload'
        ]
}

