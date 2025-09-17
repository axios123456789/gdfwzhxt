package com.wangwen.gdfwzhxt.manager.controller;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.manager.service.SaleManageService;
import com.wangwen.gdfwzhxt.model.dto.saleManage.CustomerInfoDto;
import com.wangwen.gdfwzhxt.model.dto.saleManage.ProductInfoDto;
import com.wangwen.gdfwzhxt.model.dto.saleManage.TransactionRecordDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.CustomerInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.ProductInfo;
import com.wangwen.gdfwzhxt.model.entity.saleManage.TransactionRecord;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/electricity/saleManage")
public class SaleManageController {
    @Autowired
    private SaleManageService saleManageService;

    /**
     * 条件分页查询客户信息
     * @param current
     * @param limit
     * @param customerInfoDto
     * @return
     */
    @PostMapping("/getCustomerInfoByConditionAndPage/{current}/{limit}")
    public Result getCustomerInfoByConditionAndPage(@PathVariable("current") Integer current,
                                                    @PathVariable("limit") Integer limit,
                                                    @RequestBody CustomerInfoDto customerInfoDto){
        PageInfo<CustomerInfo> customerInfoPageInfo = saleManageService.getCustomerInfoByConditionAndPage(current, limit, customerInfoDto);
        return Result.build(customerInfoPageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存客户信息
     * @param customerInfo
     * @return
     */
    @PostMapping("/saveCustomerInfo")
    public Result saveCustomerInfo(@RequestBody CustomerInfo customerInfo){
        try {
            saleManageService.saveCustomerInfo(customerInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存客户信息失败，请联系开发人员~~");
        }
    }

    /**
     * 根据id删除客户信息
     * @param id
     * @return
     */
    @DeleteMapping("/deleteCustomerInfoById/{id}")
    public Result deleteCustomerInfoById(@PathVariable("id") String id){
        try {
            saleManageService.deleteCustomerInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除客户失败，请联系开发人员~~");
        }
    }

    /**
     * 条件分页查询产品信息
     * @param current
     * @param limit
     * @param productInfoDto
     * @return
     */
    @PostMapping("/getProductInfoByConditionAndPage/{current}/{limit}")
    public Result getProductInfoByConditionAndPage(@PathVariable("current") Integer current,
                                                   @PathVariable("limit") Integer limit,
                                                   @RequestBody ProductInfoDto productInfoDto){
        PageInfo<ProductInfo> productInfoPageInfo = saleManageService.getProductInfoByConditionAndPage(current, limit, productInfoDto);
        return Result.build(productInfoPageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存产品信息
     * @param productInfo
     * @return
     */
    @PostMapping("/saveProductInfo")
    public Result saveProductInfo(@RequestBody ProductInfo productInfo){
        try {
            saleManageService.saveProductInfo(productInfo);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存产品信息失败，请联系开发者~~");
        }
    }

    /**
     * 根据id删除产品信息
     * @param id
     * @return
     */
    @DeleteMapping("/deleteProductInfoById/{id}")
    public Result deleteProductInfoById(@PathVariable("id") String id){
        try {
            saleManageService.deleteProductInfoById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除产品信息失败，请联系开发者~~");
        }
    }

    /**
     * 条件分页查询交易记录列表
     * @param current
     * @param limit
     * @param transactionRecordDto
     * @return
     */
    @PostMapping("/getTransactionRecordByConditionAndPage/{current}/{limit}")
    public Result getTransactionRecordByConditionAndPage(@PathVariable("current") Integer current,
                                                         @PathVariable("limit") Integer limit,
                                                         @RequestBody TransactionRecordDto transactionRecordDto){
        PageInfo<TransactionRecord> transactionRecordPageInfo = saleManageService.getTransactionRecordByConditionAndPage(current, limit, transactionRecordDto);
        return Result.build(transactionRecordPageInfo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 保存交易记录
     * @param transactionRecord
     * @return
     */
    @PostMapping("/saveTransactionRecord")
    public Result saveTransactionRecord(@RequestBody TransactionRecord transactionRecord){
        try {
            saleManageService.saveTransactionRecord(transactionRecord);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "保存交易记录失败，请联系开发者~~");
        }
    }

    /**
     * 根据id删除交易记录
     * @param id
     * @return
     */
    @DeleteMapping("/deleteTransactionRecordById/{id}")
    public Result deleteTransactionRecordById(@PathVariable("id") String id){
        try {
            saleManageService.deleteTransactionRecordById(id);
            return Result.build(null, ResultCodeEnum.SUCCESS);
        } catch (Exception e) {
            return Result.build(null, 500, "删除交易记录失败，请联系开发者~~");
        }
    }

    /**
     * 获取客户分析数据【客户提成金额排名】
     * @return
     */
    @GetMapping("/getCustomerAnalyseData")
    public Result getCustomerAnalyseData(){
        Map<String, Object> map = saleManageService.getCustomerAnalyseData();
        return Result.build(map, ResultCodeEnum.SUCCESS);
    }
}
