package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.DistributeMenuDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface SysRoleAndMenuRelationMapper {
    //把isHalf半开
    void updateSysRoleMenuIsHalf(String id);

    //查询分配过的菜单id
    List<String> selectMenuIdsByRoleId(String roleId);

    //删除角色分配过的菜单
    @Delete("delete from t_role_menu where role_id = #{param1}")
    void deleteHaveAllocateMenuDataByRoleId(String roleId);

    //为角色分配菜单
    void addAllocateData(DistributeMenuDto distributeMenuDto);
}
