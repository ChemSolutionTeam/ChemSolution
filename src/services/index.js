import axios from 'axios'
import storage from '../store/index'
const API = axios.create({
  // baseURL: 'http://192.168.0.104:5001',
  //baseURL: 'http://192.168.1.8:5001',
  // baseURL: 'https://localhost:5001',
  baseURL: 'https://chemsolutionapi.azurewebsites.net',
  headers: {
    'Access-Control-Allow-Origin': '*',
    Accept: 'text/plan',
    'Content-Type': 'application/json',
  },
})
export default {
  //Token queries
  async getToken(user) {
    await API.post('/getjwt?email=' + user.email + '&password=' + user.password)
      .then((resp) => {
        storage.commit('setToken', resp.data.access_token)
        storage.state.username = resp.data.username
        storage.state.email = user.email

        console.log(resp)
      })
      .catch((e) => {
        console.info(e)
      })
  },

  //User queries
  //Регистрация
  async postUser(user) {
    await API.post(
      '/Users',
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

  getUser() {
    return API.get('/Users/', {
      headers: {
        Authorization: 'Bearer ' + storage.state.token,
      },
    }).catch((e) => console.error(e))
  },
  deleteUser(id) {
    API.delete('/Users/' + id, {
      headers: {
        Authorization: 'Bearer' + storage.state.token,
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
  getUsersByRating() {
    return API.get('/Users/rating').catch((e) => console.error(e))
  },

  //Request queries
  getRequests() {
    return API.get('/Requests').catch((e) => {
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
        statusId: 0,
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
  getRequest(id) {
    API.get('/Requests/' + id)
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
    API.delete('/Requests' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //Materials queries
  getMaterials() {
    API.get('/Materials')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  postMaterial(material) {
    material
    API.post('/Materials')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getMaterial(id) {
    API.get('/Materials/' + id)
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
    API.delete('/Materials/' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  searchMaterial(value) {
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
    API.get('/MaterialGroups')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  postMGroup(group) {
    group
    API.post('/MaterialGroups')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getMGroup(id) {
    API.get('/MaterialGroups/' + id)
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
    API.delete('/MaterialGroups/' + id)
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
      API.get('/Elements')
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
    API.post('/Elements')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getElement(id) {
    return API.get('/Elements/' + id).catch((e) => {
      console.error(e)
    })
  },
  putElement(element) {
    alert(element)
    //TODO PUT Element
  },
  deleteElement(id) {
    API.delete('/Elements/' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //BlogPosts queries
  getBlogPosts() {
    API.get('/BlogPosts')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  postBlogPost(blogPost) {
    blogPost
    API.post('/BlogPosts')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getBlogPost(id) {
    API.get('/BlogPosts/' + id)
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
    API.delete('/BlogPosts/' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },

  //Achievements queries
  getAchievements() {
    return API.get('/Achievements').catch((e) => {
      console.error(e)
    })
  },
  postAchievement(achievement) {
    achievement
    API.post('/Achievements')
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  getAchievement(id) {
    return API.get('/Achievements/' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
  putAchievement(id) {
    id
    //TODO PUT Achievements
  },
  deleteAchievement(id) {
    API.delete('/Achievements/' + id)
      .then((resp) => {
        console.log(resp)
      })
      .catch((e) => {
        console.error(e)
      })
  },
}
