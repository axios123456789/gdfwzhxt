package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;

public interface ConsInfoService {
    //条件分页查询用户信息列表
    PageInfo<ConsInfo> getConsInfoListByConditionAndPage(Integer current, Integer limit, ConsInfoDto consInfoDto);

    //保存用户信息
    void saveConsInfo(ConsInfo consInfo);

    //根据id删除用户
    void deleteConsInfoById(String id);
}
