package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.system.SysCode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysDictMapper {
    //根据type查询所有
    List<SysCode> getCodesByType(String type);

    //根据type查询对应权限的账号等级(只能是自己的下级权限)
    List<SysCode> getUserLevelByPower(String type, int level);
}
