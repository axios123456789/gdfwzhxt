// 导入组件
const Layout = () => import('@/layout/index.vue')
const workOrderManagement = () =>
  import('@/views/workOrderControl/workOrderManagement.vue')
const workOrderHandleCenter = () =>
  import('@/views/workOrderControl/workOrderHandleCenter.vue')
const acceptOrderCenter = () =>
  import('@/views/workOrderControl/acceptOrderCenter.vue')
const personOrderManagement = () =>
  import('@/views/workOrderControl/personOrderManagement.vue')

// 导出该组件
export default [
  {
    path: '/workOrderControl',
    component: Layout,
    name: 'workOrderControl',
    meta: {
      title: '工单管控',
    },
    icon: 'collection',
    children: [
      {
        path: '/workOrderManagement',
        name: 'workOrderManagement',
        component: workOrderManagement,
        meta: {
          title: '工单管理',
        },
        hidden: false,
      },
      {
        path: '/workOrderHandleCenter',
        name: 'workOrderHandleCenter',
        component: workOrderHandleCenter,
        meta: {
          title: '工单受理中心',
        },
        hidden: false,
      },
      {
        path: '/acceptOrderCenter',
        name: 'acceptOrderCenter',
        component: acceptOrderCenter,
        meta: {
          title: '接单中心',
        },
        hidden: false,
      },
      {
        path: '/personOrderManagement',
        name: 'personOrderManagement',
        component: personOrderManagement,
        meta: {
          title: '个人工单管理',
        },
        hidden: false,
      },
    ],
  },
]
