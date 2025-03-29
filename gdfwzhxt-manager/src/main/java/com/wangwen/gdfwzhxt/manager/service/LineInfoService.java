package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.line.LineInfoDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineInfo;

import java.util.List;

public interface LineInfoService {
    //查询线路信息（以特定的形式返回）
    List<LineInfo> findNodes();

    //添加线路信息
    void addLineInfo(LineInfo lineInfo);

    //修改线路信息
    void updateLineInfo(LineInfo lineInfo);

    //根据id删除线路
    void deleteLineInfoById(String id);

    //条件分页查询线路信息
    PageInfo<LineInfo> getLineInfoListByConditionAndPage(Integer current, Integer limit, LineInfoDto lineInfoDto);

    //根据lineId查询线路信息
    LineInfo getLineInfoByLineId(String lineId);
}
