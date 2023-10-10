'use client';

interface MenuItemProps {
  onClick: () => void;
  label: string;
}

const MenuItem: React.FC<MenuItemProps> = ({
  onClick,
  label
}) => {
  return ( 
    <div 
      onClick={onClick} 
      className="px-4 py-3 font-semibold transition cursor-pointer hover:bg-orange-600"
    >
      {label}
    </div>
   );
}
 
export default MenuItem;