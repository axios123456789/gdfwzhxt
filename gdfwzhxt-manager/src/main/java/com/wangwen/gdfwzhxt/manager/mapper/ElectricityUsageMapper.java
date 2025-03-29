package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectricityUsageMapper {
    //生成记录
    void addElectricityUsage(ElectricityUsage electricityUsage);
}
