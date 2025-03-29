import request from '@/utils/request'

const base_api = '/electricity/transformerEvent'

//条件分页查询配变停电事件
export const GetTransformerEventByConditionAndPage = (
  current,
  limit,
  transformerEventQueryDto
) => {
  return request({
    url: `${base_api}/getTransformerEventByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: transformerEventQueryDto,
  })
}

//保存配变停运事件
export const SaveTransformerEvent = transformerEvent => {
  return request({
    url: `${base_api}/saveTransformerEvent`,
    method: 'post',
    data: transformerEvent,
  })
}

//删除配变停运事件
export const DeleteTransformerEventByDataId = dataId => {
  return request({
    url: `${base_api}/deleteTransformerEventByDataId/${dataId}`,
    method: 'delete',
  })
}

//根据配变停运事件id查询配变停运事件
export const GetTransformerEventById = id => {
  return request({
    url: `${base_api}/getTransformerEventById/${id}`,
    method: 'get',
  })
}
