package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.WorkOrderService;
import com.wangwen.gdfwzhxt.model.dto.workOrder.WorkOrderDto;
import com.wangwen.gdfwzhxt.model.entity.workOrder.PersonAccept;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkSource;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 工单相关操作
 */
@RestController
@RequestMapping("/electricity/workOrder")
public class WorkOrderController {
    @Autowired
    private WorkOrderService workOrderService;

    /**
     * excel导出接口
     * @param
     * @param response
     * @return
     */
    @RequestMapping("/download")
    public void download(HttpServletResponse response, @RequestBody WorkOrderDto workOrderDto){
        try {
            workOrderService.download(workOrderDto,response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * 条件分页查询工单列表
     * @param current
     * @param limit
     * @param workOrderDto
     * @return
     */
    @RequestMapping("/getWorkOrderByConditionAndPage/{current}/{limit}")
    public Result getWorkOrderByConditionAndPage(@PathVariable("current") Integer current,
                                                 @PathVariable("limit") Integer limit,
                                                 @RequestBody WorkOrderDto workOrderDto){
        PageInfo<WorkOrder> pageInfo = workOrderService.getWorkOrderByConditionAndPage(current, limit, workOrderDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存工单
     * @param workOrder
     * @return
     */
    @PostMapping("/saveWorkOrder")
    public Result saveWorkOrder(@RequestBody WorkOrder workOrder){
        try {
            workOrderService.saveWorkOrder(workOrder);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "该工单编号已存在！");
        }
    }

    /**
     * 根据id删除工单
     * @param id
     * @return
     */
    @DeleteMapping("/deleteWorkOrderById/{id}")
    public Result deleteWorkOrderById(@PathVariable("id") String id){
        try {
            workOrderService.deleteWorkOrderById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除工单失败！");
        }
    }

    /**
     * 推送工单按钮点击事件接口
     * @param workOrder
     * @return
     */
    @PutMapping("/pushWorkOrder")
    public Result pushWorkOrder(@RequestBody WorkOrder workOrder){
        try {
            workOrderService.pushWorkOrder(workOrder);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "推送工单失败！");
        }
    }

    /**
     * 催处理按钮点击调用接口
     * @param workOrder
     * @return
     */
    @PutMapping("/urgeToProcess")
    public Result urgeToProcess(@RequestBody WorkOrder workOrder){
        workOrderService.urgeToProcess(workOrder);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 点击受理按钮，受理工单
     * @param workOrder
     * @return
     */
    @PutMapping("/processWorkOrder")
    public Result processWorkOrder(@RequestBody WorkOrder workOrder){
        try {
            workOrderService.processWorkOrder(workOrder);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "工单受理失败，请联系管理员！");
        }
    }

    /**
     * 点击催接单按钮调用接口
     * @param workOrder
     * @return
     */
    @PutMapping("/urgeToAccept")
    public Result urgeToAccept(@RequestBody WorkOrder workOrder){
        workOrderService.urgeToAccept(workOrder);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 点击接单按钮，接受工单
     * @param workOrder
     * @return
     */
    @PutMapping("/acceptWorkOrder")
    public Result acceptWorkOrder(@RequestBody WorkOrder workOrder){
        try {
            workOrderService.acceptWorkOrder(workOrder);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "接单失败，请联系管理员！");
        }
    }

    /**
     * 点击催办按钮，调用接口进行催办
     * @param workOrder
     * @return
     */
    @PutMapping("/urgeToHandle")
    public Result urgeToHandle(@RequestBody WorkOrder workOrder){
        workOrderService.urgeToHandle(workOrder);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询个人接单列表
     * @param current
     * @param limit
     * @param handleStatus
     * @return
     */
    @GetMapping("/getPersonAcceptByConditionAndPage/{current}/{limit}/{handleStatus}")
    public Result getPersonAcceptByConditionAndPage(@PathVariable("current") Integer current,
                                                    @PathVariable("limit") Integer limit,
                                                    @PathVariable("handleStatus") Integer handleStatus){
        PageInfo<PersonAccept> pageInfo = workOrderService.getPersonAcceptByConditionAndPage(current, limit, handleStatus);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 根据工单编号查询工单信息列表
     * @param workOrderNo
     * @return
     */
    @GetMapping("/getWorkOrderByWorkOrderNo/{workOrderNo}")
    public Result getWorkOrderByWorkOrderNo(@PathVariable("workOrderNo") String workOrderNo){
        WorkOrder workOrder = workOrderService.getWorkOrderByWorkOrderNo(workOrderNo);
        return Result.build(workOrder, ResultCodeEnum.SUCCESS);
    }

    /**
     * 个人工单管理-开始受理工单
     * @param id
     * @return
     */
    @PostMapping("/beginHandleWorkOrder/{id}")
    public Result beginHandleWorkOrder(@PathVariable("id") String id){
        try {
            workOrderService.beginHandleWorkOrder(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "工单开始受理时出错，请联系管理员！");
        }
    }

    /**
     * 个人工单管理-完成工单处理
     * @param workSource
     * @return
     */
    @PostMapping("/achieveWorkOrderHandle")
    public Result achieveWorkOrderHandle(@RequestBody WorkSource workSource){
        try {
            workOrderService.achieveWorkOrderHandle(workSource);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "处理工单失败，请联系管理员！");
        }
    }

    /**
     * 根据个人接单id查询个人提交材料信息
     * @param acceptId
     * @return
     */
    @GetMapping("/getWorkSourceByAcceptId/{acceptId}")
    public Result getWorkSourceByAcceptId(@PathVariable("acceptId") String acceptId){
        WorkSource workSource = workOrderService.getWorkSourceByAcceptId(acceptId);
        return Result.build(workSource, ResultCodeEnum.SUCCESS);
    }

    /**
     * 修改提交工单材料信息
     * @param workSource
     * @return
     */
    @PutMapping("/updateWorkSource")
    public Result updateWorkSource(@RequestBody WorkSource workSource){
        try {
            workOrderService.updateWorkSource(workSource);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存工单材料信息失败，请联系管理员！");
        }
    }

    /**
     * 提交工单材料审核接口
     * @param workSource
     * @return
     */
    @PostMapping("/submitWorkSource")
    public Result submitWorkSource(@RequestBody WorkSource workSource){
        try {
            workOrderService.submitWorkSource(workSource);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "后台出错，请联系管理员！");
        }
    }

    /**
     * 根据工单编号查询个人接单信息
     * @param workOrderNo
     * @return
     */
    @GetMapping("/getPersonAcceptByWorkOrderNo/{workOrderNo}")
    public Result getPersonAcceptByWorkOrderNo(@PathVariable("workOrderNo") String workOrderNo){
        PersonAccept personAccept = workOrderService.getPersonAcceptByWorkOrderNo(workOrderNo);
        return Result.build(personAccept, ResultCodeEnum.SUCCESS);
    }

    /**
     * 工单材料驳回接口
     * @param workSource
     * @return
     */
    @PostMapping("/refuseWorkOrder")
    public Result refuseWorkOrder(@RequestBody WorkSource workSource){
        try {
            workOrderService.refuseWorkOrder(workSource);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "驳回出错，请联系管理员！");
        }
    }

    /**
     * 工单材料通过审核接口
     * @param personAccept
     * @return
     */
    @PostMapping("/reviewSuccess")
    public Result reviewSuccess(@RequestBody PersonAccept personAccept){
        try {
            workOrderService.reviewSuccess(personAccept);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "通过审核出错，请联系管理员！");
        }
    }

    /**
     * 根据材料编号查询个人工单材料提交信息和个人接单信息
     * @param workSourceNo
     * @return
     */
    @GetMapping("/getPersonAcceptAndWorkSourceByWorkSourceNo/{workSourceNo}")
    public Result getPersonAcceptAndWorkSourceByWorkSourceNo(@PathVariable("workSourceNo") String workSourceNo){
        Map<String, Object> map = workOrderService.getPersonAcceptAndWorkSourceByWorkSourceNo(workSourceNo);
        return Result.build(map, ResultCodeEnum.SUCCESS);
    }
}
