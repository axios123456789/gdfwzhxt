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

//条件分页查询无人机巡视记录
export const GetViewRecordByConditionAndPage = (
  current,
  limit,
  viewRecordDto
) => {
  return request({
    url: `${base_api}/getViewRecordByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: viewRecordDto,
  })
}

//保存无人机巡视记录
export const SaveViewRecord = viewRecord => {
  return request({
    url: `${base_api}/saveViewRecord`,
    method: 'post',
    data: viewRecord,
  })
}

//根据id删除无人机巡视记录
export const DeleteViewRecordById = id => {
  return request({
    url: `${base_api}/deleteViewRecord/${id}`,
    method: 'delete',
  })
}

//记录扭转
export const ViewRecordChange = (viewRecord, changeFlag) => {
  return request({
    url: `${base_api}/viewRecordChange/${changeFlag}`,
    method: 'post',
    data: viewRecord,
  })
}
