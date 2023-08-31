package com.fittv.admin.common;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;



@ApiModel(value = "API 응답")
@Data
@AllArgsConstructor
@Builder
public class ApiResponse<T> {
    private int code;
    private String message;
    private T data;


    public static <T> ApiResponse<T> res(ResponseCodes responseCode) {
        return res(responseCode.getCode(), responseCode.getMsg());
    }

    public static <T> ApiResponse<T> res(final int responseCode, final String responseMessage) {
        return res(responseCode, responseMessage, null);
    }

    public static <T> ApiResponse<T> res(final int responseCode, final String responseMessage, final T t) {
        return ApiResponse.<T>builder()
                .data(t)
                .code(responseCode)
                .message(responseMessage)
                .build();
    }

}
