package com.example.jwt.auth;

import com.example.jwt.model.User;
import com.example.jwt.model.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RestController;

// http://localhost:8080/login 요청오면 동작 -> formLogin() disable 해놓음
@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("PrincipalDetailsService is called");
        User userEntity = userRepository.findByUsername(username);
        System.out.println("userEntity:"+userEntity);
        return new PrincipalDetails(userEntity);
    }
}
