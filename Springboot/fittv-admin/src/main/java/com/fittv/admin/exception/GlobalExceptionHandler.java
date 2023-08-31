package com.fittv.admin.exception;

import com.fittv.admin.common.ApiResponse;
import com.fittv.admin.common.ResponseCodes;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@ControllerAdvice
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<ApiResponse> handleGeneralException(Exception e) {
        log.error(e.getMessage());
        ApiResponse response = ApiResponse.res(ResponseCodes.INTERNAL_SERVER_ERROR.getCode(), ResponseCodes.INTERNAL_SERVER_ERROR.getMsg(), null);
        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }


    @ExceptionHandler(value = ServiceException.class)
    public ResponseEntity<?> handleServiceException(ServiceException e) {
        log.error(e.getMessage());
        return ResponseEntity.ok(ApiResponse.res(e.getResponseCodes()));
    }
}
