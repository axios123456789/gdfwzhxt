package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsEventMapper;
import com.wangwen.gdfwzhxt.manager.mapper.LineEventMapper;
import com.wangwen.gdfwzhxt.manager.mapper.TransformerEventMapper;
import com.wangwen.gdfwzhxt.manager.service.LineEventService;
import com.wangwen.gdfwzhxt.model.dto.line.LineEventDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LineEventServiceImpl implements LineEventService {
    @Autowired
    private LineEventMapper lineEventMapper;

    @Autowired
    private TransformerEventMapper transformerEventMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    /**
     * 条件分页查询线路停运事件
     * @param current
     * @param limit
     * @param lineEventDto
     * @return
     */
    @Override
    public PageInfo<LineEvent> getLineEventByConditionAndPage(Integer current, Integer limit, LineEventDto lineEventDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有线路事件
        List<LineEvent> list = lineEventMapper.getLineEventByCondition(lineEventDto);

        //封装
        PageInfo<LineEvent> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存线路停运事件
     * @param lineEvent
     */
    @Transactional
    @Override
    public void saveLineEvent(LineEvent lineEvent) {
        //根据是否有id判断保存还是修改
        if (lineEvent.getMid() == null || "".equals(lineEvent.getMid())){//添加
            //设置基本参数
            lineEvent.setMid(UUIDUtil.getUUID());
            lineEvent.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            lineEvent.setCreateBy(AuthContextUtil.get().getName());
            lineEvent.setIsGenerateWorkOrder(0);

            //根据lineId查询影响配变数并设置影响配变数
            int effectTransformerCount = lineEventMapper.getEffectTransformerByLineId(lineEvent.getLineId());
            lineEvent.setEffectTransformerNumber(effectTransformerCount);

            //根据lineId查询影响用户数并设置影响用户数
            int effectConsCount = lineEventMapper.getEffectConsCountByLineId(lineEvent.getLineId());
            lineEvent.setEffectConsNumber(effectConsCount);

            //添加线路停运事件
            lineEventMapper.addLineEvent(lineEvent);

            //根据线路事件添加配变停运事件
            transformerEventMapper.addTransformerEventByLineEvent(lineEvent);

            //根据线路事件添加用户停运事件
            consEventMapper.addConsEventByLineEvent(lineEvent);
        }else {//修改
            //设置参数
            lineEvent.setUpdateBy(AuthContextUtil.get().getName());

            //计算停运时长
            if (lineEvent.getPowerSupplyTime() != null){
                lineEvent.setPowerOutageDuration((lineEvent.getPowerSupplyTime().getTime() - lineEvent.getPowerOutageTime().getTime()) / (1000.0 * 60 * 60));
            }

            //修改线路停运事件
            lineEventMapper.updateLineEvent(lineEvent);

            //同步修改线路下配变停运事件
            transformerEventMapper.updateTransformerEventByLineEvent(lineEvent);

            //同步修改线路下配变下用户停运事件
            consEventMapper.updateConsEventByLineEvent(lineEvent);
        }
    }

    /**
     * 根据id删除线路停运事件
     * @param id
     */
    @Override
    @Transactional
    public void deleteLineEventById(String id) {
        //根据Mid删除线路停运事件
        lineEventMapper.deleteLineEventByMid(id);

        //根据Mid删除配变停运事件
        transformerEventMapper.deleteTransformerEventByMid(id);

        //根据线路id删除用户停运事件
        consEventMapper.deleteConsEventByLineId(id);
    }

    /**
     * 根据事件id查询事件信息
     * @param id
     * @return
     */
    @Override
    public LineEvent getLineEventById(String id) {
        LineEvent lineEvent = lineEventMapper.getLineEventById(id);
        return lineEvent;
    }
}
