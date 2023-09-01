package com.fittv.admin.exception;

import com.fittv.admin.common.response.DefaultApiResponse;
import com.fittv.admin.common.response.ResponseCodes;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.*;

@Slf4j
@ControllerAdvice
@RestControllerAdvice
public class GlobalExceptionHandler {

    private List<Class<? extends Exception>> skipExceptions = Arrays.asList(
            ServiceException.class,
            MethodArgumentNotValidException.class
    );

    /**
     * 일반적인 예외를 처리합니다.
     */
    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<DefaultApiResponse> handleGeneralException(Exception e) {

        if (skipExceptions.contains(e.getClass())) {
            return null; // 다른 핸들러가 처리하도록 넘깁니다.
        }
        DefaultApiResponse response = DefaultApiResponse.res(ResponseCodes.INTERNAL_SERVER_ERROR.getCode(), ResponseCodes.INTERNAL_SERVER_ERROR.getMsg(), null);
        log.error(e.getMessage());
        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }



    /**
     * 유효성 검사 실패시 발생하는 예외를 처리합니다.
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<DefaultApiResponse> handleBindException(MethodArgumentNotValidException ex) {
        Map<String, List<String>> errors = new HashMap<>();

        log.error(ex.getBindingResult().getAllErrors().size() + "개의 유효성 검사 실패");

        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            if (errors.containsKey(fieldName)) {
                errors.get(fieldName).add(errorMessage);
            } else {
                List<String> errorList = new ArrayList<>();
                errorList.add(errorMessage);
                errors.put(fieldName, errorList);
            }
        });
        log.error(errors.toString());

        DefaultApiResponse response = DefaultApiResponse.res(ResponseCodes.BAD_REQUEST.getCode(), ResponseCodes.BAD_REQUEST.getMsg(), errors);

        return ResponseEntity.badRequest().body(response);
    }


    /**
     * 비즈니즈 로직 실패시 발생하는 예외를 처리합니다.
     */
    @ExceptionHandler(value = ServiceException.class)
    public ResponseEntity<?> handleServiceException(ServiceException e) {
        log.error(e.getMessage());
        return ResponseEntity.ok(DefaultApiResponse.res(e.getResponseCodes()));
    }
}
