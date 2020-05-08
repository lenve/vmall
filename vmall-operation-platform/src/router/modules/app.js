/** 商品中心相关路由 **/

import Layout from '@/layout'

const appRouter = {
  path: '/app',
  component: Layout,
  redirect: 'noRedirect',
  name: 'App',
  meta: {
    title: 'App管理',
    icon: 'chart'
  },
  children: [
    {
      path: 'categories',
      component: () => import('@/views/app/categories'),
      name: 'Categories',
      meta: { title: '类目运营', noCache: true }
    }, {
      path: 'navigation',
      component: () => import('@/views/app/navigation'),
      name: 'Navigation',
      meta: { title: '导航label', noCache: true }
    },
    {
      path: 'banner',
      component: () => import('@/views/app/banner'),
      name: 'Banner',
      meta: { title: '首页Banner', noCache: true }
    },
    {
      path: 'launcher',
      component: () => import('@/views/app/launcher'),
      name: 'Launcher',
      meta: { title: '启动页管理', noCache: true }
    }
  ]
}

export default appRouter
