package com.wangwen.gdfwzhxt.model.entity.cons;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "电能使用情况实体类")
public class ElectricityUsage {
    private String id;

    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "记录时间")
    private Date recordTime;

    @Schema(description = "已耗电能（kwh）")
    private double usedEnergy;

    @Schema(description = "剩余电费")
    private double remainingBalance;

    private String company;
}
