package com.wangwen.gdfwzhxt.model.dto.source;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "无人机条件查询参数")
public class DroneInfoDto {
    @Schema(description = "无人机编码")
    private String droneNo;

    @Schema(description = "无人机名称")
    private String droneName;
}
