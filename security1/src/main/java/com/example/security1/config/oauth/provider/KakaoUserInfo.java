package com.example.security1.config.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo {

    private Map<String,Object> attributes; // oauth2User.getAttributes()

    public KakaoUserInfo(Map<String,Object> attributes) {
        this.attributes = attributes;
    }

    @Override
    public String getProviderId() {
        return ((Long)attributes.get("id")).toString();
    }

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getEmail() {
        return (String)((Map)attributes.get("kakao_account")).get("email");
    }

    @Override
    public String getName() {
        return (String)attributes.get("nickname");
    }
}
