package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;

public interface DroneService {
    //条件分页查询无人机信息列表
    PageInfo<DroneInfo> getDroneInfoListByConditionAndPage(Integer current, Integer limit, DroneInfoDto droneInfoDto);

    //保存无人机信息
    void saveDroneInfo(DroneInfo droneInfo);

    //根据id删除无人机信息
    void deleteDroneInfoById(String id);
}
