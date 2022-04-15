package com.example.security1.config.auth;

// 시큐리티가 /login을 주소요청이 오면  낚아채서 로그인을 진행
// 로그인을 진행이 완료가 되면 시큐리티 session을 만들어줍니다. (Security ContextHolder라는 키값에 저장)
// 오브젝트 타입 => Authentication 타입의 객체
// Authentication 안에 User정보가 있어야 됨.
// User 오브젝트 타입 => UserDetails 타입 객체


import com.example.security1.model.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

// Security Session 정보에 저장을 해주는데 => 여기에 들어가는 객체는 Authentication => UserDetails
@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

    private User user;


    public PrincipalDetails(User user) {
        this.user = user;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return null;
    }

    @Override
    public String getName() {
        return null;
    }

    // 해당 User의 권한을 리턴하는 곳!
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collect = new ArrayList<>();

        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return user.getRole();
            }
        });
        return collect;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() { // 활성화 여부

        // 우리 사이트가 1년동안 회원이 로그인을 안하면 휴면계정으로 하기로했다.
        // 현재시간 - 로긴시간 => 1년을 초과하면 return false
        return true;
    }


}
