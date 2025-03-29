package com.wangwen.gdfwzhxt.model.entity.cons;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "用户停电事件实体类")
public class ConsEvent {
    @Schema(description = "事件id")
    private String eventId;

    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "停电时间")
    private Date powerOutageTime;

    @Schema(description = "停电时长（小时）")
    private double powerOutageDuration;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "送电时间")
    private Date powerSupplyTime;

    @Schema(description = "停电类型")
    private Integer powerOutageType;

    @Schema(description = "停电类型名称")
    private String powerOutageTypeName;

    @Schema(description = "停电状态")
    private Integer status;

    @Schema(description = "停电状态名称")
    private String statusName;

    @Schema(description = "停电原因")
    private String reason;

    private String company;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private String createBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    private String updateBy;

    @Schema(description = "配变事件id")
    private String transformerEventId;

    @Schema(description = "线路事件id")
    private String lineEventId;

    @Schema(description = "是否生产工单：1->是 0->否")
    private Integer isGenerateWorkOrder;
}
