package com.wangwen.gdfwzhxt.model.vo.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
public class SysMenuVo {
    @Schema(description = "系统菜单标题")
    private String title;

    @Schema(description = "系统菜单名称")
    private String name;

    @Schema(description = "系统菜单子菜单列表")
    private List<SysMenuVo> children;
}
