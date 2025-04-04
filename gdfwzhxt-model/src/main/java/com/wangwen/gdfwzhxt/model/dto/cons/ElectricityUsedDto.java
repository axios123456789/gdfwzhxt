package com.wangwen.gdfwzhxt.model.dto.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "电能使用情况条件查询参数")
public class ElectricityUsedDto {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @Schema(description = "记录开始时间")
    private String recordBeginTime;

    @Schema(description = "记录结束时间")
    private String recordEndTime;
}
