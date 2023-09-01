package com.fittv.admin.controller.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@ApiModel(value = "샘플 요청")
@Data
public class SampleRequestDto {

    @ApiModelProperty(value = "ID", example = "1", required = true)
    @NotNull(message = "{id.notnull}")
    private Integer id;

    @ApiModelProperty(value = "이름", example = "강동현")
    @NotNull(message = "{name.notnull}")
//    @Size(min = 2, message = "{name.size.minOnly}")
    @Size(min = 2, max = 30, message = "{name.size.minMax}")
    private String name;
}
