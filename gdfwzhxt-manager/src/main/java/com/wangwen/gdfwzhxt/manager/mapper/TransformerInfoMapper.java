package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.transformer.TransformerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.transformer.TransformerInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface TransformerInfoMapper {
    //条件查询所有变压器信息列表
    List<TransformerInfo> getTransformerInfoListByCondition(TransformerInfoDto transformerInfoDto);

    //查询变压器的数量根据变压器局号
    int getTransformerInfoCountByTransformerCode(String transformerCode);

    //添加变压器信息
    void addTransformerInfo(TransformerInfo transformerInfo);

    //修改变压器信息
    void updateTransformerInfo(TransformerInfo transformerInfo);

    //根据id删除变压器信息
    @Update("update t_transformerInfo set is_deleted = 1 where id = #{param1}")
    void deleteTransformerInfoById(String id);
}
