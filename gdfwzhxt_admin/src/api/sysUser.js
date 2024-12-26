import request from "@/utils/request";

const base_api = '/electricity/system/sysUser'

//用户列表
export const GetSysUserListByPage = (current, limit, queryDto) => {
    return request({
        url: `${base_api}/findByPage/${current}/${limit}`,
        method: 'post',
        data: queryDto
    })
}

//保存用户
export const SaveSysUser = (sysUser) => {
    return request({
        url: `${base_api}/saveUser`,
        method: 'post',
        data: sysUser
    })
}

//根据id删除用户
export const DeleteUserById = (userId) => {
    return request({
        url: `${base_api}/deleteUserById/${userId}`,
        method: 'post',
    })
}