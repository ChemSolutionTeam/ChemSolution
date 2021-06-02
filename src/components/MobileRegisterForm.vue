<template>
  <div class="inset-0 z-20 fixed w-full h-full bg-csblack">
    <div
      class="mt-0 flex flex-row bg-white absolute inset-3 rounded-3xl self-center p-2"
    >
      <div class="w-full overflow-scroll">
        <h1 class="text-2xl">Реєстрація</h1>
        <BaseInput
          label="Ім'я користувача"
          type="text"
          placeholder="Уведіть ваше ім'я"
          :isMultiline="true"
          v-model="user.username"
          errorMassage=""
        />
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
          @change="validate()"
          v-model="user.pass"
          :isIncorrect="passWrong"
          errorMassage="Пароль має містити 8 знаків, 1 цифру, 1 велику , 1 малу літери та 1 символ"
        />

        <BaseInput
          label="Підтвердження паролю"
          type="password"
          placeholder="Уведіть пароль"
          :isMultiline="true"
          v-model="user.passRepeat"
          @change="validate()"
          :isIncorrect="passDontMatch"
          errorMassage="Паролі не співпадають"
        />
        <BaseInput
          label="Дата народження"
          type="date"
          :isMultiline="true"
          v-model="user.birthDate"
          errorMassage="Уведіть правильну дату"
          :isIncorrect="dateWrong"
          @change="validate()"
        />
        <BaseCheck
          v-model="user.agreeToTerms"
          label="Я даю згоду на обробку персональних даних та
            погоджуюсь із правилами користування сервісом"
        />
        <BaseCheck
          v-model="user.isMyInfoTrue"
          label="Я підтверджую достовірність внесених даних"
        />
        <button
          id="sign-up"
          type="submit"
          :disabled="!registerable"
          class="hover:text-csblack disabled:opacity-25 shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
        >
          Створити акаунт
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput'
import BaseCheck from '@/components/BaseCheck'
import Validation from '@/services/validation.js'
import apiService from '@/services/index'
import storage from '@/store/index.js'

export default {
  name: 'MobileRegister',
  components: {
    BaseInput,
    BaseCheck,
  },
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
  methods: {
    validate() {
      this.passWrong = !Validation.pass(this.user.pass)
      this.passDontMatch = !Validation.passRepeat(
        this.user.pass,
        this.user.passRepeat
      )
      this.dateWrong = !Validation.age(this.user.birthDate)
    },
    async register() {
      this.validate()
      await apiService.postUser(this.user).then(() => {
        apiService.getToken(this.user).then(() => {
          console.log(storage.state.token.length)
          if (storage.state.token.length !== 0) {
            this.$emit('login')
          } else {
            this.passIsIncorrect = true
          }
        })
        this.$emit('register')
      })
    },
  },
}
</script>

<style></style>
