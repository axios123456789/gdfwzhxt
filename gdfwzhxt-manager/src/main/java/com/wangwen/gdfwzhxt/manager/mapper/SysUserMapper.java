package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysUserMapper {
    //根据账号查询用户信息
    SysUser getSysUserByAccount(String loginAccount);

    //查询用户表注册的公司数
    int getCompanyCount();
}
