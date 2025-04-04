package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.cons.ElectricityUsedDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedGroupByDayVo;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ElectricityUsageMapper {
    //生成记录
    void addElectricityUsage(ElectricityUsage electricityUsage);

    //条件查询所有电能使用情况
    List<ElectricityUsedVo> getElectricityUsedByCondition(ElectricityUsedDto electricityUsedDto);

    //条件查询电能使用情况明细
    List<ElectricityUsage> getElectricityUsedDetailByCondition(ElectricityUsedDto electricityUsedDto);

    //条件查询每条电能电费使用情况数据
    List<ElectricityUsedGroupByDayVo> getEveryDayElectricityUsedByCondition(ElectricityUsedDto electricityUsedDto);
}
