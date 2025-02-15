package com.wangwen.gdfwzhxt.model.dto.line;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "线路信息查询条件参数")
public class LineInfoDto {
    @Schema(description = "线路名称")
    private String lineName;

    @Schema(description = "线路长度")
    private double lineLength;

    @Schema(description = "线路半径")
    private double radius;

    @Schema(description = "线路类型")
    private List<Integer> lineType;

    @Schema(description = "线路状态")
    private Integer lineStatus;

    @Schema(description = "线路所属单位名称")
    private String unitName;
}
