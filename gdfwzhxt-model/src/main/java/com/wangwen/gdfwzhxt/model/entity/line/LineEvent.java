package com.wangwen.gdfwzhxt.model.entity.line;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "线路停电事件实体类")
public class LineEvent {
    @Schema(description = "线路事件id")
    private String Mid;

    @Schema(description = "线路id")
    private String lineId;

    @Schema(description = "线路名称")
    private String lineName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "停运时间")
    private Date powerOutageTime;

    @Schema(description = "停运时长")
    private double powerOutageDuration;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "复电时间")
    private Date powerSupplyTime;

    @Schema(description = "停电类型")
    private Integer powerOutageType;

    @Schema(description = "停电类型名称")
    private String  powerOutageTypeName;

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

    @Schema(description = "影响配变数")
    private Integer effectTransformerNumber;

    @Schema(description = "影响用户数")
    private Integer effectConsNumber;

    @Schema(description = "是否生产工单：1->是 0->否")
    private Integer isGenerateWorkOrder;
}
