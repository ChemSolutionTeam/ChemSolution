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
  methods: {
    //Token queries
    getToken(user) {
      API.post('/getjwt?email=' + user.email + '&password=' + user.password)
        .then((resp) => {
          storage.commit('setToken', resp.data.access_token)
        })
        .catch((e) => {
          console.error(e)
        })
    },

    //User queries
    getUsers() {
      API.get('/Users', {
        headers: {
          Authorization: 'Bearer' + storage.state.token,
        },
      })
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => console.error(e))
    },
    postUser(user) {
      user
      API.post('/Users')
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => console.error(e))
    },
    getUser(id) {
      API.get('/Users/' + id, {
        headers: {
          Authorization: 'Bearer' + storage.state.token,
        },
      })
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => console.error(e))
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

    //Request queries
    getRequests() {
      API.get('/Requests')
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => {
          console.error(e)
        })
    },
    postRequest(request) {
      request
      API.post('/Requests')
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => {
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
      API.get('/Elements')
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => {
          console.error(e)
        })
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
      API.get('/Elements/' + id)
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => {
          console.error(e)
        })
    },
    putElement(id) {
      id
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
      API.get('/Achievements')
        .then((resp) => {
          console.log(resp)
        })
        .catch((e) => {
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
      API.get('/Achievements/' + id)
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
  },
}
