package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.line.LineInfoDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface LineInfoMapper {
    //查询所有线路
    List<LineInfo> getAllLine();

    //添加线路信息
    void addLineInfo(LineInfo lineInfo);

    //修改线路信息
    void updateLineInfo(LineInfo lineInfo);

    //查询下级节点的数量
    int getChildrenCountParentId(String id);

    //根据id删除线路
    @Update("update t_lineInfo set is_deleted = 1 where id = #{param1}")
    void deleteLineInfoById(String id);

    //条件查询线路信息列表
    List<LineInfo> getLineInfoByCondition(LineInfoDto lineInfoDto);

    //根据lineId查询线路信息
    LineInfo getLineInfoByLineId(String lineId);
}
