package com.wangwen.gdfwzhxt.model.entity.saleManage;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "客户信息实体类")
public class CustomerInfo {

    @Schema(description = "唯一标识")
    private String id;

    @Schema(description = "客户名称")
    private String customerName;

    @Schema(description = "客户编号")
    private String customerNo;

    @Schema(description = "客户性别")
    private Integer customerGender;

    @Schema(description = "客户年龄")
    private Integer customerAge;

    @Schema(description = "客户类型（1：新客户 2：二次交易客户 3：忠实客户 4：重要客户）")
    private Integer customerType;

    @Schema(description = "客户电话")
    private String customerTel;

    @Schema(description = "客户邮箱")
    private String customerEmail;

    @Schema(description = "客户地址")
    private String customerAddress;

    @Schema(description = "客户详细信息")
    private String customerDetail;

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

    @Schema(description = "国家")
    private Integer country;

    @Schema(description = "州")
    private String state;

    @Schema(description = "城市")
    private String city;

    @Schema(description = "邮编")
    private String postcode;

    @Schema(description = "客户返单次数")
    private Integer repeatOrderCount;

    @Schema(description = "客户照片")
    private String customerPicture;

    @Schema(description = "客户分析")
    private String analyse;
}