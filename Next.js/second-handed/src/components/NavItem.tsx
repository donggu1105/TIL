import React from 'react';
import Link from "next/link";
import {signIn, signOut } from "next-auth/react";
import {User} from "@prisma/client";


interface NavItemProps {
    mobile?: boolean;
    currentUser?: User | null;
}
const NavItem = ({mobile, currentUser}: NavItemProps) => {

    const handleSignIn = async () => {
        try {
            await signIn();
        } catch (error) {
            console.log("Error during sign-in:", error);
        }
    };



    return (
        <ul className={`text-md justify-center flex gap-4 w-full items-center ${mobile && "flex-col h-full"}`}>
            <li className="py-2 text-center border-b-4 cursor-pointer"><Link href="/admin">Admin</Link></li>
            <li className="py-2 text-center border-b-4 cursor-pointer"><Link href="/user">User</Link></li>

            {currentUser
                ?
                <li className="py-2 text-center border-b-4 cursor-pointer"><button onClick={() => signOut()}>SiginOut</button></li>
                :
                <li className="py-2 text-center border-b-4 cursor-pointer"><button onClick={handleSignIn}>SiginIn</button></li>
            }
        </ul>
    );
};

export default NavItem;