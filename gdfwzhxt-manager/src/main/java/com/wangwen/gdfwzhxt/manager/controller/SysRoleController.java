package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SysRoleService;
import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 系统管理-角色管理
 */
@RestController
@RequestMapping("/electricity/system/sysRole")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 角色列表方法
     * @param current 当前页
     * @param limit 每页记录数
     * @param sysRoleDto 查询条件
     * @return
     */
    @GetMapping("/findByPage/{current}/{limit}")
    public Result findByPage(@PathVariable("current") Integer current,
                             @PathVariable("limit") Integer limit,
                             SysRoleDto sysRoleDto){
        PageInfo<SysRole> pageInfo  = sysRoleService.findByPage(sysRoleDto, current, limit);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 添加或修改角色
     * @param sysRole
     * @return
     */
    @PostMapping("/saveRole")
    public Result saveRole(@RequestBody SysRole sysRole){
        try {
            //开始保存操作
            sysRoleService.saveRole(sysRole);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存角色失败！");
        }
    }

    /**
     * 通过ID删除角色
     * @param id
     * @return
     */
    @DeleteMapping("/deleteRoleById/{roleId}")
    public Result deleteRoleById(@PathVariable("roleId") String id){
        try {
            sysRoleService.deleteRoleById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除角色失败！");
        }
    }

    /**
     * 获取所有角色和用户已经分配的角色
     * @param userId
     * @return
     */
    @GetMapping("/getAllRole/{userId}")
    public Result getAllRole(@PathVariable("userId") String userId){
        Map<String, Object> map = sysRoleService.getAllRoles(userId);
        return Result.build(map, ResultCodeEnum.SUCCESS);
    }
}
