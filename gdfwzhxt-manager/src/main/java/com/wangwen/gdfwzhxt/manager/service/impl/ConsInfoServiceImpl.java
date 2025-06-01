package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.*;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.CustomerFeedbackDto;
import com.wangwen.gdfwzhxt.model.dto.cons.ElectricityUsedDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.*;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedGroupByDayVo;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ConsInfoServiceImpl implements ConsInfoService {
    @Autowired
    private ConsInfoMapper consInfoMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;

    @Autowired
    private ElectricityUsageMapper electricityUsageMapper;

    @Autowired
    private CustomerFeedbackMapper customerFeedbackMapper;

    @Autowired
    private TransformerEventMapper transformerEventMapper;

    @Autowired
    private LineEventMapper lineEventMapper;

    @Autowired
    private WorkOrderMapper workOrderMapper;



    /**
     * 条件分页查询用户信息列表
     * @param current
     * @param limit
     * @param consInfoDto
     * @return
     */
    @Override
    public PageInfo<ConsInfo> getConsInfoListByConditionAndPage(Integer current, Integer limit, ConsInfoDto consInfoDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询用户信息列表
        List<ConsInfo> list = consInfoMapper.getConsInfoListByCondition(consInfoDto);

        //封装数据成PageInfo<ConsInfo>新式
        PageInfo<ConsInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存用户信息
     * @param consInfo
     */
    @Override
    public void saveConsInfo(ConsInfo consInfo) {
        //保存前先判断户号是否存在
//        int count = consInfoMapper.getConsInfoCountByConsNo(consInfo.getConsNo());
//        if (count > 0){
//            throw new ElectricityException(ResultCodeEnum.CONS_EXISTS);
//        }

        //根据id是否为空判断添加还是修改
        if (consInfo.getId() == null || "".equals(consInfo.getId())){//添加
            //设置参数
            consInfo.setId(UUIDUtil.getUUID());
            consInfo.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            consInfo.setCreateBy(AuthContextUtil.get().getName());

            //添加用户
            consInfoMapper.addConsInfo(consInfo);
        }else {//修改
            //设置参数
            consInfo.setUpdateBy(AuthContextUtil.get().getName());

            //修改用户
            consInfoMapper.updateConsInfo(consInfo);
        }
    }

    /**
     * 根据id删除用户
     * @param id
     */
    @Override
    public void deleteConsInfoById(String id) {
        consInfoMapper.deleteConsInfoById(id);
    }

    /**
     * 根据用户编号查询用户信息
     * @param consNo
     * @return
     */
    @Override
    public ConsInfo getConsInfoByConsNo(String consNo) {
        ConsInfo consInfo = consInfoMapper.getConsInfoByConsNo(consNo);
        return consInfo;
    }

    /**
     * 条件分页查询用户电费充值记录
     * @param current
     * @param limit
     * @param rechargeRecordDto
     * @return
     */
    @Override
    public PageInfo<RechargeRecord> getRechargeRecordByConditionAndPage(Integer current, Integer limit, RechargeRecordDto rechargeRecordDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有电费充值记录
        List<RechargeRecord> list = rechargeRecordMapper.getRechargeRecordByCondition(rechargeRecordDto);

        //封装
        PageInfo<RechargeRecord> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    /**
     * 用户电费充值
     * @param rechargeRecord
     */
    @Override
    @Transactional
    public void rechargeElectricity(RechargeRecord rechargeRecord) {
        //1.查询用户原有电费
        double priCharge = consInfoMapper.getPriChargeByConsNo(rechargeRecord.getConsNo());

        //2.查询用户是否有停电类型为用户欠费，停电状态为未复电的停电事件
        ConsEvent consEvent = consEventMapper.getConsEventByConsNo(rechargeRecord.getConsNo());

        //3.如果有事件，则加上充值电费卡看电费是否大于0，如果大于0则事件复电
        if (consEvent != null && (priCharge + rechargeRecord.getRechargeAmount()) > 0){//用户事件复电
            Date curDate = new Date(); //当前时间
            consEvent.setPowerSupplyTime(curDate);
            consEvent.setStatus(2);
            consEvent.setPowerOutageDuration((curDate.getTime() - consEvent.getPowerOutageTime().getTime()) / (1000*60*60));
            consEventMapper.updateConsEvent(consEvent);
        }

        //4.修改用户电费
        consInfoMapper.updateRecharge(rechargeRecord);

        //设置数据
        rechargeRecord.setId(UUIDUtil.getUUID());
        rechargeRecord.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        rechargeRecord.setOperator(AuthContextUtil.get().getName());

        //5.形成电费充值记录
        rechargeRecordMapper.addRechargeRecord(rechargeRecord);
    }

    /**
     * 条件分页查询电能使用情况
     * @param current
     * @param limit
     * @param electricityUsedDto
     * @return
     */
    @Override
    public PageInfo<ElectricityUsedVo> getElectricityUsedByConditionAndPage(Integer current, Integer limit, ElectricityUsedDto electricityUsedDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有电能使用情况
        List<ElectricityUsedVo> list = electricityUsageMapper.getElectricityUsedByCondition(electricityUsedDto);

        //封装
        PageInfo<ElectricityUsedVo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 条件分页查询电能使用情况明细
     * @param current
     * @param limit
     * @param electricityUsedDto
     * @return
     */
    @Override
    public PageInfo<ElectricityUsage> getElectricityUsedDetailByConditionAndPage(Integer current, Integer limit, ElectricityUsedDto electricityUsedDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询电能使用情况明细
        List<ElectricityUsage> list = electricityUsageMapper.getElectricityUsedDetailByCondition(electricityUsedDto);

        //封装
        PageInfo<ElectricityUsage> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 条件查询每条电能电费使用情况数据-用于可视化
     * @param electricityUsedDto
     * @return
     */
    @Override
    public Map<String, Object> getEveryDayElectricityUsedByCondition(ElectricityUsedDto electricityUsedDto) {
        //条件查询每条电能电费使用情况数据
        List<ElectricityUsedGroupByDayVo> electricityUsedGroupByDayVos = electricityUsageMapper.getEveryDayElectricityUsedByCondition(electricityUsedDto);
        List<String> dayDateList = new ArrayList<>(); //存放天数据
        List<Double> totalEnergyUsedList = new ArrayList<>(); //存放当天使用电能数据
        List<Double> totalBalanceUsedList = new ArrayList<>(); //存放当天使用电费数据
        List<Double> dayUsedEnergyList = new ArrayList<>(); //存放当日已用电能
        List<Double> dayMinBalanceList = new ArrayList<>(); //存放当日最少电费

        for (ElectricityUsedGroupByDayVo electricityUsedGroupByDayVo : electricityUsedGroupByDayVos){
            dayDateList.add(electricityUsedGroupByDayVo.getDayDate());
            totalEnergyUsedList.add(electricityUsedGroupByDayVo.getTotalEnergyUsed());
            totalBalanceUsedList.add(electricityUsedGroupByDayVo.getTotalBalanceUsed());
            dayUsedEnergyList.add(electricityUsedGroupByDayVo.getDayUsedEnergy());
            dayMinBalanceList.add(electricityUsedGroupByDayVo.getDayMinBalance());
        }

        //封装数据
        Map<String, Object> map = new HashMap<>();
        map.put("dayDateList", dayDateList);
        map.put("totalEnergyUsedList", totalEnergyUsedList);
        map.put("totalBalanceUsedList", totalBalanceUsedList);
        map.put("dayUsedEnergyList", dayUsedEnergyList);
        map.put("dayMinBalanceList", dayMinBalanceList);

        return map;
    }

    /**
     * 条件分页查询客户反馈记录列表
     * @param current
     * @param limit
     * @param customerFeedbackDto
     * @return
     */
    @Override
    public PageInfo<CustomerFeedback> getCustomerFeedbackByConditionAndPage(Integer current, Integer limit, CustomerFeedbackDto customerFeedbackDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有反馈记录
        List<CustomerFeedback> list = customerFeedbackMapper.getCustomerFeedbackByCondition(customerFeedbackDto);

        //封装
        PageInfo<CustomerFeedback> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存客户反馈记录
     * @param customerFeedback
     */
    @Override
    public void saveCustomerFeedback(CustomerFeedback customerFeedback) {
        if (customerFeedback.getId() == null || "".equals(customerFeedback.getId())){//添加
            //设置基本参数
            customerFeedback.setId(UUIDUtil.getUUID());
            customerFeedback.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            customerFeedback.setCreateBy(AuthContextUtil.get().getName());

            //添加
            customerFeedbackMapper.addCustomerFeedback(customerFeedback);
        }else {//修改
            customerFeedback.setUpdateBy(AuthContextUtil.get().getName());

            //更加是否处理进一步设置
            if (customerFeedback.getHandleFlag() == 1){
                customerFeedback.setHandleTime(new Date());
            }

            //修改
            customerFeedbackMapper.updateCustomerFeedback(customerFeedback);
        }
    }

    /**
     * 根据id删除客户反馈记录
     * @param id
     */
    @Override
    public void deleteCustomerFeedbackById(String id) {
        customerFeedbackMapper.deleteCustomerFeedbackById(id);
    }

    /**
     * 根据反馈记录生成工单和事件
     * @param customerFeedback
     */
    @Override
    @Transactional
    public void generateWorkOrderByFeedback(CustomerFeedback customerFeedback) {
        if (customerFeedback.getFeedbackEquipType() == 1){//线路
            this.generateLineEventAndWorkOrder(customerFeedback);
        }else if (customerFeedback.getFeedbackEquipType() == 2){//配变
            this.generateTransformerEventAndWorkOrder(customerFeedback);
        }
        //更新处理标识
        customerFeedback.setHandleFlag(1);
        customerFeedback.setHandleTime(new Date());
        customerFeedbackMapper.updateCustomerFeedback(customerFeedback);
    }

    /**
     * 生成配变及其下级事件和单位
     * @param customerFeedback
     */
    private void generateTransformerEventAndWorkOrder(CustomerFeedback customerFeedback) {
        //创建配变停运事件对象
        TransformerEvent transformerEvent = new TransformerEvent();
        transformerEvent.setDataId(UUIDUtil.getUUID());
        transformerEvent.setTransformerCode(customerFeedback.getFeedbackEquip());
        transformerEvent.setTransformerName(customerFeedback.getFeedbackEquipName());
        transformerEvent.setTerminalOutageTime(customerFeedback.getCreateTime());
        transformerEvent.setPowerOutageType(1);
        transformerEvent.setStatus(1);
        transformerEvent.setReason("由用户反馈生成的事件，具体内容为："+customerFeedback.getFeedbackContent());
        transformerEvent.setCompany(customerFeedback.getCompany());
        transformerEvent.setCreateBy(customerFeedback.getCreateBy());
        transformerEvent.setEffectConsNumber(transformerEventMapper.getConsNumberByTransformerCode(customerFeedback.getFeedbackEquip()));
        //生成配变停运事件
        transformerEventMapper.addTransformerEvent(transformerEvent);

        //生成用户停运事件
        consEventMapper.addConsEventByTransformer(transformerEvent);

        //生成工单
        WorkOrder workOrder = new WorkOrder();
        workOrder.setId(UUIDUtil.getUUID());
        workOrder.setWorkOrderNo(generateWorkOrderNo());
        workOrder.setWorkOrderType(2);
        workOrder.setEventId(transformerEvent.getDataId());
        workOrder.setWorkOrderContent(customerFeedback.getGenerateWorkOrderContent());
        workOrder.setWorkOrderSource(2);
        workOrder.setWorkOrderStatus(1);
        workOrder.setEventType(2);
        workOrder.setCompany(customerFeedback.getCompany());
        workOrder.setCreateBy(customerFeedback.getCreateBy());
        workOrderMapper.addWorkOrder(workOrder);
    }

    /**
     * 生成线路及下级事件和工单
     * @param customerFeedback
     */
    private void generateLineEventAndWorkOrder(CustomerFeedback customerFeedback) {
        //创建线路事件对象
        LineEvent lineEvent = new LineEvent();
        lineEvent.setMid(UUIDUtil.getUUID());
        lineEvent.setLineId(customerFeedback.getFeedbackEquip());
        lineEvent.setLineName(customerFeedback.getFeedbackEquipName());
        lineEvent.setPowerOutageTime(customerFeedback.getCreateTime());
        lineEvent.setPowerOutageType(2);
        lineEvent.setStatus(1);
        lineEvent.setReason("由用户反馈生成的事件，具体内容为："+customerFeedback.getFeedbackContent());
        lineEvent.setCompany(customerFeedback.getCompany());
        lineEvent.setCreateBy(customerFeedback.getCreateBy());
        lineEvent.setEffectTransformerNumber(lineEventMapper.getEffectTransformerByLineId(customerFeedback.getFeedbackEquip()));
        lineEvent.setEffectConsNumber(lineEventMapper.getEffectConsCountByLineId(customerFeedback.getFeedbackEquip()));
        //生成线路事件
        lineEventMapper.addLineEvent(lineEvent);

        //配变停运事件生成
        transformerEventMapper.addTransformerEventByLineEvent(lineEvent);

        //用户事件生成
        consEventMapper.addConsEventByLineEvent(lineEvent);

        //生成工单
        WorkOrder workOrder = new WorkOrder();
        workOrder.setId(UUIDUtil.getUUID());
        workOrder.setWorkOrderNo(generateWorkOrderNo());
        workOrder.setWorkOrderType(1);
        workOrder.setEventId(lineEvent.getMid());
        workOrder.setWorkOrderContent(customerFeedback.getGenerateWorkOrderContent());
        workOrder.setWorkOrderSource(2);
        workOrder.setWorkOrderStatus(1);
        workOrder.setEventType(1);
        workOrder.setCompany(customerFeedback.getCompany());
        workOrder.setCreateBy(customerFeedback.getCreateBy());
        workOrderMapper.addWorkOrder(workOrder);
    }

    //定制方法，生成工单编号
    private String generateWorkOrderNo() {
        // 获取当前日期
        Date currentDate = new Date();
        // 创建 SimpleDateFormat 对象，定义日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // 将日期转换为字符串
        String dateString = dateFormat.format(currentDate).replaceAll("-", "");
        // 创建一个Random对象
        Random random = new Random();
        // 生成随机整数，范围从0到99
        int randomNumber = random.nextInt(100);
        // 将整数转换为两位数的字符串
        String twoDigitNumber = String.format("%02d", randomNumber);
        String workOrderNo = dateString + twoDigitNumber;
        return workOrderNo;
    }
}
