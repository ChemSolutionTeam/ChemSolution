import { createStore } from 'vuex'

export default createStore({
  state() {
    return {
      token: '',
      username: '',
      role: '',
      email: '',
      currentPage: 'Домашня сторінка',
      authorizeProgress: 0,
    }
  },
  mutations: {
    setToken(state, t) {
      state.token = t
    },

    setCurrentPage(state, page) {
      state.currentPage = page
    },
  },
  actions: {},
  modules: {},
})
