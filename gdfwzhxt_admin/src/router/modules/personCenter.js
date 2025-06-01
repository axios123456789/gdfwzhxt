const PersonCenter = () => import('@/views/personCenter/personCenter.vue')

export default [
  {
    path: '/personCenter',
    name: 'personCenter',
    component: PersonCenter,
    meta: {
      title: '个人中心',
    },
  },
]
