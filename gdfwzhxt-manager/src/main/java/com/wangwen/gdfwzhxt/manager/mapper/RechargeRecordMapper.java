package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.cons.RechargeRecordDto;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RechargeRecordMapper {
    //条件查询所有电费充值记录
    List<RechargeRecord> getRechargeRecordByCondition(RechargeRecordDto rechargeRecordDto);

    //新增电费充值记录
    void addRechargeRecord(RechargeRecord rechargeRecord);
}
