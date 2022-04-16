package com.example.security1.controller;

import com.example.security1.config.auth.PrincipalDetails;
import com.example.security1.model.User;
import com.example.security1.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequiredArgsConstructor
@Controller // view를 리턴하겠다.
public class IndexController {

    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/test/login")
    public @ResponseBody String testLogin(Authentication authentication, @AuthenticationPrincipal PrincipalDetails userDetails) {
        // DI(의존성 주입) @AuthenticationPrincipal 이거쓰면 UserDetails를 받을수있게해줌 , 세션정보를 가져올수있게 해줌
        System.out.println("/test/login ===========");
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        System.out.println("authentication : " + principalDetails.getUsername());

        System.out.println("userDetails :" + userDetails.getUser());
        return "세션 정보 확인하기";
    }

    /**
     * 스프링 시큐리티 - 자기만의 시큐리티 세션을 가지고 있음
     * 서버가 관리하는 세션안에 시큐리티 세션이 있음 - 이 세션은 Authentication 객체 밖에 없음
     *
     * 근데 Authentication 은 2가지 종류가 있어
     * 1. UserDetails : 일반적인 로그인
     * 2. OAuth2User : OAuth 로그인
     *
     * -> 두개라서 번거로워 세션처리할때 -> 두개를 부모로 두는 특정한 클래스를 만들자. 그냥 그 클래스를 Authentication에 담자
     * */

    @GetMapping("/test/oauth/login")
    public @ResponseBody String testOAuthLogin(Authentication authentication, @AuthenticationPrincipal OAuth2User oAuth) {
        // DI(의존성 주입) @AuthenticationPrincipal 이거쓰면 UserDetails를 받을수있게해줌 , 세션정보를 가져올수있게 해줌
        System.out.println("/test/oauth/login ===========");
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        System.out.println("authentication : " + oAuth2User.getAttributes());

        System.out.println("oauth2User:"+oAuth.getAttributes());

        return "oauth 세션 정보 확인하기";
    }



    @GetMapping("/user")
    public @ResponseBody String testOAuthLogin(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        System.out.println("pricipalDetails : " + principalDetails.getUser());
        return "user";
    }

    @GetMapping({"", "/" })
    public String index() {
        return "index";
    }

//
//    @GetMapping("/user")
//    public @ResponseBody
//    String user() {
//        return "user";
//    }

    @GetMapping("/admin")
    public @ResponseBody
    String admin() {
        return "admin";
    }

    @GetMapping("/manager")
    public @ResponseBody
    String manager() {
        return "manager";
    }

    @GetMapping("/loginForm") // - SecurityConfig 파일 생성후 작동안함
    public String login() {
        return "loginForm";
    }


    @GetMapping("/joinForm")
    public String joinForm() {
        return "joinForm";
    }

    @PostMapping("/join")
    public String join(User user) {


        user.setRole("ROLE_USER");
        String rawPassword = user.getPassword();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        user.setPassword(encPassword);

        System.out.println(user);

        userRepository.save(user); // 비밀번호 : 1234 => 시큐리티로 로그인을 할수없음 , 이유는 패스워드가 암호화가 안되었기 때문입니다.


        return "redirect:/loginForm";
    }


    @Secured("ROLE_ADMIN")
    @GetMapping("/info")
    public @ResponseBody
    String info() {
        return "개인정보";
    }

    @PreAuthorize("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')") // 함수가 실행되기 직전에 권한 처리
//    @PostAuthorize() // 함수가 끝나고 나서 권한 처리
    @GetMapping("/data")
    public @ResponseBody
    String data() {
        return "데이터 정보";
    }

}
