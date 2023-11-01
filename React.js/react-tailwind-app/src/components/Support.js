import React from 'react';
import supportImg from '../assets/support.jpeg';

const Support = () => {
    return (
        <div name="support" className="w-full m-24">

            <div className="w-full h-[700px] bg-slate-900/90 absolute">
                <img className='object-cover w-full h-full mix-blend-overlay' src={supportImg} alt="/" />
            </div>

            <div className='max-w-[1240px] mx-auto text-white relative'>

            </div>
        </div>
    );
};

export default Support;