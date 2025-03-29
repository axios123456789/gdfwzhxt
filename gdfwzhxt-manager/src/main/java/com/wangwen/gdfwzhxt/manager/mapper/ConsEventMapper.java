package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.cons.ConsEventDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsEvent;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ConsEventMapper {
    //条件查询所有用户停电事件列表
    List<ConsEvent> getConsEventByCondition(ConsEventDto consEventDto);

    //添加用户停电事件
    void addConsEvent(ConsEvent consEvent);

    //修改用户停电事件
    void updateConsEvent(ConsEvent consEvent);

    //根据eventId删除用户停电事件
    @Delete("delete from t_cons_event where event_id = #{param1}")
    void deleteConsEventByEventId(String eventId);

    //根据变压器事件添加用户停电事件
    void addConsEventByTransformer(TransformerEvent transformerEvent);

    //根具配变事件id删除用户事件
    @Delete("delete from t_cons_event where transformer_event_id = #{param1}")
    void deleteConsEventByTransformerEventId(String dataId);

    //根据配变事件修改用户停电事件
    void updateConsEventByTransformerEvent(TransformerEvent transformerEvent);

    //根据线路事件添加用户停运事件
    void addConsEventByLineEvent(LineEvent lineEvent);

    //同步修改线路下配变下用户停运事件
    void updateConsEventByLineEvent(LineEvent lineEvent);

    //根据线路id删除用户停运事件
    @Delete("delete from t_cons_event where line_event_id = #{param1}")
    void deleteConsEventByLineId(String id);

    //根据用户停电事件id查询用户停电信息
    ConsEvent getConsEventById(String id);

    //由于工单完成设置用户事件
    void updateConsEventByWorkOrderAchieve(String eventId, String supplyTime);

    // 根据配变事件id修改用户停运事件(工单完成)
    void updateConsEventByDataId(String eventId, String supplyTime);

    //通过线路事件id修改用户事件（工单完成）
    void updateConsEventByMid(String eventId, String supplyTime);
}
