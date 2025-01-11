package com.wangwen.gdfwzhxt.manager.service.impl;

import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.SysMenuMapper;
import com.wangwen.gdfwzhxt.manager.mapper.SysRoleAndMenuRelationMapper;
import com.wangwen.gdfwzhxt.manager.service.SysMenuService;
import com.wangwen.gdfwzhxt.manager.util.MenuHelper;
import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.system.SysMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private SysRoleAndMenuRelationMapper sysRoleAndMenuRelationMapper;

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

    @Override
    public SysMenu selectParentMenu(String parentId) {
        //根据id查询菜单
        SysMenu sysMenu = sysMenuMapper.getMenuById(parentId);

        return sysMenu;
    }

    /**
     * 查询所有菜单和角色分配过的菜单
     * @param roleId
     * @return
     */
    @Override
    public Map<String, Object> findAllMenusWithRoleId(String roleId) {
        //查询所有菜单
        List<SysMenu> allMenus = sysMenuMapper.getAllMenu();
        List<SysMenu> sysMenus = MenuHelper.buildTree(allMenus);

        //查询分配过的菜单id
        List<String> menuIds = sysRoleAndMenuRelationMapper.selectMenuIdsByRoleId(roleId);

        //封装数据
        Map<String, Object> map = new HashMap<>();
        map.put("sysMenuList", sysMenus);
        map.put("roleMenuIds", menuIds);

        return map;
    }

    /**
     * 查询用户可以操作的菜单
     * @return
     */
    @Override
    public List<SysMenuVo> findMenusByUserId() {
        //得到当前用户id
        String userId = AuthContextUtil.get().getId();

        //根据id查询到当前用户可以操作的菜单
        List<SysMenu> sysMenus = sysMenuMapper.findMenusByUserId(userId);

        //将查询到的数据封装成要求的格式
        List<SysMenu> sysMenus1 = MenuHelper.buildTree(sysMenus);
        List<SysMenuVo> sysMenuVos = buildMenus(sysMenus1);

        return sysMenuVos;
    }

    //将List<SysMenu>对象转换成List<SysMenuVo>对象
    private List<SysMenuVo> buildMenus(List<SysMenu> menus) {
        List<SysMenuVo> sysMenuVoList = new LinkedList<SysMenuVo>();
        for (SysMenu sysMenu : menus) {
            SysMenuVo sysMenuVo = new SysMenuVo();
            sysMenuVo.setTitle(sysMenu.getTitle());
            sysMenuVo.setName(sysMenu.getComponent());
            List<SysMenu> children = sysMenu.getChildren();
            if (!CollectionUtils.isEmpty(children)) {
                sysMenuVo.setChildren(buildMenus(children));
            }
            sysMenuVoList.add(sysMenuVo);
        }
        return sysMenuVoList;
    }
}
