package com.wangwen.gdfwzhxt.model.vo.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "电能使用情况响应类")
public class ElectricityUsedVo {
    private String consNo;
    private String consName;
    private double electricityUsed;
    private double chargeUsed;
}
