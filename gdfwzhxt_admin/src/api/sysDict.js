import request from "@/utils/request";

const base_api = '/electricity/system/dict'

//根据type查询键值对
export const GetKeyAndValueByType = type => {
    return request({
        url: `${base_api}/getKeyAndValueByType/${type}`,
        method: 'get'
    })
}

//根据type查询对应权限的账号等级(只能是自己的下级权限)
export const GetUserLevelByPower = type => {
    return request({
        url: `${base_api}/getUserLevelByPower/${type}`,
        method: 'get'
    })
}