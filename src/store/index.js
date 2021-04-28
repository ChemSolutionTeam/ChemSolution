import { createStore } from 'vuex'

export default createStore({
  state() {
    return {
      token: '',
      username: '',
      email: '',
    }
  },
  mutations: {
    setToken(state, t) {
      state.token = t
    },
    setUser(state, user) {
      state.username = user.username
      state.email = user.email
    },
  },
  actions: {},
  modules: {},
})
