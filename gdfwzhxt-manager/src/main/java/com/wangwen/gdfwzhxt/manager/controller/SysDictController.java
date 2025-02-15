package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SysDictService;
import com.wangwen.gdfwzhxt.model.dto.system.SysDictDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysDict;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    /**
     * 条件分页查询数据字典
     * @param current
     * @param limit
     * @param sysDictDto
     * @return
     */
    @GetMapping("/getSysDictList/{current}/{limit}")
    public Result getSysDictList(@PathVariable("current") Integer current,
                                 @PathVariable("limit") Integer limit,
                                 SysDictDto sysDictDto){
        PageInfo<SysDict> pageInfo = sysDictService.getSysDictList(current, limit, sysDictDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 添加或修改数据字典
     * @param sysDict
     * @return
     */
    @PostMapping("/saveDict")
    public Result saveDict(@RequestBody SysDict sysDict){
        try {
            sysDictService.saveDict(sysDict);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存失败！");
        }
    }

    /**
     * 根据id删除数据字典
     * @param id
     * @return
     */
    @DeleteMapping("/deleteDictById/{id}")
    public Result deleteDictById(@PathVariable("id") String id){
        try {
            sysDictService.deleteDictById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除字典数据失败！");
        }
    }
}
