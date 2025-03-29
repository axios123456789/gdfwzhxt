package com.wangwen.gdfwzhxt.model.dto.workOrder;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "巡视记录条件查询参数")
public class ViewRecordDto {
    @Schema(description = "设备类型")
    private Integer equipType;

    @Schema(description = "设备名称")
    private String equipName;

    @Schema(description = "设备故障类型")
    private List<Integer> equipFaultType;

    @Schema(description = "巡视开始时间")
    private String viewBeginTime;

    @Schema(description = "巡视结束时间")
    private String viewEndTime;

    @Schema(description = "处理标识")
    private List<Integer> handleFlag;
}
