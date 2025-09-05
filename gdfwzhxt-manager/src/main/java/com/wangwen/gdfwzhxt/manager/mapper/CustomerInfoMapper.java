package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.saleManage.CustomerInfoDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

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
}
