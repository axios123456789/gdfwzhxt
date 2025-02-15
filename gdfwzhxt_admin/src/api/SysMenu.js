import request from '@/utils/request'

const api_name = '/electricity/system/sysMenu'

//菜单列表
export const findNodes = () => {
  return request({
    url: `${api_name}/findNodes`,
    method: 'get',
  })
}

//添加菜单
export const addMenu = sysMenu => {
  return request({
    url: `${api_name}/addMenu`,
    method: 'post',
    data: sysMenu,
  })
}

//修改菜单
export const updateMenu = sysMenu => {
  return request({
    url: `${api_name}/updateMenu`,
    method: 'put',
    data: sysMenu,
  })
}

//删除菜单
export const deleteMenuById = id => {
  return request({
    url: `${api_name}/deleteMenuById/${id}`,
    method: 'delete',
  })
}

//查询所有菜单和角色分配过的菜单
export const getAllMenus = roleId => {
  return request({
    url: `${api_name}/findAllMenusWithRoleId/${roleId}`,
    method: 'get',
  })
}
