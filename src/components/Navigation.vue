<template>
  <back-to-top-button :isShown="toTop" />
  <nav
    class="top-0 z-20 lg:h-auto sm:h-1/6 flex items-center justify-between flex-grow bg-csblack p-5 m-auto shadow-2xl fixed w-full"
  >
    <div
      class="transform md:scale-50 lg:scale-100 flex items-center flex-shrink text-white ml-3 mr-6"
    >
      <img :src="require('@/assets/logo2.png')" class="w-20 h-20" />
    </div>
    <div
      class="w-full h-full flex-grow flex lg:items-center lg:mr-6 lg:ml-9 lg:w-auto"
    >
      <div class="lg:text-lg sm:text-sm lg:flex-grow flex justify-start">
        <div class="flex flex-grow" v-if="!isUserAuthorised">
          <Link label="Домашня сторінка" href="/" />
          <Link label="Хімічна лабораторія" href="/Workspace" />
          <Link label="Періодична таблиця" href="/PeriodicTable" />
        </div>
        <div class="flex flex-grow" v-else>
          <div v-if="userRole === 'Admin'">
            <Link label="Редагування БД" href="/Admin" />
            <Link label="Обробка запитів" href="/Admin/Requests" />
            <Link label="Додавання адмінів" href="/Admin" />
          </div>
          <div v-else>
            <Link label="Особистий кабінет" href="/UserPage" />
            <Link label="Хімічна лабораторія" href="/Workspace" />
            <Link label="Періодична таблиця" href="/PeriodicTable" />
          </div>
        </div>
      </div>

      <div v-if="!isUserAuthorised" class="flex flex-row">
        <div
          class="block mt-4 text-lg lg:inline-block cursor-pointer self-center focus:outline-none lg:mt-0 text-white hover:text-cslightgreen hover:scale-110 transform duration-300 ease-in-out"
          @click="openForm('login')"
        >
          Авторизуватися
        </div>
        <div
          @click="openForm('register')"
          class="inline-block self-center cursor-pointer ml-6 text-lg items-center bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue px-4 py-2 leading-none border rounded text-csblack border-csgreen hover:border-transparent hover:text-white transform duration-300 ease-in-out hover:scale-110 hover:animate-pulse mt-4 lg:mt-0"
        >
          Зареєструватися
        </div>
      </div>
      <div v-else class="flex flex-row">
        <i
          v-if="userRole !== 'Admin'"
          @click="openForm('shop')"
          class="fas fa-plus-circle text-white scale-200 cursor-pointer transform mx-2 self-center hover:scale-250 duration-150 ease-in-out"
        ></i>

        <div
          class="text-white text-center flex mx-3 items-center self-center text-2xl"
          v-if="userRole !== 'Admin'"
        >
          Баланс:
          <span class="text-cslightgreen flex mx-3" @show="getBalance()">
            {{ storageBalance }}
            <img src="AtomCoinGreen.png" width="30" class="" />
          </span>
        </div>

        <button
          @click="logout()"
          class="inline-block ml-6 h-10 text-lg items-center bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue px-4 py-2 leading-none border rounded text-csblack border-csgreen hover:border-transparent hover:text-white transform duration-300 ease-in-out hover:scale-110 hover:animate-pulse mt-4 lg:mt-0"
        >
          Вийти
        </button>
      </div>
    </div>
  </nav>
</template>

<script>
import Link from '@/components/NavigationLink.vue'
import BackToTopButton from '@/components/BackToTopButton.vue'
import apiService from '@/services/index'
import storage from '@/store/index'

export default {
  name: 'Navigation',
  emits: ['showForm', 'logout'],
  props: {
    isUserAuthorised: {
      type: Boolean,
      default: false,
    },
  },
  components: {
    Link,
    BackToTopButton,
  },
  computed: {
    toTop() {
      return this.scroll.y > 200
    },
    storageBalance() {
      if (storage.state.balance === 0) {
        storage.dispatch('getBalance')
      }
      return storage.state.balance
    },
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll)
  },
  data() {
    return {
      balance: 0,
      name: '',
      userRole: '',
      scroll: {
        timer: 0,
        y: 0,
      },
    }
  },
  watch: {
    isUserAuthorised() {
      this.getBalance()
    },
  },
  methods: {
    async getBalance() {
      if (this.isUserAuthorised) {
        await apiService.getUser().then((resp) => {
          console.error(resp.data.balance)
          this.userRole = resp.data.role
          this.name = resp.data.userName
          this.balance = resp.data.balance
          return resp.data.balance
        })
      } else {
        return 0
      }
    },
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
    logout() {
      this.$emit('logout')
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
  font-family: 'Open Sans', sans-serif;
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
