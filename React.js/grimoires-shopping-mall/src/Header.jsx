import React from 'react';

const Header = () => {
    return (
        <header className="bg-gray-800 text-white p-4 flex justify-between items-center">
            <div className="flex items-center">
                <img src="path-to-your-logo.png" alt="Logo" className="h-12 mr-3" />
                <span className="text-xl font-semibold">Your Agency</span>
            </div>
            <nav>
                <ul className="flex">
                    <li className="ml-6"><a href="#hero" className="hover:text-gray-300">Home</a></li>
                    <li className="ml-6"><a href="#portfolio" className="hover:text-gray-300">Portfolio</a></li>
                    <li className="ml-6"><a href="#about" className="hover:text-gray-300">About</a></li>
                    <li className="ml-6"><a href="#contact" className="hover:text-gray-300">Contact</a></li>
                </ul>
            </nav>
        </header>
    );
};

export default Header;
