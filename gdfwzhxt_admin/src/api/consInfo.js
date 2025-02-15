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
