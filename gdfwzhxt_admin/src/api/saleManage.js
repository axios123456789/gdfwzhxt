import request from '@/utils/request'

const api_name = '/electricity/saleManage'

//条件分页查询客户信息列表
export const GetCustomerInfoByConditionAndPage = (
  current,
  limit,
  customerInfoQueryDto
) => {
  return request({
    url: `${api_name}/getCustomerInfoByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: customerInfoQueryDto,
  })
}

//保存客户信息
export const SaveCustomerInfo = customerInfo => {
  return request({
    url: `${api_name}/saveCustomerInfo`,
    method: 'post',
    data: customerInfo,
  })
}

//根据id删除客户信息
export const DeleteCustomerInfoById = id => {
  return request({
    url: `${api_name}/deleteCustomerInfoById/${id}`,
    method: 'delete',
  })
}

//条件分页查询产品信息
export const GetProductInfoByConditionAndPage = (
  current,
  limit,
  productInfoQueryDto
) => {
  return request({
    url: `${api_name}/getProductInfoByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: productInfoQueryDto,
  })
}

//保存产品信息
export const SaveProductInfo = productInfo => {
  return request({
    url: `${api_name}/saveProductInfo`,
    method: 'post',
    data: productInfo,
  })
}

//根据id删除产品信息
export const DeleteProductInfoById = id => {
  return request({
    url: `${api_name}/deleteProductInfoById/${id}`,
    method: 'delete',
  })
}
