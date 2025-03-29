package com.wangwen.gdfwzhxt.model.dto.workOrder;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "封装工单条件查询参数")
public class WorkOrderDto {
    @Schema(description = "工单编号")
    private String workOrderNo;

    @Schema(description = "工单类型")
    private List<Integer> workOrderType;

    @Schema(description = "工单来源")
    private List<Integer> workOrderSource;

    @Schema(description = "工单状态")
    private List<Integer> workOrderStatus;

    @Schema(description = "事件类型")
    private List<Integer> eventType;

    @Schema(description = "受理开始时间")
    private String handleBeginTime;

    @Schema(description = "受理结束时间")
    private String handleEndTime;

    @Schema(description = "接单人")
    private String acceptOrderBy;

    @Schema(description = "工单创建开始时间")
    private String createBeginTime;

    @Schema(description = "工单创建结束时间")
    private String createEndTime;
}
