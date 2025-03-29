package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.workOrder.WorkOrderDto;
import com.wangwen.gdfwzhxt.model.entity.workOrder.PersonAccept;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkSource;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

public interface WorkOrderService {
    //条件分页查询工单列表
    PageInfo<WorkOrder> getWorkOrderByConditionAndPage(Integer current, Integer limit, WorkOrderDto workOrderDto);

    //保存工单
    void saveWorkOrder(WorkOrder workOrder);

    //根据id删除工单
    void deleteWorkOrderById(String id);

    //推送工单按钮点击事件接口
    void pushWorkOrder(WorkOrder workOrder);

    //催处理按钮点击调用接口
    void urgeToProcess(WorkOrder workOrder);

    //点击受理按钮，受理工单
    void processWorkOrder(WorkOrder workOrder);

    //点击催接单按钮调用接口
    void urgeToAccept(WorkOrder workOrder);

    //点击接单按钮，接受工单
    void acceptWorkOrder(WorkOrder workOrder);

    //点击催办按钮，调用接口进行催办
    void urgeToHandle(WorkOrder workOrder);

    //excel导出接口
    void download(WorkOrderDto workOrderDto, HttpServletResponse response) throws IOException;

    //条件分页查询个人接单列表
    PageInfo<PersonAccept> getPersonAcceptByConditionAndPage(Integer current, Integer limit, Integer handleStatus);

    //根据工单编号查询工单信息列表
    WorkOrder getWorkOrderByWorkOrderNo(String workOrderNo);

    //个人工单管理-开始受理工单
    void beginHandleWorkOrder(String id);

    //个人工单管理-完成工单处理
    void achieveWorkOrderHandle(WorkSource workSource);

    //根据个人接单id查询个人提交材料信息
    WorkSource getWorkSourceByAcceptId(String acceptId);

    //修改提交工单材料信息
    void updateWorkSource(WorkSource workSource);

    //提交工单材料审核接口
    void submitWorkSource(WorkSource workSource);

    //根据工单编号查询个人接单信息
    PersonAccept getPersonAcceptByWorkOrderNo(String workOrderNo);

    //工单材料驳回接口
    void refuseWorkOrder(WorkSource workSource);

    //工单材料通过审核接口
    void reviewSuccess(PersonAccept personAccept);

    //根据材料编号查询个人工单材料提交信息和个人接单信息
    Map<String, Object> getPersonAcceptAndWorkSourceByWorkSourceNo(String workSourceNo);
}
