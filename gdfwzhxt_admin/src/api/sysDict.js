import request from '@/utils/request'

const base_api = '/electricity/system/dict'

//根据type查询键值对
export const GetKeyAndValueByType = type => {
  return request({
    url: `${base_api}/getKeyAndValueByType/${type}`,
    method: 'get',
  })
}

//根据type查询对应权限的账号等级(只能是自己的下级权限)
export const GetUserLevelByPower = type => {
  return request({
    url: `${base_api}/getUserLevelByPower/${type}`,
    method: 'get',
  })
}

//条件查询数据字典列表
export const GetSysDictList = (current, limit, queryDto) => {
  return request({
    url: `${base_api}/getSysDictList/${current}/${limit}`,
    method: 'get',
    params: queryDto,
  })
}

//添加修改数据字典
export const SaveDict = sysDict => {
  return request({
    url: `${base_api}/saveDict`,
    method: 'post',
    data: sysDict,
  })
}

//删除数据字典数据
export const DeleteDictById = id => {
  return request({
    url: `${base_api}/deleteDictById/${id}`,
    method: 'delete',
  })
}
