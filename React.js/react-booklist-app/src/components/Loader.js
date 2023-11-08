/** @jsxImportSource @emotion/react */
import {css} from '@emotion/react';
import React from 'react';

const Loader = ({loading, children}) => {
    return (
        <>
            {loading ? <div css={css`
            color: #ffffff;
          text-align: center;
              padding: 20px;
            `}
            >
                {children}
            </div> : null}
        </>
    );
};

export default Loader;