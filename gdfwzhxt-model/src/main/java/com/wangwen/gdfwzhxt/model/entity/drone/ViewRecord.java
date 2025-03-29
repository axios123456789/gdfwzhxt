package com.wangwen.gdfwzhxt.model.entity.drone;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "无人机巡视记录")
public class ViewRecord {
    @Schema(description = "主键")
    private String id;

    @Schema(description = "巡视设备类型（1.线路 2.变压器）")
    private Integer equipType;

    @Schema(description = "巡视设备类型名称")
    private String equipTypeName;

    @Schema(description = "设备编码")
    private String equipNo;

    @Schema(description = "设备名称")
    private String equipName;

    @Schema(description = "设备故障类型：线路就按线路故障类型，配变就按配变故障类型")
    private Integer equipFaultType;

    @Schema(description = "设备故障类型名称")
    private String equipFaultTypeName;

    @Schema(description = "巡视无人机编号")
    private String droneNo;

    @Schema(description = "巡视无人机名称")
    private String droneName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "巡视时间")
    private Date viewTime;

    @Schema(description = "巡视人")
    private String viewBy;

    @Schema(description = "巡视结果描述")
    private String description;

    @Schema(description = "处理标识（1.未处理 2.已生成停电事件 3.已生成工单 4.已生成事件和工单）")
    private Integer handleFlag;

    @Schema(description = "处理标识名称")
    private String handleFlagName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    private String updateBy;

    private Integer isDeleted;

    private String company;

    @Schema(description = "设备所在地址")
    private String equipAddress;
}
