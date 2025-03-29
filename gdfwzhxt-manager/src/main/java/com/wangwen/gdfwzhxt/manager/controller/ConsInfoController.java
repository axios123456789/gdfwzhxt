package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.ConsInfoService;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/electricity/consInfo")
public class ConsInfoController {
    @Autowired
    private ConsInfoService consInfoService;

    /**
     * 条件分页查询用户信息列表
     * @param current
     * @param limit
     * @param consInfoDto
     * @return
     */
    @PostMapping("/getConsInfoListByConditionAndPage/{current}/{limit}")
    public Result getConsInfoListByConditionAndPage(@PathVariable("current") Integer current,
                                                    @PathVariable("limit") Integer limit,
                                                    @RequestBody ConsInfoDto consInfoDto){
        PageInfo<ConsInfo> pageInfo = consInfoService.getConsInfoListByConditionAndPage(current, limit, consInfoDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存用户信息
     * @param consInfo
     * @return
     */
    @PostMapping("/saveConsInfo")
    public Result saveConsInfo(@RequestBody ConsInfo consInfo){
        try {
            consInfoService.saveConsInfo(consInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, ResultCodeEnum.CONS_EXISTS);
        }
    }

    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    @DeleteMapping("/deleteConsInfoById/{id}")
    public Result deleteConsInfoById(@PathVariable("id") String id){
        try {
            consInfoService.deleteConsInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除用户信息失败！");
        }
    }

    /**
     * 根据用户编号查询用户信息
     * @param consNo
     * @return
     */
    @GetMapping("/getConsInfoByConsNo/{consNo}")
    public Result getConsInfoByConsNo(@PathVariable("consNo") String consNo){
        ConsInfo consInfo = consInfoService.getConsInfoByConsNo(consNo);
        return Result.build(consInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 条件分页查询用户电费充值记录
     * @param current
     * @param limit
     * @param rechargeRecordDto
     * @return
     */
    @PostMapping("/getRechargeRecordByConditionAndPage/{current}/{limit}")
    public Result getRechargeRecordByConditionAndPage(@PathVariable("current") Integer current,
                                                      @PathVariable("limit") Integer limit,
                                                      @RequestBody RechargeRecordDto rechargeRecordDto){
        PageInfo<RechargeRecord> pageInfo = consInfoService.getRechargeRecordByConditionAndPage(current, limit, rechargeRecordDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 用户电费充值
     * @param rechargeRecord
     * @return
     */
    @PostMapping("/rechargeElectricity")
    public Result rechargeElectricity(@RequestBody RechargeRecord rechargeRecord){
        try {
            consInfoService.rechargeElectricity(rechargeRecord);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "电费充值失败，请联系管理员！");
        }
    }
}
