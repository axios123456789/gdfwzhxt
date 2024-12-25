package com.wangwen.gdfwzhxt.manager.controller;

import com.wangwen.gdfwzhxt.manager.service.SysDictService;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 系统管理-数据字典
 */
@RestController
@RequestMapping("/electricity/system/dict")
public class SysDictController {
    @Autowired
    private SysDictService sysDictService;

    /**
     * 通过类型获取下拉列表等键和值
     * @param type
     * @return
     */
    @GetMapping("/getKeyAndValueByType/{type}")
    public Result getKeyAndValueByType(@PathVariable("type") String type){
        List<Map<String, Object>> list = sysDictService.getKeyAndValueByType(type);
        return Result.build(list, ResultCodeEnum.SUCCESS);
    }

    /**
     * 根据当前账号的权限查询对应的账号等级
     * @param type
     * @return
     */
    @GetMapping("/getUserLevelByPower/{type}")
    public Result getUserLevelByPower(@PathVariable("type") String type){
        List<Map<String, Object>> list = sysDictService.getUserLevelByPower(type);
        return Result.build(list, ResultCodeEnum.SUCCESS);
    }
}
