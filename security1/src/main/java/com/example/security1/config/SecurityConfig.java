package com.example.security1.config;

import com.example.security1.config.oauth.PrincipalOauth2UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록이 됨
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) // secured 어노테이션 활성화  => 특정 메소드에 주고 싶을때, prePostEnabled => preAuthorize 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final PrincipalOauth2UserService principalOauth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http.authorizeRequests()
                .antMatchers("/user/**").authenticated() // user로 들어오면 인증이필요해
                .antMatchers("/manager/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')") // 로그인은 했지만 해당권한이 있어야됨
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                .anyRequest().permitAll() // 다른요청은 모두 on
                // 권한없으면 이쪽 타게 만들기
                .and()
                .formLogin()
                .loginPage("/loginForm")
                .loginProcessingUrl("/login") // /login 주소가 호출이되면 시큐리티가 낚아채서 대신 로그인을 진행해줍니다. => /login 안만들어도됨
                .defaultSuccessUrl("/") // 성공하면 갈 주소
                // oauth2
                .and()
                .oauth2Login()
                .loginPage("/loginForm") // 여기 까지하면 구글로그인 완료된 뒤의 후처리가 필요함
                // 1. 코드받기 (인증이 됬다는 뜻, 구글에 인증된 사용자라는 뜻)
                // 2. 엑세스 토큰(시큐리티가 구글에 접근권한 생김)
                // 3. 사용자프로필 정보를 가져오기
                // 4-1. 그 정보를 토대로 회원가입을 자동으로 진행시키기도함
                // 4-2. (이메일, 전화번호, 이름 ,아이디) 쇼핑몰을 한다고하면 집주소같은게 추가적으로 필요함
                .userInfoEndpoint() // Tip. 코드르르 받는게아니라 (엑세스토큰 + 사용자프로필 정보를 받음)
                .userService(principalOauth2UserService);

    }


    @Bean // 해당 메서드의 리턴되는 오브젝트를 ioC로 등록해준다.
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }
}
