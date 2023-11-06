/** @jsxImportSource @emotion/react */

import React from 'react';
import { css } from '@emotion/react';
const Footer = ({isDark, setIsDark}) => {
    return (
        <div
            css={css`
            margin: 1rem 0;
            display: inline;
              justify-content: center;
            `}
        >
            <p>
                Book List Inc.
            </p>
            <button onClick={() => setIsDark(!isDark)}
            css={css`
            background-color: #FCF6F5;
              color: #333;
              border: 1px solid rgba(34, 36, 38, 0.15);
              padding: 0.5rem 1rem;
              margin-left: 15px;
              border-radius: 0.25rem;
              cursor: pointer;
              
              &.hover {
                transform: translate(-2px);
              }
              
            `}
            >{isDark ? "dark" : "light"}</button>
            
        </div>
    );
};

export default Footer;