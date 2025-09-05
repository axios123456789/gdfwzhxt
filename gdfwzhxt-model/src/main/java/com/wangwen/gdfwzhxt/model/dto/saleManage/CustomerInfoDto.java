package com.wangwen.gdfwzhxt.model.dto.saleManage;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "客户信息条件查询参数")
public class CustomerInfoDto {
    private String customerName;
    private String customerNo;
    private Integer customerGender;
    private Integer customerAgeBegin;
    private Integer customerAgeEnd;
    private List<Integer> customerType;
    private List<Integer> country;
    private String state;
    private String city;
    private Integer repeatOrderCountBegin;
    private Integer repeatOrderCountEnd;
}
