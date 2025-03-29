package com.wangwen.gdfwzhxt.model.dto.transformer;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "配变停电事件请求参数")
public class TransformerEventDto {
    @Schema(description = "变压器局号")
    private String transformerCode;

    @Schema(description = "变压器名称")
    private String transformerName;

    @Schema(description = "终端停电开始时间")
    private String terminalOutageBeingTime;

    @Schema(description = "终端停电结束时间")
    private String terminalOutageEndTime;

    @Schema(description = "停电类型")
    private List<Integer> powerOutageType;

    @Schema(description = "停电状态")
    private Integer status;
}
