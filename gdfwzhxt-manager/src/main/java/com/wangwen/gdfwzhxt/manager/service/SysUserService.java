package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.system.DistributeRoleDto;
import com.wangwen.gdfwzhxt.model.dto.system.LoginDto;
import com.wangwen.gdfwzhxt.model.dto.system.SysUserDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import com.wangwen.gdfwzhxt.model.vo.system.LoginVo;

public interface SysUserService {
    //用户登录
    LoginVo login(LoginDto loginDto);

    //获取当前登录用户信息
    SysUser getUserInfo(String token);

    //用户退出登录
    void logout(String token);

    //查询系统是否注册了公司
    boolean getCompanyExistsFlag();

    //查询系统用户列表
    PageInfo<SysUser> findByPage(Integer current, Integer limit, SysUserDto sysUserDto);

    //保存用户（添加或修改用户）
    void saveUser(SysUser sysUser);

    //根据id删除用户
    void deleteUserById(String id);

    //用户分配角色
    void distributeRole(DistributeRoleDto distributeRoleDto);
}
