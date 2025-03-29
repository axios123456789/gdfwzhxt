package com.wangwen.gdfwzhxt.model.entity.workOrder;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "个人接单表实体类")
public class PersonAccept {
    @Schema(description = "主键")
    private String id;

    @Schema(description = "接单人名字")
    private String name;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "接单时间")
    private Date acceptTime;

    @Schema(description = "工单编号")
    private String workOrderNo;

    @Schema(description = "处理状态")
    private Integer handleStatus;

    @Schema(description = "处理状态名称")
    private String handleStatusName;

    private String company;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "处理开始时间")
    private Date processBeginTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "督办开始时间")
    private Date superviseBeginTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "督办结束时间")
    private Date superviseEndTime;

    @Schema(description = "工单内容")
    private String workOrderContent;

    @Schema(description = "事件id")
    private String eventId;

    @Schema(description = "事件类型")
    private Integer eventType;

    @Schema(description = "事件类型名称")
    private String eventTypeName;

    @Schema(description = "工单来源")
    private Integer workOrderSource;

    @Schema(description = "工单来源名称")
    private String workOrderSourceName;

    @Schema(description = "工单类型")
    private Integer workOrderType;

    @Schema(description = "工单类型名称")
    private String workOrderTypeName;

    @Schema(description = "催办次数")
    private Integer urgeToHandleCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "上次催办时间")
    private Date lastUrgeToHandleTime;

    @Schema(description = "接单人id")
    private String userId;
}
