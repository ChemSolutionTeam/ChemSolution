import axios from 'axios'
import storage from '../store/index'

const API = axios.create({
  baseURL: 'https://chemsolution-re-api-v2.azurewebsites.net/api',
  headers: {
    'Access-Control-Allow-Origin': '*',
    Accept: 'text/plan',
    'Content-Type': 'application/json',
  },
})
export default {
  //Token queries
  async getToken({ email, password }) {
    await API.post('/Auth/login', {
      email: email,
      password: password,
    })
      .then((res) => {
        storage.commit('setToken', res.data.accessToken)
        localStorage.setItem('accessToken', res.data.accessToken)
        storage.state.username = res.data.username
        storage.state.email = email.email

        console.log(res)
      })
      .catch((e) => {
        console.info(e)
      })
  },

  //User queries
  //Регистрация
  async postUser(user) {
    await API.post(
      '/Auth/register',
      {
        userEmail: user.email,
        userName: user.username,
        dateOfBirth: user.birthDate,
        password: user.pass,
      },
      {
        headers: {
          Authorization: 'Bearer ' + storage.state.token,
        },
      }
    ).catch((e) => {
      console.error(e)
    })
  },

  getUsers() {
    API.get('/Users', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    })
      .then((resp) => {
        let data = resp.data
        console.log(data)
      })
      .catch((e) => console.error(e))
  },

  async getUser() {
    return API.get('/Users/', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((e) => console.error(e))
  },

  deleteUser(id) {
    API.delete('/Users/' + id, {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => console.error(e))
  },

  resetUser() {
    //TODO USER PUT request
  },

  async getUsersByRating() {
    return API.get('/Users/rating', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((e) => console.error(e))
  },

  //Request queries
  async getRequests() {
    return API.get('/Requests/OwnRequests', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((e) => {
      console.error(e)
    })
  },

  async postRequest(request) {
    console.info(request)
    await API.post(
      '/Requests',
      {
        userEmail: request.userEmail,
        theme: request.theme,
        text: request.text,
        dateTimeSended: request.dateTimeSended,
        statusId: 1,
      },
      {
        headers: {
          Authorization: 'Bearer ' + storage.state.token,
        },
      }
    )
  },

  getRequest(id) {
    API.get('/Requests/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  putRequest() {
    //TODO PUT Request
  },
  deleteRequest(id) {
    API.delete('/Requests' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //Materials queries
  getMaterials() {
    API.get('/Materials', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  postMaterial(material) {
    material
    API.post('/Materials', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  getMaterial(id) {
    API.get('/Materials/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  putMaterial(id) {
    id
    //TODO PUT Material
  },

  deleteMaterial(id) {
    API.delete('/Materials/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  async searchMaterial(value) {
    return API.post(
      '/Materials/search',
      { value: value },
      {
        headers: {
          Authorization: 'Bearer ' + storage.state.token,
        },
      }
    ).catch((e) => {
      console.error(e)
      return 'Fail'
    })
  },

  //MaterialGroups queries
  getMGroups() {
    API.get('/MaterialGroups', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  postMGroup(group) {
    group
    API.post('/MaterialGroups', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  getMGroup(id) {
    API.get('/MaterialGroups/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  putMGroup(id) {
    id
    //TODO PUT MaterialGroup
  },

  deleteMGroup(id) {
    API.delete('/MaterialGroups/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //Elements queries
  getElements() {
    return (
      API.get('/Elements', {
        headers: {
          Authorization: 'Bearer' + storage.state.token,
        },
      })
        /*.then((resp) => {
          console.log(resp)
           let data = resp.data
          if (data.length !== 0)
            return data
        })*/
        .catch((e) => {
          console.error(e)
        })
    )
  },

  postElement(element) {
    element
    API.post('/Elements', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  async getElement(id) {
    const el = await API.get('/Elements/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    }).catch((e) => {
      console.error(e)
    })
    return el
  },

  putElement(element) {
    alert(element)
    //TODO PUT Element
  },

  deleteElement(id) {
    API.delete('/Elements/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //BlogPosts queries
  getBlogPosts() {
    API.get('/BlogPosts', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  postBlogPost(blogPost) {
    blogPost
    API.post('/BlogPosts', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  getBlogPost(id) {
    API.get('/BlogPosts/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  putBlogPost(id) {
    id
    //TODO PUT BlogPosts
  },

  deleteBlogPost(id) {
    API.delete('/BlogPosts/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //Achievements queries
  async getAchievements() {
    return API.get('/Achievements/OwnAchievements', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((e) => {
      console.error(e)
    })
  },

  postAchievement(achievement) {
    achievement
    API.post('/Achievements', {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  async getAchievement(id) {
    return API.get('/Achievements/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    }).catch((e) => {
      console.error(e)
    })
  },

  putAchievement(id) {
    id
    //TODO PUT Achievements
  },

  deleteAchievement(id) {
    API.delete('/Achievements/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    })
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //recovering Password
  recoverPassword(email, newPassword) {
    API.post('/UserSecurity/RecoverPassword/' + email + '/' + newPassword, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
      },
    }).catch((e) => {
      console.error(e)
    })
  },

  //buy element
  buyElements(id) {
    API.post(
      '/Donate/buy/element/' + id,
      { value: id },
      {
        headers: {
          Authorization: 'Bearer ' + storage.state.token,
        },
      }
    ).catch((e) => {
      console.error(e)
      return 'Fail'
    })
  },

  async getDonate(amount) {
    return API.get('/Donate?amount=' + parseInt(amount), {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((error) => {
      console.error(error)
    })
  },

  async postDonate(data, signature) {
    return API.post(
      '/Donate/',
      {
        data: data,
        signature: signature,
      },
      {
        headers: {
          Authorization: 'Bearer ' + storage.state.token,
        },
      }
    ).catch((error) => {
      console.error(error)
    })
  },
}
