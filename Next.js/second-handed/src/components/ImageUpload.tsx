import React from "react";
import {CldUploadWidget} from "next-cloudinary";
import {TbPhotoPlus} from "react-icons/tb";
import Image from "next/image";

interface ImageUploadProps {
    onChange: (value: string) => void;
    value: string;
}

const ImageUpload: React.FC<ImageUploadProps> = ({
    onChange, value}) => {

        const handleUpload = (result: any) => {
            console.log('result', result);
            onChange(result.info.secure_url);
        }

        const uploadPreset = process.env.NEXT_PUBLIC_CLOUDINARY_UPLOAD_PRESET


    return (
        <CldUploadWidget
            onUpload={handleUpload}
            uploadPreset={uploadPreset}
            options={{
                maxFiles: 1
            }}
        >
            {({open}) => {
                return (<div onClick={() => open?.()}
                        className='relative flex flex-col items-center justify-center gap-4 p-20 transition border-2 border-dashed cursor-pointer hover:opacity-80 border-neutral-300 text-neutral-300'
                >
                    <TbPhotoPlus size={50}/>
                    {value && (
                        <div className='absolute inset-0 w-full h-full'>

                            <Image fill
                            style={{objectFit: 'cover'}}
                            src={value}
                            alt={""}/>

                        </div>
                    )}
                </div>)
            }}


        </CldUploadWidget>
    );
};

export default ImageUpload;