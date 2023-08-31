package com.fittv.admin.controller;

import com.fittv.admin.common.ApiResponse;
import com.fittv.admin.common.Path;
import com.fittv.admin.common.ResponseUtil;
import com.fittv.admin.controller.request.SampleRequest;
import com.fittv.admin.controller.response.SampleResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * 샘플
 */
@Api(value = "Sample", description = "샘플 컨트롤러")
@Slf4j
@RestController
public class SampleController {

    @ApiOperation(value = "샘플 요청", response = ResponseEntity.class)
    @GetMapping(Path.SAMPLE)
    public ResponseEntity<ApiResponse<Object>> sample(SampleRequest request) {

        log.info("sample request : {}", request);

        // 예외처리 예시
//        if (true) {
//            throw new ServiceException(ResponseCodes.INTERNAL_SERVER_ERROR);
//        }

        return ResponseUtil.ok();
    }


}
