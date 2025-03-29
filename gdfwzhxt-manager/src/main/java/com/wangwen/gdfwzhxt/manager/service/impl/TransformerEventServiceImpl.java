package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsEventMapper;
import com.wangwen.gdfwzhxt.manager.mapper.TransformerEventMapper;
import com.wangwen.gdfwzhxt.manager.service.TransformerEventService;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerEventDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TransformerEventServiceImpl implements TransformerEventService {
    @Autowired
    private TransformerEventMapper transformerEventMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    /**
     * 条件分页查询配变停运事件列表
     * @param current
     * @param limit
     * @param transformerEventDto
     * @return
     */
    @Override
    public PageInfo<TransformerEvent> getTransformerEventByConditionAndPage(Integer current, Integer limit, TransformerEventDto transformerEventDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有配变停运事件列表
        List<TransformerEvent> list = transformerEventMapper.getTransformerEventByCondition(transformerEventDto);

        //封装成pageInfo类型
        PageInfo<TransformerEvent> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存配变停运事件
     * @param transformerEvent
     */
    @Transactional
    @Override
    public void saveTransformerEvent(TransformerEvent transformerEvent) {
        //更具是否有id判断是添加还是修改
        if (transformerEvent.getDataId() == null || "".equals(transformerEvent.getDataId())){//添加
            //设置添加的参数
            transformerEvent.setDataId(UUIDUtil.getUUID());
            transformerEvent.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            transformerEvent.setCreateBy(AuthContextUtil.get().getName());
            transformerEvent.setIsGenerateWorkOrder(0);

            //计算影响用户数
            //根据变压器局号查询用户数
            int effectConsNum = transformerEventMapper.getConsNumberByTransformerCode(transformerEvent.getTransformerCode());
            transformerEvent.setEffectConsNumber(effectConsNum);

            //添加配变事件
            transformerEventMapper.addTransformerEvent(transformerEvent);

            //同步添加配变下的用户停电事件(根据变压器局号)
            consEventMapper.addConsEventByTransformer(transformerEvent);
        }else {//修改
            //设置参数
            transformerEvent.setUpdateBy(AuthContextUtil.get().getName());

            if (transformerEvent.getTerminalSupplyTime() != null){
                transformerEvent.setOutageDuration((transformerEvent.getTerminalSupplyTime().getTime() - transformerEvent.getTerminalOutageTime().getTime()) / (1000.0 * 60 * 60));
            }

            //修改配变事件
            transformerEventMapper.updateTransformerEvent(transformerEvent);

            //同步修改配变事件下的用户事件
            consEventMapper.updateConsEventByTransformerEvent(transformerEvent);
        }
    }

    /**
     * 删除配变事件根据id
     * @param dataId
     */
    @Override
    @Transactional
    public void deleteTransformerEventByDataId(String dataId) {
        //根具配变事件id删除事件
        transformerEventMapper.deleteTransformerEventByDataId(dataId);

        //根具配变事件id删除用户事件
        consEventMapper.deleteConsEventByTransformerEventId(dataId);
    }

    /**
     * 根据配变事件id查看配变事件信息
     * @param id
     * @return
     */
    @Override
    public TransformerEvent getTransformerEventById(String id) {
        TransformerEvent transformerEvent = transformerEventMapper.getTransformerEventById(id);
        return transformerEvent;
    }
}
