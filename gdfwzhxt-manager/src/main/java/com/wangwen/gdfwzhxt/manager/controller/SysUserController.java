package com.wangwen.gdfwzhxt.manager.controller;

import com.wangwen.gdfwzhxt.manager.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统管理-用户管理
 */
@RestController
@RequestMapping("/electricity/system/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
}
