package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SysUserService;
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
}
