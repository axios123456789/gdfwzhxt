package com.wangwen.gdfwzhxt.model.entity.cons;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "用电户信息实体类")
public class ConsInfo extends BaseEntity {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @Schema(description = "用户类型")
    private Integer consType;

    @Schema(description = "用户类型名称")
    private String consTypeName;

    @Schema(description = "地址")
    private String address;

    @Schema(description = "联系电话")
    private String tel;

    @Schema(description = "所属变压器局号")
    private String transformerCode;

    @Schema(description = "所属变压器名称")
    private String transformerName;

    @Schema(description = "接电日期")
    private String connectionDate;

    @Schema(description = "账户余额")
    private double balance;

    @Schema(description = "用户状态（正常/欠费）")
    private Integer consStatus;

    @Schema(description = "用户状态名称")
    private String consStatusName;

    @Schema(description = "总用电量（kWh）度")
    private double totalConsumption;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "应急变压器局号")
    private String emergencyTransformerCode;

    @Schema(description = "应急变压器名称")
    private String emergencyTransformerName;
}
