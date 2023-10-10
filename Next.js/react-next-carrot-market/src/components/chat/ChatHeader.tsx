/* eslint-disable @next/next/no-img-element */
import { formatTime } from "@/helpers/dayjs";
import { IoChevronBackCircleSharp } from "react-icons/io5";
interface IChatHeaderProps {
  setLayout: (layout: boolean) => void;
  receiverName: string;
  receiverImage: string;
  lastMessageTime: Date | undefined;
}

const ChatHeader = ({
  setLayout,
  receiverName,
  receiverImage,
  lastMessageTime,
}: IChatHeaderProps) => {
  return (
    <div className='pl-4 border-b-[1px]'>
      <div className='flex items-center h-16 gap-4 '>
        <div className='flex items-center justify-center text-3xl text-gray-400 hover:text-gray-600'>
          <button onClick={() => setLayout(false)} className="md:hidden">
            <IoChevronBackCircleSharp />
          </button>
        </div>
        <div className='flex items-center gap-[0.6rem]'>
          <div className='flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-900 rounded-full'>
            <img src={receiverImage || ""} alt="" />
          </div>
          <div>
            <h2 className="text-lg font-semibold ">{receiverName}</h2>
            {lastMessageTime && (
              <p className="text-gray-600">
                {formatTime(lastMessageTime)}
              </p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ChatHeader;
