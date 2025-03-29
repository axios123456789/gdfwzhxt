package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerEventDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;

public interface TransformerEventService {
    //条件分页查询配变停运事件列表
    PageInfo<TransformerEvent> getTransformerEventByConditionAndPage(Integer current, Integer limit, TransformerEventDto transformerEventDto);

    //保存配变停运事件
    void saveTransformerEvent(TransformerEvent transformerEvent);

    //删除配变事件根据id
    void deleteTransformerEventByDataId(String dataId);

    //根据配变事件id查看配变事件信息
    TransformerEvent getTransformerEventById(String id);
}
