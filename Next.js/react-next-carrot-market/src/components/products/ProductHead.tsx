'use client';

import Image from "next/image";

import Heading from "../Heading";
import HeartButton from "../HeartButton";
import { TUser } from "@/types";

interface ProductHeadProps {
  title: string;
  imageSrc: string;
  id: string;
  currentUser?: TUser | null
}

const ProductHead: React.FC<ProductHeadProps> = ({
  title,
  imageSrc,
  id,
  currentUser
}) => {
  return (
    <>
      <Heading
        title={title}
      />
      <div className="
          w-full
          h-[60vh]
          overflow-hidden 
          rounded-xl
          relative
        "
      >
        <Image
          src={imageSrc}
          fill
          className="object-cover w-full"
          alt="Image"
        />
        <div
          className="absolute top-5 right-5"
        >
          <HeartButton
            productId={id}
            currentUser={currentUser}
          />
        </div>
      </div>
    </>
  );
}

export default ProductHead;

