package com.wangwen.gdfwzhxt.model.dto.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
public class DistributeRoleDto {
    @Schema(description = "用户id")
    private String userId;

    @Schema(description = "角色id的List集合")
    private List<String> roleIdList;
}
