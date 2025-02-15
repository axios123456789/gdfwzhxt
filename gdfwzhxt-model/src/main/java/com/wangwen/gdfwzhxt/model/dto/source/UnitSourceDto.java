package com.wangwen.gdfwzhxt.model.dto.source;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "单位资源条件查询参数")
public class UnitSourceDto {
    @Schema(description = "单位名称")
    private String unitName;

    @Schema(description = "单位等级")
    private String unitLevel;
}
