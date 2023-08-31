package com.fittv.admin.exception;

import com.fittv.admin.common.ResponseCodes;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
public class ServiceException extends RuntimeException {

    private final ResponseCodes responseCodes;

    public ServiceException(ResponseCodes responseCodes) {
        super(responseCodes.getMsg());
        this.responseCodes = responseCodes;
    }

}
