package com.wangwen.gdfwzhxt.model.entity.workOrder;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "工单实体类")
public class WorkOrder extends BaseEntity {
    @Schema(description = "工单编号")
    private String workOrderNo;

    @Schema(description = "工单类型")
    private Integer workOrderType;

    @Schema(description = "工单类型名称")
    private String workOrderTypeName;

    @Schema(description = "督办事件id")
    private String eventId;

    @Schema(description = "工单内容")
    private String workOrderContent;

    @Schema(description = "工单来源")
    private Integer workOrderSource;

    @Schema(description = "工单来源名称")
    private String workOrderSourceName;

    @Schema(description = "工单状态")
    private Integer workOrderStatus;

    @Schema(description = "工单状态名称")
    private String workOrderStatusName;

    @Schema(description = "接单地址")
    private String acceptAddress;

    @Schema(description = "催受理次数")
    private Integer urgeToProcessCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "上次催受理时间")
    private Date lastUrgeToProcessTime;

    @Schema(description = "催接单次数")
    private Integer urgeToAcceptCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "上次催接单时间")
    private Date lastUrgeToAcceptTime;

    @Schema(description = "催办次数")
    private Integer urgeToHandleCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "上次催办时间")
    private Date lastUrgeToHandleTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "受理时间")
    private Date handleTime;

    @Schema(description = "受理人")
    private String handleBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "接单时间")
    private Date acceptOrderTime;

    @Schema(description = "接单人")
    private String acceptOrderBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "完成时间")
    private Date finishTime;

    @Schema(description = "完成人")
    private String finishBy;

    @Schema(description = "事件类型(1->线路停运事件 2->配变停运事件 3->用户停电事件)")
    private Integer eventType;

    @Schema(description = "事件类型名称")
    private String eventTypeName;

    @Schema(description = "工单审核材料编号")
    private String sourceNo;
}
