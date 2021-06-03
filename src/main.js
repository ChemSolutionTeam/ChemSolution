import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './index.css'
import firebase from 'firebase'

createApp(App).use(store).use(router).mount('#app')

const firebaseConfig = {
  apiKey: 'AIzaSyBCv-60c3AWlcc-e5t82hBn8MhrJlCYHDQ',
  authDomain: 'chem-solution.firebaseapp.com',
  projectId: 'chem-solution',
  storageBucket: 'chem-solution.appspot.com',
  messagingSenderId: '967962031381',
  appId: '1:967962031381:web:56dd8a0be805b04c74651c',
  measurementId: 'G-ESNH7DV0SX',
}

// Initialize Firebase
firebase.initializeApp(firebaseConfig)
firebase.analytics()
