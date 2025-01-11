package com.wangwen.gdfwzhxt.model.dto.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class DistributeMenuDto {
    private String company;

    @Schema(description = "角色id")
    private String roleId;

    @Schema(description = "选中的菜单id的集合")
    private List<Map<String , Object>> menuIdList;//选中的菜单id的集合; Map的键表示菜单的id，值表示是否为半开; 0否，1是
}
