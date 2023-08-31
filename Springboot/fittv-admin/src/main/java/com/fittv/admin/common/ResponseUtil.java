package com.fittv.admin.common;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseUtil {

    public static <T> ResponseEntity<ApiResponse<T>> ok(T body) {
        return new ResponseEntity<>(
                ApiResponse.res(ResponseCodes.SUCCESS.getCode(), ResponseCodes.SUCCESS.getMsg(),
                body
            ), HttpStatus.OK);
    }

    public static <T> ResponseEntity<ApiResponse<T>> ok(T body, int code, String msg) {
        return new ResponseEntity<>(
                ApiResponse.res(code, msg, body), HttpStatus.OK);
    }

    public static <T> ResponseEntity<ApiResponse<T>> ok() {
        return new ResponseEntity<>(
                ApiResponse.res(ResponseCodes.SUCCESS.getCode(), ResponseCodes.SUCCESS.getMsg(), null), HttpStatus.OK);
    }



}
