// 导入组件
const Layout = () => import('@/layout/index.vue')
const lineInfo = () => import('@/views/line/lineInfo.vue')
const lineEvent = () => import('@/views/line/lineEvent.vue')

// 导出该组件
export default([
    {
        path: "/line",
        component: Layout,
        name: 'line',
        meta: {
            title: '线路管理',
        },
        icon: 'remove',
        children: [
            {
                path: '/lineInfo',
                name: 'lineInfo',
                component: lineInfo,
                meta: {
                    title: '线路信息',
                },
                hidden: false
            },
            {
                path: '/lineEvent',
                name: 'lineEvent',
                component: lineEvent,
                meta: {
                    title: '线路停电事件',
                },
                hidden: false
            }
        ]
    }
])