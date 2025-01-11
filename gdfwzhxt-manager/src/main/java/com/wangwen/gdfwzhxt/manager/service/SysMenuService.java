package com.wangwen.gdfwzhxt.manager.service;

import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import com.wangwen.gdfwzhxt.model.vo.system.SysMenuVo;

import java.util.List;
import java.util.Map;

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

    /**
     * 获取当前添加菜单的父菜单
     * @param parentId
     * @return
     */
    SysMenu selectParentMenu(String parentId);

    /**
     * 查询所有菜单和角色分配过的菜单
     * @param roleId
     * @return
     */
    Map<String, Object> findAllMenusWithRoleId(String roleId);

    /**
     * 查询用户可以操作的菜单
     * @return
     */
    List<SysMenuVo> findMenusByUserId();
}
