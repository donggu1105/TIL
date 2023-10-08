import React from 'react';
import Link from "next/link";
import {signIn, signOut, useSession} from "next-auth/react";

const NavItem = ({mobile} : {mobile?: boolean}) => {

    const {data: session, status} = useSession();
    console.log({session}, status);

    return (
        <ul className={`text-md justify-center flex gap-4 w-full items-center ${mobile && "flex-col h-full"}`}>
            <li className="py-2 text-center border-b-4 cursor-pointer"><Link href="/admin">Admin</Link></li>
            <li className="py-2 text-center border-b-4 cursor-pointer"><Link href="/user">User</Link></li>

            {session?.user
                ?
                <li className="py-2 text-center border-b-4 cursor-pointer"><button onClick={() => signOut()}>SiginOut</button></li>
                :
                <li className="py-2 text-center border-b-4 cursor-pointer"><button onClick={() => signIn()}
                >SiginIn</button></li>
            }



        </ul>
    );
};

export default NavItem;