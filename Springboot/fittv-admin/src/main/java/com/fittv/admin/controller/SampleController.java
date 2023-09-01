package com.fittv.admin.controller;

import com.fittv.admin.common.response.DefaultApiResponse;
import com.fittv.admin.common.Path;
import com.fittv.admin.common.response.ResponseUtil;
import com.fittv.admin.controller.dto.SampleRequestDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@Api(tags = "Sample", description = "샘플 컨트롤러")
@Slf4j
@RestController
public class SampleController {


    /**
     * 샘플 요청 (API 설명)
     */
    @ApiOperation(value = "샘플 요청", response = SampleController.class)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "설명", content = @Content(schema = @Schema(implementation = ResponseEntity.class)))})
    @GetMapping(Path.SAMPLE)
    public ResponseEntity<DefaultApiResponse> sample(@Valid @RequestBody SampleRequestDto request) {

        log.info("sample request : {}", request);

        /**
         * 예외처리 예시
         */
//        if (true) {
//            throw new ServiceException(ResponseCodes.INTERNAL_SERVER_ERROR);
//        }

        return ResponseUtil.ok();
    }


}
