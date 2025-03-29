package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.ConsEventService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsEventDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsEvent;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/electricity/consEvent")
public class ConsEventController {
    @Autowired
    private ConsEventService consEventService;

    /**
     * 条件分页查询用户停电事件列表
     * @param current
     * @param limit
     * @param consEventDto
     * @return
     */
    @RequestMapping("/getConsEventByConditionAndPage/{current}/{limit}")
    public Result getConsEventByConditionAndPage(@PathVariable("current") Integer current,
                                                 @PathVariable("limit") Integer limit,
                                                 @RequestBody ConsEventDto consEventDto){
        PageInfo<ConsEvent> pageInfo = consEventService.getConsEventByConditionAndPage(current, limit, consEventDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存用户停电事件
     * @param consEvent
     * @return
     */
    @PostMapping("/saveConsEvent")
    public Result saveConsEvent(@RequestBody ConsEvent consEvent){
        try {
            consEventService.saveConsEvent(consEvent);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存用户停电事件失败！");
        }
    }

    /**
     * 根据eventId删除用户停电事件
     * @param eventId
     * @return
     */
    @DeleteMapping("/deleteConsEventByEventId/{eventId}")
    public Result deleteConsEventByEventId(@PathVariable("eventId") String eventId){
        try {
            consEventService.deleteConsEventByEventId(eventId);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除用户停电事件失败！");
        }
    }

    /**
     * 根据用户停电事件id查询用户停电信息
     * @param id
     * @return
     */
    @GetMapping("/getConsEventById/{id}")
    public Result getConsEventById(@PathVariable("id") String id){
        ConsEvent consEvent = consEventService.getConsEventById(id);
        return Result.build(consEvent, ResultCodeEnum.SUCCESS);
    }
}
