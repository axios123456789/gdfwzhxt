package com.wangwen.gdfwzhxt.model.entity.system;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import lombok.Data;

@Data
public class SysRoleMenu extends BaseEntity {
    private String roleId;
    private String menuId;
    private Integer isHalf;
}
