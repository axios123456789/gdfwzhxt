// 导入组件
const Layout = () => import('@/layout/index.vue')
const customerInfo = () => import('@/views/saleManage/customerInfo.vue')
const productInfo = () => import('@/views/saleManage/productInfo.vue')
const transactionRecode = () =>
  import('@/views/saleManage/transactionRecode.vue')
const orderAnalyze = () => import('@/views/saleManage/orderAnalyze.vue')

// 导出该组件
export default [
  {
    path: '/saleManage',
    component: Layout,
    name: 'saleManage',
    meta: {
      title: '销售管理',
    },
    icon: 'ShoppingCart', // 主菜单图标：购物车，代表销售业务
    children: [
      {
        path: '/customerInfo',
        name: 'customerInfo',
        component: customerInfo,
        meta: {
          title: '客户信息库',
        },
        icon: 'User', // 用户图标，直接代表客户
        hidden: false,
      },
      {
        path: '/productInfo',
        name: 'productInfo',
        component: productInfo,
        meta: {
          title: '产品信息库',
        },
        icon: 'Box', // 盒子图标，代表产品/商品
        hidden: false,
      },
      {
        path: '/transactionRecode',
        name: 'transactionRecode',
        component: transactionRecode,
        meta: {
          title: '交易记录',
        },
        icon: 'Document', // 文档图标，代表记录和文档
        hidden: false,
      },
      {
        path: '/orderAnalyze',
        name: 'orderAnalyze',
        component: orderAnalyze,
        meta: {
          title: '销售订单分析',
        },
        icon: 'DataAnalysis', // 数据分析图标，代表分析功能
        hidden: false,
      },
    ],
  },
]
