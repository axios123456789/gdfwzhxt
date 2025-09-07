package com.wangwen.gdfwzhxt.model.dto.saleManage;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "交易记录条件查询参数")
public class TransactionRecordDto {
    @Schema(description = "快递单号")
    private String trackingNumber;

    @Schema(description = "是否到货")
    private Integer isArrive;

    @Schema(description = "订单编号")
    private String orderNo;

    @Schema(description = "交易开始时间")
    private String tradeTimeBegin;

    @Schema(description = "交易结束时间")
    private String tradeTimeEnd;

    @Schema(description = "客户id")
    private String customerId;

    @Schema(description = "产品id")
    private String productId;

    private String customerName;
    private String productName;

    @Schema(description = "交易产品数量大于")
    private Integer tradeCountBegin;

    @Schema(description = "交易产品数量小于")
    private Integer tradeCountEnd;

    @Schema(description = "物流方式")
    private List<Integer> shippingMethod;

    @Schema(description = "订单状态")
    private List<Integer> orderStatus;

    @Schema(description = "退款原因")
    private List<Integer> refundReason;

    @Schema(description = "是否收到被退货物")
    private Integer isReceiveRefundProduct;
}
