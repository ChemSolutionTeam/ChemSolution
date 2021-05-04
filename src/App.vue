<template>
  <Navigation v-on:showForm="openForm($event)" />
  <!-- <div id="nav"> -->
  <!-- <router-link to="/">Home</router-link> | -->
  <!-- <router-link to="/about">About</router-link> -->
  <!-- </div> -->
  <router-view v-on:showForm="openForm($event)" />
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
        v-on:login="closeForm('auth')"
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
</template>
<script>
import Navigation from '../src/components/Navigation.vue'
import LoginForm from '../src/components/LoginForm.vue'
import RegisterForm from '../src/components/RegisterForm.vue'
import ForgetPassForm from '../src/components/ForgetPassForm'
export default {
  components: { Navigation, LoginForm, RegisterForm, ForgetPassForm },
  data() {
    return {
      isMouseOut: true,
      isFormShow: 'none',
      isBackgroundShown: 'none',
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
