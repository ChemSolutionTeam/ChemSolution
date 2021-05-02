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
        <Link label="Home" />
        <Link label="test" />
        <Link />
      </div>
      <div>
        <button
          class="block mt-4 lg:inline-block lg:mt-0 text-white hover:text-cslightgreen"
          @click="openForm('login')"
        >
          Авторизуватися
        </button>
        <button
          @click="openForm('register')"
          class="inline-block ml-6 h-10 text-lg items-center bg-gradient-to-t from-csgreen to-cslightgreen px-4 py-2 leading-none border rounded text-csblack border-csgreen hover:border-transparent mt-4 lg:mt-0"
        >
          Зареєструватися
        </button>
      </div>
    </div>
  </nav>
  <div
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
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
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
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
    class="inset-0 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
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
      isFormShow: 'none',
      isBackgroundShown: 'none',
    }
  },
  methods: {
    //Open forms
    openForm(form) {
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
