package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsEventMapper;
import com.wangwen.gdfwzhxt.manager.service.ConsEventService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsEventDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
public class ConsEventServiceImpl implements ConsEventService {
    @Autowired
    private ConsEventMapper consEventMapper;

    /**
     * 条件分页查询用户停电事件列表
     * @param current
     * @param limit
     * @param consEventDto
     * @return
     */
    @Override
    public PageInfo<ConsEvent> getConsEventByConditionAndPage(Integer current, Integer limit, ConsEventDto consEventDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有用户停电事件列表
        List<ConsEvent> list = consEventMapper.getConsEventByCondition(consEventDto);

        PageInfo<ConsEvent> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存用户停电事件
     * @param consEvent
     */
    @Override
    public void saveConsEvent(ConsEvent consEvent) {
        //根据是否有事件id来判断是添加还是修改
        if (consEvent.getEventId() == null || "".equals(consEvent.getEventId())){//添加
            consEvent.setEventId(UUIDUtil.getUUID());
            consEvent.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            consEvent.setCreateBy(AuthContextUtil.get().getName());
            consEvent.setIsGenerateWorkOrder(0);

            //添加用户停电事件
            consEventMapper.addConsEvent(consEvent);
        }else {//修改
            if (consEvent.getPowerSupplyTime() != null){
                consEvent.setPowerOutageDuration((consEvent.getPowerSupplyTime().getTime() - consEvent.getPowerOutageTime().getTime()) / (1000.0 * 60 * 60));
            }
            consEvent.setUpdateBy(AuthContextUtil.get().getName());

            //修改用户停电事件
            consEventMapper.updateConsEvent(consEvent);
        }
    }

    /**
     * 根据eventId删除用户停电事件
     * @param eventId
     */
    @Override
    public void deleteConsEventByEventId(String eventId) {
        consEventMapper.deleteConsEventByEventId(eventId);
    }

    /**
     * 根据用户停电事件id查询用户停电信息
     * @param id
     * @return
     */
    @Override
    public ConsEvent getConsEventById(String id) {
        ConsEvent consEvent = consEventMapper.getConsEventById(id);
        return consEvent;
    }
}
