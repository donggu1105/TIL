package com.fittv.admin.common.response;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseUtil {

    public static <T> ResponseEntity<DefaultApiResponse<T>> ok(T body) {
        return new ResponseEntity<>(
                DefaultApiResponse.res(ResponseCodes.SUCCESS.getCode(), ResponseCodes.SUCCESS.getMsg(),
                body
            ), HttpStatus.OK);
    }

    public static <T> ResponseEntity<DefaultApiResponse<T>> ok(T body, int code, String msg) {
        return new ResponseEntity<>(
                DefaultApiResponse.res(code, msg, body), HttpStatus.OK);
    }

    public static <T> ResponseEntity<DefaultApiResponse> ok() {
        return new ResponseEntity<>(
                DefaultApiResponse.res(ResponseCodes.SUCCESS.getCode(), ResponseCodes.SUCCESS.getMsg(), null), HttpStatus.OK);
    }



}
