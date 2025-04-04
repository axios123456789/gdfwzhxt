package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsInfoMapper;
import com.wangwen.gdfwzhxt.manager.mapper.ElectricityUsageMapper;
import com.wangwen.gdfwzhxt.manager.mapper.RechargeRecordMapper;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.ElectricityUsedDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedGroupByDayVo;
import com.wangwen.gdfwzhxt.model.vo.cons.ElectricityUsedVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ConsInfoServiceImpl implements ConsInfoService {
    @Autowired
    private ConsInfoMapper consInfoMapper;

    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;

    @Autowired
    private ElectricityUsageMapper electricityUsageMapper;

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
        //1.修改用户电费
        consInfoMapper.updateRecharge(rechargeRecord);

        //设置数据
        rechargeRecord.setId(UUIDUtil.getUUID());
        rechargeRecord.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        rechargeRecord.setOperator(AuthContextUtil.get().getName());

        //2.形成电费充值记录
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
}
