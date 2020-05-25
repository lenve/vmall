/** 商品中心相关路由 **/

import Layout from '@/layout'

const merchandiseRouter = {
  path: '/merchandise',
  component: Layout,
  redirect: 'noRedirect',
  name: 'Merchandise',
  meta: {
    title: '商品中心',
    icon: 'chart'
  },
  children: [
    {
      path: '',
      component: () => import('@/views/merchandise/merchandise'),
      name: 'Merchandise',
      meta: { title: '商品管理', noCache: true }
    }, {
      path: 'category',
      component: () => import('@/views/merchandise/category'),
      name: 'MerchandiseCategory',
      meta: { title: '商品类目', noCache: true }
    },
    {
      path: 'brand',
      component: () => import('@/views/merchandise/brand'),
      name: 'MerchandiseBrand',
      meta: { title: '品牌管理', noCache: true }
    },
    {
      path: 'attribute',
      component: () => import('@/views/merchandise/attribute'),
      name: 'MerchandiseAttribute',
      meta: { title: '属性管理', noCache: true }
    },
    {
      path: 'sku',
      component: () => import('@/views/merchandise/sku'),
      name: 'MerchandiseSku',
      meta: { title: 'SKU', noCache: true }
    },
    {
      path: 'spu',
      component: () => import('@/views/merchandise/spu'),
      name: 'MerchandiseSpu',
      meta: { title: 'SPU', noCache: true }
    },
    {
      path: 'search',
      component: () => import('@/views/merchandise/search'),
      name: 'MerchandiseSearch',
      meta: { title: '商品搜索', noCache: true }
    },
    {
      path: 'appraisal',
      component: () => import('@/views/merchandise/appraisal'),
      name: 'MerchandiseAppraisal',
      meta: { title: '商品评价', noCache: true }
    },
    {
      path: 'recommend',
      component: () => import('@/views/merchandise/recommend'),
      name: 'MerchandiseRecommend',
      meta: { title: '商品推荐', noCache: true }
    }
  ]
}

export default merchandiseRouter
