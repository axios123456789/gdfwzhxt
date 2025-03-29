package com.wangwen.gdfwzhxt.model.dto.line;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "封装线路停运事件请求参数")
public class LineEventDto {
    @Schema(description = "线路名称")
    private String lineName;

    @Schema(description = "停电开始时间")
    private String powerOutageBeginTime;

    @Schema(description = "停电结束时间")
    private String powerOutageEndTime;

    @Schema(description = "停电类型")
    private Integer powerOutageType;

    @Schema(description = "停电状态")
    private Integer status;
}
