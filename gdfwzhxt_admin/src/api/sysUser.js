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