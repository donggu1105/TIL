import React, { useEffect, useRef } from "react";
import Input from "./Input";
import Message from "./Message";
import ChatHeader from "./ChatHeader";
import { TConversation, TMessage, TUser, TUserWithChat } from "@/types";

interface IChatProps {
  receiver: {
    receiverId: string;
    receiverName: string;
    receiverImage: string;
  };
  currentUser: TUserWithChat;
  setLayout: (layout: boolean) => void;
}

const Chat = ({ currentUser, receiver, setLayout }: IChatProps) => {

  const conversation: TConversation | undefined =
    currentUser?.conversations.find((conversation: TConversation) =>
      conversation.users.find((user: TUser) => user.id === receiver.receiverId)
    );

  const messagesEndRef = useRef<null | HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef?.current?.scrollIntoView({
      behavior: "smooth",
    });
  };

  useEffect(() => {
    scrollToBottom();
  });

  if (!receiver.receiverName || !currentUser)
    return <div className='w-full h-full'></div>;

  return (
    <div className="w-full">
      <div>
        <ChatHeader
          setLayout={setLayout}
          receiverName={receiver.receiverName}
          receiverImage={receiver.receiverImage}
          lastMessageTime={
            conversation?.messages
              .filter((message) => message.receiverId === currentUser.id)
              .slice(-1)[0]?.createdAt
          }
        />
      </div>

      <div className='flex flex-col gap-8 p-4 overflow-auto h-[calc(100vh_-_60px_-_70px_-_80px)]'>
        {conversation &&
          conversation.messages
            // .filter((message: TMessage) => {
            //   if (receiver.receiverId) {
            //     if (
            //       (message.senderId === receiver.receiverId &&
            //         message.receiverId === currentUser.id) ||
            //       (message.receiverId === receiver.receiverId &&
            //         message.senderId === currentUser.id)
            //     ) {
            //       return message;
            //     }
            //   }
            //   return null;
            // })
            .map((message) => {
              return (
                <Message
                  key={message.id}
                  isSender={message.senderId === currentUser.id}
                  messageText={message.text}
                  messageImage={message.image}
                  receiverName={receiver.receiverName}
                  receiverImage={receiver.receiverImage}
                  senderImage={currentUser?.image}
                  time={message.createdAt}
                />
              );
            })}
        <div ref={messagesEndRef} />
      </div>

      <div className='flex items-center p-3'>
        <Input
          receiverId={receiver?.receiverId}
          currentUserId={currentUser?.id}
        />
      </div>
    </div>
  );
};

export default Chat;
