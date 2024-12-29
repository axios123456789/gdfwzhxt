package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SysUserService;
import com.wangwen.gdfwzhxt.model.dto.system.DistributeRoleDto;
import com.wangwen.gdfwzhxt.model.dto.system.SysUserDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 系统管理-用户管理
 */
@RestController
@RequestMapping("/electricity/system/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 查询系统用户列表
     * @param current
     * @param limit
     * @param sysUserDto
     * @return
     */
    @RequestMapping("/findByPage/{current}/{limit}")
    public Result findByPage(@PathVariable("current") Integer current,
                             @PathVariable("limit") Integer limit,
                             @RequestBody SysUserDto sysUserDto){
        PageInfo<SysUser> pageInfo = sysUserService.findByPage(current, limit, sysUserDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存用户（添加或修改用户）
     * @param sysUser
     * @return
     */
    @PostMapping("/saveUser")
    public Result saveUser(@RequestBody SysUser sysUser){
        try {
            sysUserService.saveUser(sysUser);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "报错用户失败！");
        }
    }

    /**
     * 删除用户根据id
     * @param id
     * @return
     */
    @PostMapping("/deleteUserById/{userId}")
    public Result deleteUserById(@PathVariable("userId") String id){
        try {
            sysUserService.deleteUserById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除用户失败！");
        }
    }

    /**
     * 用户分配角色
     * @param distributeRoleDto
     * @return
     */
    @PostMapping("/distributeRole")
    public Result distributeRole(@RequestBody DistributeRoleDto distributeRoleDto){
        try {
            sysUserService.distributeRole(distributeRoleDto);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "角色分配失败！");
        }
    }
}
