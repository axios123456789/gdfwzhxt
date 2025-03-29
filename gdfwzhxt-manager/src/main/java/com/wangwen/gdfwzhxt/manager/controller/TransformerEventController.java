package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.TransformerEventService;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerEventDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerEvent;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/electricity/transformerEvent")
public class TransformerEventController {
    @Autowired
    private TransformerEventService transformerEventService;

    /**
     * 条件分页查询配变停运事件列表
     * @param current
     * @param limit
     * @param transformerEventDto
     * @return
     */
    @RequestMapping("/getTransformerEventByConditionAndPage/{current}/{limit}")
    public Result getTransformerEventByConditionAndPage(@PathVariable("current") Integer current,
                                                        @PathVariable("limit") Integer limit,
                                                        @RequestBody TransformerEventDto transformerEventDto){
        PageInfo<TransformerEvent> pageInfo = transformerEventService.getTransformerEventByConditionAndPage(current, limit, transformerEventDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存配变停运事件
     * @param transformerEvent
     * @return
     */
    @PostMapping("/saveTransformerEvent")
    public Result saveTransformerEvent(@RequestBody TransformerEvent transformerEvent){
        try {
            transformerEventService.saveTransformerEvent(transformerEvent);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存配变停运事件失败！");
        }
    }

    /**
     * 删除配变事件根据id
     * @param dataId
     * @return
     */
    @DeleteMapping("/deleteTransformerEventByDataId/{dataId}")
    public Result deleteTransformerEventByDataId(@PathVariable("dataId") String dataId){
        try {
            transformerEventService.deleteTransformerEventByDataId(dataId);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除配变事件失败！");
        }
    }

    /**
     * 根据配变事件id查看配变事件信息
     * @param id
     * @return
     */
    @GetMapping("/getTransformerEventById/{id}")
    public Result getTransformerEventById(@PathVariable("id") String id){
        TransformerEvent transformerEvent = transformerEventService.getTransformerEventById(id);
        return Result.build(transformerEvent, ResultCodeEnum.SUCCESS);
    }
}
