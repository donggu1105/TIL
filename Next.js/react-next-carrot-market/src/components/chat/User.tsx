/* eslint-disable @next/next/no-img-element */
import { fromNow } from "@/helpers/dayjs";
import { TConversation, TUserWithChat } from "@/types";

interface IUserProps {
  user: TUserWithChat;
  currentUserId: string;
}

const User = ({ user, currentUserId }: IUserProps) => {
  const messagesWihCurrentUser = user.conversations.find(
    (conversation: TConversation) =>
      conversation.users.find((user) => user.id === currentUserId)
  );

  const latestMessage = messagesWihCurrentUser?.messages.slice(-1)[0];

  return (
    <div className="grid grid-cols-[40px_1fr_50px] grid-rows-[40px] gap-3 py-3 px-4 
    border-b-[1px] hover:cursor-pointer hover:bg-orange-500">
      <div className="w-10 h-10 overflow-hidden bg-white rounded-full">
        <img src={user.image || ""} alt="" />
      </div>
      <div>
        <h3 className="overflow-hidden text-base font-medium">{user.name}</h3>
        {latestMessage && <p className="overflow-hidden text-xs font-medium text-gray-600 break-words whitespace-pre-wrap">{latestMessage.text}</p>}
        {latestMessage && latestMessage.image && 
        <p className="text-xs font-medium text-gray-600">[이미지]</p>}

      </div>
      <div className="flex justify-end text-xs text-gray-500">
        {latestMessage && (
          <p>
            {fromNow(latestMessage?.createdAt)}
          </p>
        )}
      </div>
    </div>
  );
};

export default User;
