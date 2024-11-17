package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SysRoleService;
import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
                             @RequestBody SysRoleDto sysRoleDto){
        PageInfo<SysRole> pageInfo  = sysRoleService.findByPage(sysRoleDto, current, limit);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }
}
