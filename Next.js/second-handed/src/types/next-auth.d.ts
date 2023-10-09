
declare module "next-auth" {
    import {DefaultSession} from "next-auth";

    interface Session {
        user?: {
            id?: string;
            role?: string;
        } & DefaultSession["user"];

    }

}