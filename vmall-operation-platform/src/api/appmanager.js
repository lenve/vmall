import request from '@/utils/request'

export function getCategories(data) {
  return request({
    url: '/appmanager/app/categories/',
    method: 'get',
    param: data
  })
}
