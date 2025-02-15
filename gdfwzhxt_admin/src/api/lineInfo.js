import request from '@/utils/request'

const base_api = '/electricity/lineInfo'

//单位列表
export const findNodes = () => {
  return request({
    url: `${base_api}/findNodes`,
    method: 'get',
  })
}

//添加线路信息
export const addLineInfo = lineInfo => {
  return request({
    url: `${base_api}/addLineInfo`,
    method: 'post',
    data: lineInfo,
  })
}

//修改线路信息
export const updateLineInfo = lineInfo => {
  return request({
    url: `${base_api}/updateLineInfo`,
    method: 'put',
    data: lineInfo,
  })
}

//根据id删除线路
export const deleteLineInfoById = id => {
  return request({
    url: `${base_api}/deleteLineInfoById/${id}`,
    method: 'delete',
  })
}

//条件分页查询线路信息列表
export const GetLineInfoListByConditionAndPage = (
  current,
  limit,
  queryLineDto
) => {
  return request({
    url: `${base_api}/getLineInfoListByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: queryLineDto,
  })
}
