package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.TransformerInfoService;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerInfo;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 变压器信息
 */
@RestController
@RequestMapping("/electricity/transformerInfo")
public class TransformerInfoController {
    @Autowired
    private TransformerInfoService transformerInfoService;

    /**
     * 条件分页查询变压器信息
     * @param current
     * @param limit
     * @param transformerInfoDto
     * @return
     */
    @GetMapping("/getTransformerInfoListByConditionAndPage/{current}/{limit}")
    public Result getTransformerInfoListByConditionAndPage(@PathVariable("current") Integer current,
                                                           @PathVariable("limit") Integer limit,
                                                           TransformerInfoDto transformerInfoDto){
        PageInfo<TransformerInfo> pageInfo = transformerInfoService.getTransformerInfoListByConditionAndPage(current, limit, transformerInfoDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存变压器信息
     * @param transformerInfo
     * @return
     */
    @PostMapping("/saveTransformerInfo")
    public Result saveTransformerInfo(@RequestBody TransformerInfo transformerInfo){
        try {
            transformerInfoService.saveTransformerInfo(transformerInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, ResultCodeEnum.BYQJH_EXISTS);
        }
    }

    /**
     * 根据id删除变压器信息
     * @param id
     * @return
     */
    @DeleteMapping("/deleteTransformerInfoById/{id}")
    public Result deleteTransformerInfoById(@PathVariable("id") String id){
        try {
            transformerInfoService.deleteTransformerInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除变压器信息失败！");
        }
    }

    /**
     * 根据变压器局号查询变压器
     * @param transformerCode
     * @return
     */
    @GetMapping("/getTransformerInfoByTransformerCode/{transformerCode}")
    public Result getTransformerInfoByTransformerCode(@PathVariable("transformerCode") String transformerCode){
        TransformerInfo transformerInfo = transformerInfoService.getTransformerInfoByTransformerCode(transformerCode);
        return Result.build(transformerInfo, ResultCodeEnum.SUCCESS);
    }
}
