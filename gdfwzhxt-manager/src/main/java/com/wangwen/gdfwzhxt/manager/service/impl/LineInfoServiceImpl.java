package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.LineInfoMapper;
import com.wangwen.gdfwzhxt.manager.service.LineInfoService;
import com.wangwen.gdfwzhxt.manager.util.LineInfoHelper;
import com.wangwen.gdfwzhxt.model.dto.line.LineInfoDto;
import com.wangwen.gdfwzhxt.model.entity.line.LineInfo;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class LineInfoServiceImpl implements LineInfoService {
    @Autowired
    private LineInfoMapper lineInfoMapper;

    /**
     * 查询线路信息（以特定的形式返回）
     * @return
     */
    @Override
    public List<LineInfo> findNodes() {
        //1.查询所有线路
        List<LineInfo> lineInfos = lineInfoMapper.getAllLine();

        //2.判断查到的线路列表是否为空
        if (CollectionUtils.isEmpty(lineInfos)){
            return null;
        }

        //3.将查询到的线路列表处理成特定的格式
        List<LineInfo> tree = LineInfoHelper.buildTree(lineInfos);
        return tree;
    }

    /**
     * 添加线路信息
     * @param lineInfo
     */
    @Override
    public void addLineInfo(LineInfo lineInfo) {
        //设置参数
        lineInfo.setId(UUIDUtil.getUUID());
        lineInfo.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        lineInfo.setCreateBy(AuthContextUtil.get().getName());

        //添加
        lineInfoMapper.addLineInfo(lineInfo);
    }

    /**
     * 修改线路信息
     * @param lineInfo
     */
    @Override
    public void updateLineInfo(LineInfo lineInfo) {
        lineInfo.setUpdateBy(AuthContextUtil.get().getName());

        //修改
        lineInfoMapper.updateLineInfo(lineInfo);
    }

    /**
     * 根据id删除线路
     * @param id
     */
    @Override
    public void deleteLineInfoById(String id) {
        //删除前先查看是否有下级节点
        int count = lineInfoMapper.getChildrenCountParentId(id);
        if (count > 0){
            throw new ElectricityException(ResultCodeEnum.NODE_ERROR);
        }

        //删除
        lineInfoMapper.deleteLineInfoById(id);
    }

    /**
     * 条件分页查询线路信息
     * @param current
     * @param limit
     * @param lineInfoDto
     * @return
     */
    @Override
    public PageInfo<LineInfo> getLineInfoListByConditionAndPage(Integer current, Integer limit, LineInfoDto lineInfoDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询线路信息列表
        List<LineInfo> lineInfos = lineInfoMapper.getLineInfoByCondition(lineInfoDto);

        //处理成pageInfo新式
        PageInfo<LineInfo> pageInfo = new PageInfo<>(lineInfos);
        return pageInfo;
    }

    /**
     * 根据lineId查询线路信息
     * @param lineId
     * @return
     */
    @Override
    public LineInfo getLineInfoByLineId(String lineId) {
        LineInfo lineInfo = lineInfoMapper.getLineInfoByLineId(lineId);
        return lineInfo;
    }
}
