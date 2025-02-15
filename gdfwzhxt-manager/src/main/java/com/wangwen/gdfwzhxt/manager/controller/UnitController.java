package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.UnitService;
import com.wangwen.gdfwzhxt.model.dto.source.UnitSourceDto;
import com.wangwen.gdfwzhxt.model.entity.source.Unit;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 单位
 */
@RestController
@RequestMapping("/electricity/unit")
public class UnitController {
    @Autowired
    private UnitService unitService;

    /**
     * 查询单位列表（以特定的形式返回）
     * @return
     */
    @GetMapping("/findNodes")
    public Result findNodes(){
        List<Unit> list = unitService.findNodes();
        return Result.build(list, ResultCodeEnum.SUCCESS);
    }

    /**
     * 添加单位
     * @param unit
     * @return
     */
    @PostMapping("/addUnit")
    public Result addUnit(@RequestBody Unit unit){
        try {
            unitService.addUnit(unit);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "添加单位失败！");
        }
    }

    /**
     * 修改单位
     * @param unit
     * @return
     */
    @PutMapping("/updateUnit")
    public Result updateUnit(@RequestBody Unit unit){
        try {
            unitService.updateUnit(unit);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "修改单位失败！");
        }
    }

    /**
     * 根据unitId删除单位
     * @param unitId
     * @return
     */
    @DeleteMapping("deleteUnitByUnitId/{unitId}")
    public Result deleteUnitByUnitId(@PathVariable("unitId") String unitId){
        unitService.deleteUnitByUnitId(unitId);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询单位
     * @param current
     * @param limit
     * @param unitSourceDto
     * @return
     */
    @GetMapping("/getUnitListByConditionAndPage/{current}/{limit}")
    public Result getUnitListByConditionAndPage(@PathVariable("current") Integer current,
                                                @PathVariable("limit") Integer limit,
                                                UnitSourceDto unitSourceDto){
        PageInfo<Unit> pageInfo = unitService.getUnitListByConditionAndPage(current, limit, unitSourceDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }
}
