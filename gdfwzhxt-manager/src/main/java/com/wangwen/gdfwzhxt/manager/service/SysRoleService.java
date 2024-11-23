package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;

public interface SysRoleService {
    /**
     * 角色列表的方法
     * @param sysRoleDto
     * @param current
     * @param limit
     * @return
     */
    PageInfo<SysRole> findByPage(SysRoleDto sysRoleDto, Integer current, Integer limit);

    /**
     * 添加或修改角色
     * @param sysRole
     */
    void saveRole(SysRole sysRole);

    /**
     * 通过ID删除角色
     * @param id
     */
    void deleteRoleById(String id);
}
