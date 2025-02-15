import request from '@/utils/request'

const base_api = '/electricity/transformerInfo'

//条件分页查询变压器信息列表
export const GetTransformerInfoListByConditionAndPage = (
  current,
  limit,
  queryTransformerDto
) => {
  return request({
    url: `${base_api}/getTransformerInfoListByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: queryTransformerDto,
  })
}

//保存变压器信息
export const SaveTransformerInfo = transformerInfo => {
  return request({
    url: `${base_api}/saveTransformerInfo`,
    method: 'post',
    data: transformerInfo,
  })
}

//根据id删除变压器信息
export const DeleteTransformerInfoById = id => {
  return request({
    url: `${base_api}/deleteTransformerInfoById/${id}`,
    method: 'delete',
  })
}
