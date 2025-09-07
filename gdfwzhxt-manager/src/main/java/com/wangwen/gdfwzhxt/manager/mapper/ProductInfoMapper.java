package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.saleManage.ProductInfoDto;
import com.wangwen.gdfwzhxt.model.entity.saleManage.ProductInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ProductInfoMapper {
    //条件查询所有产品信息
    List<ProductInfo> getProductInfoByCondition(ProductInfoDto productInfoDto);

    //添加产品信息
    void addProductInfo(ProductInfo productInfo);

    //修改产品信息
    void updateProductInfo(ProductInfo productInfo);

    //根据id删除产品信息
    @Delete("delete from t_product_info where id = #{param1}")
    void deleteProductInfoById(String id);

    //根据产品id将产品库存减一
    @Update("update t_product_info set product_number = ifnull(product_number, 0) - #{param2} where id = #{param1}")
    void updateProductInfoNumberById(String productId, Integer tradeCount);
}
