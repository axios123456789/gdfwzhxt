package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsEventDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsEvent;

public interface ConsEventService {
    //条件分页查询用户停电事件列表
    PageInfo<ConsEvent> getConsEventByConditionAndPage(Integer current, Integer limit, ConsEventDto consEventDto);

    //保存用户停电事件
    void saveConsEvent(ConsEvent consEvent);

    //根据eventId删除用户停电事件
    void deleteConsEventByEventId(String eventId);

    //根据用户停电事件id查询用户停电信息
    ConsEvent getConsEventById(String id);
}
