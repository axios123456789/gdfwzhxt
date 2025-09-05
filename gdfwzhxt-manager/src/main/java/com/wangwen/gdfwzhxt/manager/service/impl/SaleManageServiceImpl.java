package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.CustomerInfoMapper;
import com.wangwen.gdfwzhxt.manager.mapper.ProductInfoMapper;
import com.wangwen.gdfwzhxt.manager.mapper.TransactionRecordMapper;
import com.wangwen.gdfwzhxt.manager.service.SaleManageService;
import com.wangwen.gdfwzhxt.model.dto.saleManage.CustomerInfoDto;
import com.wangwen.gdfwzhxt.model.dto.saleManage.ProductInfoDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleManageServiceImpl implements SaleManageService {
    @Autowired
    private CustomerInfoMapper customerInfoMapper;
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Autowired
    private TransactionRecordMapper transactionRecordMapper;

    /**
     * 条件分页查询客户信息
     * @param current
     * @param limit
     * @param customerInfoDto
     * @return
     */
    @Override
    public PageInfo<CustomerInfo> getCustomerInfoByConditionAndPage(Integer current, Integer limit, CustomerInfoDto customerInfoDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有客户信息
        List<CustomerInfo> customerInfos = customerInfoMapper.getCustomerInfoByCondition(customerInfoDto);

        //设置分页
        PageInfo<CustomerInfo> customerInfoPageInfo = new PageInfo<>(customerInfos);

        return customerInfoPageInfo;
    }

    /**
     * 保存客户信息
     * @param customerInfo
     */
    @Override
    public void saveCustomerInfo(CustomerInfo customerInfo) {
        if (customerInfo.getId() == null || "".equals(customerInfo.getId())){//添加客户信息
            //设置基本参数
            customerInfo.setId(UUIDUtil.getUUID());
            customerInfo.setCreateBy(AuthContextUtil.get().getName());

            //添加客户信息
            customerInfoMapper.addCustomerInfo(customerInfo);
        }else {//修改客户信息
            customerInfo.setUpdateBy(AuthContextUtil.get().getName());

            //修改客户信息
            customerInfoMapper.updateCustomerInfo(customerInfo);
        }
    }

    /**
     * 根据id删除客户信息
     * @param id
     */
    @Override
    public void deleteCustomerInfoById(String id) {
        customerInfoMapper.deleteCustomerInfoById(id);
    }

    /**
     * 条件分页查询产品信息
     * @param current
     * @param limit
     * @param productInfoDto
     * @return
     */
    @Override
    public PageInfo<ProductInfo> getProductInfoByConditionAndPage(Integer current, Integer limit, ProductInfoDto productInfoDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有产品信息
        List<ProductInfo> productInfos = productInfoMapper.getProductInfoByCondition(productInfoDto);

        //设置分页
        PageInfo<ProductInfo> productInfoPageInfo = new PageInfo<>(productInfos);
        return productInfoPageInfo;
    }

    /**
     * 保存产品信息
     * @param productInfo
     */
    @Override
    public void saveProductInfo(ProductInfo productInfo) {
        if (productInfo.getId() == null || "".equals(productInfo.getId())){//添加
            productInfo.setId(UUIDUtil.getUUID());
            productInfo.setCreateBy(AuthContextUtil.get().getName());

            //添加产品信息
            productInfoMapper.addProductInfo(productInfo);
        }else {//修改
            productInfo.setUpdateBy(AuthContextUtil.get().getName());

            //修改产品信息
            productInfoMapper.updateProductInfo(productInfo);
        }
    }

    /**
     * 根据id删除产品信息
     * @param id
     */
    @Override
    public void deleteProductInfoById(String id) {
        productInfoMapper.deleteProductInfoById(id);
    }
}
