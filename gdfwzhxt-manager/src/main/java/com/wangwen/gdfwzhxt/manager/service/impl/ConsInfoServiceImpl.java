package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsInfoMapper;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConsInfoServiceImpl implements ConsInfoService {
    @Autowired
    private ConsInfoMapper consInfoMapper;

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
}
