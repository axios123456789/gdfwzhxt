package com.wangwen.gdfwzhxt.model.dto.transformer;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "变压器信息查询条件参数")
public class TransformerInfoDto {
    @Schema(description = "变压器名称")
    private String transformerName;

    @Schema(description = "变压器型号（TM-100）")
    private String model;

    @Schema(description = "额定容量kVA")
    private double ratedCapacity;

    @Schema(description = "所属线路id")
    private String lineId;

    @Schema(description = "所属线路名称")
    private String lineName;

    @Schema(description = "变压器类型")
    private Integer transformerType;
}
