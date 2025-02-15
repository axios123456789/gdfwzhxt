// 导入组件
const Layout = () => import('@/layout/index.vue')
const consInfo = () => import('@/views/cons/consInfo.vue')
const consEvent = () => import('@/views/cons/consEvent.vue')
const consEventReport = () => import('@/views/cons/consEventReport.vue')
const customerFeedback = () => import('@/views/cons/customerFeedback.vue')
const electricityRechargeHistory = () =>
  import('@/views/cons/electricityRechargeHistory.vue')
const electricityUsageStatus = () =>
  import('@/views/cons/electricityUsageStatus.vue')

// 导出该组件
export default [
  {
    path: '/cons',
    component: Layout,
    name: 'cons',
    meta: {
      title: '用电户管理',
    },
    icon: 'user',
    children: [
      {
        path: '/consInfo',
        name: 'consInfo',
        component: consInfo,
        meta: {
          title: '用户信息',
        },
        hidden: false,
      },
      {
        path: '/consEvent',
        name: 'consEvent',
        component: consEvent,
        meta: {
          title: '用户停电事件',
        },
        hidden: false,
      },
      {
        path: '/consEventReport',
        name: 'consEventReport',
        component: consEventReport,
        meta: {
          title: '用户停电事件报表',
        },
        hidden: false,
      },
      {
        path: '/customerFeedback',
        name: 'customerFeedback',
        component: customerFeedback,
        meta: {
          title: '客户反馈',
        },
        hidden: false,
      },
      {
        path: '/electricityRechargeHistory',
        name: 'electricityRechargeHistory',
        component: electricityRechargeHistory,
        meta: {
          title: '电费充值记录',
        },
        hidden: false,
      },
      {
        path: '/electricityUsageStatus',
        name: 'electricityUsageStatus',
        component: electricityUsageStatus,
        meta: {
          title: '电能使用情况',
        },
        hidden: false,
      },
    ],
  },
]
