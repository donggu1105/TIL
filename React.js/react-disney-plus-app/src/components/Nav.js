import React, {useEffect, useState} from 'react';
import styled from "styled-components";

function Nav(props) {

    const [show, setShow] = useState(false);

    useEffect(() => {
        window.addEventListener("scroll", () => {
            if (window.scrollY > 50) {
                setShow(true);
            } else {
                setShow(false);
            }
        });
        return () => {
            window.removeEventListener("scroll", () => {
            });
        }

    }, []);





    return (
        <NavWrapper show={show.toString()}>
            <Logo>
                <img alt="Disney Plus Logo"
                     src="/images/logo.svg"
                     onClick={() => (window.location.href = "/")}
                />


            </Logo>


        </NavWrapper>
    );
}



export default Nav;

const NavWrapper = styled.nav`
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: 70px;
        // background-color: ${props => props.show ? '#909b13' : 'transparent'};
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 36px;
        letter-spacing: 16px;
        z-index: 3;
        `;




const Logo = styled.a`
  padding: 0;
  width: 80px;
  margin-top: 4px;
  max-height: 70px;
  font-size: 0;
  display: inline-block;
  
  img {
    display: block;
    width: 100%;
  }


`;