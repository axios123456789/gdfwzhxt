package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface SysRoleMapper {

    //查询所有角色
    List<SysRole> findByPage(SysRoleDto sysRoleDto);

    //添加角色
    void addRole(SysRole sysRole);

    //修改角色
    void updateRole(SysRole sysRole);

    //通过Id删除角色
    @Update("update t_role set is_deleted = 1 where id = #{param1}")
    void deleteRoleById(String id);
}
