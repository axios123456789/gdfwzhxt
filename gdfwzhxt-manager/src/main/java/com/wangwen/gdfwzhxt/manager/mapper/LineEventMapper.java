package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.line.LineEventDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LineEventMapper {
    //条件查询所有线路事件
    List<LineEvent> getLineEventByCondition(LineEventDto lineEventDto);

    //根据lineId查询影响配变数
    int getEffectTransformerByLineId(String lineId);

    //根据lineId查询影响用户数并设置影响用户数
    int getEffectConsCountByLineId(String lineId);

    //添加线路停运事件
    void addLineEvent(LineEvent lineEvent);

    //修改线路停运事件
    void updateLineEvent(LineEvent lineEvent);

    //根据Mid删除线路停运事件
    @Delete("delete from t_line_event where Mid = #{param1}")
    void deleteLineEventByMid(String id);

    //根据事件id查询事件信息
    LineEvent getLineEventById(String id);

    //通过mid修改线路停运事件(已完成工单)
    void updateLineEventByMid(String eventId, String supplyTime);
}
