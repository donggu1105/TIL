import React from 'react'
import { signOut, signIn } from "next-auth/react";
import { TUser } from '@/types';
import { useRouter } from 'next/navigation';
import MenuItem from './MenuItem';

interface NavItemProps {
    mobile?: boolean;
    currentUser?: TUser | null;
}

const NavItem = ({ mobile, currentUser }: NavItemProps) => {
    const router = useRouter();

    return (
        <ul className={`text-md justify-center w-full flex gap-4 ${mobile && "flex-col bg-orange-500 h-full"} items-center`}>
            {currentUser ?
                <>
                    <MenuItem
                        label="Admin"
                        onClick={() => router.push('/admin')}
                    />
                    <MenuItem
                        label="Chat"
                        onClick={() => router.push('/chat')}
                    />
                    <MenuItem
                        label="Logout"
                        onClick={() => signOut()}
                    />
                </>
                :
                <MenuItem
                    label="Login"
                    onClick={() => signIn()}
                />
            }
        </ul>
    )
}

export default NavItem

