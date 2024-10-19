package com.wangwen.gdfwzhxt.manager.service;

import com.wangwen.gdfwzhxt.model.dto.system.LoginDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import com.wangwen.gdfwzhxt.model.vo.system.LoginVo;

public interface SysUserService {
    //用户登录
    LoginVo login(LoginDto loginDto);

    //获取当前登录用户信息
    SysUser getUserInfo(String token);

    //用户退出登录
    void logout(String token);
}
