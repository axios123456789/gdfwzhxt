package com.wangwen.gdfwzhxt.model.dto.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "数据字典请求参数封装类")
public class SysDictDto {
    @Schema(description = "字典值参数")
    private String value;

    @Schema(description = "字典类型请求参数")
    private String type;
}
