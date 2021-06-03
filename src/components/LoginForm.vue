<template>
  <div
    class="transform lg:scale-100 sm:scale-50 md:scale-50 flex items-start inset-0 my-4 shadow-lg max-w-xl mx-auto"
  >
    <div
      class="box self-center pl-12 p-3 text-left w-full bg-white border-csblack shadow-2xl border rounded-lg"
    >
      <form @submit.prevent="logIn">
        <h3 class="text-4xl text-center heading pb-5">Авторизація</h3>
        <BaseInput
          label="Email"
          type="email"
          placeholder="Уведіть E-mail"
          v-model="user.email"
        ></BaseInput>
        <BaseInput
          label="Пароль"
          type="password"
          placeholder="Уведіть пароль"
          v-model="user.password"
          :isIncorrect="passIsIncorrect"
          errorMassage="Такої комбінації паролю та пошти не існує"
        ></BaseInput>

        <BaseCheck label="Запам'ятати мене" v-model="user.remember" />

        <button
          id="sign-in"
          type="submit"
          class="hover:text-csblack transform shadow-lg p-3 border focus:ring-offset-2 border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
        >
          Увійти
        </button>

        <hr class="m-3 w-11/12" />

        <button
          @click="googleSignIn"
          id="google-sign-in"
          class="focus:outline-none focus:ring-red-400 focus:ring hover:text-csblack shadow-lg p-3 border border-grey-300 button-enter w-11/12 ml-3 m-5 text-xl"
        >
          <i
            class="text-white animate-pulse fab fa-google mr-3 transform scale-150"
          ></i
          >Увійти з Google
        </button>

        <button
          id="facebook-sign-in"
          class="hover:text-csblack focus:ring-csblue focus:ring focus:ring-offset-2 focus:outline-none shadow-lg border p-3 border-grey-300 button-enter w-11/12 ml-3 mt-0 m-5 text-xl"
        >
          <i
            class="text-white animate-pulse fab fa-facebook mr-3 transform scale-150"
          ></i
          >Увійти з Facebook
        </button>

        <hr class="m-3 w-11/12" />
        <div class="w-11/12 text-center">
          <div class="mb-3 mt-3">
            <button
              type="button"
              class="link focus:outline-none hover:text-csgreen"
              @click="this.$emit('openReset')"
            >
              Забули пароль?
            </button>
          </div>
          <div>
            <button
              type="button"
              class="link focus:outline-none hover:text-csgreen"
              @click="this.$emit('openRegister')"
            >
              Створити аккаунт
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput.vue'
import BaseCheck from '@/components/BaseCheck.vue'
import apiService from '@/services/index.js'
import storage from '../store/index'
import firebase from 'firebase'

export default {
  name: 'LoginForm',
  components: {
    BaseInput,
    BaseCheck,
  },
  emits: ['openRegister', 'openReset', 'login'],
  data() {
    return {
      user: {
        email: '',
        password: '',
        remember: false,
      },
      isShown: false,
      passIsIncorrect: false,
    }
  },
  methods: {
    googleSignIn: function () {
      let provider = new firebase.auth.GoogleAuthProvider()
      firebase
        .auth()
        .signInWithPopup(provider)
        .then((result) => {
          let token = result.credential
          let user = result.user
          console.log(token) // Token
          console.log(user) // User that was authenticated
          this.user.email = user.email
          this.user.password = user.uid
          apiService.getToken(this.user).then(() => {
            console.log(storage.state.token.length)
            if (storage.state.token.length !== 0) {
              this.$emit('login')
            } else {
              this.passIsIncorrect = true
            }
          })
        })
        .catch((err) => {
          console.log(err) // This will give you all the information needed to further debug any errors
        })
    },
    async logIn() {
      await apiService.getToken(this.user).then(() => {
        console.log(storage.state.token.length)
        if (storage.state.token.length !== 0) {
          this.$emit('login')
        } else {
          this.passIsIncorrect = true
        }
      })
    },
  },
}
</script>

<style>
form {
  font-family: 'Century Gothic', serif;
}
.heading {
  font-weight: 700;
}
.button-enter {
  height: auto;
  border-radius: 15px;
  font-size: larger;
  padding: 5px;
  color: #ffffff;
}

.link {
  padding-bottom: 1px;
  font-size: larger;
  font-weight: bolder;
}

#google-sign-in {
  background-color: #ea4335;
}

#facebook-sign-in {
  background-color: #4064ac;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}
</style>
