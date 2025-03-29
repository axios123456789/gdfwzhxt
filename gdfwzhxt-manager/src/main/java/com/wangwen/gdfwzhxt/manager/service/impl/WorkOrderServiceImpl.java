package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.*;
import com.wangwen.gdfwzhxt.manager.service.WorkOrderService;
import com.wangwen.gdfwzhxt.model.dto.workOrder.WorkOrderDto;
import com.wangwen.gdfwzhxt.model.entity.workOrder.PersonAccept;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkOrder;
import com.wangwen.gdfwzhxt.model.entity.workOrder.WorkSource;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {
    @Autowired
    private WorkOrderMapper workOrderMapper;

    @Autowired
    private PersonAcceptMapper personAcceptMapper;

    @Autowired
    private WorkSourceMapper workSourceMapper;

    @Autowired
    private LineEventMapper lineEventMapper;

    @Autowired
    private TransformerEventMapper transformerEventMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    /**
     * 条件分页查询工单列表
     * @param current
     * @param limit
     * @param workOrderDto
     * @return
     */
    @Override
    public PageInfo<WorkOrder> getWorkOrderByConditionAndPage(Integer current, Integer limit, WorkOrderDto workOrderDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有工单
        List<WorkOrder> list = workOrderMapper.getWorkOrderByCondition(workOrderDto);

        //封装
        PageInfo<WorkOrder> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存工单
     * @param workOrder
     */
    @Override
    @Transactional
    public void saveWorkOrder(WorkOrder workOrder) {
        if (workOrder.getId() == null || "".equals(workOrder.getId())){//添加
            workOrder.setId(UUIDUtil.getUUID());
            workOrder.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            workOrder.setCreateBy(AuthContextUtil.get().getName());
            if (workOrder.getEventType() == 1){
                workOrder.setWorkOrderNo(workOrder.getWorkOrderNo() + "01");
            }else if (workOrder.getEventType() == 2){
                workOrder.setWorkOrderNo(workOrder.getWorkOrderNo() + "02");
            }else if (workOrder.getEventType() == 3){
                workOrder.setWorkOrderNo(workOrder.getWorkOrderNo() + "03");
            }

            //添加工单
            workOrderMapper.addWorkOrder(workOrder);
        }else {//修改
            workOrder.setUpdateBy(AuthContextUtil.get().getName());
            //根据修改的工单状态来重置对应的值
            if (workOrder.getWorkOrderStatus() == 1){//未处理
                workOrder.setUrgeToProcessCount(null);
                workOrder.setLastUrgeToProcessTime(null);
                workOrder.setUrgeToAcceptCount(null);
                workOrder.setLastUrgeToAcceptTime(null);
                workOrder.setUrgeToHandleCount(null);
                workOrder.setLastUrgeToHandleTime(null);
                workOrder.setHandleTime(null);
                workOrder.setHandleBy(null);
                workOrder.setAcceptOrderTime(null);
                workOrder.setAcceptOrderBy(null);
                workOrder.setFinishTime(null);
                workOrder.setFinishBy(null);
                workOrder.setSourceNo(null);
            }else if (workOrder.getWorkOrderStatus() == 2){//待受理
                workOrder.setUrgeToAcceptCount(null);
                workOrder.setLastUrgeToAcceptTime(null);
                workOrder.setUrgeToHandleCount(null);
                workOrder.setLastUrgeToHandleTime(null);
                workOrder.setHandleTime(null);
                workOrder.setHandleBy(null);
                workOrder.setAcceptOrderTime(null);
                workOrder.setAcceptOrderBy(null);
                workOrder.setFinishTime(null);
                workOrder.setFinishBy(null);
                workOrder.setSourceNo(null);
            }else if (workOrder.getWorkOrderStatus() == 3){//已派单
                workOrder.setUrgeToHandleCount(null);
                workOrder.setLastUrgeToHandleTime(null);
                workOrder.setAcceptOrderTime(null);
                workOrder.setAcceptOrderBy(null);
                workOrder.setFinishTime(null);
                workOrder.setFinishBy(null);
                workOrder.setSourceNo(null);
            }else if (workOrder.getWorkOrderStatus() == 4){//已接单
                workOrder.setFinishTime(null);
                workOrder.setFinishBy(null);
                workOrder.setSourceNo(null);
            }else if (workOrder.getWorkOrderStatus() == 5){//已督办
                workOrder.setFinishTime(null);
                workOrder.setFinishBy(null);
                workOrder.setSourceNo(null);
            }

            //修改工单
            workOrderMapper.updateWorkOrder(workOrder);

            //根据工单编号删除个人工单材料提交表中的数据
            workSourceMapper.deleteByWorkOrderNo(workOrder.getWorkOrderNo());

            //根据工单编号删除个人接单表中对应的工单
            personAcceptMapper.deletePersonAcceptByWorkOrderNo(workOrder.getWorkOrderNo());
        }
    }

    /**
     * 根据id删除工单
     * @param id
     */
    @Override
    @Transactional
    public void deleteWorkOrderById(String id) {
        //根据id查询工单
        WorkOrder workOrder = workOrderMapper.getWorkOrderById(id);

        //根据工单编号删除个人工单材料提交表中的数据
        workSourceMapper.deleteByWorkOrderNo(workOrder.getWorkOrderNo());

        //根据工单编号删除个人接单表中对应的工单
        personAcceptMapper.deletePersonAcceptByWorkOrderNo(workOrder.getWorkOrderNo());

        //根据id删除工单
        workOrderMapper.deleteWorkOrderById(id);
    }

    /**
     * 推送工单按钮点击事件接口
     * @param workOrder
     */
    @Override
    public void pushWorkOrder(WorkOrder workOrder) {
        workOrder.setWorkOrderStatus(2);

        //推送工单
        workOrderMapper.pushWorkOrder(workOrder);
    }

    /**
     * 催处理按钮点击调用接口
     * @param workOrder
     */
    @Override
    public void urgeToProcess(WorkOrder workOrder) {
        Date currentTime = new Date();
        if (workOrder.getLastUrgeToProcessTime() == null){
            workOrder.setLastUrgeToProcessTime(currentTime);
        }else {
            if ((currentTime.getTime() - workOrder.getLastUrgeToProcessTime().getTime()) / (1000*60.0)  <= 5.0){
                throw new ElectricityException(ResultCodeEnum.URGE_FREQUENT);
            }else {
                workOrder.setLastUrgeToProcessTime(currentTime);
            }
        }
        if (workOrder.getUrgeToProcessCount() == null || workOrder.getUrgeToProcessCount() == 0){
            workOrder.setUrgeToProcessCount(1);
        }else {
            workOrder.setUrgeToProcessCount(workOrder.getUrgeToProcessCount() + 1);
        }
        //催处理
        workOrderMapper.urgeToProcess(workOrder);
    }

    /**
     * 点击受理按钮，受理工单
     * @param workOrder
     */
    @Override
    public void processWorkOrder(WorkOrder workOrder) {
        Date currentTime = new Date();
        workOrder.setWorkOrderStatus(3);
        workOrder.setHandleTime(currentTime);
        workOrder.setHandleBy(AuthContextUtil.get().getName());

        //受理
        workOrderMapper.processWorkOrder(workOrder);
    }

    /**
     * 点击催接单按钮调用接口
     * @param workOrder
     */
    @Override
    public void urgeToAccept(WorkOrder workOrder) {
        Date currentTime = new Date();
        if (workOrder.getLastUrgeToAcceptTime() == null){
            workOrder.setLastUrgeToAcceptTime(currentTime);
        }else {
            if ((currentTime.getTime() - workOrder.getLastUrgeToAcceptTime().getTime()) / (1000*60.0) <= 5){
                throw new ElectricityException(ResultCodeEnum.URGE_FREQUENT);
            }else {
                workOrder.setLastUrgeToAcceptTime(currentTime);
            }
        }
        if (workOrder.getUrgeToAcceptCount() == null || workOrder.getUrgeToAcceptCount() == 0){
            workOrder.setUrgeToAcceptCount(1);
        }else {
            workOrder.setUrgeToAcceptCount(workOrder.getUrgeToAcceptCount() + 1);
        }

        //催接单
        workOrderMapper.urgeToAccept(workOrder);
    }

    /**
     * 点击接单按钮，接受工单
     * @param workOrder
     */
    @Override
    @Transactional
    public void acceptWorkOrder(WorkOrder workOrder) {
        Date currentTime = new Date();
        workOrder.setWorkOrderStatus(4);
        workOrder.setAcceptOrderTime(currentTime);
        workOrder.setAcceptOrderBy(AuthContextUtil.get().getName());

        //接单
        workOrderMapper.acceptWorkOrder(workOrder);

        //将接受的工单插入个人接单表
        PersonAccept personAccept = new PersonAccept();
        personAccept.setId(UUIDUtil.getUUID());
        personAccept.setName(AuthContextUtil.get().getName());
        personAccept.setAcceptTime(currentTime);
        personAccept.setWorkOrderNo(workOrder.getWorkOrderNo());
        personAccept.setHandleStatus(1);
        personAccept.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        personAccept.setWorkOrderContent(workOrder.getWorkOrderContent());
        personAccept.setEventId(workOrder.getEventId());
        personAccept.setEventType(workOrder.getEventType());
        personAccept.setWorkOrderSource(workOrder.getWorkOrderSource());
        personAccept.setWorkOrderType(workOrder.getWorkOrderType());
        personAccept.setUrgeToHandleCount(workOrder.getUrgeToHandleCount());
        personAccept.setLastUrgeToHandleTime(workOrder.getLastUrgeToHandleTime());
        personAccept.setUserId(AuthContextUtil.get().getId());
        personAcceptMapper.insertPersonAccept(personAccept);
    }

    /**
     * 点击催办按钮，调用接口进行催办
     * @param workOrder
     */
    @Override
    @Transactional
    public void urgeToHandle(WorkOrder workOrder) {
        Date currentTime = new Date();
        if (workOrder.getLastUrgeToHandleTime() == null){
            workOrder.setLastUrgeToHandleTime(currentTime);
        }else {
            if ((currentTime.getTime() - workOrder.getLastUrgeToHandleTime().getTime()) / (1000*60.0) <= 5){
                throw new ElectricityException(ResultCodeEnum.URGE_FREQUENT);
            }else {
                workOrder.setLastUrgeToHandleTime(currentTime);
            }
        }
        if (workOrder.getUrgeToHandleCount() == null || workOrder.getUrgeToHandleCount() == 0){
            workOrder.setUrgeToHandleCount(1);
        }else {
            workOrder.setUrgeToHandleCount(workOrder.getUrgeToHandleCount() + 1);
        }

        //催办
        workOrderMapper.urgeToHandle(workOrder);

        //催办完后根据工单编号同步修改个人接单表的催办记录
        personAcceptMapper.updateUrgeToHandleRecode(workOrder);
    }

    /**
     * excel导出接口
     * @param
     * @param response
     */
    @Override
    public void download(WorkOrderDto workOrderDto, HttpServletResponse response) throws IOException {
        String file_path = "sjdcmb.xls";
        //以流的形式下载文件。
        //InputStream in = this.getClass().getResourceAsStream(file_path);
        //InputStream fis = new BufferedInputStream(in);
        //byte[] buffer = new byte[fis.available()];
        //fis.read(buffer);
        //fis.close();
        InputStream in = this.getClass().getResourceAsStream(file_path);
        Workbook workbook = new HSSFWorkbook(in);
        in.close();

        //创建工作簿样式
        CellStyle style = workbook.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER); // 水平居中
        style.setVerticalAlignment(VerticalAlignment.CENTER); // 垂直居中
        // 设置水平边框
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        // 设置边框颜色（可选）
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        // 设置垂直边框
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        // 设置垂直边框颜色
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());

        //设置表头
        String[] headers = {"工单编号", "工单类型", "工单审核材料号", "工单内容", "工单来源", "工单状态", "所属事件类型", "接单地址",
        "催受理次数", "上次催受理时间", "催接单次数", "上次催接单时间", "催办次数", "上次催办时间", "受理时间", "受理人", "接单时间",
        "接单人", "完成时间", "完成人", "工单创建时间", "工单创建者", "工单修改时间", "工单修改者"};
        Sheet sheet = workbook.getSheetAt(0);
        // 创建第一行（索引从0开始）
        Row headerRow = sheet.createRow(0);
        // 遍历表头数据，创建单元格并设置值
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(style);
        }

        //加载数据
        List<WorkOrder> list = workOrderMapper.getWorkOrderByCondition(workOrderDto);

        //设置数据
        //Sheet sheetAt = workbook.getSheetAt(0); //获取第一个sheet
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (int i = 0; i < list.size(); i++) {
            Row row = sheet.createRow(i + 1);
            for (int j = 0; j < headers.length; j++) {
                Cell cell = row.createCell(j);
                switch (j){
                    case 0:
                        cell.setCellValue(list.get(i).getWorkOrderNo());
                        break;
                    case 1:
                        cell.setCellValue(list.get(i).getWorkOrderTypeName());
                        break;
                    case 2:
                        cell.setCellValue(list.get(i).getSourceNo()==null?"":list.get(i).getSourceNo());
                        break;
                    case 3:
                        cell.setCellValue(list.get(i).getWorkOrderContent()==null?"":list.get(i).getWorkOrderContent());
                        break;
                    case 4:
                        cell.setCellValue(list.get(i).getWorkOrderSourceName());
                        break;
                    case 5:
                        cell.setCellValue(list.get(i).getWorkOrderStatusName());
                        break;
                    case 6:
                        cell.setCellValue(list.get(i).getEventTypeName());
                        break;
                    case 7:
                        cell.setCellValue(list.get(i).getAcceptAddress()==null?"":list.get(i).getAcceptAddress());
                        break;
                    case 8:
                        cell.setCellValue(list.get(i).getUrgeToProcessCount()==null?0:list.get(i).getUrgeToProcessCount());
                        break;
                    case 9:
                        cell.setCellValue(list.get(i).getLastUrgeToProcessTime()==null?"":formatter.format(list.get(i).getLastUrgeToProcessTime()));
                        break;
                    case 10:
                        cell.setCellValue(list.get(i).getUrgeToAcceptCount()==null?0:list.get(i).getUrgeToAcceptCount());
                        break;
                    case 11:
                        cell.setCellValue(list.get(i).getLastUrgeToAcceptTime()==null?"":formatter.format(list.get(i).getLastUrgeToAcceptTime()));
                        break;
                    case 12:
                        cell.setCellValue(list.get(i).getUrgeToHandleCount()==null?0:list.get(i).getUrgeToHandleCount());
                        break;
                    case 13:
                        cell.setCellValue(list.get(i).getLastUrgeToHandleTime()==null?"":formatter.format(list.get(i).getLastUrgeToHandleTime()));
                        break;
                    case 14:
                        cell.setCellValue(list.get(i).getHandleTime()==null?"":formatter.format(list.get(i).getHandleTime()));
                        break;
                    case 15:
                        cell.setCellValue(list.get(i).getHandleBy()==null?"":list.get(i).getHandleBy());
                        break;
                    case 16:
                        cell.setCellValue(list.get(i).getAcceptOrderTime()==null?"":formatter.format(list.get(i).getAcceptOrderTime()));
                        break;
                    case 17:
                        cell.setCellValue(list.get(i).getAcceptOrderBy()==null?"":list.get(i).getAcceptOrderBy());
                        break;
                    case 18:
                        cell.setCellValue(list.get(i).getFinishTime()==null?"":formatter.format(list.get(i).getFinishTime()));
                        break;
                    case 19:
                        cell.setCellValue(list.get(i).getFinishBy()==null?"":list.get(i).getFinishBy());
                        break;
                    case 20:
                        cell.setCellValue(formatter.format(list.get(i).getCreateTime()));
                        break;
                    case 21:
                        cell.setCellValue(list.get(i).getCreateBy());
                        break;
                    case 22:
                        cell.setCellValue(list.get(i).getUpdateTime()==null?"":formatter.format(list.get(i).getUpdateTime()));
                        break;
                    case 23:
                        cell.setCellValue(list.get(i).getUpdateBy()==null?"":list.get(i).getUpdateBy());
                        break;
                }
                cell.setCellStyle(style);
            }
        }

        //将excel处理成buffer进行输出
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        workbook.close();
        byte[] buffer = bos.toByteArray();

        //-----下载excel
        //清空response
        String filename = "工单列表数据.xls";
        response.reset();
        //设置response的Header
        response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("UTF-8"),"ISO8859-1"));
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");//处理post请求时跨域问题
        OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
        toClient.write(buffer);
        toClient.flush();
        toClient.close();
    }

    /**
     * 条件分页查询个人接单列表
     * @param current
     * @param limit
     * @param handleStatus
     * @return
     */
    @Override
    public PageInfo<PersonAccept> getPersonAcceptByConditionAndPage(Integer current, Integer limit, Integer handleStatus) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有
        List<PersonAccept> list = personAcceptMapper.getPersonAcceptByCondition(handleStatus, AuthContextUtil.get().getId());

        //封装
        PageInfo<PersonAccept> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 根据工单编号查询工单信息列表
     * @param workOrderNo
     * @return
     */
    @Override
    public WorkOrder getWorkOrderByWorkOrderNo(String workOrderNo) {
        WorkOrder workOrder = workOrderMapper.getworkOrderByWorkOrderNo(workOrderNo);
        return workOrder;
    }

    /**
     * 个人工单管理-开始受理工单
     * @param id
     */
    @Override
    public void beginHandleWorkOrder(String id) {
        personAcceptMapper.beginHandleWorkOrder(id);
    }

    /**
     * 个人工单管理-完成工单处理
     * @param workSource
     */
    @Override
    @Transactional
    public void achieveWorkOrderHandle(WorkSource workSource) {
        //数据处理
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str1 = formatter.format(currentTime).replaceAll("-", "");
        String str2 = str1.replace(" ", "");
        String sourceNo = str2.replaceAll(":", "");
        workSource.setSourceNo(sourceNo);

        //修改个人工单的状态
        personAcceptMapper.achieveWorkOrderHandle(workSource.getAcceptId());

        //在提交工单材料表中添加数据
        workSourceMapper.addWorkSource(workSource);
    }

    /**
     * 根据个人接单id查询个人提交材料信息
     * @param acceptId
     * @return
     */
    @Override
    public WorkSource getWorkSourceByAcceptId(String acceptId) {
        WorkSource workSource = workSourceMapper.getWorkSourceByAcceptId(acceptId);
        return workSource;
    }

    /**
     * 修改提交工单材料信息
     * @param workSource
     */
    @Override
    public void updateWorkSource(WorkSource workSource) {
        workSourceMapper.updateWorkSource(workSource);
    }

    /**
     * 提交工单材料审核接口
     * @param workSource
     */
    @Override
    @Transactional
    public void submitWorkSource(WorkSource workSource) {
        //保存工单材料
        workSourceMapper.updateWorkSource(workSource);

        //修改个人工单表的流程状态
        personAcceptMapper.handleAchievee(workSource.getAcceptId());

        //修改工单表的工单状态(已督办)
        workOrderMapper.handleAchieve(workSource.getAcceptId());
    }

    /**
     * 根据工单编号查询个人接单信息
     * @param workOrderNo
     * @return
     */
    @Override
    public PersonAccept getPersonAcceptByWorkOrderNo(String workOrderNo) {
        PersonAccept personAccept = personAcceptMapper.getPersonAcceptByWorkOrderNo(workOrderNo);
        return personAccept;
    }

    /**
     * 工单材料驳回接口
     * @param workSource
     */
    @Override
    @Transactional
    public void refuseWorkOrder(WorkSource workSource) {
        //1.将工单状态回滚到已接单4
        workOrderMapper.returnWorkOrderStatus(workSource.getAcceptId());

        //2.将个人接单状态进入到被驳回5
        personAcceptMapper.updateStatusToRefuse(workSource.getAcceptId());

        //3.同步驳回原因，驳回人到材料表中
        workSource.setRefuseBy(AuthContextUtil.get().getName());
        workSource.setAcceptFlag(2);
        workSourceMapper.updateWorkSourceToRefuse(workSource);
    }

    /**
     * 工单材料通过审核接口
     * @param personAccept
     */
    @Override
    @Transactional
    public void reviewSuccess(PersonAccept personAccept) {
        //1.修改工单状态为已完成6且设置材料编号和完成时间完成人
        workOrderMapper.reviewSuccess(personAccept);

        //2.修改个人工单状态为已完成6
        personAcceptMapper.reviewSuccess(personAccept.getId());

        //3.修改材料信息中的标识为已通过
        workSourceMapper.updateFlagToSuccess(personAccept.getId());

        //4.根据事件类型和事件id对对应的事件进行复电（将转特改为已复电2  将复电时间设置为督办开始时间 时长自己计算）
        //拿到事件id
        String eventId = personAccept.getEventId();
        //拿到督办开始时间作为复电时间
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String supplyTime = formatter.format(personAccept.getSuperviseBeginTime());
        if (personAccept.getEventType() == 1){//线路
            //设置线路
            lineEventMapper.updateLineEventByMid(eventId, supplyTime);

            //设置下来下的配变事件
            transformerEventMapper.updateTransformerEventByMid(eventId, supplyTime);

            //设置线路下的用户事件
            consEventMapper.updateConsEventByMid(eventId, supplyTime);
        }else if (personAccept.getEventType() == 2){//配变
            //设置配变
            transformerEventMapper.updateTransformerEventByDataId(eventId, supplyTime);

            //设置配变下的用户事件
            consEventMapper.updateConsEventByDataId(eventId, supplyTime);
        }else if (personAccept.getEventType() == 3){//用户
            //设置用户事件
            consEventMapper.updateConsEventByWorkOrderAchieve(eventId, supplyTime);
        }
    }

    /**
     * 根据材料编号查询个人工单材料提交信息和个人接单信息
     * @param workSourceNo
     * @return
     */
    @Override
    public Map<String, Object> getPersonAcceptAndWorkSourceByWorkSourceNo(String workSourceNo) {
        Map<String, Object> map = new HashMap<>();
        //根据材料编号查询材料信息
        WorkSource workSource = workSourceMapper.getWorkSourceByWorkSourceNo(workSourceNo);
        //根据个人id查询个人接单信息
        PersonAccept personAccept = personAcceptMapper.getPersonAcceptById(workSource.getAcceptId());
        map.put("personAccept", personAccept);
        map.put("workSource", workSource);
        return map;
    }
}
