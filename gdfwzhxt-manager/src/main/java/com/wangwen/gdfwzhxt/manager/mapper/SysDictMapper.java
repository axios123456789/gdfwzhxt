package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.system.SysDictDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysCode;
import com.wangwen.gdfwzhxt.model.entity.system.SysDict;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface SysDictMapper {
    //根据type查询所有
    List<SysCode> getCodesByType(String type);

    //根据type查询对应权限的账号等级(只能是自己的下级权限)
    List<SysCode> getUserLevelByPower(String type, int level);

    //条件查询数据字典列表
    List<SysDict> getSysDictList(SysDictDto sysDictDto);

    //添加数据字典
    void addDict(SysDict sysDict);

    //修改数据字典
    void updateDict(SysDict sysDict);

    //通过id删除数据字典值
    @Update("update t_code set is_deleted = 1 where id = #{param1}")
    void deleteDictById(String id);
}
