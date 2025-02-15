import request from '@/utils/request'

const base_api = '/electricity/drone'

//条件分页查询无人机列表
export const GetDroneInfoByConditionAndPage = (
  current,
  limit,
  droneQueryDto
) => {
  return request({
    url: `${base_api}/getDroneInfoListByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: droneQueryDto,
  })
}

//保存无人机信息
export const SaveDroneInfo = droneInfo => {
  return request({
    url: `${base_api}/saveDroneInfo`,
    method: 'post',
    data: droneInfo,
  })
}

//根据id删除无人机信息
export const DeleteDroneInfoById = id => {
  return request({
    url: `${base_api}/deleteDroneInfoById/${id}`,
    method: 'delete',
  })
}
