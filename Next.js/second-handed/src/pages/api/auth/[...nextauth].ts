import NextAuth, { NextAuthOptions } from "next-auth"
import GoogleProvider from "next-auth/providers/google"
import CredentialsProvider from 'next-auth/providers/credentials'
import {PrismaAdapter} from "@next-auth/prisma-adapter";
import prisma from '@/helpers/prismadb';
import {PrismaClient} from "@prisma/client";
import bcrypt from "bcryptjs";


export const authOptions: NextAuthOptions = {
    adapter: PrismaAdapter(<PrismaClient>prisma),
    providers: [
        GoogleProvider({
            clientId: process.env.GOOGLE_CLIENT_ID!,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET!
        }),
        CredentialsProvider({
            // The name to display on the sign in form (e.g. "Sign in with...")
            name: "Credentials",
            // `credentials` is used to generate a form on the sign in page.
            // You can specify which fields should be submitted, by adding keys to the `credentials` object.
            // e.g. domain, username, password, 2FA token, etc.
            // You can pass any HTML attribute to the <input> tag through the object.
            credentials: {
                email: { label: "Email", type: "text"},
                password: {  label: "Password", type: "password" }
            },

            async authorize(credentials, req) {

                // Add logic here to look up the user from the credentials supplied
                if (!credentials?.email || !credentials?.password) {
                    throw new Error('Invalid credentials');
                }
                const user = await prisma?.user.findUnique({
                    where: {
                        email: credentials.email,
                    }
                })


                if (!user || !user?.hashedPassword) {
                    // oauth login
                    throw new Error('Invalid credentials2')
                }

                const isCorrectPassword = await bcrypt.compare(credentials.password, user.hashedPassword);

                if (!isCorrectPassword) {
                    throw new Error('Invalid credentials3')
                }

                return user;
            }
        })
    ],

    session: {
        strategy: 'jwt',
    },
    jwt: {
        secret: process.env.JWT_SECRET,
        maxAge: 30 * 24 * 60 * 60,
    },
    pages: {
        signIn: '/auth/login'
    },
    callbacks: {
        async jwt({token, user}) {
            return {...token, ...user}},

        async session({session, token}) {
            session.user = token;
            return session;

        },
    }
}

export default NextAuth(authOptions);