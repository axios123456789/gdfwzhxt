package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface DroneMapper {
    //条件查询所有无人机信息
    List<DroneInfo> getDroneInfoListByCondition(DroneInfoDto droneInfoDto);

    //添加无人机信息
    void addDroneInfo(DroneInfo droneInfo);

    //修改无人机信息
    void updateDroneInfo(DroneInfo droneInfo);

    //根据id删除无人机信息
    @Update("update t_drone_info set is_deleted = 1 where id = #{param1}")
    void deleteDroneInfoById(String id);
}
