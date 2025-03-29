package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.dto.workOrder.ViewRecordDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;
import com.wangwen.gdfwzhxt.model.entity.drone.ViewRecord;

public interface DroneService {
    //条件分页查询无人机信息列表
    PageInfo<DroneInfo> getDroneInfoListByConditionAndPage(Integer current, Integer limit, DroneInfoDto droneInfoDto);

    //保存无人机信息
    void saveDroneInfo(DroneInfo droneInfo);

    //根据id删除无人机信息
    void deleteDroneInfoById(String id);

    //条件分页查询无人机巡视记录
    PageInfo<ViewRecord> getViewRecordByConditionAndPage(Integer current, Integer limit, ViewRecordDto viewRecordDto);

    //保存巡视记录
    void saveViewRecord(ViewRecord viewRecord);

    //根据id删除巡视记录
    void deleteViewRecord(String id);

    //核心业务-巡视记录扭转
    void viewRecordChange(ViewRecord viewRecord, Integer changeFlag);
}
