// 导入组件
const Layout = () => import('@/layout/index.vue')
const lineSource = () => import('@/views/source/entity/lineSource.vue')
const transformerSource = () =>
  import('@/views/source/entity/transformerSource.vue')
const droneSource = () => import('@/views/source/entity/droneSource.vue')
const unitSource = () => import('@/views/source/virtual/unitSource.vue')
const consSource = () => import('@/views/source/virtual/consSource.vue')

// 导出该组件
export default [
  {
    path: '/source',
    component: Layout,
    name: 'source',
    meta: {
      title: '资源管理',
    },
    icon: 'platform',
    children: [
      {
        path: '/entity',
        component: Layout,
        name: 'entity',
        meta: {
          title: '实体资源',
        },
        children: [
          {
            path: '/lineSource',
            name: 'lineSource',
            component: lineSource,
            meta: {
              title: '线路资源',
            },
            hidden: false,
          },
          {
            path: '/transformerSource',
            name: 'transformerSource',
            component: transformerSource,
            meta: {
              title: '变压器资源',
            },
            hidden: false,
          },
          {
            path: '/droneSource',
            name: 'droneSource',
            component: droneSource,
            meta: {
              title: '无人机资源',
            },
            hidden: false,
          },
        ],
      },
      {
        path: '/virtual',
        component: Layout,
        name: 'virtual',
        meta: {
          title: '虚拟资源',
        },
        children: [
          {
            path: '/unitSource',
            name: 'unitSource',
            component: unitSource,
            meta: {
              title: '单位管理',
            },
            hidden: false,
          },
          {
            path: '/consSource',
            name: 'consSource',
            component: consSource,
            meta: {
              title: '用户资源管理',
            },
            hidden: false,
          },
        ],
      },
    ],
  },
]
