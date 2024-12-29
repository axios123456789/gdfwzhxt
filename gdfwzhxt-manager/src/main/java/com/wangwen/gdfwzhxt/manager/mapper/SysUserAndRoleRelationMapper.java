package com.wangwen.gdfwzhxt.manager.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface SysUserAndRoleRelationMapper {
    //根据用户id获取角色ids
    @Select("select role_id as roleId from t_user_role ur where user_id = #{param1} and exists (select 1 from t_user t where t.is_deleted = 0 and t.id = ur.company)")
    List<String> getRoleIdsByUserId(String userId);

    //根据userId删除角色
    @Delete("delete from t_user_role where user_id = #{param1}")
    void deleteRoleByUserId(String userId);

    void addRoleByUserId(List<Map<String, Object>> userAndRoleList);
}
