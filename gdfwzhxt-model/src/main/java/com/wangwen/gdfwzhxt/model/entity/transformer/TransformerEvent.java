package com.wangwen.gdfwzhxt.model.entity.transformer;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "台区停运事件")
public class TransformerEvent {
    @Schema(description = "台区停运事件id")
    private String dataId;

    @Schema(description = "变压器局号")
    private String transformerCode;

    @Schema(description = "变压器名称")
    private String transformerName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "终端停电时间")
    private Date terminalOutageTime;

    @Schema(description = "停电时长")
    private double outageDuration;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "终端送电时间")
    private Date terminalSupplyTime;

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

    @Schema(description = "影响用户数")
    private Integer effectConsNumber;

    @Schema(description = "线路事件id")
    private String lineEventId;

    @Schema(description = "是否生产工单：1->是 0->否")
    private Integer isGenerateWorkOrder;
}
