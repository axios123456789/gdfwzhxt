import request from '@/utils/request'

const base_api = '/electricity/lineEvent'

//条件分页查询线路停运事件
export const GetLineEventByConditionAndPage = (
  current,
  limit,
  lineEventQueryDto
) => {
  return request({
    url: `${base_api}/getLineEventByConditionAndPage/${current}/${limit}`,
    method: 'get',
    params: lineEventQueryDto,
  })
}

//保存线路停运事件
export const SaveLineEvent = lineEvent => {
  return request({
    url: `${base_api}/saveLineEvent`,
    method: 'post',
    data: lineEvent,
  })
}

//根据id删除线路停运事件
export const DeleteLineEventById = id => {
  return request({
    url: `${base_api}/deleteLineEventById/${id}`,
    method: 'delete',
  })
}

//根据线路停运事件id查询线路停运事件信息
export const GetLineEventById = id => {
  return request({
    url: `${base_api}/getLineEventById/${id}`,
    method: 'get',
  })
}
