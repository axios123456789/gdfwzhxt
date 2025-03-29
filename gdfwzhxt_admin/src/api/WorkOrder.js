import request from '@/utils/request'

const base_api = '/electricity/workOrder'

//条件分页查询工单
export const GetWorkOrderByConditionAndPage = (
  current,
  limit,
  workOrderQueryDto
) => {
  return request({
    url: `${base_api}/getWorkOrderByConditionAndPage/${current}/${limit}`,
    method: 'post',
    data: workOrderQueryDto,
  })
}

//保存工单
export const SaveWorkOrder = workOrder => {
  return request({
    url: `${base_api}/saveWorkOrder`,
    method: 'post',
    data: workOrder,
  })
}

//根据id删除工单
export const DeleteWorkOrderById = id => {
  return request({
    url: `${base_api}/deleteWorkOrderById/${id}`,
    method: 'delete',
  })
}

//推送工单
export const PushWorkOrder = workOrder => {
  return request({
    url: `${base_api}/pushWorkOrder`,
    method: 'put',
    data: workOrder,
  })
}

//催受理工单
export const UrgeToProcess = workOrder => {
  return request({
    url: `${base_api}/urgeToProcess`,
    method: 'put',
    data: workOrder,
  })
}

//受理工单
export const ProcessWorkOrder = workOrder => {
  return request({
    url: `${base_api}/processWorkOrder`,
    method: 'put',
    data: workOrder,
  })
}

//催接单
export const UrgeToAccept = workOrder => {
  return request({
    url: `${base_api}/urgeToAccept`,
    method: 'put',
    data: workOrder,
  })
}

//接单
export const AcceptWorkOrder = workOrder => {
  return request({
    url: `${base_api}/acceptWorkOrder`,
    method: 'put',
    data: workOrder,
  })
}

//催办
export const UrgeToHandle = workOrder => {
  return request({
    url: `${base_api}/urgeToHandle`,
    method: 'put',
    data: workOrder,
  })
}

//条件分页查询个人接单列表
export const GetPersonAcceptByConditionAndPage = (
  current,
  limit,
  handleStatus
) => {
  return request({
    url: `${base_api}/getPersonAcceptByConditionAndPage/${current}/${limit}/${handleStatus}`,
    method: 'get',
  })
}

//根据工单编号获取工单数据
export const GetWorkOderByWorkOrderNo = workOrderNo => {
  return request({
    url: `${base_api}/getWorkOrderByWorkOrderNo/${workOrderNo}`,
    method: 'get',
  })
}

//开始受理工单
export const BeginHandleWorkOrder = id => {
  return request({
    url: `${base_api}/beginHandleWorkOrder/${id}`,
    method: 'post',
  })
}

//完成工单受理
export const achieveWorkOrderHandle = workSource => {
  return request({
    url: `${base_api}/achieveWorkOrderHandle`,
    method: 'post',
    data: workSource,
  })
}

//根据个人接单id查询个人提交材料信息
export const GetWorkSourceByAcceptId = acceptId => {
  return request({
    url: `${base_api}/getWorkSourceByAcceptId/${acceptId}`,
    method: 'get',
  })
}

//保存提交工单材料信息
export const SaveWorkSource = workSource => {
  return request({
    url: `${base_api}/updateWorkSource`,
    method: 'put',
    data: workSource,
  })
}

//提交工单材料信息
export const SubmitWorkSource = workSource => {
  return request({
    url: `${base_api}/submitWorkSource`,
    method: 'post',
    data: workSource,
  })
}

//根据工单编号查询个人接单信息
export const GetPersonAcceptByWorkOrderNo = workOrderNo => {
  return request({
    url: `${base_api}/getPersonAcceptByWorkOrderNo/${workOrderNo}`,
    method: 'get',
  })
}

//工单被驳回接口
export const RefuseWorkOrder = workSource => {
  return request({
    url: `${base_api}/refuseWorkOrder`,
    method: 'post',
    data: workSource,
  })
}

//工单通过接口
export const ReviewSuccess = personAccept => {
  return request({
    url: `${base_api}/reviewSuccess`,
    method: 'post',
    data: personAccept,
  })
}

//根据材料编号查询个人工单材料提交信息和个人接单信息
export const GetPersonAcceptAndWorkSourceByWorkSourceNo = workSourceNo => {
  return request({
    url: `${base_api}/getPersonAcceptAndWorkSourceByWorkSourceNo/${workSourceNo}`,
    method: 'get',
  })
}
