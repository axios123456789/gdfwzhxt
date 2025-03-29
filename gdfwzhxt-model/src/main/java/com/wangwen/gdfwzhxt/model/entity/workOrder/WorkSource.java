package com.wangwen.gdfwzhxt.model.entity.workOrder;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "工单提交材料实体类")
public class WorkSource {
    @Schema(description = "个人接单id")
    private String acceptId;

    @Schema(description = "材料编号")
    private String sourceNo;

    @Schema(description = "提交人")
    private String submitBy;

    @Schema(description = "处理对象")
    private String handleObject;

    @Schema(description = "处理原因")
    private String handleReason;

    @Schema(description = "现场真实原因")
    private String reallyReason;

    @Schema(description = "现场设备故障记录图")
    private String faultRecordImage;

    @Schema(description = "处理结果")
    private String handleResult;

    @Schema(description = "佐证图片")
    private String handleImage;

    @Schema(description = "材料通过标识（1.通过 2.驳回 0.审核中）")
    private Integer acceptFlag;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "提交时间")
    private Date submitTime;

    @Schema(description = "驳回原因")
    private String refuseReason;

    @Schema(description = "驳回人")
    private String refuseBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "驳回时间")
    private Date refuseTime;

    private String company;
}
