package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.system.SysCode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysDictMapper {
    //根据type查询所有
    List<SysCode> getCodesByType(String type);
}
