package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface SysMenuMapper {
    //查询所有菜单
    List<SysMenu> getAllMenu();

    //添加菜单
    void addMenu(SysMenu sysMenu);

    //修改菜单
    void updateMenu(SysMenu sysMenu);

    //根据id查询子菜单的数量
    int getChildrenCountById(String id);

    //根据id删除菜单
    @Update("update t_menu set is_deleted = 1 where id = #{param1}")
    void deleteById(String id);
}
