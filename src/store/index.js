import { createStore } from 'vuex'
import apiService from '@/services/index'
export default createStore({
  state() {
    return {
      token: '',
      username: '',
      role: '',
      email: '',
      currentPage: 'Домашня сторінка',
      authorizeProgress: 0,
      balance: 0,
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
  actions: {
    getBalance() {
      if (this.state.token.length !== 0) {
        apiService.getUser().then((resp) => {
          this.state.balance = resp.data.balance
        })
      }
    },
  },
  modules: {},
})
