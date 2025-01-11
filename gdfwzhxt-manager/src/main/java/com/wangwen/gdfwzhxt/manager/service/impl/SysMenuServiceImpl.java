package com.wangwen.gdfwzhxt.manager.service.impl;

import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.SysMenuMapper;
import com.wangwen.gdfwzhxt.manager.service.SysMenuService;
import com.wangwen.gdfwzhxt.manager.util.MenuHelper;
import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    /**
     * 查询菜单列表
     * @return
     */
    @Override
    public List<SysMenu> findNodes() {
        //1.查询所有菜单
        List<SysMenu> sysMenus = sysMenuMapper.getAllMenu();

        //2.判断菜单是否为空
        if (CollectionUtils.isEmpty(sysMenus)){
            return null;
        }

        //将菜单处理成特定格式返回(调用工具类)
        List<SysMenu> trees = MenuHelper.buildTree(sysMenus);
        return trees;
    }

    /**
     * 添加菜单
     * @param sysMenu
     */
    @Override
    public void addMenu(SysMenu sysMenu) {
        //设置相关添加数据
        sysMenu.setCreateBy(AuthContextUtil.get().getName());
        sysMenu.setId(UUIDUtil.getUUID());
        sysMenu.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());

        //添加操作
        sysMenuMapper.addMenu(sysMenu);
    }

    /**
     * 修改菜单
     * @param sysMenu
     */
    @Override
    public void updateMenu(SysMenu sysMenu) {
        //设置相关修改数据
        sysMenu.setUpdateBy(AuthContextUtil.get().getName());

        //修改菜单
        sysMenuMapper.updateMenu(sysMenu);
    }

    /**
     * 删除菜单
     * @param id
     */
    @Override
    public void deleteMenuById(String id) {
        //根据当前菜单id查询是否包含
        int childrenCountById = sysMenuMapper.getChildrenCountById(id);
        if (childrenCountById > 0){
            throw new ElectricityException(ResultCodeEnum.NODE_ERROR);
        }

        //删除
        sysMenuMapper.deleteById(id);
    }
}
