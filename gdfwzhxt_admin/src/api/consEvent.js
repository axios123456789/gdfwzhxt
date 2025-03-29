import request from '@/utils/request'

const base_api = '/electricity/consEvent'

//条件分页查询用户停电事件列表
export const GetConsEventByConditionAndPage = (
  current,
  limit,
  consEventQueryDto
) => {
  return request({
    url: `${base_api}/getConsEventByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: consEventQueryDto,
  })
}

//保存用户停电事件
export const SaveConsEvent = consEvent => {
  return request({
    url: `${base_api}/saveConsEvent`,
    method: 'post',
    data: consEvent,
  })
}

//更具eventId删除用户停电事件
export const DeleteConsEventByEventId = eventId => {
  return request({
    url: `${base_api}/deleteConsEventByEventId/${eventId}`,
    method: 'delete',
  })
}

//根据用户停运事件id查询用户停运事件信息
export const GetConsEventById = id => {
  return request({
    url: `${base_api}/getConsEventById/${id}`,
    method: 'get',
  })
}
