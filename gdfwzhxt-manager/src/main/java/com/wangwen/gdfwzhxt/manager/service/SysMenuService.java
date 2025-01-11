package com.wangwen.gdfwzhxt.manager.service;

import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;

import java.util.List;

public interface SysMenuService {
    /**
     * 查询菜单列表
     * @return
     */
    List<SysMenu> findNodes();

    /**
     * 添加菜单
     * @param sysMenu
     */
    void addMenu(SysMenu sysMenu);

    /**
     * 修改菜单
     * @param sysMenu
     */
    void updateMenu(SysMenu sysMenu);

    /**
     * 删除
     * @param id
     */
    void deleteMenuById(String id);
}
