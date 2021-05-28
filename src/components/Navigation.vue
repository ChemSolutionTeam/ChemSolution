<template>
  <BackToTopButton :isShown="toTop" />
  <nav
    class="top-0 z-20 flex items-center justify-between flex-wrap bg-csblack p-5 m-auto shadow-2xl fixed w-full"
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
        <Link label="Головна" href="/" />
        <Link label="Admin" href="/admin" />
        <Link label="Періодична таблиця" href="/PeriodicTable" />
        <Link label="Лабораторія" href="/Workspace" />
        <Link v-if="isUserAuthorised" label="Мій профіль" href="/UserPage" />
      </div>
      <div>
        <button
          class="block mt-4 lg:inline-block focus:outline-none lg:mt-0 text-white hover:text-cslightgreen hover:scale-110 transform duration-300 ease-in-out"
          @click="openForm('login')"
        >
          Авторизуватися
        </button>
        <button
          @click="openForm('register')"
          class="inline-block ml-6 h-10 text-lg items-center bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue px-4 py-2 leading-none border rounded text-csblack border-csgreen hover:border-transparent hover:text-white transform duration-300 ease-in-out hover:scale-110 hover:animate-pulse mt-4 lg:mt-0"
        >
          Зареєструватися
        </button>
      </div>
    </div>
  </nav>
</template>

<script>
import Link from '../components/NavigationLink.vue'
import Logo from '../components/Logo.vue'
import BackToTopButton from '../components/BackToTopButton.vue'
import storage from '@/store'

export default {
  name: 'Navigation',
  emits: ['showForm'],
  components: {
    Link,
    Logo,
    BackToTopButton,
  },
  computed: {
    toTop() {
      return this.scroll.y > 200
    },
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll)
  },
  data() {
    return {
      scroll: {
        timer: 0,
        y: 0,
      },
    }
  },
  methods: {
    openForm(args) {
      this.$emit('showForm', args)
    },
    handleScroll() {
      if (this.scroll.timer) return
      this.scroll.timer = setTimeout(() => {
        this.scroll.y = window.scrollY
        clearTimeout(this.scroll.timer)
        this.scroll.timer = 0
      }, 100)
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
