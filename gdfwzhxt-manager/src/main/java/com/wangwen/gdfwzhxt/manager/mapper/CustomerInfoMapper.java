package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.saleManage.CustomerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import com.wangwen.gdfwzhxt.model.vo.saleManage.CustomerAnalyseVo;
import com.wangwen.gdfwzhxt.model.vo.saleManage.CustomerEchartsVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CustomerInfoMapper {
    //条件查询所有客户信息
    List<CustomerInfo> getCustomerInfoByCondition(CustomerInfoDto customerInfoDto);

    //添加客户信息
    void addCustomerInfo(CustomerInfo customerInfo);

    //修改客户信息
    void updateCustomerInfo(CustomerInfo customerInfo);

    //根据id删除客户信息
    @Delete("delete from t_customer_info where id = #{param1}")
    void deleteCustomerInfoById(String id);

    //根据客户id将客户交易次数加一
    @Update("update t_customer_info set repeat_order_count = ifnull(repeat_order_count, 0) + 1, " +
            "customer_type = (case when ifnull(repeat_order_count, 0) = 2 then 2 " +
            "when ifnull(repeat_order_count, 0) > 2 and ifnull(repeat_order_count, 0) < 6 then 3 " +
            "when ifnull(repeat_order_count, 0) > 5 then 4 end) where id = #{param1}")
    void updateCustomerTradeCountById(String customerId);

    //保存客户分析结果
    @Update("update t_customer_info set analyse = #{param2} where id = #{param1}")
    void saveCustomerAnalyseResult(String customerId, String stringBuilder);

    //获取订单分析结果
    List<CustomerAnalyseVo> getOrderStatusAnalyse(String customerId);

    //获取客户提成金额排名分析数据
    List<CustomerEchartsVo> getCustomerAnalyseData();
}
