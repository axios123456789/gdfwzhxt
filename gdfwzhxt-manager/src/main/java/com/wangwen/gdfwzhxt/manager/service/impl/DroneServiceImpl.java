package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.*;
import com.wangwen.gdfwzhxt.manager.service.DroneService;
import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.dto.workOrder.ViewRecordDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;
import com.wangwen.gdfwzhxt.model.entity.drone.ViewRecord;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class DroneServiceImpl implements DroneService {
    @Autowired
    private DroneMapper droneMapper;

    @Autowired
    private ViewRecordMapper viewRecordMapper;

    @Autowired
    private LineEventMapper lineEventMapper;

    @Autowired
    private TransformerEventMapper transformerEventMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    @Autowired
    private WorkOrderMapper workOrderMapper;

    /**
     * 条件分页查询无人机信息列表
     * @param current
     * @param limit
     * @param droneInfoDto
     * @return
     */
    @Override
    public PageInfo<DroneInfo> getDroneInfoListByConditionAndPage(Integer current, Integer limit, DroneInfoDto droneInfoDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有数据
        List<DroneInfo> list = droneMapper.getDroneInfoListByCondition(droneInfoDto);

        //封装list为pageInfo<DroneInfo>新式数据
        PageInfo<DroneInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存无人机信息
     * @param droneInfo
     */
    @Override
    public void saveDroneInfo(DroneInfo droneInfo) {
        //根据id是否为空判断添加还是修改
        if (droneInfo.getId() == null || "".equals(droneInfo.getId())){//添加
            droneInfo.setId(UUIDUtil.getUUID());
            droneInfo.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            droneInfo.setCreateBy(AuthContextUtil.get().getName());

            //添加
            droneMapper.addDroneInfo(droneInfo);
        }else {//修改
            droneInfo.setUpdateBy(AuthContextUtil.get().getName());

            //修改
            droneMapper.updateDroneInfo(droneInfo);
        }
    }

    /**
     * 根据id删除无人机信息
     * @param id
     */
    @Override
    public void deleteDroneInfoById(String id) {
        droneMapper.deleteDroneInfoById(id);
    }

    /**
     * 条件分页查询无人机巡视记录
     * @param current
     * @param limit
     * @param viewRecordDto
     * @return
     */
    @Override
    public PageInfo<ViewRecord> getViewRecordByConditionAndPage(Integer current, Integer limit, ViewRecordDto viewRecordDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有无人机巡视记录数据
        List<ViewRecord> list = viewRecordMapper.getViewRecordByCondition(viewRecordDto);

        //封装
        PageInfo<ViewRecord> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存巡视记录
     * @param viewRecord
     */
    @Override
    public void saveViewRecord(ViewRecord viewRecord) {
        if (viewRecord.getId() == null || "".equals(viewRecord.getId())){//添加
            viewRecord.setId(UUIDUtil.getUUID());
            viewRecord.setViewBy(AuthContextUtil.get().getName());
            viewRecord.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());

            //添加巡视记录
            viewRecordMapper.addViewRecord(viewRecord);
        }else {//修改
            viewRecord.setUpdateBy(AuthContextUtil.get().getName());

            //修改巡视记录
            viewRecordMapper.updateViewRecord(viewRecord);
        }
    }

    /**
     * 根据id删除巡视记录
     * @param id
     */
    @Override
    public void deleteViewRecord(String id) {
        viewRecordMapper.deleteViewRecord(id);
    }

    /**
     * 核心业务-巡视记录扭转
     * @param viewRecord
     * @param changeFlag
     */
    @Override
    @Transactional
    public void viewRecordChange(ViewRecord viewRecord, Integer changeFlag) {
        if (changeFlag == 1){//仅生成事件
            if (viewRecord.getEquipType() == 1){//生成线路，配变，用户事件
                generateLineAndLowerLevelEvent(viewRecord, false);
            }else if (viewRecord.getEquipType() == 2){//生成配变，用户事件
                generateTransformerAndLowerLevelEvent(viewRecord, false);
            }

            //修改巡视记录状态改为已生成事件2
            viewRecordMapper.updateViewRecordStatus1(viewRecord.getId());
        }else if (changeFlag == 2){//仅生成工单
            generateWorkOrder(viewRecord);

            //修改巡视记录状态改为已生成工单3
            viewRecordMapper.updateViewRecordStatus2(viewRecord.getId());
        }else if (changeFlag == 3){//生成事件和工单
            if (viewRecord.getEquipType() == 1){//生成线路事件和工单
                generateLineAndLowerLevelEvent(viewRecord, true);
            }else if (viewRecord.getEquipType() == 2){//生成配变事件和工单
                generateTransformerAndLowerLevelEvent(viewRecord, true);
            }

            //修改巡视记录状态改为已生成工单和事件4
            viewRecordMapper.updateViewRecordStatus3(viewRecord.getId());
        }
    }

    //仅生成工单（无事件）
    private void generateWorkOrder(ViewRecord viewRecord) {
        //创建工单对象
        WorkOrder workOrder = new WorkOrder();
        workOrder.setId(UUIDUtil.getUUID());
        String workOrderNo = generateWorkOrderNo();
        workOrder.setWorkOrderNo(workOrderNo);
        workOrder.setWorkOrderType(3);
        workOrder.setWorkOrderContent("非抢工单没有发生停电事件，但是出现了相关问题，问题描述："+viewRecord.getDescription());
        workOrder.setWorkOrderSource(1);
        workOrder.setWorkOrderStatus(1);
        workOrder.setAcceptAddress(viewRecord.getEquipAddress());
        if (viewRecord.getEquipType() == 1){
            workOrder.setEventType(1);
        }else if (viewRecord.getEquipType() == 2){
            workOrder.setEventType(2);
        }
        workOrder.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        workOrder.setCreateBy(AuthContextUtil.get().getName());

        //生成工单
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


    //生成配变及其下级事件(工单可生成)
    private void generateTransformerAndLowerLevelEvent(ViewRecord viewRecord, boolean isGenerateWorkOrder) {
        //创建配变停运事件对象
        TransformerEvent transformerEvent = new TransformerEvent();
        transformerEvent.setDataId(UUIDUtil.getUUID());
        transformerEvent.setTransformerCode(viewRecord.getEquipNo());
        transformerEvent.setTransformerName(viewRecord.getEquipName());
        transformerEvent.setTerminalOutageTime(viewRecord.getViewTime());
        transformerEvent.setPowerOutageType(viewRecord.getEquipFaultType());
        transformerEvent.setStatus(1);
        transformerEvent.setReason("配变层级的问题导致停运，具体巡视原因描述为："+viewRecord.getDescription());
        transformerEvent.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        transformerEvent.setCreateBy(AuthContextUtil.get().getName());
        int consNumberByTransformerCode = transformerEventMapper.getConsNumberByTransformerCode(viewRecord.getEquipNo());
        transformerEvent.setEffectConsNumber(consNumberByTransformerCode);
        //生成配变停运事件
        transformerEventMapper.addTransformerEvent(transformerEvent);

        //生成用户停运事件
        consEventMapper.addConsEventByTransformer(transformerEvent);

        if (isGenerateWorkOrder){//生成事件工单
            //创建工单对象
            WorkOrder workOrder = new WorkOrder();
            workOrder.setId(UUIDUtil.getUUID());
            String workOrderNo = generateWorkOrderNo();
            workOrder.setWorkOrderNo(workOrderNo);
            if (viewRecord.getEquipFaultType() == 1 || viewRecord.getEquipFaultType() == 5){
                workOrder.setWorkOrderType(1);
                workOrder.setWorkOrderContent("故障报修工单发生停电事件，出现了相关问题，问题描述："+viewRecord.getDescription());
            }else {
                workOrder.setWorkOrderType(2);
                workOrder.setWorkOrderContent("主动抢修工单发生停电事件，出现了相关问题，问题描述："+viewRecord.getDescription());
            }
            workOrder.setWorkOrderSource(1);
            workOrder.setWorkOrderStatus(1);
            workOrder.setAcceptAddress(viewRecord.getEquipAddress());
            if (viewRecord.getEquipType() == 1){
                workOrder.setEventType(1);
            }else if (viewRecord.getEquipType() == 2){
                workOrder.setEventType(2);
            }
            workOrder.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            workOrder.setCreateBy(AuthContextUtil.get().getName());
            workOrder.setEventId(transformerEvent.getDataId());
            //生成工单
            workOrderMapper.addWorkOrder(workOrder);
        }
    }

    //生成线路及其下级的事件（工单可生成）
    private void generateLineAndLowerLevelEvent(ViewRecord viewRecord, boolean isGenerateWorkOrder) {
        //创建线路事件对象
        LineEvent lineEvent = new LineEvent();
        lineEvent.setMid(UUIDUtil.getUUID());
        lineEvent.setLineId(viewRecord.getEquipNo());
        lineEvent.setLineName(viewRecord.getEquipName());
        lineEvent.setPowerOutageTime(viewRecord.getViewTime());
        lineEvent.setPowerOutageType(viewRecord.getEquipFaultType());
        lineEvent.setStatus(1);
        lineEvent.setReason("线路层级的问题导致停运，具体巡视原因描述为："+viewRecord.getDescription());
        lineEvent.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        lineEvent.setCreateBy(AuthContextUtil.get().getName());
        int effectTransformerByLineId = lineEventMapper.getEffectTransformerByLineId(viewRecord.getEquipNo());
        lineEvent.setEffectTransformerNumber(effectTransformerByLineId);
        int effectConsCountByLineId = lineEventMapper.getEffectConsCountByLineId(viewRecord.getEquipNo());
        lineEvent.setEffectConsNumber(effectConsCountByLineId);
        //生成线路停电事件
        lineEventMapper.addLineEvent(lineEvent);

        //配变停运事件生成
        transformerEventMapper.addTransformerEventByLineEvent(lineEvent);

        //用户事件生成
        consEventMapper.addConsEventByLineEvent(lineEvent);

        if (isGenerateWorkOrder){//生成事件工单
            //创建工单对象
            WorkOrder workOrder = new WorkOrder();
            workOrder.setId(UUIDUtil.getUUID());
            String workOrderNo = generateWorkOrderNo();
            workOrder.setWorkOrderNo(workOrderNo);
            if (viewRecord.getEquipFaultType() == 1){
                workOrder.setWorkOrderType(3);
                workOrder.setWorkOrderContent("非抢工单发生停电事件，出现了相关问题，问题描述："+viewRecord.getDescription());
            }else {
                workOrder.setWorkOrderType(1);
                workOrder.setWorkOrderContent("故障报修工单发生停电事件，出现了相关问题，问题描述："+viewRecord.getDescription());
            }
            workOrder.setWorkOrderSource(1);
            workOrder.setWorkOrderStatus(1);
            workOrder.setAcceptAddress(viewRecord.getEquipAddress());
            if (viewRecord.getEquipType() == 1){
                workOrder.setEventType(1);
            }else if (viewRecord.getEquipType() == 2){
                workOrder.setEventType(2);
            }
            workOrder.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            workOrder.setCreateBy(AuthContextUtil.get().getName());
            workOrder.setEventId(lineEvent.getMid());
            //生成工单
            workOrderMapper.addWorkOrder(workOrder);
        }
    }
}
