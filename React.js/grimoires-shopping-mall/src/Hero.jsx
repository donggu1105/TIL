import React from 'react';

const Hero = () => {
    return (
        <section id="hero" className="text-center p-10 bg-gray-100">
            <h1 className="text-4xl font-bold mb-4">Welcome to Our Development Agency</h1>
            <p className="mb-6">We create innovative digital solutions.</p>
            <a href="#contact" className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Get in Touch
            </a>
        </section>
    );
};

export default Hero;
