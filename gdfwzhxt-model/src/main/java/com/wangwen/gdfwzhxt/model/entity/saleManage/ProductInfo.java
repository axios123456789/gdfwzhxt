package com.wangwen.gdfwzhxt.model.entity.saleManage;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Schema(description = "产品信息实体类")
public class ProductInfo {

    @Schema(description = "唯一标识")
    private String id;

    @Schema(description = "产品名称")
    private String productName;

    @Schema(description = "产品类型（1：笔记本电脑 2：手机 3：照相机）")
    private Integer productType;

    @Schema(description = "产品型号")
    private String productModel;

    @Schema(description = "产品图片")
    private String productImage;

    @Schema(description = "产品库存数量")
    private Integer productNumber;

    @Schema(description = "产品成本价")
    private BigDecimal productRowPrice;

    @Schema(description = "产品售价")
    private BigDecimal productDealPrice;

    @Schema(description = "产品税收价")
    private BigDecimal taxInclusivePrice;

    @Schema(description = "产品提成倍率")
    private BigDecimal commissionMultiplier;

    @Schema(description = "提成计算规则【1：（售价-成本价-税收价）*提成倍率 2：（售价-成本价）*提成倍率】")
    private Integer commissionRule;

    @Schema(description = "预想提成金额")
    private BigDecimal commissionAmount;

    @Schema(description = "实际提成金额")
    private BigDecimal realCommissionAmount;

    @Schema(description = "产品详细信息")
    private String productDetail;

    @Schema(description = "产品特点（卖点）")
    private String productTrait;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "创建时间")
    private Date createTime;

    @Schema(description = "创建者")
    private String createBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "修改时间")
    private Date updateTime;

    @Schema(description = "修改者")
    private String updateBy;
}
