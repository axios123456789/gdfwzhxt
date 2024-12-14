package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.SysUserDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserMapper {
    //根据账号查询用户信息
    SysUser getSysUserByAccount(String loginAccount);

    //查询用户表注册的公司数
    int getCompanyCount();

    //条件查询用户列表
    List<SysUser> findByPage(SysUserDto sysUserDto);
}
