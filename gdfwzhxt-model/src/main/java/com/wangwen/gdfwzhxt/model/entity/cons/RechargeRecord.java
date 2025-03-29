package com.wangwen.gdfwzhxt.model.entity.cons;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "电费充值记录实体类")
public class RechargeRecord {
    private String id;

    @Schema(description = "充值人")
    private String rechargeBy;

    @Schema(description = "充值时间")
    private String rechargeTime;

    @Schema(description = "充值用户编号")
    private String consNo;

    @Schema(description = "充值用户名称")
    private String consName;

    @Schema(description = "充值金额")
    private double rechargeAmount;

    @Schema(description = "备注")
    private String remark;

    private String company;

    @Schema(description = "操作人")
    private String operator;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "操作时间")
    private Date operateTime;

    @Schema(description = "充值人与用户关系")
    private String relation;
}
