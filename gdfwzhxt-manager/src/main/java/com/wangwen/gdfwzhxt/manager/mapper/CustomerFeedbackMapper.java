package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.cons.CustomerFeedbackDto;
import com.wangwen.gdfwzhxt.model.entity.cons.CustomerFeedback;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CustomerFeedbackMapper {
    //条件查询所有反馈记录
    List<CustomerFeedback> getCustomerFeedbackByCondition(CustomerFeedbackDto customerFeedbackDto);

    //添加客户反馈记录
    void addCustomerFeedback(CustomerFeedback customerFeedback);

    //修改客户反馈记录
    void updateCustomerFeedback(CustomerFeedback customerFeedback);

    //根据id删除客户反馈记录
    @Update("update t_customer_feedback set is_deleted = 1 where id = #{param1}")
    void deleteCustomerFeedbackById(String id);
}
