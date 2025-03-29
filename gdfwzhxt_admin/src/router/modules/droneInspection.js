// 导入组件
const Layout = () => import('@/layout/index.vue')
const inspectionRecord = () =>
  import('@/views/droneInspection/inspectionRecord.vue')
const inspectionWorkOrder = () =>
  import('@/views/droneInspection/inspectionWorkOrder.vue')

// 导出该组件
export default [
  {
    path: '/droneInspection',
    component: Layout,
    name: 'droneInspection',
    meta: {
      title: '无人机巡视',
    },
    icon: 'promotion',
    children: [
      {
        path: '/inspectionRecord',
        name: 'inspectionRecord',
        component: inspectionRecord,
        meta: {
          title: '巡视记录',
        },
        hidden: false,
      },
      {
        path: '/inspectionWorkOrder',
        name: 'inspectionWorkOrder',
        component: inspectionWorkOrder,
        meta: {
          title: '巡视工单',
        },
        hidden: false,
      },
    ],
  },
]
