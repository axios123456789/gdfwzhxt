package com.wangwen.gdfwzhxt.model.vo.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "电能使用情况根据日数据情况分组")
public class ElectricityUsedGroupByDayVo {
    @Schema(description = "统计日")
    private String dayDate;

    @Schema(description = "统计日使用电能（kwh）")
    private double totalEnergyUsed;

    @Schema(description = "统计日使用电费（元）")
    private double totalBalanceUsed;

    @Schema(description = "统计日总耗电能最大值（kwh）")
    private double dayUsedEnergy;

    @Schema(description = "统计日剩余电费最小值（元）")
    private double dayMinBalance;
}
