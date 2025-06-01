package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.CustomerFeedbackDto;
import com.wangwen.gdfwzhxt.model.dto.cons.ElectricityUsedDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.CustomerFeedback;
import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/electricity/consInfo")
public class ConsInfoController {
    @Autowired
    private ConsInfoService consInfoService;

    /**
     * 条件分页查询用户信息列表
     * @param current
     * @param limit
     * @param consInfoDto
     * @return
     */
    @PostMapping("/getConsInfoListByConditionAndPage/{current}/{limit}")
    public Result getConsInfoListByConditionAndPage(@PathVariable("current") Integer current,
                                                    @PathVariable("limit") Integer limit,
                                                    @RequestBody ConsInfoDto consInfoDto){
        PageInfo<ConsInfo> pageInfo = consInfoService.getConsInfoListByConditionAndPage(current, limit, consInfoDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存用户信息
     * @param consInfo
     * @return
     */
    @PostMapping("/saveConsInfo")
    public Result saveConsInfo(@RequestBody ConsInfo consInfo){
        try {
            consInfoService.saveConsInfo(consInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, ResultCodeEnum.CONS_EXISTS);
        }
    }

    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    @DeleteMapping("/deleteConsInfoById/{id}")
    public Result deleteConsInfoById(@PathVariable("id") String id){
        try {
            consInfoService.deleteConsInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除用户信息失败！");
        }
    }

    /**
     * 根据用户编号查询用户信息
     * @param consNo
     * @return
     */
    @GetMapping("/getConsInfoByConsNo/{consNo}")
    public Result getConsInfoByConsNo(@PathVariable("consNo") String consNo){
        ConsInfo consInfo = consInfoService.getConsInfoByConsNo(consNo);
        return Result.build(consInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询用户电费充值记录
     * @param current
     * @param limit
     * @param rechargeRecordDto
     * @return
     */
    @PostMapping("/getRechargeRecordByConditionAndPage/{current}/{limit}")
    public Result getRechargeRecordByConditionAndPage(@PathVariable("current") Integer current,
                                                      @PathVariable("limit") Integer limit,
                                                      @RequestBody RechargeRecordDto rechargeRecordDto){
        PageInfo<RechargeRecord> pageInfo = consInfoService.getRechargeRecordByConditionAndPage(current, limit, rechargeRecordDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 用户电费充值
     * @param rechargeRecord
     * @return
     */
    @PostMapping("/rechargeElectricity")
    public Result rechargeElectricity(@RequestBody RechargeRecord rechargeRecord){
        try {
            consInfoService.rechargeElectricity(rechargeRecord);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "电费充值失败，请联系管理员！");
        }
    }

    /**
     * 条件分页查询电能使用情况
     * @param current
     * @param limit
     * @param electricityUsedDto
     * @return
     */
    @GetMapping("/getElectricityUsedByConditionAndPage/{current}/{limit}")
    public Result getElectricityUsedByConditionAndPage(@PathVariable("current") Integer current,
                                                       @PathVariable("limit") Integer limit,
                                                       ElectricityUsedDto electricityUsedDto){
        PageInfo<ElectricityUsedVo> pageInfo = consInfoService.getElectricityUsedByConditionAndPage(current, limit, electricityUsedDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询电能使用情况明细
     * @param current
     * @param limit
     * @param electricityUsedDto
     * @return
     */
    @GetMapping("/getElectricityUsedDetailByConditionAndPage/{current}/{limit}")
    public Result getElectricityUsedDetailByConditionAndPage(@PathVariable("current") Integer current,
                                                             @PathVariable("limit") Integer limit,
                                                             ElectricityUsedDto electricityUsedDto){
        PageInfo<ElectricityUsage> pageInfo = consInfoService.getElectricityUsedDetailByConditionAndPage(current, limit, electricityUsedDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件查询每条电能电费使用情况数据-用于可视化
     * @param electricityUsedDto
     * @return
     */
    @GetMapping("/getEveryDayElectricityUsedByCondition")
    public Result getEveryDayElectricityUsedByCondition(ElectricityUsedDto electricityUsedDto){
        Map<String, Object> map = consInfoService.getEveryDayElectricityUsedByCondition(electricityUsedDto);
        return Result.build(map, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询客户反馈记录列表
     * @param current
     * @param limit
     * @param customerFeedbackDto
     * @return
     */
    @PostMapping("/getCustomerFeedbackByConditionAndPage/{current}/{limit}")
    public Result getCustomerFeedbackByConditionAndPage(@PathVariable("current") Integer current,
                                                        @PathVariable("limit") Integer limit,
                                                        @RequestBody CustomerFeedbackDto customerFeedbackDto){
        PageInfo<CustomerFeedback> pageInfo = consInfoService.getCustomerFeedbackByConditionAndPage(current, limit, customerFeedbackDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存客户反馈记录
     * @param customerFeedback
     * @return
     */
    @PostMapping("/saveCustomerFeedback")
    public Result saveCustomerFeedback(@RequestBody CustomerFeedback customerFeedback){
        try {
            consInfoService.saveCustomerFeedback(customerFeedback);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存失败，请联系管理员！");
        }
    }

    /**
     * 根据id删除客户反馈记录
     * @param id
     * @return
     */
    @DeleteMapping("/deleteCustomerFeedbackById/{id}")
    public Result deleteCustomerFeedbackById(@PathVariable("id") String id){
        try {
            consInfoService.deleteCustomerFeedbackById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除客户反馈记录失败，请联系管理员！");
        }
    }

    /**
     * 根据反馈记录生成工单和事件
     * @param customerFeedback
     * @return
     */
    @PostMapping("/generateWorkOrderByFeedback")
    public Result generateWorkOrderByFeedback(@RequestBody CustomerFeedback customerFeedback){
        try {
            consInfoService.generateWorkOrderByFeedback(customerFeedback);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "生成工单失败，请联系管理员！");
        }
    }
}
