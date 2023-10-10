import {IconType} from "react-icons";
import React from "react";

interface ButtonProps {
    label: string;
    onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
    disabled?: boolean;
    outline?: boolean;
    small?: boolean;
    icon?: IconType;
}


export const Button: React.FC<ButtonProps> = ({label,
                                                  onClick,
                                                  disabled,
                                                  outline,
                                                  small,
                                                  icon: Icon
}) => {
    return (
        <button
            type="submit"
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
                ${outline? 'bg-white': 'bg-orange-500'}
                ${outline? 'border-black': 'border-orange-500'}
                ${outline? 'text-black': 'text-white'}
                ${small ? 'text-sm' : 'text-md'}
                ${small ? 'py-1' : 'py-3'}
                ${small ? 'font-light' : 'font-semibold'}
                ${small ? 'border-[1px]' : 'border-2'}
            `}
        >
            {Icon && (
                <Icon
                    size={24}
                    className='absolute left-4 top-3'
                />
            )}
            {label}

        </button>
    );
};
