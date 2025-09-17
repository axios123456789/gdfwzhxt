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
import com.wangwen.gdfwzhxt.model.dto.saleManage.TransactionRecordDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.ProductInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.TransactionRecord;
import com.wangwen.gdfwzhxt.model.vo.saleManage.CustomerAnalyseVo;
import com.wangwen.gdfwzhxt.model.vo.saleManage.CustomerEchartsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 条件分页查询交易记录列表
     * @param current
     * @param limit
     * @param transactionRecordDto
     * @return
     */
    @Override
    public PageInfo<TransactionRecord> getTransactionRecordByConditionAndPage(Integer current, Integer limit, TransactionRecordDto transactionRecordDto) {
        //开启分页
        PageHelper.startPage(current, limit);

        //条件查询所有交易记录
        List<TransactionRecord> transactionRecords = transactionRecordMapper.getTransactionRecordByCondition(transactionRecordDto);

        //使用分页插件返回
        PageInfo<TransactionRecord> transactionRecordPageInfo = new PageInfo<>(transactionRecords);

        return transactionRecordPageInfo;
    }

    /**
     * 保存交易记录
     * @param transactionRecord
     */
    @Override
    public void saveTransactionRecord(TransactionRecord transactionRecord) {
        if (transactionRecord.getId() == null || "".equals(transactionRecord.getId())){//添加
            transactionRecord.setId(UUIDUtil.getUUID());
            transactionRecord.setCreateBy(AuthContextUtil.get().getName());

            //添加交易记录
            transactionRecordMapper.addTransactionRecord(transactionRecord);
            //根据客户id将客户交易次数加一
            customerInfoMapper.updateCustomerTradeCountById(transactionRecord.getCustomerId());
            //根据产品id将产品库存减交易数量
            productInfoMapper.updateProductInfoNumberById(transactionRecord.getProductId(), transactionRecord.getTradeCount());
        }else {//修改
            transactionRecord.setUpdateBy(AuthContextUtil.get().getName());

            //修改交易记录
            transactionRecordMapper.updateTransactionRecord(transactionRecord);
        }
        customerAnalyse(transactionRecord);
    }

    /**
     * 客户分析
     * @param transactionRecord
     */
    private void customerAnalyse(TransactionRecord transactionRecord){
        StringBuilder stringBuilder = new StringBuilder();
        //1.产品层面对客户进行分析
        //1.1获取各产品情况
        List<CustomerAnalyseVo> customerAnalyseVos = transactionRecordMapper.getProductAnalyse(transactionRecord.getCustomerId());
        if (customerAnalyseVos.size() > 0){
            CustomerAnalyseVo customerAnalyseVoTotal = getTotal(customerAnalyseVos);
            stringBuilder.append("1.客户总体情况分析：").append(System.lineSeparator());
            stringBuilder.append("  "+transactionRecord.getCustomerName()+"客户与您总共完成了"+customerAnalyseVoTotal.getTradeCount()+"场交易，");
            stringBuilder.append("交易产品数量达"+customerAnalyseVoTotal.getTradeSum()+"个；");
            stringBuilder.append("累计交易金额达到"+customerAnalyseVoTotal.getTradeAmount()+"元，");
            stringBuilder.append("您在"+transactionRecord.getCustomerName()+"客户身上获取的提成总金额为："+customerAnalyseVoTotal.getTradeCommissionAmount()+"元。");
            stringBuilder.append(System.lineSeparator());
            //1.2针对客户购买产品分析
            stringBuilder.append("2.交易产品分析：").append(System.lineSeparator());
            stringBuilder.append("  "+transactionRecord.getCustomerName()+"客户与您完成的所有交易中：");
            for (int i = 0; i < customerAnalyseVos.size(); i++) {
                stringBuilder.append(customerAnalyseVos.get(i).getProductName()+"产品的交易数量排名第"+(i+1)+"，为"+customerAnalyseVos.get(i).getTradeSum()+"个；");
                stringBuilder.append("交易的总金额达："+customerAnalyseVos.get(i).getTradeAmount()+"元；");
                stringBuilder.append("累计获取的提成金额为："+customerAnalyseVos.get(i).getTradeCommissionAmount()+"元。");
            }
            stringBuilder.append(System.lineSeparator());
            stringBuilder.append("  由此分析可判断："+transactionRecord.getCustomerName()+"客户对");
            stringBuilder.append(customerAnalyseVos.get(0).getProductName()+"产品的中意度比较高，往后可以给客户推荐类似");
            stringBuilder.append(customerAnalyseVos.get(0).getProductName()+"的产品来获取利益。").append(System.lineSeparator());
        }

        //2.订单状态层面对客户进行分析
        //获取订单分析结果
        List<CustomerAnalyseVo> customerAnalyseVoList = customerInfoMapper.getOrderStatusAnalyse(transactionRecord.getCustomerId());
        CustomerAnalyseVo orderStatusTotal = getTotal(customerAnalyseVoList);
        stringBuilder.append("3.客户订单状态分析：").append(System.lineSeparator()).append("  "+transactionRecord.getCustomerName()+"客户处于");
        for (CustomerAnalyseVo customerAnalyseVo : customerAnalyseVoList){
            stringBuilder.append("【"+customerAnalyseVo.getOrderStatus()+"】的订单数量"+customerAnalyseVo.getTradeCount()+"个，占比");
            stringBuilder.append(String.format("%.2f", (double)customerAnalyseVo.getTradeCount()/orderStatusTotal.getTradeCount()*100)+"%。");
        }

        //3.保存客户分析结果
        customerInfoMapper.saveCustomerAnalyseResult(transactionRecord.getCustomerId(), stringBuilder.toString());
    }

    /**
     * 针对各指标求合计
     * @param customerAnalyseVos
     * @return
     */
    private CustomerAnalyseVo getTotal(List<CustomerAnalyseVo> customerAnalyseVos){
        CustomerAnalyseVo customerAnalyseVoTotal = new CustomerAnalyseVo();
        customerAnalyseVoTotal.setProductName("合计");
        customerAnalyseVoTotal.setTradeCount(0);
        customerAnalyseVoTotal.setTradeSum(0);
        customerAnalyseVoTotal.setTradeAmount(BigDecimal.valueOf(0.00));
        customerAnalyseVoTotal.setTradeCommissionAmount(BigDecimal.valueOf(0.00));
        for (CustomerAnalyseVo customerAnalyseVo : customerAnalyseVos){
            customerAnalyseVoTotal.setTradeCount(customerAnalyseVoTotal.getTradeCount() + customerAnalyseVo.getTradeCount());
            customerAnalyseVoTotal.setTradeSum(customerAnalyseVoTotal.getTradeSum() + customerAnalyseVo.getTradeSum());
            customerAnalyseVoTotal.setTradeAmount(customerAnalyseVoTotal.getTradeAmount().add(customerAnalyseVo.getTradeAmount()));
            customerAnalyseVoTotal.setTradeCommissionAmount(customerAnalyseVoTotal.getTradeCommissionAmount().add(customerAnalyseVo.getTradeCommissionAmount()));
        }
        return customerAnalyseVoTotal;
    }

    /**
     * 根据id删除交易记录
     * @param id
     */
    @Override
    public void deleteTransactionRecordById(String id) {
        transactionRecordMapper.deleteTransactionRecordById(id);
    }

    /**
     * 获取客户分析数据【客户提成金额排名】
     * @return
     */
    @Override
    public Map<String, Object> getCustomerAnalyseData() {
        //1.获取客户提成金额排名分析数据
        List<CustomerEchartsVo> customerEchartsVos = customerInfoMapper.getCustomerAnalyseData();

        //2.封装数据
        Map<String, Object> map = new HashMap<>();
        map.put("dataList", customerEchartsVos);
        List<String> listTitle = new ArrayList<>();
        for (CustomerEchartsVo customerEchartsVo : customerEchartsVos){
            listTitle.add(customerEchartsVo.getName());
        }
        map.put("dataTitle", listTitle);

        return map;
    }
}
