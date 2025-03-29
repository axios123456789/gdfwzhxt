package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.DroneService;
import com.wangwen.gdfwzhxt.model.dto.source.DroneInfoDto;
import com.wangwen.gdfwzhxt.model.dto.workOrder.ViewRecordDto;
import com.wangwen.gdfwzhxt.model.entity.drone.DroneInfo;
import com.wangwen.gdfwzhxt.model.entity.drone.ViewRecord;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/electricity/drone")
public class DroneController {
    @Autowired
    private DroneService droneService;

    /**
     * 条件分页查询无人机信息列表
     * @param current
     * @param limit
     * @param droneInfoDto
     * @return
     */
    @GetMapping("/getDroneInfoListByConditionAndPage/{current}/{limit}")
    public Result getDroneInfoListByConditionAndPage(@PathVariable("current") Integer current,
                                                     @PathVariable("limit") Integer limit,
                                                     DroneInfoDto droneInfoDto){
        PageInfo<DroneInfo> pageInfo = droneService.getDroneInfoListByConditionAndPage(current, limit, droneInfoDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存无人机信息
     * @param droneInfo
     * @return
     */
    @PostMapping("/saveDroneInfo")
    public Result saveDroneInfo(@RequestBody DroneInfo droneInfo){
        try {
            droneService.saveDroneInfo(droneInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, ResultCodeEnum.DRONE_EXISTS);
        }
    }

    /**
     * 根据id删除无人机信息
     * @param id
     * @return
     */
    @DeleteMapping("/deleteDroneInfoById/{id}")
    public Result deleteDroneInfoById(@PathVariable("id") String id){
        try {
            droneService.deleteDroneInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除无人机信息失败！");
        }
    }

    /**
     * 条件分页查询无人机巡视记录
     * @param current
     * @param limit
     * @param viewRecordDto
     * @return
     */
    @PostMapping("/getViewRecordByConditionAndPage/{current}/{limit}")
    public Result getViewRecordByConditionAndPage(@PathVariable("current") Integer current,
                                                  @PathVariable("limit") Integer limit,
                                                  @RequestBody ViewRecordDto viewRecordDto){
        PageInfo<ViewRecord> pageInfo = droneService.getViewRecordByConditionAndPage(current, limit, viewRecordDto);
        return Result.build(pageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存巡视记录
     * @param viewRecord
     * @return
     */
    @PostMapping("/saveViewRecord")
    public Result saveViewRecord(@RequestBody ViewRecord viewRecord){
        try {
            droneService.saveViewRecord(viewRecord);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存巡视记录出错，请联系管理员！");
        }
    }

    /**
     * 根据id删除巡视记录
     * @param id
     * @return
     */
    @DeleteMapping("/deleteViewRecord/{id}")
    public Result deleteViewRecord(@PathVariable("id") String id){
        try {
            droneService.deleteViewRecord(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除巡视记录失败，请联系管理员！");
        }
    }

    /**
     * 核心业务-巡视记录扭转
     * @param changeFlag
     * @param viewRecord
     * @return
     */
    @PostMapping("/viewRecordChange/{changeFlag}")
    public Result viewRecordChange(@PathVariable("changeFlag") Integer changeFlag,
                                   @RequestBody ViewRecord viewRecord){
        try {
            droneService.viewRecordChange(viewRecord, changeFlag);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "工单扭转失败，请联系1管理员！");
        }
    }
}
