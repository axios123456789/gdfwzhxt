package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.entity.workOrder.PersonAccept;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

@Mapper
public interface PersonAcceptMapper {
    //条件查询个人接单列表
    List<PersonAccept> getPersonAcceptByCondition(Integer handleStatus, String userId);

    //新增个人接单数据
    void insertPersonAccept(PersonAccept personAccept);

    //根据工单编号删除个人接单表中对应的工单
    @Delete("delete from t_person_accept where work_order_no = #{param1}")
    void deletePersonAcceptByWorkOrderNo(String workOrderNo);

    //催办完后同步修改个人接单表的催办记录
    @Update("update t_person_accept set urge_to_handle_count = #{urgeToHandleCount}," +
            "last_urge_to_handle_time = #{lastUrgeToHandleTime} where work_order_no = #{workOrderNo}")
    void updateUrgeToHandleRecode(WorkOrder workOrder);

    //个人工单管理-开始受理工单
    @Update("update t_person_accept set handle_status = 2, process_begin_time = now() where id = #{param1}")
    void beginHandleWorkOrder(String id);

    //个人工单管理-完成工单处理
    @Update("update t_person_accept set handle_status = 3, supervise_begin_time = now() where id = #{param1}")
    void achieveWorkOrderHandle(String acceptId);

    //修改个人工单表的流程状态(完成督办)
    @Update("update t_person_accept set handle_status = 4, supervise_end_time = now() where id = #{param1}")
    void handleAchievee(String acceptId);

    //根据工单编号查询个人接单信息
    PersonAccept getPersonAcceptByWorkOrderNo(String workOrderNo);

    //将个人接单状态进入到被驳回5
    @Update("update t_person_accept set handle_status = 5, supervise_end_time = null where id = #{param1}")
    void updateStatusToRefuse(String acceptId);

    //修改个人工单状态为已完成6
    @Update("update t_person_accept set handle_status = 6 where id = #{param1}")
    void reviewSuccess(String id);

    //根据个人id查询个人接单信息
    PersonAccept getPersonAcceptById(String acceptId);
}
