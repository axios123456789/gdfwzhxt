package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.source.UnitSourceDto;
import com.wangwen.gdfwzhxt.model.entity.source.Unit;

import java.util.List;

public interface UnitService {
    //查询单位列表（以特定的形式返回）
    List<Unit> findNodes();

    //添加单位
    void addUnit(Unit unit);

    //修改单位
    void updateUnit(Unit unit);

    //根据unitId删除单位
    void deleteUnitByUnitId(String unitId);

    //条件分页查询单位
    PageInfo<Unit> getUnitListByConditionAndPage(Integer current, Integer limit, UnitSourceDto unitSourceDto);
}
