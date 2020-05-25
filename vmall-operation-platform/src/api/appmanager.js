import request from '@/utils/request'

export function getCategories(data) {
  return request({
    url: '/appmanager/app/categories/',
    method: 'get',
    params: data
  })
}
export function addCategories(data) {
  return request({
    url: '/appmanager/app/categories/',
    method: 'post',
    data: data
  })
}
export function addAppTabs(data) {
  return request({
    url: '/appmanager/app/apptabs/',
    method: 'post',
    data: data
  })
}
export function getAppTabs(data) {
  return request({
    url: '/appmanager/app/apptabs/',
    method: 'get',
    params: data
  })
}
