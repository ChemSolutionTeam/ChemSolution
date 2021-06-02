<template>
  <Navigation
    v-on:showForm="openForm($event)"
    :isUserAuthorised="isUserAuthorised"
    v-on:logout="logout()"
  />
  <!-- <div id="nav"> -->
  <!-- <router-link to="/">Home</router-link> | -->
  <!-- <router-link to="/about">About</router-link> -->
  <!-- </div> -->
  <router-view v-on:showForm="openForm($event)" class="pt-40" />
  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'login'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <LoginForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-on:openRegister="closeForm('register')"
        v-on:openReset="closeForm('reset')"
        v-on:login="login()"
        v-show="isFormShow == 'login'"
      />
    </transition>
  </div>
  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'register'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <RegisterForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        @register="register()"
        v-show="isFormShow == 'register'"
        v-on:openLogin="closeForm('login')"
        v-on:openReset="closeForm('reset')"
      />
    </transition>
  </div>
  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'reset'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <ForgetPassForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isFormShow == 'reset'"
      />
    </transition>
  </div>

  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'shop'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <ShopForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isFormShow == 'shop'"
      />
    </transition>
  </div>

  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'requests'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <UserRequests
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isFormShow == 'requests'"
        v-on:openCreateRequest="closeForm('createRequest')"
      />
    </transition>
  </div>
  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isBackgroundShown == 'createRequest'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <CreateRequestForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isFormShow == 'createRequest'"
        v-on:openUserRequests="closeForm('requests')"
      />
    </transition>
  </div>
</template>
<script>
import Navigation from '../src/components/Navigation.vue'
import LoginForm from '../src/components/LoginForm.vue'
import RegisterForm from '../src/components/RegisterForm.vue'
import ShopForm from '../src/components/ShopForm.vue'
import UserRequests from '../src/components/UserRequests.vue'
import CreateRequestForm from '../src/components/CreateRequestForm.vue'
import ForgetPassForm from '../src/components/ForgetPassForm'
import router from '@/router/index'
import apiService from '@/services/index'
import storage from '@/store/index'
// import storage from '@/store/index'
export default {
  components: {
    Navigation,
    CreateRequestForm,
    LoginForm,
    RegisterForm,
    UserRequests,
    ShopForm,
    ForgetPassForm,
  },
  data() {
    return {
      isMouseOut: true,
      isUserAuthorised: false,
      isFormShow: 'none',
      isBackgroundShown: 'none',
      role: '',
    }
  },
  methods: {
    //Open forms
    openForm(form) {
      // alert(form)
      this.isBackgroundShown = form
      this.isFormShow = form
    },

    //Form Close
    closeForm(form) {
      if (this.isMouseOut || form !== 'none') {
        this.isFormShow = 'none'
        this.hideBG(form)
      }
      if (form != 'auth') {
        this.redirect(form)
      }
    },
    redirect(form) {
      if (form != 'none') {
        setTimeout(this.openForm(form), 500)
      }
    },
    hideBG(args) {
      setTimeout(() => {
        this.isBackgroundShown = args
      }, 500)
    },
    login() {
      this.closeForm('auth')
      this.isUserAuthorised = true
      this.getRole().then(() => {
        router.push(this.role == 'Admin' ? 'Admin' : 'userPage')
      })
    },
    async getRole() {
      await apiService.getUser().then((resp) => {
        storage.state.role = resp.data.role
        this.role = resp.data.role
      })
    },
    logout() {
      this.isUserAuthorised = false
      router.push('/')
    },
    register() {
      this.login()
    },
  },
}
</script>
<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf') format('ttf');
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
