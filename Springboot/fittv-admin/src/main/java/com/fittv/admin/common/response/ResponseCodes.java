package com.fittv.admin.common.response;


import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ResponseCodes {


    /**
     * =================================== BASIC ============================
     * ======================================================================
     */
    SUCCESS(200, "성공"),
    BAD_REQUEST(400, "잘못된 요청 입니다."),
    UNAUTHORIZED(401, "인증이 필요합니다."),
    FORBIDDEN(403, "접근이 거부되었습니다."),
    NOT_FOUND(404, "리소스를 찾을 수 없습니다."),
    INTERNAL_SERVER_ERROR(500, "서버 내부 오류입니다");


    private int code;
    private String msg;

}
