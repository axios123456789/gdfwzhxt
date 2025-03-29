package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkSource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface WorkSourceMapper {
    //在提交工单材料表中添加数据
    void addWorkSource(WorkSource workSourceDto);

    //根据工单编号删除个人工单材料提交表中的数据
    void deleteByWorkOrderNo(String workOrderNo);

    //根据个人接单id查询个人提交材料信息
    WorkSource getWorkSourceByAcceptId(String acceptId);

    //修改提交工单材料信息
    void updateWorkSource(WorkSource workSource);

    //同步驳回原因，驳回人到材料表中
    void updateWorkSourceToRefuse(WorkSource workSource);

    //修改材料信息中的标识为已通过
    @Update("update t_work_source set accept_flag = 1 where accept_id = #{param1}")
    void updateFlagToSuccess(String id);

    //根据材料编号查询材料信息
    WorkSource getWorkSourceByWorkSourceNo(String workSourceNo);
}
