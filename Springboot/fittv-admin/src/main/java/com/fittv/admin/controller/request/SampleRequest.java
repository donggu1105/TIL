package com.fittv.admin.controller.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@ApiModel(value = "샘플 요청")
@Data
public class SampleRequest {

    @ApiModelProperty(value = , dataType = "Long", required = true)
    private Long id;

    @ApiModelProperty(value = "샘플 요청 필드2")
    private String name;
}
