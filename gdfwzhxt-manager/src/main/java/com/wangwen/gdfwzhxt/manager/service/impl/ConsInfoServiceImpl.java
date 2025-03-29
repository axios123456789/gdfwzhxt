package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsInfoMapper;
import com.wangwen.gdfwzhxt.manager.mapper.RechargeRecordMapper;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ConsInfoServiceImpl implements ConsInfoService {
    @Autowired
    private ConsInfoMapper consInfoMapper;

    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;

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
}
