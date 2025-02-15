// 导入组件
const Layout = () => import('@/layout/index.vue')
const transformerInfo = () => import('@/views/transformer/transformerInfo.vue')
const transformerEvent = () =>
  import('@/views/transformer/transformerEvent.vue')
const transformerEventReport = () =>
  import('@/views/transformer/transformerEventReport.vue')

// 导出该组件
export default [
  {
    path: '/transformer',
    component: Layout,
    name: 'transformer',
    meta: {
      title: '台区管理',
    },
    icon: 'place',
    children: [
      {
        path: '/transformerInfo',
        name: 'transformerInfo',
        component: transformerInfo,
        meta: {
          title: '变压器信息',
        },
        hidden: false,
      },
      {
        path: '/transformerEvent',
        name: 'transformerEvent',
        component: transformerEvent,
        meta: {
          title: '台区停运事件',
        },
        hidden: false,
      },
      {
        path: '/transformerEventReport',
        name: 'transformerEventReport',
        component: transformerEventReport,
        meta: {
          title: '台区停运事件报表',
        },
        hidden: false,
      },
    ],
  },
]
