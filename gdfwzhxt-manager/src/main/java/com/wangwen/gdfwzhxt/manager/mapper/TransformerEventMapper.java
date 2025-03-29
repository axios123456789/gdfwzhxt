package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerEventDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TransformerEventMapper {
    //条件查询配变停运事件
    List<TransformerEvent> getTransformerEventByCondition(TransformerEventDto transformerEventDto);

    //添加配变事件
    void addTransformerEvent(TransformerEvent transformerEvent);

    //修改配变事件
    void updateTransformerEvent(TransformerEvent transformerEvent);

    //更具配变事件id删除事件
    @Delete("delete from t_transformer_event where data_id = #{param1}")
    void deleteTransformerEventByDataId(String dataId);

    //根据变压器局号查询用户数
    int getConsNumberByTransformerCode(String transformerCode);

    //根据线路事件添加配变停运事件
    void addTransformerEventByLineEvent(LineEvent lineEvent);

    //同步修改线路下配变停运事件
    void updateTransformerEventByLineEvent(LineEvent lineEvent);

    //根据Mid删除配变停运事件
    @Delete("delete from t_transformer_event where line_event_id = #{param1}")
    void deleteTransformerEventByMid(String id);

    //根据配变事件id查看配变事件信息
    TransformerEvent getTransformerEventById(String id);

    //根据配变事件id修改配变事件（工单已完成）
    void updateTransformerEventByDataId(String eventId, String supplyTime);

    //根据线路事件id修改配变事件（工单完成）
    void updateTransformerEventByMid(String eventId, String supplyTime);
}
