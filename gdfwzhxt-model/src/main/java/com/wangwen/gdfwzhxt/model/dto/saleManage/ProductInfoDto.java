package com.wangwen.gdfwzhxt.model.dto.saleManage;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
@Schema(description = "产品信息条件查询参数")
public class ProductInfoDto {
    private String productName;
    private List<Integer> productType;
    private BigDecimal realCommissionAmountBegin;
    private BigDecimal realCommissionAmountEnd;
}
