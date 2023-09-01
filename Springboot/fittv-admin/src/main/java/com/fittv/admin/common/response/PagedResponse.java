package com.fittv.admin.common.response;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@ApiModel(value = "페이징 API 응답")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PagedResponse<T> {

    private Long totalCount;
    private List<T> pageData;
}
