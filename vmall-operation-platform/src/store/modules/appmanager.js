import { getCategories } from '@/api/appmanager'
import { addCategories } from '@/api/appmanager'

const state = {}

const mutations = {}
const actions = {

  getCategories({ commit }, data) {
    return new Promise((resolve, reject) => {
      getCategories(data).then(response => {
        resolve(response)
      }).catch(error => {
        reject(error)
      })
    })
  },
  addCategories({ commit }, data) {
    return new Promise((resolve, reject) => {
      addCategories(data).then(response => {
        resolve(response)
      }).catch(error => {
        reject(error)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
