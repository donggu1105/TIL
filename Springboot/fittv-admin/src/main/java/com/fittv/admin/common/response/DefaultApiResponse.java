package com.fittv.admin.common.response;


import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;



@ApiModel(value = "API 응답")
@Data
@AllArgsConstructor
@Builder
public class DefaultApiResponse<T> {
    private int code;
    private String message;
    private T data;


    public static <T> DefaultApiResponse<T> res(ResponseCodes responseCode) {
        return res(responseCode.getCode(), responseCode.getMsg());
    }

    public static <T> DefaultApiResponse<T> res(final int responseCode, final String responseMessage) {
        return res(responseCode, responseMessage, null);
    }

    public static <T> DefaultApiResponse<T> res(final int responseCode, final String responseMessage, final T t) {
        return DefaultApiResponse.<T>builder()
                .data(t)
                .code(responseCode)
                .message(responseMessage)
                .build();
    }

}
