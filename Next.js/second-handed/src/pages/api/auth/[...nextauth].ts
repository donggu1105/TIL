import NextAuth, { NextAuthOptions } from "next-auth"
import GoogleProvider from "next-auth/providers/google"
import { PrismaClient } from "@prisma/client"
import CredentialsProvider from 'next-auth/providers/credentials'
import {PrismaAdapter} from "@next-auth/prisma-adapter";

const prisma = new PrismaClient()

export const authOptions: NextAuthOptions = {
    adapter: PrismaAdapter(prisma),
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
                username: { label: "Username", type: "text", placeholder: "" },
                password: {  label: "Password", type: "password" }
            },
            async authorize(credentials, req) {
                // Add logic here to look up the user from the credentials supplied


                const user = { id: "1", name: "J Smith", email: "jsmith@example.com", role: "User"}

                if (user) {
                    // Any object returned will be saved in `user` property of the JWT
                    return user
                } else {
                    // If you return null then an error will be displayed advising the user to check their details.
                    return null

                    // You can also Reject this callback with an Error thus the user will be sent to the error page with the error message as a query parameter
                }
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