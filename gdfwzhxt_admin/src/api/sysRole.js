import request from "@/utils/request";

const base_api = '/electricity/system/sysRole'

//角色列表
export const GetSysRoleListByPage = (current, limit, queryDto) => {
    return request({
        //``模板字符串
        url: `${base_api}/findByPage/${current}/${limit}`,
        method: 'get',
        //接口@requestBody 前端 data：名称，以json格式传输
        //接口没有注解，前端 params：名称
        params: queryDto
    })
}

//添加或修改
export const SaveRole = (sysRole) => {
    return request({
        url: `${base_api}/saveRole`,
        method: 'post',
        data: sysRole
    })
}

//删除角色
export const DeleteRoleById = (roleId) => {
    return request({
        url: `${base_api}/deleteRoleById/${roleId}`,
        method: 'delete'
    })
}