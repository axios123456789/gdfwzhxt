package com.wangwen.gdfwzhxt.model.vo.saleManage;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Schema(description = "客户分析汇总")
public class CustomerAnalyseVo {
    @Schema(description = "产品名称")
    private String productName;

    @Schema(description = "订单状态")
    private String orderStatus;

    @Schema(description = "交易次数")
    private Integer tradeCount;

    @Schema(description = "交易总数量")
    private Integer tradeSum;

    @Schema(description = "交易总金额")
    private BigDecimal tradeAmount;

    @Schema(description = "交易提成金额")
    private BigDecimal tradeCommissionAmount;
}
