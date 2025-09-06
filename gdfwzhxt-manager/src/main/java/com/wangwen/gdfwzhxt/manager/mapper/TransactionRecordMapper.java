package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.saleManage.TransactionRecordDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.TransactionRecord;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TransactionRecordMapper {
    //条件查询所有交易记录
    List<TransactionRecord> getTransactionRecordByCondition(TransactionRecordDto transactionRecordDto);

    //添加交易记录
    void addTransactionRecord(TransactionRecord transactionRecord);

    //修改交易记录
    void updateTransactionRecord(TransactionRecord transactionRecord);

    //根据id删除交易记录
    @Delete("delete from t_transaction_record where id = #{param1}")
    void deleteTransactionRecordById(String id);
}
