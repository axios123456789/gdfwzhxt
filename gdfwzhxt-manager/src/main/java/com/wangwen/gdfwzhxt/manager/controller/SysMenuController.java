package com.wangwen.gdfwzhxt.manager.controller;

import com.wangwen.gdfwzhxt.manager.mapper.SysRoleAndMenuRelationMapper;
import com.wangwen.gdfwzhxt.manager.service.SysMenuService;
import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/electricity/system/sysMenu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysRoleAndMenuRelationMapper roleAndMenuRelationMapper;

    /**
     * 查询菜单列表（以特定形式返回查询结果）
     * @return
     */
    @GetMapping("/findNodes")
    public Result findNodes(){
        List<SysMenu> list = sysMenuService.findNodes();
        return Result.build(list, ResultCodeEnum.SUCCESS);
    }

    /**
     * 添加菜单
     * @param sysMenu
     * @return
     */
    @PostMapping("/addMenu")
    public Result addMenu(@RequestBody SysMenu sysMenu){
        try {
            sysMenuService.addMenu(sysMenu);

            //添加子菜单，把父菜单的isHalf半开状态
            updateSysRoleMenu(sysMenu);

            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "添加菜单失败，请联系管理员！");
        }
    }

    //新添子菜单，将父菜单的isHalf半开 1
    private void updateSysRoleMenu(SysMenu sysMenu) {
        //获取当前添加菜单的父菜单
        SysMenu parentSysMenu = sysMenuService.selectParentMenu(sysMenu.getParentId());

        if (parentSysMenu != null){
            //把isHalf半开
            roleAndMenuRelationMapper.updateSysRoleMenuIsHalf(parentSysMenu.getId());

            //递归调用
            updateSysRoleMenu(parentSysMenu);
        }
    }

    /**
     * 修改菜单
     * @param sysMenu
     * @return
     */
    @PutMapping("/updateMenu")
    public Result updateMenu(@RequestBody SysMenu sysMenu){
        try {
            sysMenuService.updateMenu(sysMenu);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "修改菜单失败，请联系管理员！");
        }
    }

    /**
     * 删除菜单
     * @param id
     * @return
     */
    @DeleteMapping("/deleteMenuById/{id}")
    public Result deleteMenuById(@PathVariable("id") String id){
        sysMenuService.deleteMenuById(id);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 查询所有菜单和角色分配过的菜单
     */
    @GetMapping("/findAllMenusWithRoleId/{roleId}")
    public Result findAllMenusWithRoleId(@PathVariable("roleId") String roleId){
        Map<String, Object> map = sysMenuService.findAllMenusWithRoleId(roleId);
        return Result.build(map, ResultCodeEnum.SUCCESS);
    }
}
