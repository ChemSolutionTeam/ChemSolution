import { createStore } from 'vuex'

export default createStore({
  state() {
    return {
      token: '',
    }
  },
  mutations: {
    setToken(state, t) {
      state.token = t
    },
  },
  actions: {},
  modules: {},
})
