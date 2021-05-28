<template>
  <div
    class="transform md:scale-50 lg:scale-100 flex items-start inset-0 my-4 shadow-lg max-w-6xl mx-auto"
  >
    <div
      class="box self-center pl-12 p-3 pb-16 text-left w-full bg-white border-csblack shadow-2xl border rounded-lg"
    >
      <form @submit.prevent="register()">
        <div class="column w-7/12 mt-4">
          <h3 class="text-4xl text-center heading pb-5">Реєстрація</h3>
          <div class="column w-6/12">
            <BaseInput
              label="Email"
              type="email"
              placeholder="Уведіть E-mail"
              :isMultiline="true"
              v-model="user.email"
            />
            <BaseInput
              label="Пароль"
              type="password"
              placeholder="Уведіть пароль"
              :isMultiline="true"
              @change="validatePass()"
              v-model="user.pass"
              :isIncorrect="passWrong"
              errorMassage="Пароль має містити 8 знаків, 1 цифру, 1 велику , 1 малу літери та 1 символ"
            />
            <div class="mt-7">
              <BaseInput
                label="Дата народження"
                type="date"
                :isMultiline="true"
                v-model="user.birthDate"
                errorMassage="Уведіть правильну дату"
                :isIncorrect="dateWrong"
                @change="validateAge()"
              />
            </div>
          </div>
          <div class="column w-6/12">
            <BaseInput
              label="Ім'я користувача"
              type="text"
              placeholder="Уведіть ваше ім'я"
              :isMultiline="true"
              v-model="user.username"
              errorMassage=""
            />
            <BaseInput
              label="Підтвердження паролю"
              type="password"
              placeholder="Уведіть пароль"
              :isMultiline="true"
              v-model="user.passRepeat"
              @change="validatePassRepeat()"
              :isIncorrect="passDontMatch"
              errorMassage="Паролі не співпадають"
            ></BaseInput>
          </div>
          <div class="column">
            <BaseCheck
              v-model="user.agreeToTerms"
              label="Я даю згоду на обробку персональних даних та
            погоджуюсь із правилами користування сервісом"
            />
            <BaseCheck
              v-model="user.isMyInfoTrue"
              label="Я підтверджую достовірність внесених даних"
            />
          </div>
        </div>
        <!-- <div class="column w-[3.23rem] v-line"> </div> -->
        <div class="column w-4/12 mt-4">
          <div class="block mx-auto w-1/2 mb-5 transform">
            <Logo />
          </div>
          <button
            id="sign-up"
            type="submit"
            :disabled="!registerable"
            class="hover:text-csblack disabled:opacity-25 shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
          >
            Створити акаунт
          </button>
          <hr class="mt-3 mb-3" />

          <button
            id="google-sign-up"
            class="hover:text-csblack shadow-lg p-3 border border-grey-300 button-enter w-11/12 ml-3 m-5 sm:text-xl"
          >
            <i
              class="text-white animate-pulse fab fa-google mr-3 transform scale-200"
            />
            Зареєструватися з Google
          </button>

          <button
            id="facebook-sign-up"
            class="hover:text-csblack shadow-lg border p-3 border-grey-300 button-enter w-11/12 ml-3 mt-0 m-5 text-xl"
          >
            <i
              class="text-white animate-pulse fab fa-facebook mr-3 transform scale-200"
            />
            Зареєструватися з Facebook
          </button>
          <hr class="mt-3 mb-3" />
          <div class="text-center">
            <div class="mb-3 mt-3">
              <button
                type="button"
                class="focus:outline-none hover:text-csgreen link"
                @click="this.$emit('openReset')"
              >
                Забули пароль?
              </button>
            </div>
            <div>
              <button
                type="button"
                @click="this.$emit('openLogin')"
                class="link focus:outline-none hover:text-csgreen"
              >
                Увійти
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput.vue'
import BaseCheck from '@/components/BaseCheck.vue'
import Logo from '@/components/Logo.vue'
import Validation from '@/services/validation.js'
export default {
  name: 'RegisterForm',
  components: {
    BaseInput,
    BaseCheck,
    Logo,
  },
  emits: ['openLogin'],
  data() {
    return {
      user: {
        email: '',
        username: '',
        pass: '',
        passRepeat: '',
        birthDate: '',
        agreeToTerms: false,
        isMyInfoTrue: false,
      },
      passDontMatch: false,
      passWrong: false,
      dateWrong: false,
    }
  },
  computed: {
    registerable() {
      return (
        !this.passDontMatch &&
        !this.passWrong &&
        !this.dateWrong &&
        this.user.agreeToTerms &&
        this.user.isMyInfoTrue &&
        this.user.email.length > 0 &&
        this.user.username.length > 0 &&
        this.user.pass.length > 0 &&
        this.user.passRepeat.length > 0
      )
    },
  },
  methods: {
    register() {
      //verification.

      this.passWrong = !Validation.pass(this.user.pass)
      this.passDontMatch = !Validation.passRepeat(
        this.user.pass,
        this.user.passRepeat
      )
      this.dateWrong = !Validation.age(this.user.birthDate)
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

.v-line {
  margin-top: 1.5rem;
  border-left: 1px solid green;
  height: 550px;
  margin-left: -3px;
  top: 0;
}

.link {
  padding-bottom: 1px;
  font-size: larger;
  font-weight: bolder;
}

.column {
  display: inline-block;
  vertical-align: top;
}

.image-holder {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}

#google-sign-up {
  background-color: #ea4335;
}

#facebook-sign-up {
  background-color: #4064ac;
}
</style>
