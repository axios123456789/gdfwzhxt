package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.workOrder.ViewRecordDto;
import com.wangwen.gdfwzhxt.model.entity.drone.ViewRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ViewRecordMapper {
    //条件查询所有无人机巡视记录数据
    List<ViewRecord> getViewRecordByCondition(ViewRecordDto viewRecordDto);

    //添加巡视记录
    void addViewRecord(ViewRecord viewRecord);

    //修改巡视记录
    void updateViewRecord(ViewRecord viewRecord);

    //根据id删除巡视记录
    @Update("update t_view_record set is_deleted = 1 where id = #{param1}")
    void deleteViewRecord(String id);

    //修改巡视记录状态改为已生成事件2
    @Update("update t_view_record set handle_flag = 2 where id = #{param1}")
    void updateViewRecordStatus1(String id);

    //修改巡视记录状态改为已生成工单3
    @Update("update t_view_record set handle_flag = 3 where id = #{param1}")
    void updateViewRecordStatus2(String id);

    //修改巡视记录状态改为已生成工单和事件4
    @Update("update t_view_record set handle_flag = 4 where id = #{param1}")
    void updateViewRecordStatus3(String id);
}
