'use client';

import { IconType } from "react-icons";
import { RotatingLines } from "react-loader-spinner";

interface ButtonProps {
    label?: string;
    onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
    disabled?: boolean;
    outline?: boolean;
    small?: boolean;
    icon?: IconType;
    isLoading?: boolean;
}

const Button: React.FC<ButtonProps> = ({
    label,
    onClick,
    disabled,
    outline,
    small,
    icon: Icon,
    isLoading = false
}) => {
    return (
        <button
            type='submit'
            disabled={disabled}
            onClick={onClick}
            className={`
        relative
        disabled:opacity-70
        disabled:cursor-not-allowed
        rounded-lg
        hover:opacity-80
        transition   
        w-full
        ${outline ? 'bg-white' : 'bg-orange-500'}
        ${outline ? 'border-black' : 'border-orange-500'}
        ${outline ? 'text-black' : 'text-white'}
        ${small ? 'text-sm' : 'text-md'}
        ${small ? 'py-1' : 'py-3'}
        ${small ? 'font-light' : 'font-semibold'}
        ${small ? 'border-[1px]' : 'border-2'}
      `}
        >
            {isLoading ?
                <div className="flex justify-center">
                    <RotatingLines
                        strokeColor="grey"
                        strokeWidth="5"
                        animationDuration="0.75"
                        width="30"
                        visible={true}
                    />
                </div>
                :
                <>
                    {Icon && (
                        <Icon
                            size={24}
                            className="absolute left-4 top-3"
                        />
                    )}
                    {label && label}
                </>
            }
        </button>
    );
}

export default Button;