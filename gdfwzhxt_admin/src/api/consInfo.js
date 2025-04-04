import request from '@/utils/request'

const base_api = '/electricity/consInfo'

//条件分页查询用户信息列表
export const GetConsInfoListByConditionAndPage = (
  current,
  limit,
  consQueryDto
) => {
  return request({
    url: `${base_api}/getConsInfoListByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: consQueryDto,
  })
}

//保存用户信息
export const SaveConsInfo = consInfo => {
  return request({
    url: `${base_api}/saveConsInfo`,
    method: 'post',
    data: consInfo,
  })
}

//根据id删除用户
export const DeleteConsInfoById = id => {
  return request({
    url: `${base_api}/deleteConsInfoById/${id}`,
    method: 'delete',
  })
}

//根据用户编号查询用户信息
export const GetConsInfoByConsNo = consNo => {
  return request({
    url: `${base_api}/getConsInfoByConsNo/${consNo}`,
    method: 'get',
  })
}

//条件分页查询电费充值记录
export const GetRechargeRecordByConditionAndPage = (
  current,
  limit,
  rechargeRecordQueryDto
) => {
  return request({
    url: `${base_api}/getRechargeRecordByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: rechargeRecordQueryDto,
  })
}

//用户电费充值
export const RechargeElectricity = rechargeRecord => {
  return request({
    url: `${base_api}/rechargeElectricity`,
    method: 'post',
    data: rechargeRecord,
  })
}

//条件分页查询电能使用情况
export const GetElectricityUsedByConditionAndPage = (
  current,
  limit,
  electricityUsedQueryDto
) => {
  return request({
    url: `${base_api}/getElectricityUsedByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: electricityUsedQueryDto,
  })
}

//条件分页查询电能使用情况明细
export const GetElectricityUsedDetailByConditionAndPage = (
  current,
  limit,
  electricityUsedQueryDto
) => {
  return request({
    url: `${base_api}/getElectricityUsedDetailByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: electricityUsedQueryDto,
  })
}

//条件查询每条电能电费使用情况数据-用于可视化
export const GetEveryDayElectricityUsedByCondition = electricityUsedQueryDto => {
  return request({
    url: `${base_api}/getEveryDayElectricityUsedByCondition`,
    method: 'get',
    params: electricityUsedQueryDto,
  })
}
