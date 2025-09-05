package com.wangwen.gdfwzhxt.model.entity.saleManage;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Schema(description = "交易记录实体类")
public class TransactionRecord {

    @Schema(description = "唯一标识")
    private String id;

    @Schema(description = "成交界面（图片）")
    private String checkoutSuccessPage;

    @Schema(description = "快递单号")
    private String trackingNumber;

    @Schema(description = "是否到货（1是 0否）")
    private Integer isArrive;

    @Schema(description = "客户id")
    private String customerId;

    @Schema(description = "产品id")
    private String productId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "交易时间")
    private Date tradeTime;

    @Schema(description = "交易产品数量")
    private Integer tradeCount;

    @Schema(description = "交易金额")
    private BigDecimal tradeAmount;

    @Schema(description = "交易提成金额")
    private BigDecimal tradeCommissionAmount;

    @Schema(description = "客户备注")
    private String customerRemark;

    @Schema(description = "物流方式（1：顺丰快递 2：邮政快递）")
    private Integer shippingMethod;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "发货时间")
    private Date handleTime;

    @Schema(description = "发货地点")
    private String deliveryAddress;

    @Schema(description = "收货人")
    private String recipient;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "订单完成时间")
    private Date orderCloseTime;

    @Schema(description = "订单完成截图")
    private String orderCloseImage;

    @Schema(description = "客户评价")
    private String customerReview;

    @Schema(description = "评价截图")
    private String reviewImage;

    @Schema(description = "订单状态（1：待发货 2：送货中 3：已收货 4：已完成 5：发货前退款 6：发货中退款 7：全额退款不退货 8：部分退款不退货 9：退货退款）")
    private Integer orderStatus;

    @Schema(description = "退款原因（1：不喜欢 2：不想要了 3：找到更优选择 4：地址变更 5：产品质量缺陷 6：实物与描述不符 7：商品错发 8：运输损坏 9：七天无理由退货 10：性能/效果未达预期 11：操作复杂 12：售后体验差 13：其他）")
    private Integer refundReason;

    @Schema(description = "具体原因")
    private String refundReasonDetail;

    @Schema(description = "是否收到被退货物（1是0否）")
    private Integer isReceiveRefundProduct;

    @Schema(description = "未收到退货产品原因")
    private String notReceiveReason;

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