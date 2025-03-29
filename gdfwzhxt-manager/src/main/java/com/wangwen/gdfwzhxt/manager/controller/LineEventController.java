package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.LineEventService;
import com.wangwen.gdfwzhxt.model.dto.line.LineEventDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineEvent;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/electricity/lineEvent")
public class LineEventController {
    @Autowired
    private LineEventService lineEventService;

    /**
     * 条件分页查询线路停运事件
     * @param current
     * @param limit
     * @param lineEventDto
     * @return
     */
    @GetMapping("/getLineEventByConditionAndPage/{current}/{limit}")
    public Result getLineEventByConditionAndPage(@PathVariable("current") Integer current,
                                                 @PathVariable("limit") Integer limit,
                                                 LineEventDto lineEventDto){
        PageInfo<LineEvent> pageInfo = lineEventService.getLineEventByConditionAndPage(current, limit, lineEventDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存线路停运事件
     * @param lineEvent
     * @return
     */
    @PostMapping("/saveLineEvent")
    public Result saveLineEvent(@RequestBody LineEvent lineEvent){
        try {
            lineEventService.saveLineEvent(lineEvent);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存线路事件失败，请联系管理员！");
        }
    }

    /**
     * 根据id删除线路停运事件
     * @param id
     * @return
     */
    @DeleteMapping("/deleteLineEventById/{id}")
    public Result deleteLineEventById(@PathVariable("id") String id){
        try {
            lineEventService.deleteLineEventById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除线路停运事件失败！");
        }
    }

    /**
     * 根据事件id查询事件信息
     * @param id
     * @return
     */
    @GetMapping("/getLineEventById/{id}")
    public Result getLineEventById(@PathVariable("id") String id){
        LineEvent lineEvent = lineEventService.getLineEventById(id);
        return Result.build(lineEvent, ResultCodeEnum.SUCCESS);
    }
}
