import Link from "next/link";
import { IconType } from "react-icons";
interface CategoryBoxProps {
  icon: IconType,
  label: string;
  path: string;
  selected?: boolean;
}

const CategoryBox: React.FC<CategoryBoxProps> = ({
  icon: Icon,
  label,
  path,
  selected,
}) => {

  return (
    <Link
      href={`/?category=${path}`}
      className={`
        flex 
        flex-col 
        items-center 
        justify-center 
        gap-2
        p-3
        border-b-2
        hover:text-neutral-800
        transition
        cursor-pointer
        ${selected ? 'border-b-neutral-800' : 'border-transparent'}
        ${selected ? 'text-neutral-800' : 'text-neutral-500'}
      `}
    >
      <Icon size={26} />
      <div className="text-sm font-medium">
        {label}
      </div>
    </Link>
  );
}

export default CategoryBox;

