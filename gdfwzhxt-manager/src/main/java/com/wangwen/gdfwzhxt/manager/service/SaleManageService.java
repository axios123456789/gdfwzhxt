package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.saleManage.CustomerInfoDto;
import com.wangwen.gdfwzhxt.model.dto.saleManage.ProductInfoDto;
import com.wangwen.gdfwzhxt.model.dto.saleManage.TransactionRecordDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.ProductInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.TransactionRecord;

public interface SaleManageService {
    //条件分页查询客户信息
    PageInfo<CustomerInfo> getCustomerInfoByConditionAndPage(Integer current, Integer limit, CustomerInfoDto customerInfoDto);

    //保存客户信息
    void saveCustomerInfo(CustomerInfo customerInfo);

    //根据id删除客户信息
    void deleteCustomerInfoById(String id);

    //条件分页查询产品信息
    PageInfo<ProductInfo> getProductInfoByConditionAndPage(Integer current, Integer limit, ProductInfoDto productInfoDto);

    //保存产品信息
    void saveProductInfo(ProductInfo productInfo);

    //根据id删除产品信息
    void deleteProductInfoById(String id);

    //条件分页查询交易记录列表
    PageInfo<TransactionRecord> getTransactionRecordByConditionAndPage(Integer current, Integer limit, TransactionRecordDto transactionRecordDto);

    //保存交易记录
    void saveTransactionRecord(TransactionRecord transactionRecord);

    //根据id删除交易记录
    void deleteTransactionRecordById(String id);
}
