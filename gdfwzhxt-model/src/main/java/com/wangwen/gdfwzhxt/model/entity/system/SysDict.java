package com.wangwen.gdfwzhxt.model.entity.system;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "数据字典实体类")
public class SysDict extends BaseEntity {
    @Schema(description = "字典状态码")
    private Integer code;

    @Schema(description = "字典值")
    private String value;

    @Schema(description = "字典类型")
    private String type;

    @Schema(description = "描述")
    private String description;
}
