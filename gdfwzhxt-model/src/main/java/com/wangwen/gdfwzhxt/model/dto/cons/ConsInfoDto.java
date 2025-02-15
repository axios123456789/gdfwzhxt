package com.wangwen.gdfwzhxt.model.dto.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "用户信息条件查询参数")
public class ConsInfoDto {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @Schema(description = "用户类型")
    private List<Integer> consType;

    @Schema(description = "变压器局号")
    private String transformerCode;

    @Schema(description = "变压器名称")
    private String transformerName;

    @Schema(description = "账户余额")
    private double balance;

    @Schema(description = "用户状态")
    private Integer consStatus;

    @Schema(description = "总用电量")
    private double totalConsumption;
}
