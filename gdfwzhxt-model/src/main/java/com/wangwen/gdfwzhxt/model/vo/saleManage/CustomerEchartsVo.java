package com.wangwen.gdfwzhxt.model.vo.saleManage;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Schema(description = "客户提成金额可视化")
public class CustomerEchartsVo {
    private BigDecimal value;
    private String name;
}
