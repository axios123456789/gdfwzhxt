package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.workOrder.WorkOrderDto;
import com.wangwen.gdfwzhxt.model.entity.workOrder.PersonAccept;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface WorkOrderMapper {
    //条件查询所有工单
    List<WorkOrder> getWorkOrderByCondition(WorkOrderDto workOrderDto);

    //添加工单
    void addWorkOrder(WorkOrder workOrder);

    //修改工单(仅核心信息部分)
    void updateWorkOrder(WorkOrder workOrder);

    //根据id删除工单
    @Update("update t_work_order set is_deleted = 1 where id = #{param1}")
    void deleteWorkOrderById(String id);

    //推送工单
    @Update("update t_work_order set work_order_status = #{workOrderStatus} where id = #{id}")
    void pushWorkOrder(WorkOrder workOrder);

    //催处理
    @Update("update t_work_order set urge_to_process_count = #{urgeToProcessCount}, " +
            "last_urge_to_process_time = #{lastUrgeToProcessTime} where id = #{id}")
    void urgeToProcess(WorkOrder workOrder);

    //受理
    @Update("update t_work_order set work_order_status = #{workOrderStatus}, handle_time = #{handleTime}, " +
            "handle_by = #{handleBy} where id = #{id}")
    void processWorkOrder(WorkOrder workOrder);

    //催接单
    @Update("update t_work_order set urge_to_accept_count = #{urgeToAcceptCount}," +
            "last_urge_to_accept_time = #{lastUrgeToAcceptTime} where id = #{id}")
    void urgeToAccept(WorkOrder workOrder);

    //接单
    @Update("update t_work_order set work_order_status = #{workOrderStatus}, accept_order_time =#{acceptOrderTime}," +
            "accept_order_by = #{acceptOrderBy} where id = #{id}")
    void acceptWorkOrder(WorkOrder workOrder);

    //催办
    @Update("update t_work_order set urge_to_handle_count = #{urgeToHandleCount}," +
            "last_urge_to_handle_time = #{lastUrgeToHandleTime} where id = #{id}")
    void urgeToHandle(WorkOrder workOrder);

    //根据工单编号查询工单信息列表
    WorkOrder getworkOrderByWorkOrderNo(String workOrderNo);

    //根据id查询工单
    WorkOrder getWorkOrderById(String id);

    //修改工单表的工单状态(已督办)
    void handleAchieve(String acceptId);

    //将工单状态回滚到已接单4
    void returnWorkOrderStatus(String acceptId);

    //修改工单状态为已完成6且设置材料编号和完成时间完成人
    void reviewSuccess(PersonAccept personAccept);
}
