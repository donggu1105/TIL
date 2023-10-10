import { NextResponse } from "next/server";

import getCurrentUser from "@/app/actions/getCurrentUser";
import prisma from "@/helpers/prismadb";

export async function GET(
    request: Request,
) {
    const currentUser = await getCurrentUser();

    if (!currentUser) {
        return NextResponse.error();
    }

    const users = await prisma.user.findMany({
        include: {
            conversations: {
                include: {
                    messages: {
                        include: {
                            sender: true,
                            receiver: true,
                        },
                        orderBy: {
                            createdAt: "asc",
                        },
                    },
                    users: true,
                },
            },
        }
    });

    return NextResponse.json(users);
}



export async function POST(
    request: Request,
) {
    const currentUser = await getCurrentUser();
    // console.log('currentUser', currentUser);
    if (!currentUser) {
        return NextResponse.error();
    }

    const body = await request.json();

    // 이미 둘이 대화를 한 conversation이 있는지 찾기 
    const conversation = await prisma.conversation.findFirst({
        where: {
            AND: [
                {
                    users: {
                        some: {
                            id: body.senderId,
                        },
                    },
                },
                {
                    users: {
                        some: {
                            id: body.receiverId,
                        },
                    },
                },
            ],
        },
    });
    // console.log('conversation', conversation);

    if (conversation) {
        // 이미 둘이 대화를 한 conversation가 있다면 메시지만 생성하기
        try {
            const message = await prisma.message.create({
                data: {
                    text: body.text,
                    image: body.image,
                    senderId: body.senderId,
                    receiverId: body.receiverId,
                    conversationId: conversation.id,
                },
            });
            return NextResponse.json(message);

        } catch (error) {
            return NextResponse.json(error);
        }
    } else {
        // 둘이 처음 대화하는 거라면 conversation과 message 둘 다 생성
        //  conversation 생성 시 존재하는 유저 record와 연결
        // https://www.prisma.io/docs/concepts/components/prisma-client/relation-queries#connect-an-existing-record
        const newConversation = await prisma.conversation.create({
            data: {
                senderId: body.senderId,
                receiverId: body.receiverId,
                users: {
                    connect: [
                        {
                            id: body.senderId,
                        },
                        {
                            id: body.receiverId,
                        },
                    ],
                },
            },
        });

        try {
            const message = await prisma.message.create({
                data: {
                    text: body.text,
                    image: body.image,
                    conversationId: newConversation.id,
                    senderId: body.senderId,
                    receiverId: body.receiverId,
                },
            });
            return NextResponse.json(message);
        } catch (error) {
            return NextResponse.json(error);
        }
    }
}

