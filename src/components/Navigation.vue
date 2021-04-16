<template>
  <nav
    class="flex items-center justify-between flex-wrap bg-csblack p-2 mb-0 shadow-lg"
  >
    <div class="flex items-center flex-shrink-0 text-white ml-3 mr-6">
      <svg
        width="75"
        hight="75"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 0 512 512"
      >
        <defs>
          <radialGradient
            id="Безымянный_градиент_17"
            cx="256"
            cy="256"
            r="241"
            gradientUnits="userSpaceOnUse"
          >
            <stop offset="0.72" stop-color="#34f4c5" />
            <stop offset="1" stop-color="#18d0ea" />
          </radialGradient>
        </defs>
        <g class="cls-1">
          <g id="Слой_1" data-name="Слой 1">
            <circle class="cls-2" cx="256" cy="256" r="241" />
            <g class="cls-3">
              <path
                class="cls-4"
                d="M256,15.25a240.81,240.81,0,0,1,93.71,462.58A240.81,240.81,0,0,1,162.29,34.17,239.31,239.31,0,0,1,256,15.25m0-.25C122.9,15,15,122.9,15,256S122.9,497,256,497,497,389.1,497,256,389.1,15,256,15Z"
              />
            </g>
            <text class="cls-5" transform="translate(58.79 351.96)">Cs</text>
          </g>
        </g>
      </svg>
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
    class="inset-0 fixed pt-20 w-full h-full bg-csblack bg-opacity-50"
    v-show="isLoginBackgroundShown"
    @click="closeLoginForm"
  >
    <transition name="bounce">
      <LoginForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isLoginShown"
      />
    </transition>
  </div>
  <div
    class="inset-0 fixed pt-20 w-full h-full bg-csblack bg-opacity-50"
    v-show="isRegisterBackgroundShown"
    @click="closeRegisterForm"
  >
    <transition name="bounce">
      <RegisterForm
        @mouseleave="isMouseOut = true"
        @mouseover="isMouseOut = false"
        v-show="isRegisterShown"
      />
    </transition>
  </div>
</template>

<script>
import Link from '../components/NavigationLink.vue'
import LoginForm from '../components/LoginForm.vue'
import RegisterForm from '../components/RegisterForm.vue'

export default {
  name: 'Navigation',
  components: { Link, LoginForm, RegisterForm },
  data() {
    return {
      isMouseOut: true,
      isLoginShown: false,
      isRegisterShown: false,
      isLoginBackgroundShown: false,
      isRegisterBackgroundShown: false,
    }
  },
  methods: {
    openLoginForm() {
      console.log('Open LoginForm')
      this.isLoginBackgroundShown = true
      this.isLoginShown = true
    },
    closeLoginForm() {
      if (this.isMouseOut) {
        this.isLoginShown = false
        setTimeout(this.hideBG, 500)

        console.log('Close LoginForm')
      }
    },
    openRegisterForm() {
      console.log('Open LoginForm')
      this.isRegisterBackgroundShown = true
      this.isRegisterShown = true
    },
    closeRegisterForm() {
      if (this.isMouseOut) {
        this.isRegisterShown = false
        setTimeout(this.hideBG, 500)

        console.log('Close RegisterForm')
      }
    },
    hideBG() {
      this.isLoginBackgroundShown = false
      this.isRegisterBackgroundShown = false
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
