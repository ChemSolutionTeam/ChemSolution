import axios from 'axios'
import storage from '../store/index'
const API = axios.create({
  baseURL: 'https://localhost:5001',
  headers: {
    'Access-Control-Allow-Origin': '*',
    Accept: 'text/plan',
    'Content-Type': 'application/json',
  },
})
export default {
  getToken(email, password) {
    API.post('/getjwt?email=' + email + '&password=' + password)
      .then((resp) => {
        storage.commit('setToken', resp.data.access_token)
        this.getTest()
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getTest() {
    API.get('/Users', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    }).then((resp) => {
      console.info(resp)
    })
  },
}
