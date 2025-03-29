package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.line.LineEventDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;

public interface LineEventService {
    //条件分页查询线路停运事件
    PageInfo<LineEvent> getLineEventByConditionAndPage(Integer current, Integer limit, LineEventDto lineEventDto);

    //保存线路停运事件
    void saveLineEvent(LineEvent lineEvent);

    //根据id删除线路停运事件
    void deleteLineEventById(String id);

    //根据事件id查询事件信息
    LineEvent getLineEventById(String id);
}
