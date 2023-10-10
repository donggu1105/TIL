import { Message, Product, User } from "@prisma/client";

export type TUser = Omit<
    User,
    "createdAt" | "updatedAt"
> & {
    createdAt: string;
    updatedAt: string;
};

export type TUserWithChat = TUser & {
    conversations: TConversation[];
}

export type TProduct = Omit<
    Product, "createdAt" | "updatedAt"
> & {
    createdAt: string;
    updatedAt: string;
};


export type TConversation = {
    id: string;
    messages: Message[];
    users: TUser[];
}


export type TMessage = Message