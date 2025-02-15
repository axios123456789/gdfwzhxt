package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.DroneMapper;
import com.wangwen.gdfwzhxt.manager.service.DroneService;
import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DroneServiceImpl implements DroneService {
    @Autowired
    private DroneMapper droneMapper;

    /**
     * 条件分页查询无人机信息列表
     * @param current
     * @param limit
     * @param droneInfoDto
     * @return
     */
    @Override
    public PageInfo<DroneInfo> getDroneInfoListByConditionAndPage(Integer current, Integer limit, DroneInfoDto droneInfoDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有数据
        List<DroneInfo> list = droneMapper.getDroneInfoListByCondition(droneInfoDto);

        //封装list为pageInfo<DroneInfo>新式数据
        PageInfo<DroneInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存无人机信息
     * @param droneInfo
     */
    @Override
    public void saveDroneInfo(DroneInfo droneInfo) {
        //根据id是否为空判断添加还是修改
        if (droneInfo.getId() == null || "".equals(droneInfo.getId())){//添加
            droneInfo.setId(UUIDUtil.getUUID());
            droneInfo.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            droneInfo.setCreateBy(AuthContextUtil.get().getName());

            //添加
            droneMapper.addDroneInfo(droneInfo);
        }else {//修改
            droneInfo.setUpdateBy(AuthContextUtil.get().getName());

            //修改
            droneMapper.updateDroneInfo(droneInfo);
        }
    }

    /**
     * 根据id删除无人机信息
     * @param id
     */
    @Override
    public void deleteDroneInfoById(String id) {
        droneMapper.deleteDroneInfoById(id);
    }
}
