/** 商品中心相关路由 **/

import Layout from '@/layout'

const cmsRouter = {
  path: '/cms',
  component: Layout,
  redirect: 'noRedirect',
  name: 'Cms',
  meta: {
    title: '内容管理',
    icon: 'chart'
  },
  children: [
    {
      path: '',
      component: () => import('@/views/cms/cms'),
      name: 'Cms',
      meta: { title: '内容管理', noCache: true }
    }
  ]
}

export default cmsRouter
