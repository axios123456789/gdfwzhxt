package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMapper {

    //查询所有角色
    List<SysRole> findByPage(SysRoleDto sysRoleDto);
}
