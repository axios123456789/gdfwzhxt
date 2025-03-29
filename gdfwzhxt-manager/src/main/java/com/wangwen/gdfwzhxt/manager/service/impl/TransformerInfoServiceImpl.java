package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.TransformerInfoMapper;
import com.wangwen.gdfwzhxt.manager.service.TransformerInfoService;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerInfo;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransformerInfoServiceImpl implements TransformerInfoService {
    @Autowired
    private TransformerInfoMapper transformerInfoMapper;

    /**
     * 条件分页查询变压器信息
     * @param current
     * @param limit
     * @param transformerInfoDto
     * @return
     */
    @Override
    public PageInfo<TransformerInfo> getTransformerInfoListByConditionAndPage(Integer current, Integer limit, TransformerInfoDto transformerInfoDto) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //条件查询所有变压器信息列表
        List<TransformerInfo> list = transformerInfoMapper.getTransformerInfoListByCondition(transformerInfoDto);

        //将列表处理成最终PageInfo<>新式
        PageInfo<TransformerInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存变压器信息
     * @param transformerInfo
     */
    @Override
    public void saveTransformerInfo(TransformerInfo transformerInfo) {
//        //保存操作进行前先判断变压器局号是否存在
//        int byqCount = transformerInfoMapper.getTransformerInfoCountByTransformerCode(transformerInfo.getTransformerCode());
//        if (byqCount > 0){
//            throw new ElectricityException(ResultCodeEnum.BYQJH_EXISTS);
//        }

        //根据id是否为空判断添加还是修改
        if (transformerInfo.getId() == null || "".equals(transformerInfo.getId())){//添加
            transformerInfo.setId(UUIDUtil.getUUID());
            transformerInfo.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
            transformerInfo.setCreateBy(AuthContextUtil.get().getName());

            transformerInfoMapper.addTransformerInfo(transformerInfo);
        }else {//修改
            transformerInfo.setUpdateBy(AuthContextUtil.get().getName());

            transformerInfoMapper.updateTransformerInfo(transformerInfo);
        }
    }

    /**
     * 根据id删除变压器信息
     * @param id
     */
    @Override
    public void deleteTransformerInfoById(String id) {
        transformerInfoMapper.deleteTransformerInfoById(id);
    }

    /**
     * 根据变压器局号查询变压器
     * @param transformerCode
     * @return
     */
    @Override
    public TransformerInfo getTransformerInfoByTransformerCode(String transformerCode) {
        TransformerInfo transformerInfo = transformerInfoMapper.getTransformerInfoByTransformerCode(transformerCode);
        return transformerInfo;
    }
}
