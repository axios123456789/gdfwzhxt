package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.UnitMapper;
import com.wangwen.gdfwzhxt.manager.service.UnitService;
import com.wangwen.gdfwzhxt.manager.util.UnitHelper;
import com.wangwen.gdfwzhxt.model.dto.source.UnitSourceDto;
import com.wangwen.gdfwzhxt.model.entity.source.Unit;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class UnitServiceImpl implements UnitService {
    @Autowired
    private UnitMapper unitMapper;

    /**
     * 查询单位列表（以特定的形式返回）
     * @return
     */
    @Override
    public List<Unit> findNodes() {
        //查询所有单位
        List<Unit> units = unitMapper.getAllUnit();

        //判断查到的单位列表是否为空
        if (CollectionUtils.isEmpty(units)){
            return null;
        }

        //将查到的单位处理成特定的格式
        List<Unit> tree = UnitHelper.buildTree(units);
        return tree;
    }

    /**
     * 添加单位
     * @param unit
     */
    @Override
    public void addUnit(Unit unit) {
        unit.setId(UUIDUtil.getUUID());
        unit.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        unit.setCreateBy(AuthContextUtil.get().getName());

        //添加
        unitMapper.addUnit(unit);
    }

    /**
     * 修改单位
     * @param unit
     */
    @Override
    public void updateUnit(Unit unit) {
        unit.setUpdateBy(AuthContextUtil.get().getName());

        //修改
        unitMapper.updateUnit(unit);
    }

    /**
     * 根据unitId删除单位
     * @param unitId
     */
    @Override
    public void deleteUnitByUnitId(String unitId) {
        //删除前先查询是否有下级节点
        int count = unitMapper.getChildrenCountByUnitId(unitId);

        if (count > 0){
            throw new ElectricityException(ResultCodeEnum.NODE_ERROR);
        }

        //删除
        unitMapper.deleteUnitByUnitId(unitId);
    }

    /**
     * 条件分页查询单位
     * @param current
     * @param limit
     * @param unitSourceDto
     * @return
     */
    @Override
    public PageInfo<Unit> getUnitListByConditionAndPage(Integer current, Integer limit, UnitSourceDto unitSourceDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有单位
        List<Unit> units = unitMapper.getUnitListByCondition(unitSourceDto);

        PageInfo<Unit> pageInfo = new PageInfo<>(units);
        return pageInfo;
    }
}
