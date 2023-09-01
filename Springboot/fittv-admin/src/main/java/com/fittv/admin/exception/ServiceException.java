package com.fittv.admin.exception;

import com.fittv.admin.common.response.ResponseCodes;
import lombok.Getter;

@Getter
public class ServiceException extends RuntimeException {

    private final ResponseCodes responseCodes;

    public ServiceException(ResponseCodes responseCodes) {
        super(responseCodes.getMsg());
        this.responseCodes = responseCodes;
    }

}
