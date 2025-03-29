package com.wangwen.gdfwzhxt.model.dto.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "电费充值记录条件查询参数")
public class RechargeRecordDto {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户姓名")
    private String consName;

    @Schema(description = "充值开始时间")
    private String rechargeBeginTime;

    @Schema(description = "充值结束时间")
    private String rechargeEndTime;

    @Schema(description = "充值金额")
    private double rechargeAmount;
}
