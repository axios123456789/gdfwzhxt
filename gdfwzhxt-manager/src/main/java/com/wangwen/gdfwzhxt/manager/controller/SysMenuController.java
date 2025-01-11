package com.wangwen.gdfwzhxt.manager.controller;

import com.wangwen.gdfwzhxt.manager.service.SysMenuService;
import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/electricity/system/sysMenu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

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
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "添加菜单失败，请联系管理员！");
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
}
