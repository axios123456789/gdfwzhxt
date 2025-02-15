package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.source.UnitSourceDto;
import com.wangwen.gdfwzhxt.model.entity.source.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface UnitMapper {
    //查询所有单位
    List<Unit> getAllUnit();

    //添加单位
    void addUnit(Unit unit);

    //修改单位
    void updateUnit(Unit unit);

    //根据unitId查询下级节点的数量
    int getChildrenCountByUnitId(String unitId);

    //根据unitId删除单位
    @Update("update t_unit set is_deleted = 1 where unit_id = #{param1}")
    void deleteUnitByUnitId(String unitId);

    //条件查询所有单位
    List<Unit> getUnitListByCondition(UnitSourceDto unitSourceDto);
}
