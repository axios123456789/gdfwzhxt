package com.wangwen.gdfwzhxt.model.dto.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "用户请求参数实体类")
public class SysUserDto {
    @Schema(description = "账号")
    private String account;

    @Schema(description = "用户名称")
    private String name;

    @Schema(description = "开始时间")
    private String beginTime;

    @Schema(description = "结束时间")
    private String endTime;

    @Schema(description = "账号等级")
    private List<Integer> level;

    @Schema(description = "账号状态")
    private Integer status;
}
