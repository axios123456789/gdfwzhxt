package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerInfo;

public interface TransformerInfoService {
    //条件分页查询变压器信息
    PageInfo<TransformerInfo> getTransformerInfoListByConditionAndPage(Integer current, Integer limit, TransformerInfoDto transformerInfoDto);

    //保存变压器信息
    void saveTransformerInfo(TransformerInfo transformerInfo);

    //根据id删除变压器信息
    void deleteTransformerInfoById(String id);

    //根据变压器局号查询变压器
    TransformerInfo getTransformerInfoByTransformerCode(String transformerCode);
}
