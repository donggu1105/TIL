import { NextResponse } from "next/server";
import bcrypt from "bcryptjs";
import prisma from "@/helpers/prismadb";

export async function POST(
    request: Request,
) {
    const body = await request.json();
    const {
        email,
        name,
        password
    } = body;

    const hashedPassword = await bcrypt.hash(password, 12);

    const user = await prisma.user.create({
        data: {
            email,
            name,
            hashedPassword,
            image: 'https://via.placeholder.com/400x400?text=no+user+image'
        }
    });

    return NextResponse.json(user);
}


