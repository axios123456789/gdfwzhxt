package com.wangwen.gdfwzhxt.model.entity.source;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "单位实体类")
public class Unit extends BaseEntity {
    @Schema(description = "单位id")
    private String unitId;

    @Schema(description = "单位名称")
    private String unitName;

    @Schema(description = "上级单位id")
    private String parentUnitId;

    @Schema(description = "单位级别")
    private Integer unitLevel;

    @Schema(description = "单位级别名称")
    private String unitLevelName;

    //下级列表
    @Schema(description = "子节点")
    private List<Unit> children;
}
