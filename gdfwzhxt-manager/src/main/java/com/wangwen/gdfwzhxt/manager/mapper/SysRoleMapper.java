package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
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

    //查询所有角色
    @Select("select id, role_name as roleName from t_role r where is_deleted = 0 and exists (select 1 from t_user t where t.is_deleted = 0 and t.id = r.company)")
    List<SysRole> getAllRoles();
}
