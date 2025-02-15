import request from '@/utils/request'

const base_api = '/electricity/unit'

//单位列表
export const findNodes = () => {
  return request({
    url: `${base_api}/findNodes`,
    method: 'get',
  })
}

//添加单位
export const addUnit = unit => {
  return request({
    url: `${base_api}/addUnit`,
    method: 'post',
    data: unit,
  })
}

//修改单位
export const updateUnit = unit => {
  return request({
    url: `${base_api}/updateUnit`,
    method: 'put',
    data: unit,
  })
}

//删除单位
export const deleteUnitByUnitId = unitId => {
  return request({
    url: `${base_api}/deleteUnitByUnitId/${unitId}`,
    method: 'delete',
  })
}

//条件分页查询单位列表
export const GetUnitListByConditionAndPage = (current, limit, queryUnitDto) => {
  return request({
    url: `${base_api}/getUnitListByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: queryUnitDto,
  })
}
