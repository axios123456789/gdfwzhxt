import request from "@/utils/request";

const base_api = '/electricity/system/dict'

//根据type查询键值对
export const GetKeyAndValueByType = type => {
    return request({
        url: `${base_api}/getKeyAndValueByType/${type}`,
        method: 'get'
    })
}