<template>
  <nav
    class="flex items-center justify-between flex-wrap bg-csblack p-2 mb-0 shadow-lg"
  >
    <div
      class="hover:animate-spin transform md:scale-50 lg:scale-100 flex items-center flex-shrink-0 text-white ml-3 mr-6"
    >
      <Logo width="75" />
    </div>
    <div class="block lg:hidden">
      <button
        class="flex items-center px-3 py-2 border rounded text-teal-200 border-teal-400 hover:text-white hover:border-white"
      >
        <svg
          class="fill-current h-3 w-3"
          viewBox="0 0 20 20"
          xmlns="http://www.w3.org/2000/svg"
        >
          <title>Menu</title>
          <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
        </svg>
      </button>
    </div>
    <div
      class="w-full h-full block flex-grow lg:flex lg:items-center lg:mr-6 lg:ml-9 lg:w-auto"
    >
      <div class="text-lg lg:flex-grow flex justify-start">
        <Link />
        <Link />
        <Link :isCurrent="true" />
      </div>
      <div>
        <button
          class="block mt-4 lg:inline-block lg:mt-0 text-white hover:text-cslightgreen"
          @click="openLoginForm()"
        >
          Авторизуватися
        </button>
        <button
          @click="openRegisterForm()"
          class="inline-block ml-6 h-10 text-lg items-center bg-gradient-to-t from-csgreen to-cslightgreen px-4 py-2 leading-none border rounded text-csblack border-csgreen hover:border-transparent mt-4 lg:mt-0"
        >
          Зареєструватися
        </button>
      </div>
    </div>
  </nav>
  <div
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isLoginBackgroundShown"
    @click="closeLoginForm"
  >
    <transition name="bounce">
      <LoginForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-on:openRegister="closeLoginForm('register')"
        v-on:openReset="closeLoginForm('reset')"
        v-on:login="closeLoginForm('login')"
        v-show="isLoginShown"
      />
    </transition>
  </div>
  <div
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isRegisterBackgroundShown"
    @click="closeRegisterForm"
  >
    <transition name="bounce">
      <RegisterForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isRegisterShown"
        v-on:openLogin="closeRegisterForm('login')"
        v-on:openReset="closeRegisterForm('reset')"
      />
    </transition>
  </div>
  <div
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="isResetBackgroundShown"
    @click="closeResetForm"
  >
    <transition name="bounce">
      <ForgetPassForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isResetShown"
      />
    </transition>
  </div>
</template>

<script>
import Link from '../components/NavigationLink.vue'
import LoginForm from '../components/LoginForm.vue'
import RegisterForm from '../components/RegisterForm.vue'
import ForgetPassForm from '../components/ForgetPassForm.vue'
import Logo from '../components/Logo.vue'

export default {
  name: 'Navigation',
  components: { Link, LoginForm, RegisterForm, ForgetPassForm, Logo },
  data() {
    return {
      isMouseOut: true,
      isLoginShown: false,
      isRegisterShown: false,
      isResetShown: false,
      isLoginBackgroundShown: false,
      isRegisterBackgroundShown: false,
      isResetBackgroundShown: false,
    }
  },
  methods: {
    //Open forms
    openLoginForm() {
      console.log('Open LoginForm')
      this.isLoginBackgroundShown = true
      this.isLoginShown = true
    },
    openResetForm() {
      console.log('Open ResetForm')
      this.isResetBackgroundShown = true
      this.isResetShown = true
    },
    openRegisterForm() {
      console.log('Open LoginForm')
      this.isRegisterBackgroundShown = true
      this.isRegisterShown = true
    },

    //Form Close

    closeLoginForm(args) {
      if (this.isMouseOut || args.length > 0) {
        this.isLoginShown = false
        setTimeout(this.hideBG, 500)
        console.log('Close LoginForm')
      }
      if (args != 'login') {
        this.redirect(args)
      }
    },
    closeResetForm(args) {
      if (this.isMouseOut || args.length > 0) {
        this.isResetShown = false
        setTimeout(this.hideBG, 500)
        console.log('Close ResetForm')
      }
      this.redirect(args)
    },

    closeRegisterForm(args) {
      if (this.isMouseOut || args.length > 0) {
        this.isRegisterShown = false
        setTimeout(this.hideBG, 500)
        console.log('Close RegisterForm')
      }
      this.redirect(args)
    },
    redirect(args) {
      switch (args) {
        case 'register':
          setTimeout(this.openRegisterForm, 500)
          break
        case 'reset':
          setTimeout(this.openResetForm, 500)
          break
        case 'login':
          setTimeout(this.openLoginForm, 500)
          break
        default:
          break
      }
    },
    hideBG() {
      this.isLoginBackgroundShown = false
      this.isRegisterBackgroundShown = false
      this.isResetBackgroundShown = false
    },
  },
}
</script>

<style>
.cls-1 {
  isolation: isolate;
}
.cls-2 {
  fill: url(#Безымянный_градиент_17);
}
.cls-3 {
  mix-blend-mode: darken;
}
.cls-4 {
  fill: #2f455c;
}
.cls-5 {
  font-size: 407.58px;
  fill: #fff;
  stroke: #278585;
  stroke-miterlimit: 10;
  stroke-width: 5px;
  font-family: ColonnaMT, Colonna MT;
}
nav {
  font-family: 'Century Gothic', serif;
  font-weight: 700;
}
button {
  font-weight: 700;
}
.bounce-enter-active {
  animation: bounce-in 0.5s;
}
.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.15);
  }
  100% {
    transform: scale(1);
  }
}
</style>
