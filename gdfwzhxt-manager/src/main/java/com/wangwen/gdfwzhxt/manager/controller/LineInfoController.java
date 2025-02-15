package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.LineInfoService;
import com.wangwen.gdfwzhxt.model.dto.line.LineInfoDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineInfo;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 线路信息
 */
@RestController
@RequestMapping("/electricity/lineInfo")
public class LineInfoController {
    @Autowired
    private LineInfoService lineInfoService;

    /**
     * 查询线路信息（以特定的形式返回）
     * @return
     */
    @GetMapping("/findNodes")
    public Result findNodes(){
        List<LineInfo> list = lineInfoService.findNodes();
        return Result.build(list, ResultCodeEnum.SUCCESS);
    }

    /**
     * 添加线路信息
     * @param lineInfo
     * @return
     */
    @PostMapping("/addLineInfo")
    public Result addLineInfo(@RequestBody LineInfo lineInfo){
        try {
            lineInfoService.addLineInfo(lineInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "线路信息添加失败！");
        }
    }

    /**
     * 修改线路信息
     * @param lineInfo
     * @return
     */
    @PutMapping("/updateLineInfo")
    public Result updateLineInfo(@RequestBody LineInfo lineInfo){
        try {
            lineInfoService.updateLineInfo(lineInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "修改线路信息失败！");
        }
    }

    /**
     * 根据id删除线路
     * @param id
     * @return
     */
    @DeleteMapping("/deleteLineInfoById/{id}")
    public Result deleteLineInfo(@PathVariable("id") String id){
        lineInfoService.deleteLineInfoById(id);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询线路信息
     * @param current
     * @param limit
     * @param lineInfoDto
     * @return
     */
    @RequestMapping("/getLineInfoListByConditionAndPage/{current}/{limit}")
    public Result getLineInfoListByConditionAndPage(@PathVariable("current") Integer current,
                                                    @PathVariable("limit") Integer limit,
                                                    @RequestBody LineInfoDto lineInfoDto){
        PageInfo<LineInfo> pageInfo = lineInfoService.getLineInfoListByConditionAndPage(current, limit, lineInfoDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }
}
