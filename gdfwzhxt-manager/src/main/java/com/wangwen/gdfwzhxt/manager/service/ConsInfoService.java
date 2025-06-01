package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.CustomerFeedbackDto;
import com.wangwen.gdfwzhxt.model.dto.cons.ElectricityUsedDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.CustomerFeedback;
import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedVo;

import java.util.List;
import java.util.Map;

public interface ConsInfoService {
    //条件分页查询用户信息列表
    PageInfo<ConsInfo> getConsInfoListByConditionAndPage(Integer current, Integer limit, ConsInfoDto consInfoDto);

    //保存用户信息
    void saveConsInfo(ConsInfo consInfo);

    //根据id删除用户
    void deleteConsInfoById(String id);

    //根据用户编号查询用户信息
    ConsInfo getConsInfoByConsNo(String consNo);

    //条件分页查询用户电费充值记录
    PageInfo<RechargeRecord> getRechargeRecordByConditionAndPage(Integer current, Integer limit, RechargeRecordDto rechargeRecordDto);

    //用户电费充值
    void rechargeElectricity(RechargeRecord rechargeRecord);

    //条件分页查询电能使用情况
    PageInfo<ElectricityUsedVo> getElectricityUsedByConditionAndPage(Integer current, Integer limit, ElectricityUsedDto electricityUsedDto);

    //条件分页查询电能使用情况明细
    PageInfo<ElectricityUsage> getElectricityUsedDetailByConditionAndPage(Integer current, Integer limit, ElectricityUsedDto electricityUsedDto);

    //条件查询每条电能电费使用情况数据-用于可视化
    Map<String, Object> getEveryDayElectricityUsedByCondition(ElectricityUsedDto electricityUsedDto);

    //条件分页查询客户反馈记录列表
    PageInfo<CustomerFeedback> getCustomerFeedbackByConditionAndPage(Integer current, Integer limit, CustomerFeedbackDto customerFeedbackDto);

    //保存客户反馈记录
    void saveCustomerFeedback(CustomerFeedback customerFeedback);

    //根据id删除客户反馈记录
    void deleteCustomerFeedbackById(String id);

    //根据反馈记录生成工单和事件
    void generateWorkOrderByFeedback(CustomerFeedback customerFeedback);
}
